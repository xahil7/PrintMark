(*********************************************************************************
 * Copyright: B&R Industrial Automation GmbH 
 * Author:    kasliwals 
 * Created:   December 16, 2023/11:35 PM 
 *********************************************************************************)

TYPE
	AutoCmd_typ : 	STRUCT  (*Auto Ctrl Command Type*)
		Start : BOOL; (*Start cmd*)
		Stop : BOOL; (*Stop cmd*)
		AutoMode : BOOL; (*Auto Mode cmd*)
		ChangeMode : BOOL; (*Change Mode cmd*)
		DisableCutter : BOOL; (*Disable Cutter cmd*)
	END_STRUCT;
	AutoPara_typ : 	STRUCT  (*Auto Ctrl Para Type*)
		ConvSpeed : REAL; (*Conv speed Para*)
		ConvJogSpeed : REAL; (*Conv Jog SPeed*)
		CutterJogSpeed : REAL; (*Cutter Jog Speed*)
	END_STRUCT;
	AutoManCmd_typ : 	STRUCT  (*Auto Ctrl Manaual Cmd Type*)
		ConvPowerON : BOOL; (*Conv power on*)
		CutterPowerON : BOOL; (*Cutter Power On*)
		CutterHome : BOOL; (*Cutter Home cmd*)
		ConvHome : BOOL; (*Conv home cmd*)
	END_STRUCT;
	AutoCtrl_typ : 	STRUCT  (*Auto Ctrl Type*)
		Cmd : AutoCmd_typ; (*Auto Ctrl cmd type*)
		Para : AutoPara_typ; (*Auto Ctrl Para type*)
		ManualCmd : AutoManCmd_typ; (*Auto Ctrl Manual Cmd Type*)
	END_STRUCT;
END_TYPE
