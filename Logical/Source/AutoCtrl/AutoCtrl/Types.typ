(*********************************************************************************
 * Copyright: B&R Industrial Automation GmbH 
 * Author:    kasliwals 
 * Created:   December 16, 2023/11:35 PM 
 *********************************************************************************)

TYPE
	AutoCtrl_enum : 
		( (*Auto Ctrl State*)
		WAIT, (*Wait state*)
		MODE_SELECT, (*Mode Select state*)
		HOMING_DONE, (*homing State*)
		MANUAL_START, (*Manual Mode*)
		AUTO_START, (*Auto mode state*)
		STOP, (*Stop state*)
		MANUAL_JOGF, (*Manual jog f State*)
		MANUAL_JOGN, (*Manual jog N State*)
		IN_CUTTING_ZONE, (*Cutting zone state*)
		CUTTER_DISABLED, (*Cutter Disabled STate*)
		CUTTER_DISABLED_HOME (*Cutter Homing after disable*)
		);
END_TYPE
