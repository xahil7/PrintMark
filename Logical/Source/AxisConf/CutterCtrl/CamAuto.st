
ACTION SingleCam: 
	iAx_CamSeq.In.Parameters.Configuration.Master := ADR(gAxis01); // Not Mplink Axis Address 
	iAx_CamSeq.In.Parameters.Configuration.MasterParID := ACP10PAR_PCTRL_S_ACT; //412 parid -
	(** STATE 0 - Event 1 - WAIT FOR TRIGGER **) 
	
	iAx_CamSeq.In.Parameters.Configuration.State[0].Event[0].Type := ncTRIGGER1; //Trigger 
	iAx_CamSeq.In.Parameters.Configuration.State[0].Event[0].Attribute := ncAT_ONCE; //Reaction
	iAx_CamSeq.In.Parameters.Configuration.State[0].Event[0].NextState := 3; //Next State
	(** STATE 1 - WAIT FOR TRIGGER **) 
	
	iAx_CamSeq.In.Parameters.Configuration.State[1].CamProfileIndex := 16#FFFE; 
	iAx_CamSeq.In.Parameters.Configuration.State[1].MasterFactor := 300 ; //Master Dist. 
	iAx_CamSeq.In.Parameters.Configuration.State[1].SlaveFactor := -400; //Slave Dist. 
	
	iAx_CamSeq.In.Parameters.Configuration.State[1].CompMode := ncONLYCOMP; 
	iAx_CamSeq.In.Parameters.Configuration.State[1].MasterCompDistance := 400; //Master Dist. 
	iAx_CamSeq.In.Parameters.Configuration.State[1].SlaveCompDistance := -3200; //Slave Dist. 
	
	iAx_CamSeq.In.Parameters.Configuration.State[1].Event[0].Type := ncST_END; //Trigger 
	iAx_CamSeq.In.Parameters.Configuration.State[1].Event[0].Attribute := ncST_END; //Reaction
	iAx_CamSeq.In.Parameters.Configuration.State[1].Event[0].NextState := 2; //Next State
	
	
	
	iAx_CamSeq.In.Parameters.Configuration.State[2].CamProfileIndex := 16#FFFF; 
	iAx_CamSeq.In.Parameters.Configuration.State[2].MasterFactor := 300; //Master Dist. 
	iAx_CamSeq.In.Parameters.Configuration.State[2].SlaveFactor := -400; //Slave Dist. 
	
	iAx_CamSeq.In.Parameters.Configuration.State[2].Event[0].Type := ncST_END; //Trigger 
	iAx_CamSeq.In.Parameters.Configuration.State[2].Event[0].Attribute := ncST_END; //Reaction
	iAx_CamSeq.In.Parameters.Configuration.State[2].Event[0].NextState := 1; //Next State
	
	
	
	//ONLY FOR FIRST PRINT MARK
	iAx_CamSeq.In.Parameters.Configuration.State[3].CamProfileIndex := 16#FFFE; 
	iAx_CamSeq.In.Parameters.Configuration.State[3].MasterFactor := 300; //Master Dist. 
	iAx_CamSeq.In.Parameters.Configuration.State[3].SlaveFactor := -400; //Slave Dist. 
	
	iAx_CamSeq.In.Parameters.Configuration.State[3].CompMode := ncONLYCOMP; 
	iAx_CamSeq.In.Parameters.Configuration.State[3].MasterCompDistance := 1650; //Master Dist. 
	iAx_CamSeq.In.Parameters.Configuration.State[3].SlaveCompDistance := -1580; //Slave Dist. 
	
	iAx_CamSeq.In.Parameters.Configuration.State[3].Event[0].Type :=ncST_END; //Trigger 
	iAx_CamSeq.In.Parameters.Configuration.State[3].Event[0].Attribute := ncST_END; //Reaction
	iAx_CamSeq.In.Parameters.Configuration.State[3].Event[0].NextState := 2; //Next State

