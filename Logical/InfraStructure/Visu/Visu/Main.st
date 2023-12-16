(*********************************************************************************
 * Copyright: B&R Industrial Automation GmbH 
 * Author:    kasliwals 
 * Created:   December 16, 2023/11:55 PM 
* Description: Visu Ctrl Task
* Version : 1.0.0.0 
 *********************************************************************************)

PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	(* Insert code here *)
	gAx_Master.In.Parameters.Velocity := (iMI_ConSetSpeed * PRODUCT_LENGTH)/PER_SEC;
	IF iMI_ConSetSpeed <> (gAx_Master.Out.Velocity * PER_SEC)/PRODUCT_LENGTH  
		OR iMI_ConSetJogAcc <> (gAx_Master.In.Parameters.Jog.Acceleration * PER_SEC)/PRODUCT_LENGTH 
		OR iMI_ConSetJogDeacc <> (	gAx_Master.In.Parameters.Jog.Deceleration * PER_SEC)/PRODUCT_LENGTH 
		OR iMI_ConSetJogVel <> (gAx_Master.In.Parameters.Jog.Velocity  * PER_SEC)/PRODUCT_LENGTH 
		THEN
		gAx_Master.In.Update := TRUE;
		IF gAx_Master.Out.UpdateDone THEN
			gAx_Master.In.Update := FALSE;
		END_IF
	END_IF
	
	IF (iMI_CutSetJogAcc <> (gAx_Slave.In.Parameters.Jog.Acceleration * PER_SEC)/PRODUCT_LENGTH 
		OR iMI_CutSetJogDeacc <> (gAx_Slave.In.Parameters.Jog.Deceleration  * PER_SEC)/PRODUCT_LENGTH 
		OR iMI_CutSetJogVel <> (gAx_Slave.In.Parameters.Jog.Velocity * PER_SEC)/PRODUCT_LENGTH) 
		AND NOT gMI_MODE THEN
		gAx_Slave.In.Update := TRUE;
		IF gAx_Slave.Out.UpdateDone THEN
			gAx_Slave.In.Update := FALSE;
		END_IF
	END_IF
	
	gAx_Master.In.Parameters.Jog.Acceleration := (iMI_ConSetJogAcc * PRODUCT_LENGTH)/PER_SEC;
	gAx_Master.In.Parameters.Jog.Deceleration := (iMI_ConSetJogDeacc * PRODUCT_LENGTH)/PER_SEC;
	gAx_Master.In.Parameters.Jog.Velocity := (iMI_ConSetJogVel * PRODUCT_LENGTH)/PER_SEC;
	
	gAx_Slave.In.Parameters.Jog.Acceleration := (iMI_CutSetJogAcc * PRODUCT_LENGTH)/PER_SEC;
	gAx_Slave.In.Parameters.Jog.Deceleration := (iMI_CutSetJogDeacc * PRODUCT_LENGTH)/PER_SEC;
	gAx_Slave.In.Parameters.Jog.Velocity := (iMI_CutSetJogVel * PRODUCT_LENGTH)/PER_SEC;
	
	iMI_CutActSpeed := (gAx_Slave.Out.Velocity * PER_SEC)/PRODUCT_LENGTH ;
	iMI_ConActSpeed := (gAx_Master.Out.Velocity * PER_SEC)/PRODUCT_LENGTH ;
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

