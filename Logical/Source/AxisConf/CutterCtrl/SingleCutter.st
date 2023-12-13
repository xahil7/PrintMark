
ACTION  SingleCutter : 
	CASE SlaveStateSingle OF 
		WAIT :
			IF gAx_Slave.Out.Active AND iVa_CutterCtrl.Cmd.Start THEN
				SlaveStateSingle := POWER_ON;
			END_IF
		ACTIVE :
			IF gAx_Slave.Out.Position >= LOWER_CUT_POS AND gAx_Master.Out.Position <= UPPER_CUT_POS THEN
				gAx_Slave.In.Power := FALSE;
			ELSE
				SlaveStateSingle := POWER_ON;
			END_IF
			
		POWER_ON :
			IF gAx_Slave.Out.Info.ReadyToPowerOn    THEN
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
			gAx_Slave.In.Parameters.Home.HomingVelocity := 300;
			gAx_Slave.In.Parameters.Position := 1033;
			gAx_Slave.In.Parameters.Velocity := 300;
			gAx_Slave.In.Update := TRUE;
			IF gAx_Slave.Out.UpdateDone THEN
				gAx_Slave.In.Update := FALSE;
				gAx_Slave.In.Home := TRUE;
				SlaveStateSingle := HOMING;
			END_IF
		POSITIVE_HOMING_MODE :
			gAx_Slave.In.Parameters.Home.Mode := mpAXIS_HOME_MODE_REF_PULSE;
			gAx_Slave.In.Parameters.Home.HomingDirection := mpAXIS_HOME_DIR_POSITIVE;
			gAx_Slave.In.Parameters.Home.HomingVelocity := 300;
			gAx_Slave.In.Parameters.Position := 1033;
			gAx_Slave.In.Parameters.Velocity := 300;
			gAx_Slave.In.Update := TRUE;
			IF gAx_Slave.Out.UpdateDone THEN
				gAx_Slave.In.Update := FALSE;
				gAx_Slave.In.Home := TRUE;
				SlaveStateSingle := HOMING;
			END_IF
			
		HOMING :
			IF gAx_Slave.Out.IsHomed THEN
				gAx_Slave.In.Home := FALSE;
				gAx_Slave.In.MoveAbsolute := TRUE;
			END_IF
			IF gAx_Slave.Out.InPosition THEN
				gAx_Slave.In.MoveAbsolute := FALSE;
				SlaveStateSingle := OPERATION;
			END_IF
		
		OPERATION :
			IF iVa_CutterCtrl.Cmd.JogFwd THEN
				SlaveStateSingle := JOG_POSITIVE;
			END_IF
			IF iVa_CutterCtrl.Cmd.JogBack THEN
				SlaveStateSingle := JOG_NEGATIVE;
			END_IF
		JOG_POSITIVE :
			IF (gAx_Slave.Out.Position < LOWER_BUFER OR gAx_Slave.Out.Position > UPPER_CUT_POS ) AND iVa_CutterCtrl.Status.JogPosReady THEN
				gAx_Slave.In.JogPositive := TRUE;
			ELSE
				//Set an alarm Here
				gAx_Slave.In.JogPositive := FALSE;
				iVa_CutterCtrl.Cmd.JogFwd:= FALSE;
				SlaveStateSingle := OPERATION;
			END_IF
			IF NOT iVa_CutterCtrl.Cmd.JogFwd THEN
				gAx_Slave.In.JogPositive := FALSE;
				SlaveStateSingle := OPERATION;
			END_IF
		JOG_NEGATIVE :
			IF ( gAx_Slave.Out.Position > UPPER_BUFFER OR gAx_Slave.Out.Position <LOWER_CUT_POS ) AND iVa_CutterCtrl.Status.JogNegReady THEN
				gAx_Slave.In.JogNegative := TRUE;
			ELSE
				//Set an warning alarm here
				gAx_Slave.In.JogNegative := FALSE;
				iVa_CutterCtrl.Cmd.JogBack:= FALSE;
				SlaveStateSingle := OPERATION;
			END_IF
			IF NOT iVa_CutterCtrl.Cmd.JogBack THEN
				gAx_Slave.In.JogNegative := FALSE;
				SlaveStateSingle := OPERATION;
			END_IF
			
		IN_CUTTING_ZONE :
			gAx_Slave.In.Power := FALSE;
			IF gAx_Slave.Out.Position < LOWER_CUT_POS OR gAx_Slave.Out.Position >UPPER_CUT_POS AND gAx_Slave.Out.IsHomed THEN
				gAx_Slave.In.Power := TRUE;
				SlaveStateSingle := OPERATION;
			ELSIF  gAx_Slave.Out.Position < LOWER_CUT_POS OR gAx_Slave.Out.Position >UPPER_CUT_POS AND NOT gAx_Slave.Out.IsHomed THEN
				SlaveStateSingle := POWER_ON;
			END_IF
		
	END_CASE
	IF gAx_Slave.Out.Position >=LOWER_CUT_POS AND gAx_Slave.Out.Position <=UPPER_CUT_POS THEN
		iVa_CutterCtrl.Status.JogNegReady := FALSE;
		iVa_CutterCtrl.Status.JogPosReady := FALSE;
		SlaveStateSingle := IN_CUTTING_ZONE;
	ELSIF gAx_Slave.Out.Position < LOWER_CUT_POS  THEN
		iVa_CutterCtrl.Status.JogNegReady := TRUE;
		IF gAx_Slave.Out.Position < LOWER_BUFER THEN
			iVa_CutterCtrl.Status.JogPosReady := TRUE;
		ELSE
			iVa_CutterCtrl.Status.JogPosReady := FALSE;
		END_IF
		
	ELSIF gAx_Slave.Out.Position > UPPER_CUT_POS THEN
			iVa_CutterCtrl.Status.JogPosReady := TRUE;
			IF gAx_Slave.Out.Position > UPPER_BUFFER THEN
				iVa_CutterCtrl.Status.JogNegReady := TRUE;
		ELSE
			iVa_CutterCtrl.Status.JogNegReady := FALSE;
			END_IF
			
	END_IF
	
	
	
END_ACTION
