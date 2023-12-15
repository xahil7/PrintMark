(*********************************************************************************
 * Copyright: B&R Industrial Automation GmbH 
 * Author:    kasliwals 
 * Created:   December 11, 2023/10:46 AM 
* Description: Mapping Structure to Function blocks
* Version : 1.0.0.0 
 *********************************************************************************)

ACTION Mapping: 
	//Assising inputs of Master axis to function Block
	iFb_MpAxisBasic.MpLink       := ADR(gAxisMaster);
	iFb_MpAxisBasic.Enable       := gAx_Master.In.Enable;
	iFb_MpAxisBasic.ErrorReset   := gAx_Master.In.ErrorReset;
	iFb_MpAxisBasic.Parameters   := ADR(gAx_Master.In.Parameters);
	iFb_MpAxisBasic.Update       := gAx_Master.In.Update;
	iFb_MpAxisBasic.Axis         := ADR(gAxis01);
	iFb_MpAxisBasic.Power        := gAx_Master.In.Power;
	iFb_MpAxisBasic.Home         := gAx_Master.In.Home;
	iFb_MpAxisBasic.MoveVelocity := gAx_Master.In.MoveVelocity ;
	iFb_MpAxisBasic.MoveAbsolute := gAx_Master.In.MoveAbsolute;
	iFb_MpAxisBasic.MoveAdditive := gAx_Master.In.MoveAdditive  ;
	iFb_MpAxisBasic.Stop         := gAx_Master.In.Stop;
	iFb_MpAxisBasic.JogPositive  := gAx_Master.In.JogPositive;
	iFb_MpAxisBasic.JogNegative  := gAx_Master.In.JogNegative;
	iFb_MpAxisBasic.Autotune     := gAx_Master.In.Autotune;
	iFb_MpAxisBasic.Simulate     := gAx_Master.In.Simulate;
	iFb_MpAxisBasic.TorqueLimit  := gAx_Master.In.TorqueLimit;
	iFb_MpAxisBasic.ReleaseBrake := gAx_Master.In.ReleaseBrake;
	iFb_MpAxisBasic();
    //Assising Outputs of Master axis to function Block
	gAx_Master.Out.Active         := iFb_MpAxisBasic.Active;
	gAx_Master.Out.Error          := iFb_MpAxisBasic.Error;
	gAx_Master.Out.StatusID       := iFb_MpAxisBasic.StatusID;
	gAx_Master.Out.UpdateDone     := iFb_MpAxisBasic.UpdateDone;
	gAx_Master.Out.Position       := iFb_MpAxisBasic.Position;
	gAx_Master.Out.Velocity       := iFb_MpAxisBasic.Velocity;
	gAx_Master.Out.CommandBusy    := iFb_MpAxisBasic.CommandBusy;
	gAx_Master.Out.CommandAborted := iFb_MpAxisBasic.CommandAborted;
	gAx_Master.Out.PowerOn        := iFb_MpAxisBasic.PowerOn;
	gAx_Master.Out.IsHomed        := iFb_MpAxisBasic.IsHomed;
	gAx_Master.Out.InVelocity     := iFb_MpAxisBasic.InVelocity;
	gAx_Master.Out.InPosition     := iFb_MpAxisBasic.InPosition;
	gAx_Master.Out.MoveActive     := iFb_MpAxisBasic.MoveActive;
	gAx_Master.Out.Stopped        := iFb_MpAxisBasic.Stopped;
	gAx_Master.Out.TuningDone     := iFb_MpAxisBasic.TuningDone;
	gAx_Master.Out.Simulation     := iFb_MpAxisBasic.Simulation;
	gAx_Master.Out.TorqueLimited  := iFb_MpAxisBasic.TorqueLimited;
	gAx_Master.Out.BrakeReleased  := iFb_MpAxisBasic.BrakeReleased;
	gAx_Master.Out.Info           := iFb_MpAxisBasic.Info;

	//Assising inputs of Slave axis to function Block
	iFb_MpAxisSlave.MpLink       := ADR(gAxisSlave);
	iFb_MpAxisSlave.Enable       := gAx_Slave.In.Enable;
	iFb_MpAxisSlave.ErrorReset   := gAx_Slave.In.ErrorReset;
	iFb_MpAxisSlave.Parameters   := ADR(gAx_Slave.In.Parameters);
	iFb_MpAxisSlave.Update       := gAx_Slave.In.Update;
	iFb_MpAxisSlave.Axis         := ADR(gAxis02);
	iFb_MpAxisSlave.Power        := gAx_Slave.In.Power;
	iFb_MpAxisSlave.Home         := gAx_Slave.In.Home;
	iFb_MpAxisSlave.MoveVelocity := gAx_Slave.In.MoveVelocity ;
	iFb_MpAxisSlave.MoveAbsolute := gAx_Slave.In.MoveAbsolute;
	iFb_MpAxisSlave.MoveAdditive := gAx_Slave.In.MoveAdditive  ;
	iFb_MpAxisSlave.Stop         := gAx_Slave.In.Stop;
	iFb_MpAxisSlave.JogPositive  := gAx_Slave.In.JogPositive;
	iFb_MpAxisSlave.JogNegative  := gAx_Slave.In.JogNegative;
	iFb_MpAxisSlave.Autotune     := gAx_Slave.In.Autotune;
	iFb_MpAxisSlave.Simulate     := gAx_Slave.In.Simulate;
	iFb_MpAxisSlave.TorqueLimit  := gAx_Slave.In.TorqueLimit;
	iFb_MpAxisSlave.ReleaseBrake := gAx_Slave.In.ReleaseBrake;
	iFb_MpAxisSlave();
    //Assising Outputs of Slave axis to function Block
	gAx_Slave.Out.Active         := iFb_MpAxisSlave.Active;
	gAx_Slave.Out.Error          := iFb_MpAxisSlave.Error;
	gAx_Slave.Out.StatusID       := iFb_MpAxisSlave.StatusID;
	gAx_Slave.Out.UpdateDone     := iFb_MpAxisSlave.UpdateDone;
	gAx_Slave.Out.Position       := iFb_MpAxisSlave.Position;
	gAx_Slave.Out.Velocity       := iFb_MpAxisSlave.Velocity;
	gAx_Slave.Out.CommandBusy    := iFb_MpAxisSlave.CommandBusy;
	gAx_Slave.Out.CommandAborted := iFb_MpAxisSlave.CommandAborted;
	gAx_Slave.Out.PowerOn        := iFb_MpAxisSlave.PowerOn;
	gAx_Slave.Out.IsHomed        := iFb_MpAxisSlave.IsHomed;
	gAx_Slave.Out.InVelocity     := iFb_MpAxisSlave.InVelocity;
	gAx_Slave.Out.InPosition     := iFb_MpAxisSlave.InPosition;
	gAx_Slave.Out.MoveActive     := iFb_MpAxisSlave.MoveActive;
	gAx_Slave.Out.Stopped        := iFb_MpAxisSlave.Stopped;
	gAx_Slave.Out.TuningDone     := iFb_MpAxisSlave.TuningDone;
	gAx_Slave.Out.Simulation     := iFb_MpAxisSlave.Simulation;
	gAx_Slave.Out.TorqueLimited  := iFb_MpAxisSlave.TorqueLimited;
	gAx_Slave.Out.BrakeReleased  := iFb_MpAxisSlave.BrakeReleased;
	gAx_Slave.Out.Info           := iFb_MpAxisSlave.Info;

	//Assigning Output Structure to Axis Coupling Function Block
	iAx_CamSeq.Out.Active				:= iFb_CamSeq.Active;
	iAx_CamSeq.Out.Error				:= iFb_CamSeq.Error;
	iAx_CamSeq.Out.StatusID				:= iFb_CamSeq.StatusID;
	iAx_CamSeq.Out.UpdateDone			:= iFb_CamSeq.UpdateDone;
	iAx_CamSeq.Out.ActStIndex			:= iFb_CamSeq.ActualStateIndex;
	iAx_CamSeq.Out.ActStCamIndex		:= iFb_CamSeq.ActualStateCamIndex;
	iAx_CamSeq.Out.Standby				:= iFb_CamSeq.Standby;
	iAx_CamSeq.Out.InCompensation		:= iFb_CamSeq.InCompensation;
	iAx_CamSeq.Out.InSync				:= iFb_CamSeq.InSync;
	iAx_CamSeq.Out.Info					:= iFb_CamSeq.Info;

	//Assigning Input Structure to Axis Cam Sequencer Function Block
	iFb_CamSeq.MpLink					:= ADR(gAxisSlave);
	iFb_CamSeq.Enable					:= TRUE;
	iFb_CamSeq.ErrorReset				:= iAx_CamSeq.In.ErrorReset;
	iFb_CamSeq.Parameters				:= ADR(iAx_CamSeq.In.Parameters);
	iFb_CamSeq.Update					:= iAx_CamSeq.In.Update;
	iFb_CamSeq.MpLinkMaster				:= ADR(gAxisMaster);
	iFb_CamSeq.Signal1					:= iAx_CamSeq.In.Signal1;
	iFb_CamSeq.Signal2					:= iAx_CamSeq.In.Signal2;
	iFb_CamSeq.Signal3					:= iAx_CamSeq.In.Signal3;
	iFb_CamSeq.Signal4					:= iAx_CamSeq.In.Signal4; 
	iFb_CamSeq.StartSequence			:= iAx_CamSeq.In.StartSequence;
	iFb_CamSeq.Continue					:= iAx_CamSeq.In.Continue;
	iFb_CamSeq.EndSequence				:= iAx_CamSeq.In.EndSequence;
	iFb_CamSeq();
	
END_ACTION
