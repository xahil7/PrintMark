(*********************************************************************************
 * Copyright: B&R Industrial Automation GmbH 
 * Author:    kasliwals 
 * Created:   December 16, 2023/11:54 PM 
* Description: Alarm Logic
* Version : 1.0.0.0 
 *********************************************************************************)

ACTION Alarm: 
	IF gAx_Slave.Out.Position < UPPER_CUT_POS AND gAx_Slave.Out.Position > LOWER_CUT_POS THEN
		MpAlarmXSet(gAlarmXMain,'InCuttingZone');
	ELSE
		MpAlarmXReset(gAlarmXMain,'InCuttingZone');
	END_IF
	
	IF pRegCapture.ProductsWithoutRM > PROUCT_WITHOUT_RM THEN
		MpAlarmXSet(gAlarmXMain,'CuttingError');
		AutoCtrlState := STOP;
	ELSE
		MpAlarmXReset(gAlarmXMain,'CuttingError');
	END_IF
	
END_ACTION
