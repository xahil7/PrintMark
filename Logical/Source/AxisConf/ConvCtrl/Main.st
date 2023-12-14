
PROGRAM _INIT
	(* Insert code here *)
	gAx_Master.In.Parameters.Jog.Acceleration := 480000;
	gAx_Master.In.Parameters.Jog.Deceleration := 4800000;
	gAx_Master.In.Parameters.Jog.Velocity := 45;
	gAx_Master.In.Parameters.Home.Mode := mpAXIS_HOME_MODE_ABS_SWITCH;
	gAx_Master.In.Parameters.Home.StartVelocity := 200;
	gAx_Master.In.Parameters.Home.HomingDirection := mpAXIS_HOME_DIR_NEGATIVE;
	
	
END_PROGRAM

PROGRAM _CYCLIC
	CASE MasterStep OF
		WAIT :
			IF gAx_Master.Out.Active THEN
				MasterStep := ACTIVE;
			END_IF
		
		ACTIVE :
			IF gAx_Master.Out.Info.ReadyToPowerOn THEN
				gAx_Master.In.Power := TRUE;
			END_IF
			IF gAx_Master.Out.PowerOn THEN
				MasterStep := HOME;
			END_IF
		
		HOME :
			gAx_Master.In.Home := TRUE;
			IF gAx_Master.Out.IsHomed THEN
				gAx_Master.In.Home := FALSE;
				MasterStep := READY_TO_START;
			END_IF
	
		READY_TO_START :
			IF iVa_ConvCtrl.Cmd.Start THEN
				MasterStep := MODE_CHANGE;
			END_IF
			
		MODE_CHANGE :
			IF iVa_ConvCtrl.Cmd.AutoMode THEN
				MasterStep := AUTOMATIC;
			ELSE
				MasterStep := MANUAL;
			END_IF
		
		AUTOMATIC :
			gAx_Master.In.MoveVelocity := TRUE;
			//WRITE STOP CONDITION
		
		MANUAL :
			IF iVa_ConvCtrl.Cmd.JogFwd THEN
				MasterStep := JOG_POSITIVE;
			END_IF
			IF iVa_ConvCtrl.Cmd.JogBack THEN
				MasterStep := JOG_NEGATIVE;
			END_IF
			
		JOG_POSITIVE :
			gAx_Master.In.JogPositive := TRUE;
			IF NOT iVa_ConvCtrl.Cmd.JogFwd THEN
				gAx_Master.In.JogPositive := FALSE;
				MasterStep := MANUAL;
			END_IF
				
		
		JOG_NEGATIVE :
			gAx_Master.In.JogNegative := TRUE;
			IF (gAx_Master.In.JogNegative  AND EDGENEG(iVa_ConvCtrl.Cmd.PrintMark)) OR 
				(EDGEPOS(gAx_Master.In.JogNegative) AND iVa_ConvCtrl.Cmd.PrintMark ) THEN
				iVa_RecPrintPosition := gAx_Master.Out.Position;
			END_IF
			
			IF (iVa_RecPrintPosition - gAx_Master.Out.Position) > (PRINT_MARK_LIMIT) AND iVa_RecPrintPosition <> K_ZERO THEN
				gAx_Master.In.JogNegative := FALSE;
				iVa_ConvCtrl.Cmd.JogBack := FALSE;
				MasterStep := MANUAL;
			ELSE
				iVa_ConvCtrl.Status.JogNegReady := TRUE;
			END_IF
		
	END_CASE
	
	iVa_ConvCtrl.Cmd.PrintMark := gAx_Slave.Out.Info.DigitalInputsStatus.Trigger1;
	iVa_SetMasterInputs.Axis := ADR(gAxis01);
	iVa_SetMasterInputs.Enable := TRUE;
	iVa_SetMasterInputs.HomeSwitch := gAx_Slave.Out.Info.DigitalInputsStatus.Trigger1;
	iVa_SetMasterInputs();
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

