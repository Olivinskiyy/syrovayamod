stock TempJobs_Init()
{
	new idx;
	for(idx = 0; idx < sizeof g_temp_jobs; idx ++)
	{
		temp_job_pickup[idx] = CreatePickup(1275,23,GetTempJobInfo(idx, TJ_POS_X), GetTempJobInfo(idx, TJ_POS_Y), GetTempJobInfo(idx, TJ_POS_Z), -1);
	}
	//loader_job_area = CreateDynamicRectangle(591.4026, 1781.0015, 482.7329, 1534.9045, 0, 0);
}