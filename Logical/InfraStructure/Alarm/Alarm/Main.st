(*********************************************************************************
 * Copyright: B&R Industrial Automation GmbH 
 * Author:    kasliwals 
 * Created:   December 16, 2023/11:54 PM 
* Description: Alarm Configuration
* Version : 1.0.0.0 
 *********************************************************************************)

PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	(* Insert code here *)
	iFB_Alarm.Enable := TRUE;
	iFB_Alarm.MpLink := ADR(gAlarmXMain);
	
	iFB_Alarm();
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	iFB_Alarm.Enable := FALSE;
	iFB_Alarm();
	
END_PROGRAM

