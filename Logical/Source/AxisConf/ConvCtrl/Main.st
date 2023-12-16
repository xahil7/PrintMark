(*********************************************************************************
 * Copyright: B&R Industrial Automation GmbH 
 * Author:    kasliwals 
 * Created:   December 16, 2023/11:44 PM 
* Description: Conv Homing and jog logic
* Version : 1.0.0.0 
 *********************************************************************************)

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
			IF gAx_Master.Out.Active AND iConvCtrl.Cmd.Start THEN
				MasterStep := ACTIVE;
			END_IF
		
		ACTIVE :
			IF gAx_Master.Out.Info.ReadyToPowerOn AND iConvCtrl.Cmd.AutoMode THEN
				gAx_Master.In.Power := TRUE;
			END_IF
			IF gAx_Master.Out.PowerOn THEN
				MasterStep := HOME;
			END_IF
		
		HOME :
		
				gAx_Master.In.Home := TRUE;
		
			
			IF gAx_Master.Out.IsHomed THEN
				gAx_Master.In.Home := FALSE;
				IF iConvCtrl.Cmd.AutoMode THEN
					MasterStep := AUTOMATIC;
				ELSE
					MasterStep := MANUAL;
				END_IF
				
			END_IF
			
		AUTOMATIC :
			IF iConvCtrl.Cmd.Start = FALSE THEN
				
				MasterStep := WAIT;
			END_IF
			
		
		MANUAL :
			IF iConvCtrl.Cmd.JogFwd THEN
				MasterStep := JOG_POSITIVE;
			END_IF
			IF iConvCtrl.Cmd.JogBack THEN
				MasterStep := JOG_NEGATIVE;
			END_IF
			iVa_RecPrintPosition := K_ZERO;
			IF iConvCtrl.Cmd.Start = FALSE THEN
				MasterStep := WAIT;
				gAx_Master.In.Power := FALSE;
			END_IF
			
		JOG_POSITIVE :
			gAx_Master.In.JogPositive := TRUE;
			IF NOT iConvCtrl.Cmd.JogFwd THEN
				gAx_Master.In.JogPositive := FALSE;
				MasterStep := MANUAL;
			END_IF
				
		
		JOG_NEGATIVE :
			gAx_Master.In.JogNegative := TRUE;
			IF (gAx_Master.In.JogNegative  AND EDGENEG(iConvCtrl.Cmd.PrintMark)) OR 
				(EDGEPOS(gAx_Master.In.JogNegative) AND iConvCtrl.Cmd.PrintMark ) THEN
				iVa_RecPrintPosition := gAx_Master.Out.Position;
			END_IF
			
			IF (iVa_RecPrintPosition - gAx_Master.Out.Position) > (PRINT_MARK_LIMIT) AND iVa_RecPrintPosition <> K_ZERO THEN
				gAx_Master.In.JogNegative := FALSE;
				iConvCtrl.Cmd.JogBack := FALSE;
				MasterStep := MANUAL;
			ELSE
				iConvCtrl.Status.JogNegReady := TRUE;
			END_IF
		
	END_CASE
	
	iConvCtrl.Cmd.PrintMark := gAx_Slave.Out.Info.DigitalInputsStatus.Trigger1;
	iVa_SetMasterInputs.Axis := ADR(gAxis01);
	iVa_SetMasterInputs.Enable := TRUE;
	iVa_SetMasterInputs.HomeSwitch := gAx_Slave.Out.Info.DigitalInputsStatus.Trigger1;
	iVa_SetMasterInputs();
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

