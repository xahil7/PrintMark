(*********************************************************************************
 * Copyright: B&R Industrial Automation GmbH 
 * Author:    kasliwals 
 * Created:   December 16, 2023/11:44 PM 
 *********************************************************************************)

TYPE
	MasterAxisState_enum : 
		( (*Master Axis States*)
		WAIT, (*Wait State*)
		ACTIVE, (*ACtive State*)
		POWER_ON, (*Power On State*)
		HOME, (*HOMING State*)
		READY_TO_START, (*Ready to Start State*)
		MODE_CHANGE, (*Mode change state*)
		MANUAL, (*Manual state*)
		AUTOMATIC, (*Auto mode state*)
		JOG_POSITIVE, (*Jog Positive State*)
		JOG_NEGATIVE, (*Jog Negative State*)
		STOP (*Stop State*)
		);
END_TYPE
