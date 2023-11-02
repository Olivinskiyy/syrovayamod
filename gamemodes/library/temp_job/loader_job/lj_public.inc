publics: SetPlayerNextCP(playerid)
{
	if(GetPlayerTempJob(playerid) == TEMP_JOB_LOADER)
	{
		//SetPlayerTempJobCheckAnim(playerid, false);

		SetPlayerTempJobState(playerid, TEMP_JOB_STATE_LOADER_LOAD);
		new rand = random(4);
		SetPlayerCheckpoint(playerid, t_load_loader_job[rand][TC_POS_X], t_load_loader_job[rand][TC_POS_Y], t_load_loader_job[rand][TC_POS_Z], 2.0);
	}
}

publics: SetPlayerNextCPLoad(playerid)
{
	if(GetPlayerTempJob(playerid) == TEMP_JOB_LOADER)
	{
		if(GetPlayerTempJobState(playerid) == TEMP_JOB_STATE_LOADER_LOAD)
		{
			ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1, 0);
			
			SetPlayerLoaderUnloadCP(playerid);
		}
	}
}