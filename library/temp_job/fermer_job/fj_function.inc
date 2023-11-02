stock SetPlayerFermerUnloadCP(playerid)
{
	if(GetPlayerTempJob(playerid) == TEMP_JOB_FERMER)
	{
		new rand = random(sizeof fermer_job_unload_cp);

		SetPlayerCheckpoint(playerid, fermer_job_unload_cp[rand][0], fermer_job_unload_cp[rand][1], fermer_job_unload_cp[rand][2], 2.0);
		SetPlayerTempJobState(playerid, TEMP_JOB_STATE_FERMER_UNLOAD);
	}
}