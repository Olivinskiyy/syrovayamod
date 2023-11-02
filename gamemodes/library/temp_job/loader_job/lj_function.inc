stock SetPlayerLoaderUnloadCP(playerid)
{
	if(GetPlayerTempJob(playerid) == TEMP_JOB_LOADER)
	{
		new rand = random(sizeof loader_job_unload_cp);

		SetPlayerCheckpoint(playerid, loader_job_unload_cp[rand][0], loader_job_unload_cp[rand][1], loader_job_unload_cp[rand][2], 2.0);
		SetPlayerTempJobState(playerid, TEMP_JOB_STATE_LOADER_UNLOAD);
	}
}