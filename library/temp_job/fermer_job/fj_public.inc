publics: SetPlayerFermerNextCP(playerid)
{
	if(GetPlayerTempJob(playerid) == TEMP_JOB_FERMER)
	{
		//SetPlayerTempJobCheckAnim(playerid, false);

		SetPlayerTempJobState(playerid, TEMP_JOB_STATE_FERMER_LOAD);
		new rand = random(4);
		SetPlayerCheckpoint(playerid, t_load_fermer_job[rand][TC_POS_X], t_load_fermer_job[rand][TC_POS_Y], t_load_fermer_job[rand][TC_POS_Z], 2.0);
	}
}

publics: SetPlayerNextFermerCPLoad(playerid)
{
	if(GetPlayerTempJob(playerid) == TEMP_JOB_FERMER)
	{
		if(GetPlayerTempJobState(playerid) == TEMP_JOB_STATE_FERMER_LOAD)
		{
			ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1, 0);
			
			SetPlayerFermerUnloadCP(playerid);
		}
	}
}