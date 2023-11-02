#define GetPlayerTempJob(%0) 			GetPlayerData(%0, pTempJob) 		// какая временная работа сейчас у игрока
#define GetPlayerUploadedItems(%0) 		GetPlayerData(%0, pTempJobUploadedItem) //кол-во предметов 
#define GetPlayerTempJobState(%0) 		GetPlayerData(%0, pTempJobState) // что делать


#define SetPlayerTempJob(%0,%1) 			SetPlayerData(%0, pTempJob, %1) 		// временная работа
#define SetPlayerUploadedItems(%0,%1) 		SetPlayerData(%0, pTempJobUploadedItem, %1)	 //кол-во предметов 
#define SetPlayerTempJobState(%0,%1) 		SetPlayerData(%0, pTempJobState, %1)	//на какой стадии находится

#define GetTempJobInfo(%0,%1) g_temp_jobs[%0][%1]

#define MAX_TEMP_JOB 2 

new temp_job_pickup[MAX_TEMP_JOB];

enum //стадии работ
{
	TEMP_JOB_STATE_NONE,
	// --------
	TEMP_JOB_STATE_LOADER_LOAD, 	
	TEMP_JOB_STATE_LOADER_UNLOAD, 	
	TEMP_JOB_STATE_LOADER_DROP_LOAD,
	// -------
	TEMP_JOB_STATE_FERMER_LOAD, 	
	TEMP_JOB_STATE_FERMER_UNLOAD, 	
	TEMP_JOB_STATE_FERMER_DROP_LOAD,
};

enum // ids временных работ
{
	TEMP_JOB_NONE = -1,
	// ----------------
	TEMP_JOB_LOADER = 0, 		// грузчик
	TEMP_JOB_FERMER			//Ферма
};

enum G_TEMP_JOB_STRUCT // временные работы
{
	Float: TJ_POS_X,
	Float: TJ_POS_Y,
	Float: TJ_POS_Z,
	TJ_PAY_FOR_LOAD, // плата за 1 продукт
	TJ_SKIN[2]		// скин игрока (0 - мужской, 1 - женский)
};

new g_temp_jobs[MAX_TEMP_JOB][G_TEMP_JOB_STRUCT] =
{
    {2565.9216, -2082.3132, 21.9549, 1,  {69, 69}},  	// грузчик
    {1688.1003, 1373.2738, 11.9985, 1, {79, 79}} 		//ферма
};

