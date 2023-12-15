
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	(* Insert code here *)
	gAx_Master.In.Parameters.Velocity := (iMI_ConSetSpeed * PRODUCT_LENGTH)/PER_SEC;
	IF iMI_ConSetSpeed <> (gAx_Master.Out.Velocity * PER_SEC)/PRODUCT_LENGTH THEN
		gAx_Master.In.Update := TRUE;
		IF gAx_Master.Out.UpdateDone THEN
			gAx_Master.In.Update := FALSE;
		END_IF
	END_IF
	
	iMI_ConActSpeed := (gAx_Master.Out.Velocity * PER_SEC)/PRODUCT_LENGTH ;
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