END_ACTION

ACTION DualCutterCamAuto :
	iAx_CamSeq.In.Parameters.Configuration.Master := ADR(gAxis01); // Not Mplink Axis Address 
	iAx_CamSeq.In.Parameters.Configuration.MasterParID := ACP10PAR_PCTRL_S_ACT; //412 parid -
	(** STATE 0 - Event 1 - WAIT FOR TRIGGER **) 
	
	iAx_CamSeq.In.Parameters.Configuration.State[0].Event[0].Type := ncTRIGGER1; //Trigger 
	iAx_CamSeq.In.Parameters.Configuration.State[0].Event[0].Attribute := ncAT_ONCE; //Reaction
	iAx_CamSeq.In.Parameters.Configuration.State[0].Event[0].NextState := 3; //Next State
	(** STATE 1 - WAIT FOR TRIGGER **) 
	
	iAx_CamSeq.In.Parameters.Configuration.State[1].CamProfileIndex := 16#FFFE; 
	iAx_CamSeq.In.Parameters.Configuration.State[1].MasterFactor := 300 ; //Master Dist. 
	iAx_CamSeq.In.Parameters.Configuration.State[1].SlaveFactor := -400; //Slave Dist. 
	
	iAx_CamSeq.In.Parameters.Configuration.State[1].CompMode := ncONLYCOMP; 
	iAx_CamSeq.In.Parameters.Configuration.State[1].MasterCompDistance := 400; //Master Dist. 
	iAx_CamSeq.In.Parameters.Configuration.State[1].SlaveCompDistance := -1400; //Slave Dist. 
	
	iAx_CamSeq.In.Parameters.Configuration.State[1].Event[0].Type := ncST_END; //Trigger 
	iAx_CamSeq.In.Parameters.Configuration.State[1].Event[0].Attribute := ncST_END; //Reaction
	iAx_CamSeq.In.Parameters.Configuration.State[1].Event[0].NextState := 2; //Next State
	
	
	
	iAx_CamSeq.In.Parameters.Configuration.State[2].CamProfileIndex := 16#FFFF; 
	iAx_CamSeq.In.Parameters.Configuration.State[2].MasterFactor := 300; //Master Dist. 
	iAx_CamSeq.In.Parameters.Configuration.State[2].SlaveFactor := -400; //Slave Dist. 
	
	iAx_CamSeq.In.Parameters.Configuration.State[2].Event[0].Type := ncST_END; //Trigger 
	iAx_CamSeq.In.Parameters.Configuration.State[2].Event[0].Attribute := ncST_END; //Reaction
	iAx_CamSeq.In.Parameters.Configuration.State[2].Event[0].NextState := 1; //Next State
	
	
	
	//ONLY FOR FIRST PRINT MARK
	iAx_CamSeq.In.Parameters.Configuration.State[3].CamProfileIndex := 16#FFFE; 
	iAx_CamSeq.In.Parameters.Configuration.State[3].MasterFactor := 300; //Master Dist. 
	iAx_CamSeq.In.Parameters.Configuration.State[3].SlaveFactor := -400; //Slave Dist. 
	
	iAx_CamSeq.In.Parameters.Configuration.State[3].CompMode := ncONLYCOMP; 
	iAx_CamSeq.In.Parameters.Configuration.State[3].MasterCompDistance := 1650; //Master Dist. 
	iAx_CamSeq.In.Parameters.Configuration.State[3].SlaveCompDistance := -700; //Slave Dist. 
	
	iAx_CamSeq.In.Parameters.Configuration.State[3].Event[0].Type :=ncST_END; //Trigger 
	iAx_CamSeq.In.Parameters.Configuration.State[3].Event[0].Attribute := ncST_END; //Reaction
	iAx_CamSeq.In.Parameters.Configuration.State[3].Event[0].NextState := 2; //Next State
	END_ACTION
