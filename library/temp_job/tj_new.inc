#define GetPlayerTempJob(%0) 			GetPlayerData(%0, pTempJob) 		// ����� ��������� ������ ������ � ������
#define GetPlayerUploadedItems(%0) 		GetPlayerData(%0, pTempJobUploadedItem) //���-�� ��������� 
#define GetPlayerTempJobState(%0) 		GetPlayerData(%0, pTempJobState) // ��� ������


#define SetPlayerTempJob(%0,%1) 			SetPlayerData(%0, pTempJob, %1) 		// ��������� ������
#define SetPlayerUploadedItems(%0,%1) 		SetPlayerData(%0, pTempJobUploadedItem, %1)	 //���-�� ��������� 
#define SetPlayerTempJobState(%0,%1) 		SetPlayerData(%0, pTempJobState, %1)	//�� ����� ������ ���������

#define GetTempJobInfo(%0,%1) g_temp_jobs[%0][%1]

#define MAX_TEMP_JOB 2 

new temp_job_pickup[MAX_TEMP_JOB];

enum //������ �����
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

enum // ids ��������� �����
{
	TEMP_JOB_NONE = -1,
	// ----------------
	TEMP_JOB_LOADER = 0, 		// �������
	TEMP_JOB_FERMER			//�����
};

enum G_TEMP_JOB_STRUCT // ��������� ������
{
	Float: TJ_POS_X,
	Float: TJ_POS_Y,
	Float: TJ_POS_Z,
	TJ_PAY_FOR_LOAD, // ����� �� 1 �������
	TJ_SKIN[2]		// ���� ������ (0 - �������, 1 - �������)
};

new g_temp_jobs[MAX_TEMP_JOB][G_TEMP_JOB_STRUCT] =
{
    {2565.9216, -2082.3132, 21.9549, 1,  {69, 69}},  	// �������
    {1688.1003, 1373.2738, 11.9985, 1, {79, 79}} 		//�����
};

