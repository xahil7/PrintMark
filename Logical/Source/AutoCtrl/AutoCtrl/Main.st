
PROGRAM _INIT
	(* Insert code here *)
	Status_CutterCtrl := PV_xgetadr(ADR('CutterCtrl:iCutterCtrl'),ADR(CutterAdd),ADR(SizeCutter));
	Status_ConvCtrl := PV_xgetadr(ADR('ConvCtrl:iConvCtrl'),ADR(ConvAdd),ADR(SizeConv));
	Status_CamSeq := PV_xgetadr(ADR('CutterCtrl:iAx_CamSeq'),ADR(CamAdd),ADR(SizeCam));
	Status_RegCapture := PV_xgetadr(ADR('CutterCtrl:iFb_RegCapture'),ADR(RegAdd),ADR(RegSize));
	gAx_Master.In.Enable := TRUE;
	gAx_Slave.In.Enable := TRUE;
	iMI_CurrentMode := 'Manual Mode';
END_PROGRAM

PROGRAM _CYCLIC
	(* Insert code here *)
	pCutterCtrl ACCESS CutterAdd;
	pConvCtrl ACCESS ConvAdd;
 	pAx_CamSeq ACCESS CamAdd;
	pRegCapture ACCESS RegAdd;
	
	CASE AutoCtrlState OF
		WAIT :
			gAx_Master.In.Enable := TRUE;
			gAx_Slave.In.Enable := TRUE;
			gMI_ModeConfirm := FALSE;
			IF iAutoCtrl.Cmd.Start THEN
				pConvCtrl.Cmd.Start := TRUE;
				pCutterCtrl.Cmd.Start := TRUE;
				AutoCtrlState := MODE_SELECT;
			END_IF
			
		MODE_SELECT :
			IF gMI_ModeConfirm THEN
				
				IF iAutoCtrl.Cmd.AutoMode THEN
					iMI_CurrentMode := 'Auto Mode';
					AutoCtrlState := HOMING_DONE;
				ELSE
					iMI_CurrentMode := 'Manual Mode';
					AutoCtrlState := MANUAL_START;
				END_IF
			END_IF
		HOMING_DONE :
			pAx_CamSeq.In.ErrorReset := TRUE;
			
			IF gAx_Master.Out.IsHomed AND gAx_Slave.Out.IsHomed THEN
				pAx_CamSeq.In.ErrorReset := FALSE;
				AutoCtrlState := AUTO_START;
			END_IF
			
		AUTO_START :
			
			IF pAx_CamSeq.Out.Info.MasterReady AND pAx_CamSeq.Out.Info.SlaveReady THEN
				pAx_CamSeq.In.StartSequence := TRUE;
			END_IF
			IF pAx_CamSeq.Out.InSync AND iAutoCtrl.Cmd.Start THEN
				gAx_Master.In.MoveVelocity := TRUE;
			END_IF
			IF iAutoCtrl.Cmd.Stop THEN
				gAx_Master.In.MoveVelocity := FALSE;
			END_IF
			
			IF iAutoCtrl.Cmd.ChangeMode AND iAutoCtrl.Cmd.Stop THEN
				gAx_Master.In.MoveVelocity := FALSE;
				iAutoCtrl.Cmd.ChangeMode := FALSE;
				pAx_CamSeq.In.StartSequence := FALSE;
				AutoCtrlState := STOP;
			END_IF
			
		MANUAL_START :
			IF NOT iAutoCtrl.ManualCmd.ConvPowerON AND NOT iAutoCtrl.ManualCmd.CutterPowerON AND iAutoCtrl.Cmd.ChangeMode THEN
				AutoCtrlState := STOP;
			END_IF
		
		STOP :
			iAutoCtrl.Cmd.Start := FALSE;
			gAx_Master.In.Power := FALSE;
			gAx_Slave.In.Power := FALSE;
			gAx_Master.In.Enable := FALSE;
			gAx_Slave.In.Enable := FALSE;
			pConvCtrl.Cmd.Start := FALSE;
			pCutterCtrl.Cmd.Start := FALSE;
			AutoCtrlState := WAIT;
		
		IN_CUTTING_ZONE :
			iAutoCtrl.ManualCmd.ConvPowerON := FALSE;
			iAutoCtrl.ManualCmd.CutterPowerON := FALSE;
			iAutoCtrl.ManualCmd.ConvHome := FALSE;
			iAutoCtrl.ManualCmd.CutterHome := FALSE;
			IF gAx_Slave.Out.Position > UPPER_CUT_POS OR gAx_Slave.Out.Position <LOWER_CUT_POS  THEN
				iAutoCtrl.Cmd.Start := FALSE;
				AutoCtrlState := WAIT;
			END_IF
		END_CASE
	
	IF NOT iAutoCtrl.Cmd.AutoMode THEN 
		gAx_Master.In.Power := iAutoCtrl.ManualCmd.ConvPowerON;
		gAx_Slave.In.Power := iAutoCtrl.ManualCmd.CutterPowerON;
		gAx_Master.In.Home := iAutoCtrl.ManualCmd.ConvHome;
		gAx_Slave.In.Home := iAutoCtrl.ManualCmd.CutterHome;
		gAx_Master.In.JogNegative := pConvCtrl.Cmd.JogBack;
		gAx_Master.In.JogPositive := pConvCtrl.Cmd.JogFwd;
		gAx_Slave.In.JogNegative := pCutterCtrl.Cmd.JogBack;
		gAx_Slave.In.JogPositive := pCutterCtrl.Cmd.JogFwd;
		
	END_IF
	
	pConvCtrl.Cmd.AutoMode := iAutoCtrl.Cmd.AutoMode;
	pCutterCtrl.Cmd.AutoMode := iAutoCtrl.Cmd.AutoMode;
	IF gAx_Slave.Out.Position < UPPER_CUT_POS AND gAx_Slave.Out.Position > LOWER_CUT_POS AND NOT iAutoCtrl.Cmd.AutoMode THEN
		AutoCtrlState := IN_CUTTING_ZONE;
	END_IF
	
	
	iMI_LastBagLen := pRegCapture.AdditionalInfo.ActLength / TEN;
	iMI_AvgBagLen := pRegCapture.AdditionalInfo.AverageProductLength /TEN;
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

