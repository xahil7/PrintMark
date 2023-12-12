(*********************************************************************************
 * Copyright: B&R Industrial Automation GmbH 
 * Author:    kasliwals 
 * Created:   December 11, 2023/10:45 AM 
* Description: Cam Sequencer Logic for Master and Slave Movement
* Version : 1.0.0.0 
 *********************************************************************************)

PROGRAM _INIT
	gAx_Slave.In.Parameters.Jog.Acceleration := 108000;
	gAx_Slave.In.Parameters.Jog.Deceleration := 1080000;
	gAx_Slave.In.Parameters.Jog.Velocity := 360;
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	
	
	SingleCutter;
	Mapping;
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	iFb_MpAxisBasic.Enable := FALSE;
	iFb_MpAxisBasic();
	iFb_MpAxisSlave.Enable := FALSE;
	iFb_MpAxisSlave();
	iFb_CamSeq.Enable := FALSE;
	iFb_CamSeq();
END_PROGRAM

