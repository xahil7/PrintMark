
ACTION DualCutter: 
	CASE SlaveStateDual OF 
		WAIT :
			IF gAx_Slave.Out.Active THEN
				SlaveStateDual := ACTIVE ;
			END_IF
			
		ACTIVE :
			IF gAx_Slave.Out.Info.ReadyToPowerOn THEN
				gAx_Slave.In.Power := TRUE;
			END_IF
			IF gAx_Slave.Out.PowerOn AND gAx_Slave.Out.Position > 3013 THEN
				SlaveStateDual := POSITIVE_HOMING_MODE;
			END_IF
			IF gAx_Slave.Out.PowerOn AND gAx_Slave.Out.Position > 142 AND gAx_Slave.Out.Position < 853 THEN
				SlaveStateDual := NEGATIVE_HOMING_MODE;
			END_IF
			
		NEGATIVE_HOMING_MODE :
			gAx_Slave.In.Parameters.Home.Mode := mpAXIS_HOME_MODE_REF_PULSE;
			gAx_Slave.In.Parameters.Home.HomingDirection := mpAXIS_HOME_DIR_NEGATIVE;
			gAx_Slave.In.Parameters.Home.HomingVelocity := 300;
			gAx_Slave.In.Parameters.Position := 142;
			gAx_Slave.In.Parameters.Velocity := 300;
			gAx_Slave.In.Update := TRUE;
			IF gAx_Slave.Out.UpdateDone THEN
				gAx_Slave.In.Update := FALSE;
				gAx_Slave.In.Home := TRUE;
				SlaveStateDual := HOMING;
			END_IF
		POSITIVE_HOMING_MODE :
			gAx_Slave.In.Parameters.Home.Mode := mpAXIS_HOME_MODE_REF_PULSE;
			gAx_Slave.In.Parameters.Home.HomingDirection := mpAXIS_HOME_DIR_POSITIVE;
			gAx_Slave.In.Parameters.Home.HomingVelocity := 300;
			gAx_Slave.In.Parameters.Position := 142;
			gAx_Slave.In.Parameters.Velocity := 300;
			gAx_Slave.In.Update := TRUE;
			IF gAx_Slave.Out.UpdateDone THEN
				gAx_Slave.In.Update := FALSE;
				gAx_Slave.In.Home := TRUE;
				SlaveStateDual := HOMING;
			END_IF
			
		HOMING :
			IF gAx_Slave.Out.IsHomed THEN
				gAx_Slave.In.Home := FALSE;
				gAx_Slave.In.MoveAbsolute := TRUE;
			END_IF
			IF gAx_Slave.Out.InPosition THEN
				gAx_Slave.In.MoveAbsolute := FALSE;
				SlaveStateDual := OPERATION;
			END_IF
		
		OPERATION :
	END_CASE
	
END_ACTION
