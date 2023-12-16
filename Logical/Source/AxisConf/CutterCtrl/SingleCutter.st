
ACTION  SingleCutter : 
	CASE SlaveStateSingle OF 
		WAIT :
			IF gAx_Slave.Out.Active AND iCutterCtrl.Cmd.Start THEN
				SlaveStateSingle := POWER_ON;
			END_IF
		ACTIVE :
			IF gAx_Slave.Out.Position >= LOWER_CUT_POS AND gAx_Master.Out.Position <= UPPER_CUT_POS THEN
				gAx_Slave.In.Power := FALSE;
			ELSE
				SlaveStateSingle := POWER_ON;
			END_IF
			
		POWER_ON :
			IF gAx_Slave.Out.Info.ReadyToPowerOn  AND iCutterCtrl.Cmd.AutoMode  THEN
				gAx_Slave.In.Power := TRUE;
			END_IF
			IF gAx_Slave.Out.PowerOn AND gAx_Slave.Out.Position < LOWER_CUT_POS THEN
				SlaveStateSingle := NEGATIVE_HOMING_MODE;
			END_IF
			IF gAx_Slave.Out.PowerOn AND gAx_Slave.Out.Position > UPPER_CUT_POS THEN
				SlaveStateSingle := POSITIVE_HOMING_MODE;
			END_IF
			
		NEGATIVE_HOMING_MODE :
			gAx_Slave.In.Parameters.Home.Mode := mpAXIS_HOME_MODE_REF_PULSE;
			gAx_Slave.In.Parameters.Home.HomingDirection := mpAXIS_HOME_DIR_NEGATIVE;
			gAx_Slave.In.Parameters.Home.SensorOffset := HOMING_OFFSET;
			gAx_Slave.In.Parameters.Home.HomingVelocity := HOMING_VEL;
			gAx_Slave.In.Parameters.Home.StartVelocity := START_VEL;
			gAx_Slave.In.Update := TRUE;
			IF gAx_Slave.Out.UpdateDone THEN
				gAx_Slave.In.Update := FALSE;
				gAx_Slave.In.Home := TRUE;
				SlaveStateSingle := HOMING;
			END_IF
		POSITIVE_HOMING_MODE :
			gAx_Slave.In.Parameters.Home.Mode := mpAXIS_HOME_MODE_REF_PULSE;
			gAx_Slave.In.Parameters.Home.HomingDirection := mpAXIS_HOME_DIR_POSITIVE;
			gAx_Slave.In.Parameters.Home.SensorOffset := HOMING_OFFSET;
			gAx_Slave.In.Parameters.Home.HomingVelocity := HOMING_VEL;
			gAx_Slave.In.Parameters.Home.StartVelocity := START_VEL;
			
			gAx_Slave.In.Update := TRUE;
			IF gAx_Slave.Out.UpdateDone THEN
				gAx_Slave.In.Update := FALSE;
				gAx_Slave.In.Home := TRUE;
				SlaveStateSingle := HOMING;
			END_IF
			
		HOMING :
			IF gAx_Slave.Out.IsHomed THEN
				gAx_Slave.In.Home := FALSE;
				IF iCutterCtrl.Cmd.AutoMode THEN
					SlaveStateSingle := AUTO_MODE;
				ELSE
					SlaveStateSingle := OPERATION;
				END_IF
				
			END_IF
		
		AUTO_MODE :
			IF iCutterCtrl.Cmd.Start = FALSE THEN
				SlaveStateSingle := WAIT;
			END_IF
				
		OPERATION :
			IF iCutterCtrl.Cmd.JogFwd THEN
				SlaveStateSingle := JOG_POSITIVE;
			END_IF
			IF iCutterCtrl.Cmd.JogBack THEN
				SlaveStateSingle := JOG_NEGATIVE;
			END_IF
			IF iCutterCtrl.Cmd.Start = FALSE THEN
				SlaveStateSingle := WAIT;
			END_IF
					
		JOG_POSITIVE :
			IF NOT iCutterCtrl.Cmd.JogFwd OR gAx_Slave.Out.Position = LOWER_BUFER  THEN
				gAx_Slave.In.JogPositive := FALSE;
				SlaveStateSingle := OPERATION;
			ELSE
				gAx_Slave.In.JogPositive := TRUE;
			END_IF
			IF gAx_Slave.Out.Position = LOWER_BUFER THEN
				iCutterCtrl.Cmd.JogFwd := FALSE;
			END_IF
			
		JOG_NEGATIVE :
			IF NOT iCutterCtrl.Cmd.JogBack OR gAx_Slave.Out.Position = UPPER_BUFFER  THEN
				gAx_Slave.In.JogNegative := FALSE;
				SlaveStateSingle := OPERATION;
			ELSE
				gAx_Slave.In.JogNegative := TRUE;
			END_IF
			IF gAx_Slave.Out.Position = UPPER_BUFFER THEN
				iCutterCtrl.Cmd.JogBack := FALSE;
			END_IF
			
		IN_CUTTING_ZONE :
			gAx_Slave.In.Power := FALSE;
			IF (gAx_Slave.Out.Position < LOWER_CUT_POS OR gAx_Slave.Out.Position >UPPER_CUT_POS) AND gAx_Slave.Out.IsHomed THEN
				gAx_Slave.In.Power := TRUE;
				SlaveStateSingle := OPERATION;
			ELSIF  (gAx_Slave.Out.Position < LOWER_CUT_POS OR gAx_Slave.Out.Position >UPPER_CUT_POS) AND NOT gAx_Slave.Out.IsHomed THEN
				SlaveStateSingle := POWER_ON;
			END_IF
		
	END_CASE
		
	CASE sJogState OF
		0:
			IF gAx_Slave.In.JogNegative = TRUE THEN
				sJogState	:= 10;
			END_IF;
			IF (gAx_Slave.In.JogPositive = TRUE) THEN
				sJogState	:= 20;
			END_IF;
		5:
			gAx_Slave.In.JogPositive	:= TRUE;
			gAx_Slave.In.JogNegative	:= TRUE;
			sJogState		:= 0;
				
		10:
			IF (gAx_Slave.Out.CommandAborted = TRUE) THEN
				sJogState					:= 5;
				gAx_Slave.In.JogNegative	:= FALSE;
			END_IF;
				
			IF (gAx_Slave.Out.Position > UPPER_CUT_POS)THEN
				gAx_Slave.In.Parameters.Jog.LowerLimit	:= UPPER_BUFFER;
				gAx_Slave.In.Parameters.Jog.UpperLimit	:= LIMIT_END;
				gAx_Slave.In.Update					:= TRUE;
				sJogState								:= 30;
			END_IF;
		20:
			IF (gAx_Slave.Out.CommandAborted = TRUE) THEN
				sJogState					:= 5;
				gAx_Slave.In.JogPositive	:= FALSE;
			END_IF;
				
			IF (gAx_Slave.Out.Position < LOWER_CUT_POS)THEN
				gAx_Slave.In.Parameters.Jog.LowerLimit	:=ZERO;
				gAx_Slave.In.Parameters.Jog.UpperLimit	:= LOWER_BUFER;
				gAx_Slave.In.Update					:= TRUE;
				sJogState								:= 30;
			END_IF;
		30:
			IF gAx_Slave.Out.UpdateDone = TRUE THEN
				gAx_Slave.In.Update					:= FALSE;
			END_IF;
			IF gAx_Slave.In.JogNegative = TRUE AND gAx_Slave.Out.Position <ZERO AND gAx_Slave.Out.Position > UPPER_CUT_POS THEN
				sJogState	:= 10;
			END_IF;
			IF (gAx_Slave.In.JogPositive = TRUE) AND gAx_Slave.Out.Position > ZERO AND gAx_Slave.Out.Position < LOWER_CUT_POS  THEN
				sJogState	:= 20;
			END_IF;
			IF ((gAx_Slave.Out.Position = UPPER_BUFFER) OR (gAx_Slave.Out.Position =LOWER_BUFER )) THEN
				gAx_Slave.In.JogNegative			:= FALSE;
				gAx_Slave.In.JogPositive			:= FALSE;
				sJogState							:= 40;
			END_IF;
		40:
	
			gAx_Slave.In.Parameters.Jog.LowerLimit	:= ZERO;
			gAx_Slave.In.Parameters.Jog.UpperLimit	:= ZERO;
			gAx_Slave.In.Update					:= TRUE;
			IF gAx_Slave.Out.UpdateDone = TRUE THEN
				gAx_Slave.In.Update				:= FALSE;
				sJogState							:= 0;
			END_IF;
	END_CASE;
		
//	IF gAx_Slave.Out.Position >=LOWER_CUT_POS AND gAx_Slave.Out.Position <=UPPER_CUT_POS THEN
//		iCutterCtrl.Status.JogNegReady := FALSE;
//		iCutterCtrl.Status.JogPosReady := FALSE;
//		SlaveStateSingle := IN_CUTTING_ZONE;
//	
//	END_IF
	
	
	
END_ACTION
