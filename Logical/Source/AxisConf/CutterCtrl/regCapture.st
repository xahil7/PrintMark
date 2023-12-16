(*********************************************************************************
 * Copyright: B&R Industrial Automation GmbH 
 * Author:    kasliwals 
 * Created:   December 16, 2023/11:41 PM 
* Description: Reg Capture implementation
* Version : 1.0.0.0 
 *********************************************************************************)

ACTION RegCapture: 
	iFb_RegCapture.Axis := ADR(gAxis02);
	iFb_RegCapture.Master := ADR(gAxis01);
	iFb_RegCapture.AdvancedParameters := iVa_RegCaptureAdvPara;
	iFb_RegCapture.InitData := TRUE;
	iFb_RegCapture.SearchRM := TRUE;
	iFb_RegCapture.Configuration := iVa_RegCaptureConfig;
	iFb_RegCapture.CutPosition := REAL_TO_DINT(iVa_RegCaptureConfig.ProductLength);
	iFb_RegCapture.Enable := iAx_CamSeq.Out.InSync;
	IF gAx_Slave.Out.Info.PLCopenState = mpAXIS_SYNCHRONIZED_MOTION THEN
		iFb_RegCapture();
	END_IF
END_ACTION
