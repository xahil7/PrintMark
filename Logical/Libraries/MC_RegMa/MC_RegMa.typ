
TYPE
	MC_BR_PRODUCT_REF : 	STRUCT  (*structure with product and search parameters*)
		Length : REAL; (*product length*)
		LengthChange : REAL; (*additive value which is used in case of a search for a trigger*)
		LengthTolerance : REAL; (*tolerance in the product length [%]*)
		StartOffset : REAL; (*offset at the start of the interval*)
		RegMarkPosition : REAL; (*set position of the registration mark in the product interval*)
		DistanceToSensor : REAL; (*distance between the sensor and the cut/seal position*)
		SearchMode : UINT; (*mode for automatic registration mark search*)
		MissedTriggerCount : UINT; (*number of consecutively missing triggers after which the search will be started*)
	END_STRUCT;
	MC_BR_RMTRIGGER_REF : 	STRUCT  (*structure with data of trigger input*)
		EventSourceParID : UINT; (*ParID as event source*)
		PosSource : USINT; (*select the position to be latched ncS_SET / ncS_ACT*)
		Edge : USINT; (*edge selection for trigger event*)
		MinWidth : REAL; (*minimum width of a valid trigger event*)
		MaxWidth : REAL; (*maximum width of a valid trigger event*)
		WindowNegative : REAL; (*window in which the valid trigger signal can occur before the expected position*)
		WindowPositive : REAL; (*window in which the valid trigger signal can occur after the expected position*)
		MasterInterval : REAL; (*interval of a product cycle*)
		IntervalSourceParID : UINT; (*ParID for detecting the start of an interval*)
		IntervalLevel : REAL; (*value of the significant event "IntervalSourceParID"*)
		IntervalCompareMode : UINT; (*mode with reference to "IntervalLevel"*)
		SensorDelay : DINT; (*registration mark sensor delay*)
		DisableWidthEvaluationAtStart : BOOL; (*no width evaluation at start if trigger is set*)
	END_STRUCT;
	MC_0066_IS_TYP : 	STRUCT  (*internal variable*)
		SearchTrigger : BOOL; (*internal variable*)
		SearchTrigger_executed : BOOL; (*internal variable*)
		InitData : BOOL; (*internal variable*)
		Active : BOOL; (*internal variable*)
		Valid : BOOL; (*internal variable*)
		Busy : BOOL; (*internal variable*)
		Error : BOOL; (*internal variable*)
		ErrorID : UINT; (*internal variable*)
		DataInitialized : BOOL; (*internal variable*)
		MasterParID : UINT; (*internal variable*)
		Mode : UINT; (*internal variable*)
		TriggerInput : MC_BR_RMTRIGGER_REF; (*internal variable*)
		ProductParameters : MC_BR_PRODUCT_REF; (*internal variable*)
		SearchActive : BOOL; (*internal variable*)
		MissedTriggers : UINT; (*internal variable*)
		ValidTriggers : UDINT; (*internal variable*)
		ActLength : REAL; (*internal variable*)
		ActIntervalLength : REAL; (*internal variable*)
		ActPosition : REAL; (*internal variable*)
		SearchDone : BOOL; (*internal variable*)
		LengthError : REAL; (*internal variable*)
		PositionError : REAL; (*internal variable*)
		AverageProductLength : REAL; (*internal variable*)
		ArrayProductLength : ARRAY[0..50]OF REAL; (*internal variable*)
		cntProductLengths : USINT; (*internal variable*)
		cnt_Average : USINT; (*internal variable*)
		state : UINT; (*internal variable*)
		LastState : UINT; (*internal variable*)
		NextState : UINT; (*internal variable*)
		CAMCONID : UINT; (*internal variable*)
		CMPID : UINT; (*internal variable*)
		DelayID : UINT; (*internal variable*)
		LatchID : UINT; (*internal variable*)
		new_LatchIVPos : BOOL; (*internal variable*)
		LatchIVPos : DINT; (*internal variable*)
		LatchIVPos_old : DINT; (*internal variable*)
		new_LatchPMPos : BOOL; (*internal variable*)
		SptID : USINT; (*internal variable*)
		LockIDSend : USINT; (*internal variable*)
		LockIDReceive : USINT; (*internal variable*)
		LatchPMPos : DINT; (*internal variable*)
		LatchPMPos_old : DINT; (*internal variable*)
		LatchPMErrCount : USINT; (*internal variable*)
		LatchPMErrCount_old : USINT; (*internal variable*)
		Skip_LengthCalculation : BOOL; (*internal variable*)
		LatchPMStatusCount : USINT; (*internal variable*)
		LatchPM_reconfiguredtoSearch : BOOL; (*internal variable*)
		sendSlot : UINT; (*internal variable*)
		readSlot : UINT; (*internal variable*)
		LatchPMValueOffset : UINT; (*internal variable*)
		LatchPMRecIndex : USINT; (*internal variable*)
		LatchPMParIndex : USINT; (*internal variable*)
		LatchIVValueOffset : UINT; (*internal variable*)
		LatchIVRecIndex : USINT; (*internal variable*)
		LockID : USINT; (*internal variable*)
		LatchPMEOffset : UINT; (*internal variable*)
		LatchPMERecIndex : USINT; (*internal variable*)
		LockIDPar : USINT; (*internal variable*)
		LatchPMSCOffset : UINT; (*internal variable*)
		LatchPMSCRecIndex : USINT; (*internal variable*)
		LockIDMa : USINT; (*internal variable*)
		IMG : MC_BR_RMIMG_REF; (*internal variable*)
		InitDataCMP : BOOL; (*internal variable*)
		InitDataCAMCON : BOOL; (*internal variable*)
		InitDataLatchPM : BOOL; (*internal variable*)
		InitDataInternal : BOOL; (*internal variable*)
		ReInitializeMasterInterval : BOOL; (*internal variable*)
		FUBModeChanged : BOOL; (*internal variable*)
		Wait_for_valid_PM : BOOL; (*internal variable*)
		Wait_for_which_telegrams : UINT; (*internal variable*)
		SavedFrDrvCnt : USINT; (*internal variable*)
		WaitForTelegrams : USINT; (*internal variable*)
		IntervalStartDelay : REAL; (*internal variable*)
		Latch_Init_value : DINT; (*internal variable*)
	END_STRUCT;
	MC_BR_RMIMG_REF : 	STRUCT  (*internal variable*)
		Length : REAL; (*internal variable*)
		LengthChange : REAL; (*internal variable*)
		RegMarkPosition : REAL; (*internal variable*)
		LengthTolerance : REAL; (*internal variable*)
		SearchMode : UINT; (*internal variable*)
		MissedTriggerCount : UINT; (*internal variable*)
		EventSourceParID : UINT; (*internal variable*)
		PosSource : USINT; (*internal variable*)
		Edge : USINT; (*internal variable*)
		MinWidth : REAL; (*internal variable*)
		MaxWidth : REAL; (*internal variable*)
		WindowNegative : REAL; (*internal variable*)
		WindowPositive : REAL; (*internal variable*)
		MasterInterval : REAL; (*internal variable*)
		IntervalLevel : REAL; (*internal variable*)
		IntervalSourceParID : UINT; (*internal variable*)
		IntervalCompareMode : UINT; (*internal variable*)
		SensorDelay : DINT; (*internal variable*)
		LatchPM_Mode : UINT; (*internal variable*)
		Camcon_InParID : UINT; (*internal variable*)
		Capture_InParID : UINT; (*internal variable*)
		Reserve : UINT; (*alignment*)
		IntervalStartDelay : REAL; (*internal variable*)
	END_STRUCT;
	MC_ADDINFO001_REF : 	STRUCT  (*structure for additional info output*)
		LengthErrorFiltered : REAL; (*length error after filter or queuing*)
		DistancePAction : REAL; (*proportional action of distance controller*)
		DistanceIAction : REAL; (*integral action of distance controller*)
		DistanceIntegralTime : REAL; (*integral action time of distance controller*)
		PositionErrorFiltered : REAL; (*position error after filter or queuing*)
		ShiftPAction : REAL; (*proportional action of shift controller*)
		ShiftIAction : REAL; (*integral action of shift controller*)
		ShiftIntegralTime : REAL; (*integral action time of shift controller*)
		TimeBetweenRMs : REAL; (*measured time between the last two registration marks*)
		Reserve1 : REAL; (*reserve*)
		Reserve2 : REAL; (*reserve*)
		Reserve3 : REAL; (*reserve*)
		Reserve4 : REAL; (*reserve*)
		Reserve5 : REAL; (*reserve*)
	END_STRUCT;
	MC_RMCALC001_REF : 	STRUCT  (*structure with data for registration mark calculation*)
		Mode : UINT; (*mode for registration mark calculation*)
		MaxDistanceCorrection : REAL; (*maximum distance from registration mark calculation*)
		MaxShiftCorrection : REAL; (*maximum shift from registration mark calculation*)
		DistanceCorrectionClamp : BOOL; (*if calculated distance correction higher than maximum put out 0*)
		AutoParamIntegrator : BOOL; (*automatic parametrization of integrator action times*)
		DistanceGain : REAL; (*proportional amplification for distance controller*)
		DistanceIntegralTime : REAL; (*integrator action time for distance controller*)
		ShiftGain : REAL; (*proportional amplification for shift controller*)
		ShiftIntegralTime : REAL; (*integrator action time for shift controller*)
		ValuesForAveraging : USINT; (*number of values for average calculation*)
		ValuesForQueuing : USINT; (*number of values for queuing*)
	END_STRUCT;
	MC_0091_IS_TYP : 	STRUCT  (*internal variable*)
		InitData : BOOL; (*internal variable*)
		Reset : BOOL; (*internal variable*)
		Calculate : BOOL; (*internal variable*)
		LengthError : REAL; (*internal variable*)
		PositionError : REAL; (*internal variable*)
		ControllerParameters : MC_RMCALC001_REF; (*internal variable*)
		Valid : BOOL; (*internal variable*)
		Busy : BOOL; (*internal variable*)
		Error : BOOL; (*internal variable*)
		ErrorID : UINT; (*internal variable*)
		DataInitialized : BOOL; (*internal variable*)
		ValidCorrections : UDINT; (*internal variable*)
		Distance : REAL; (*internal variable*)
		Shift : REAL; (*internal variable*)
		LimiterActive : BOOL; (*internal variable*)
		ShiftLimiterActive : BOOL; (*internal variable*)
		DistanceLimiterActive : BOOL; (*internal variable*)
		LengthErrorQ : ARRAY[0..50]OF REAL; (*internal variable*)
		PositionErrorQ : ARRAY[0..50]OF REAL; (*internal variable*)
		QLength : USINT; (*internal variable*)
		WriteIndex : USINT; (*internal variable*)
		FirstAfterEnable : BOOL; (*internal variable*)
		TickCountOld : UDINT; (*internal variable*)
		state : UINT; (*internal variable*)
	END_STRUCT;
	MC_BR_CFG_RM2_REF : 	STRUCT  (*structure with configuration parameters*)
		ProductLength : REAL; (*product length*)
		RegMarkPosition : REAL; (*set position of the registration mark related to cut (FiFo delayed)*)
		RegMarkOffset : REAL; (*modify the set position of the RM related to cut (directly)*)
		DistanceToSensor : REAL; (*distance between the sensor and the cut/seal position*)
	END_STRUCT;
	MC_BR_ADV_RM2_REF : 	STRUCT  (*structure with advanced configuration parameters*)
		Mode : UINT; (*operation mode*)
		EventSourceParID : UINT; (*ParID as event source e.g. where sensor is connected*)
		Edge : USINT; (*edge selection for registration mark sensor*)
		MinWidth : REAL; (*minimum width of the registration mark signal*)
		MaxWidth : REAL; (*maximum width of the registration mark signal*)
		WindowNeg : REAL; (*window before the expected registration mark signal*)
		WindowPos : REAL; (*window after the expected registration mark signal*)
		SensorDelay : DINT; (*[�s] registration mark sensor delay*)
		CorrectCurrentCycle : BOOL; (*correction can be done in actual product interval*)
		CorrectionValueLimitNeg : REAL; (*negative maximum limit value of CorrectionValue*)
		CorrectionValueLimitPos : REAL; (*positive maximum limit value of CorrectionValue*)
		DisableWidthEvaluationAtStart : BOOL; (*no width evaluation at start if trigger is set*)
	END_STRUCT;
	MC_BR_ADDINFO_RM2_REF : 	STRUCT  (*structure for additional output information*)
		ActLength : REAL; (*currently measured length*)
		AverageProductLength : REAL; (*average value of the last 50 measured product lengths*)
		CutLength : REAL; (*measured length from last CutPoint to actual one*)
		QueueElements : UINT; (*actual size of FIFO buffer*)
		LimitNegActive : BOOL; (*negative limitation of CorrectionValue active*)
		LimitPosActive : BOOL; (*positive limitation of CorrectionValue active*)
		ActualCorrectionValue : REAL; (*CorrectionValue without limitation*)
	END_STRUCT;
	MC_0117_IS_TYP : 	STRUCT  (*internal structure for MC_BR_RegMarkCapture002*)
		SearchRM : BOOL; (*internal variable*)
		IgnoreSearchRM : BOOL; (*internal variable*)
		InitData : BOOL; (*internal variable*)
		Reserve1 : USINT; (*alignment*)
		CutPosition : DINT; (*internal variable*)
		oldFBCutPosition : DINT; (*internal variable*)
		oldFBCutPositionCL : DINT; (*internal variable*)
		ProductLength : DINT; (*internal variable*)
		ProductLengthAtCut : DINT; (*internal variable*)
		RegMarkPosition : DINT; (*internal variable*)
		RegMarkOffset : DINT; (*internal variable*)
		DistanceToSensor : DINT; (*internal variable*)
		Mode : UINT; (*internal variable*)
		EventSourceParID : UINT; (*internal variable*)
		Edge : USINT; (*internal variable*)
		DisableWidthEvaluationAtStart : BOOL; (*internal variable*)
		Reserve2 : UINT; (*alignment*)
		MinWidth : DINT; (*internal variable*)
		MaxWidth : DINT; (*internal variable*)
		WindowNeg : DINT; (*internal variable*)
		WindowPos : DINT; (*internal variable*)
		SensorDelay : DINT; (*internal variable*)
		CorrectionValueLimitNeg : DINT; (*internal variable*)
		CorrectionValueLimitPos : DINT; (*internal variable*)
		CorrectCurrentCycle : BOOL; (*internal variable*)
		Active : BOOL; (*internal variable*)
		Valid : BOOL; (*internal variable*)
		Busy : BOOL; (*internal variable*)
		Reserve3 : USINT; (*alignment*)
		Error : BOOL; (*internal variable*)
		ErrorID : UINT; (*internal variable*)
		DataInitialized : BOOL; (*internal variable*)
		SearchDone : BOOL; (*internal variable*)
		ProductsWithoutRM : UINT; (*internal variable*)
		ValidRMs : UDINT; (*internal variable*)
		CorrectionValue : DINT; (*internal variable*)
		CorrectionValueUnlimited : DINT; (*internal variable*)
		ActLength : DINT; (*internal variable*)
		AverageProductLength : DINT; (*internal variable*)
		ArrayProductLength : ARRAY[0..49]OF DINT; (*internal variable*)
		idxProductLengths : USINT; (*internal variable*)
		cntAverage : USINT; (*internal variable*)
		LimitNegActive : BOOL; (*internal variable*)
		LimitPosActive : BOOL; (*internal variable*)
		CutLength : DINT; (*internal variable*)
		IMG : MC_BR_RM2_IMG_REF; (*internal variable*)
		state : USINT; (*internal variable*)
		LastState : USINT; (*internal variable*)
		NextState : USINT; (*internal variable*)
		Reserve4 : USINT; (*alignment*)
		BitCompInfo : UINT; (*internal variable*)
		BitIndex : UINT; (*internal variable*)
		BitOffset : UINT; (*internal variable*)
		LatchIndex : UINT; (*internal variable*)
		DelayIndex : UINT; (*internal variable*)
		Reserve8 : UINT; (*internal variable*)
		BitRecIndex : USINT; (*internal variable*)
		LockID : USINT; (*internal variable*)
		LockIDPar : USINT; (*internal variable*)
		IgnoreLatchErrorCountOnce : BOOL; (*internal variable*)
		LatchPos : DINT; (*internal variable*)
		oldLatchPos : DINT; (*internal variable*)
		LatchPosOffset : UINT; (*internal variable*)
		LatchPosRecIndex : USINT; (*internal variable*)
		LatchErrCount : USINT; (*internal variable*)
		oldLatchErrCount : USINT; (*internal variable*)
		LatchStatusCount : USINT; (*internal variable*)
		LatchReconfiguredtoSearch : BOOL; (*internal variable*)
		SavedFrDrvCnt : USINT; (*internal variable*)
		WaitForTelegrams : USINT; (*internal variable*)
		PerformLengthCalculation : BOOL; (*internal variable*)
		ModeAcceptAllTrigger : BOOL; (*internal variable*)
		ModeSignalWidth : BOOL; (*internal variable*)
		ProductCntToStart : USINT; (*internal variable*)
		PerformLimitation : BOOL; (*internal variable*)
		FiFoUsed : BOOL; (*internal variable*)
		RMOccuredOnce : BOOL; (*internal variable*)
		FIFOBuffer : MC_RMC002_FIFO_TYP; (*internal variable*)
		MasterAxisPositionAtBeginning : DINT; (*internal variable*)
		DelayTime : DINT; (*internal variable*)
		SPTDelayTime : REAL; (*internal variable*)
		LatchTime : DINT; (*internal variable*)
	END_STRUCT;
	MC_BR_RM2_IMG_REF : 	STRUCT  (*internal structure*)
		EventSourceParID : UINT; (*internal variable*)
		Edge : USINT; (*internal variable*)
		Reserve : USINT; (*alignment*)
		MinWidth : DINT; (*internal variable*)
		MaxWidth : DINT; (*internal variable*)
		WindowNeg : DINT; (*internal variable*)
		WindowPos : DINT; (*internal variable*)
		LatchTDelay : DINT; (*internal variable*)
		LatchIV : DINT; (*internal variable*)
		LatchIVL : DINT; (*internal variable*)
		SPTDelay : REAL; (*internal variable*)
	END_STRUCT;
	MC_RMC002_FIFO_TYP : 	STRUCT  (*structure for FIFO buffer within RegmarkCapture002*)
		QueueElements : UINT; (*internal variable*)
		IdxWriteIn : USINT; (*internal variable*)
		IdxReadOut : USINT; (*internal variable*)
		BufferRM : ARRAY[0..255]OF DINT; (*internal variable*)
		BufferPL : ARRAY[0..255]OF DINT; (*internal variable*)
	END_STRUCT;
END_TYPE
