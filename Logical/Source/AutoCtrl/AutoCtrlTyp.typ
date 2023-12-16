
TYPE
	AutoCmd_typ : 	STRUCT 
		Start : BOOL;
		Stop : BOOL;
		AutoMode : BOOL;
		ChangeMode : BOOL;
		DisableCutter : BOOL;
	END_STRUCT;
	AutoPara_typ : 	STRUCT 
		ConvSpeed : REAL;
		ConvJogSpeed : REAL;
		CutterJogSpeed : REAL;
	END_STRUCT;
	AutoStatus_typ : 	STRUCT 
		InAutoMode : BOOL;
		Error : BOOL;
		Running : BOOL;
	END_STRUCT;
	AutoManCmd_typ : 	STRUCT 
		ConvPowerON : BOOL;
		CutterPowerON : BOOL;
		CutterHome : BOOL;
		ConvHome : BOOL;
	END_STRUCT;
	AutoCtrl_typ : 	STRUCT 
		Cmd : AutoCmd_typ;
		Para : AutoPara_typ;
		Status : AutoStatus_typ;
		ManualCmd : AutoManCmd_typ;
	END_STRUCT;
END_TYPE
