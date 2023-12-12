(*********************************************************************************
 * Copyright: B&R Industrial Automation GmbH 
 * Author:    kasliwals 
 * Created:   December 11, 2023/10:46 AM 
 *********************************************************************************)
(*Cam Sequencxe Structure*)

TYPE
	AxisCamSeqInput_Typ : 	STRUCT  (*Cam sequence Input structure type*)
		ErrorReset : BOOL; (*Resets function block errors*) (* *) (*#PAR#;*)
		Parameters : MpAxisCamSequencerParType; (*Function block parameters*) (* *) (*#PAR#;*)
		Update : BOOL; (*Update command for the parameters*) (* *) (*#PAR#;*)
		Signal1 : BOOL; (*Starts a cam profile used by the slave to follow the master*) (* *) (*#CMD#;*)
		Signal2 : BOOL; (*Begins to undo all shifts made*) (* *) (*#CMD#OPT#;*)
		Signal3 : BOOL; (*Starts a phase shift to the slave position (offset)*) (* *) (*#CMD#OPT#;*)
		Signal4 : BOOL; (*Starts a phase shift to the master position with which the slave is working (phase); the master remains unaffected*) (* *) (*#CMD#OPT#;*)
		StartSequence : BOOL; (*Starts a phase shift to the master position with which the slave is working (phase); the master remains unaffected*) (* *) (*#CMD#OPT#;*)
		Continue : BOOL; (*Starts a phase shift to the master position with which the slave is working (phase); the master remains unaffected*) (* *) (*#CMD#OPT#;*)
		EndSequence : BOOL; (*Starts a phase shift to the master position with which the slave is working (phase); the master remains unaffected*) (* *) (*#CMD#OPT#;*)
	END_STRUCT;
	AxisCamSeqOutput_Typ : 	STRUCT  (*Cam sequence Output structure type*)
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly*) (* *) (*#PAR#;*)
		UpdateDone : BOOL; (*Parameter update completed*) (* *) (*#PAR#;*)
		ActStIndex : USINT; (*Function block currently executing command*) (* *) (*#CMD#OPT#;*)
		ActStCamIndex : UINT; (*Function block interrupted while executing a command*) (* *) (*#CMD#OPT#;*)
		StatusID : DINT; (*Status information about the function block*) (* *) (*#PAR#;*)
		Info : MpAxisCamSequencerInfoType; (*Additional information about the component*) (* *) (*#CMD#;*)
		Standby : BOOL; (*Standby Output var for Cam Sequence*)
		InCompensation : BOOL; (*Compensation Output var for Cam Sequence*)
		InSync : BOOL; (*Sync Output var for Cam Sequence*)
	END_STRUCT;
	AxisCamSeqMain_Typ : 	STRUCT  (*Cam Sequence Main structure type*)
		In : AxisCamSeqInput_Typ; (*Variable to bind with input structure*)
		Out : AxisCamSeqOutput_Typ; (*Variable to bind with output structure*)
	END_STRUCT;
END_TYPE

(*Axis basic Structure*)

TYPE
	AxisBasicIn_type : 	STRUCT  (*Axis Input Structure *)
		ErrorReset : BOOL; (*Resets function block errors*) (* *) (*#PAR#;*)
		Parameters : MpAxisBasicParType; (*Function block parameters*) (* *) (*#PAR#;*)
		Update : BOOL; (*Updates the parameters*) (* *) (*#PAR#;*)
		Power : BOOL; (*Level-sensitive command for turning an axis on/off. In the event of an error, a new rising edge is required to restart the axis*) (* *) (*#CMD#;*)
		Home : BOOL; (*Command for homing the axis*) (* *) (*#CMD#;*)
		MoveVelocity : BOOL; (*Starts a constant movement with a defined velocity*) (* *) (*#CMD#;*)
		MoveAbsolute : BOOL; (*Starts an absolute movement*) (* *) (*#CMD#;*)
		MoveAdditive : BOOL; (*Starts a relative movement*) (* *) (*#CMD#;*)
		Stop : BOOL; (*Stops the axis*) (* *) (*#CMD#;*)
		JogPositive : BOOL; (*Movement in the positive direction. Stops automatically at the software limit position*) (* *) (*#CMD#OPT#;*)
		JogNegative : BOOL; (*Movement in the negative direction. Stops automatically at the software limit position*) (* *) (*#CMD#OPT#;*)
		Autotune : BOOL; (*Starts autotuning*) (* *) (*#CMD#OPT#;*)
		Simulate : BOOL; (*Enables motor simulation*) (* *) (*#CMD#OPT#;*)
		TorqueLimit : BOOL; (*Enables torque limiting*) (* *) (*#CMD#OPT#;*)
		ReleaseBrake : BOOL; (*Locks or unlocks the holding brake (only when the axis is switched off)*) (* *) (*#CMD#OPT#;*)
	END_STRUCT;
	AxisBasicOut_type : 	STRUCT  (*Axis OutPut Structure*)
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block*) (* *) (*#PAR#;*)
		UpdateDone : BOOL; (*Parameter update completed*) (* *) (*#PAR#;*)
		Position : LREAL; (*Current position of the axis [units]*) (* *) (*#CYC#;*)
		Velocity : REAL; (*Current position of the axis [units/s]*) (* *) (*#CYC#;*)
		CommandBusy : BOOL; (*Function block currently executing command*) (* *) (*#CMD#OPT#;*)
		CommandAborted : BOOL; (*Function block interrupted while executing a command*) (* *) (*#CMD#OPT#;*)
		PowerOn : BOOL; (*Switches on the axis*) (* *) (*#CMD#;*)
		IsHomed : BOOL; (*Homes the axis*) (* *) (*#CMD#;*)
		InVelocity : BOOL; (*Axis running with defined velocity*) (* *) (*#CMD#;*)
		InPosition : BOOL; (*Axis reached the desired position*) (* *) (*#CMD#;*)
		MoveActive : BOOL; (*Movement active*) (* *) (*#CMD#;*)
		Stopped : BOOL; (*Axis stopped*) (* *) (*#CMD#;*)
		TuningDone : BOOL; (*Autotuning completed successfully*) (* *) (*#CMD#OPT#;*)
		Simulation : BOOL; (*Motor simulation active*) (* *) (*#CMD#OPT#;*)
		TorqueLimited : BOOL; (*Torque limiting function active*) (* *) (*#CMD#OPT#;*)
		BrakeReleased : BOOL; (*Holding brake manually released*) (* *) (*#CMD#OPT#;*)
		Info : MpAxisBasicInfoType; (*Additional information about the component*) (* *) (*#CMD#;*)
	END_STRUCT;
	AxisBasic_type : 	STRUCT  (*Axis Main Structure type*)
		In : AxisBasicIn_type;
		Out : AxisBasicOut_type;
	END_STRUCT;
	AxisCtrl_typ : 	STRUCT 
		Cmd : AxisCmd_typ;
		Para : AxisPara_typ;
		Status : AxisStatus_typ;
	END_STRUCT;
	AxisCmd_typ : 	STRUCT 
		Start : BOOL;
		Stop : BOOL;
		PrintMark : BOOL;
		ErrorReset : BOOL;
	END_STRUCT;
	AxisPara_typ : 	STRUCT 
		Speed : UINT;
	END_STRUCT;
	AxisStatus_typ : 	STRUCT 
		JogNegReady : BOOL;
		JogPosReady : BOOL;
	END_STRUCT;
END_TYPE
