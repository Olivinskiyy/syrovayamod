#include <a_samp>
#include <Pawn.CMD>

#define COLOR_ORANGE 0xFF9900AA
#define COLOR_WHITE 0xFFFFFFAA

new Fura[2];
new Pricep[10];
new Text3D:Pricep3dtext[10];
new Checkpoint[MAX_PLAYERS];

forward RazgruzFurui(playerid);

public OnFilterScriptInit()
{
    Fura[0] = AddStaticVehicleEx(515,1846.830078,2847.594726,12.564512,352.220886,-1,-1,600000); // Фура № 1
    AddStaticVehicleEx(515,12.2435,-232.4889,6.4411,89.7957,-1,-1,600000); // Фура № 2
    AddStaticVehicleEx(515,12.2912,-240.7080,6.4506,89.8790,-1,-1,600000); // Фура № 3
	AddStaticVehicleEx(403,12.8029,-248.9818,6.0362,90.7330,-1,-1,600000); // Фура
	AddStaticVehicleEx(403,12.9481,-257.2370,6.0355,90.5530,-1,-1,600000); // Фура
	AddStaticVehicleEx(403,12.8305,-265.2685,6.0354,89.7056,-1,-1,600000); // Фура
	AddStaticVehicleEx(514,-18.8261,-220.4126,6.0162,175.5331,-1,-1,600000); // Фура
	AddStaticVehicleEx(514,-26.6368,-219.4905,6.0159,175.7046,-1,-1,600000); // Фура
	Fura[1] = AddStaticVehicleEx(514,-34.4157,-218.6096,6.0108,175.0944,-1,-1,600000); // Фура
    Pricep[0] = AddStaticVehicleEx(435,-55.1299,-224.4092,6.0257,266.6206,-1,-1,600000); // Прицеп № 1
    Pricep[1] = AddStaticVehicleEx(435,-23.1413,-274.3386,6.0080,180.5373,-1,-1,600000); // Прицеп № 2
    Pricep[2] = AddStaticVehicleEx(435,-14.7631,-274.5206,6.0191,180.1252,-1,-1,600000); // Прицеп № 3
	Pricep[3] = AddStaticVehicleEx(584,-61.6196,-321.5299,6.0160,270.4092,-1,-1,600000); // Прицеп
	Pricep[4] = AddStaticVehicleEx(591,-61.4658,-307.4087,6.0192,270.4079,-1,-1,600000); // Прицеп
	Pricep[5] = AddStaticVehicleEx(450,-1.2615,-339.9842,6.0233,89.0408,-1,-1,600000); // Прицеп
	Pricep[6] = AddStaticVehicleEx(450,-1.2152,-322.3202,6.0038,89.9523,-1,-1,600000); // Прицеп
	Pricep[7] = AddStaticVehicleEx(450,-1.1001,-301.1582,6.0088,89.6910,-1,-1,600000); // Прицеп
	Pricep[8] = AddStaticVehicleEx(591,-116.4185,-322.6622,2.0134,179.6741,-1,-1,600000); // Прицеп
	Pricep[9] = AddStaticVehicleEx(584,-231.7576,-190.1307,2.0194,259.2906,-1,-1,600000); // Прицеп

	Pricep3dtext[0] = Create3DTextLabel("{ffa500}[Груз: {FFFFFF}Аммуниция{ffa500}]", COLOR_ORANGE, 0.0, 0.0, -100.0, 50.0, 0, 1);
	Attach3DTextLabelToVehicle(Pricep3dtext[0], Pricep[0], 0.0, 0.0, 0.0);
   	Pricep3dtext[1] = Create3DTextLabel("{ffa500}[Груз: {FFFFFF}Закусочная{ffa500}]", COLOR_ORANGE, 0.0, 0.0, -100.0, 50.0, 0, 1);
	Attach3DTextLabelToVehicle(Pricep3dtext[1], Pricep[1], 0.0, 0.0, 0.0);
	Pricep3dtext[2] = Create3DTextLabel("{ffa500}[Груз: {FFFFFF}Одежда{ffa500}]", COLOR_ORANGE, 0.0, 0.0, -100.0, 50.0, 0, 1);
	Attach3DTextLabelToVehicle(Pricep3dtext[2], Pricep[2], 0.0, 0.0, 0.0);
	Pricep3dtext[3] = Create3DTextLabel("{ffa500}[Груз: {FFFFFF}Бензин{ffa500}]", COLOR_ORANGE, 0.0, 0.0, -100.0, 50.0, 0, 1);
	Attach3DTextLabelToVehicle(Pricep3dtext[3], Pricep[3], 0.0, 0.0, 0.0);
	Pricep3dtext[4] = Create3DTextLabel("{ffa500}[Груз: {FFFFFF}Замороженные продукты{ffa500}]", COLOR_ORANGE, 0.0, 0.0, -100.0, 50.0, 0, 1);
	Attach3DTextLabelToVehicle(Pricep3dtext[4], Pricep[4], 0.0, 0.0, 0.0);
	Pricep3dtext[5] = Create3DTextLabel("{ffa500}[Груз: {FFFFFF}Щебень{ffa500}]", COLOR_ORANGE, 0.0, 0.0, -100.0, 50.0, 0, 1);
	Attach3DTextLabelToVehicle(Pricep3dtext[5], Pricep[5], 0.0, 0.0, 0.0);
	Pricep3dtext[6] = Create3DTextLabel("{ffa500}[Груз: {FFFFFF}Песок{ffa500}]", COLOR_ORANGE, 0.0, 0.0, -100.0, 50.0, 0, 1);
	Attach3DTextLabelToVehicle(Pricep3dtext[6], Pricep[6], 0.0, 0.0, 0.0);
	Pricep3dtext[7] = Create3DTextLabel("{ffa500}[Груз: {FFFFFF}Известняк{ffa500}]", COLOR_ORANGE, 0.0, 0.0, -100.0, 50.0, 0, 1);
	Attach3DTextLabelToVehicle(Pricep3dtext[7], Pricep[7], 0.0, 0.0, 0.0);
	Pricep3dtext[8] = Create3DTextLabel("{ffa500}[Груз: {FFFFFF}Замороженные продукты{ffa500}]", COLOR_ORANGE, 0.0, 0.0, -100.0, 50.0, 0, 1);
	Attach3DTextLabelToVehicle(Pricep3dtext[8], Pricep[8], 0.0, 0.0, 0.0);
	Pricep3dtext[9] = Create3DTextLabel("{ffa500}[Груз: {FFFFFF}Бензин{ffa500}]", COLOR_ORANGE, 0.0, 0.0, -100.0, 50.0, 0, 1);
	Attach3DTextLabelToVehicle(Pricep3dtext[9], Pricep[9], 0.0, 0.0, 0.0);
	return true;
}

public OnPlayerConnect(playerid)
{
    Checkpoint[playerid]=0;
	return true;
}


public OnPlayerDeath(playerid, killerid, reason)
{
            DisablePlayerCheckpoint(playerid);
			Checkpoint[playerid] = 0;
		    SetVehicleToRespawn(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
   	        return 1;
}



public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(newstate == PLAYER_STATE_DRIVER)
    {
        new model = GetVehicleModel(GetPlayerVehicleID(playerid));
	    if(model==515 || model==514 || model==403)
	    {
	    	SendClientMessage(playerid,COLOR_ORANGE,"(Информация){FFFFFF} Для того чтобы начать работать подцепите прицеп и введите [/DELIVERY]");
            SendClientMessage(playerid,COLOR_ORANGE,"(Информация){FFFFFF} Чтобы уйти с работы дальнобойщика введите [/quitdelivery]");
		}
    }
	return true;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	return false;
}

public OnPlayerEnterCheckpoint(playerid)
{
	if(Checkpoint[playerid] == 1)
	{
		if(!IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
		{
		    SendClientMessage(playerid, COLOR_ORANGE,"(Информация){FFFFFF} Вы потеряли прицеп!");
		    DisablePlayerCheckpoint(playerid);
		    return true;
		}
		DisablePlayerCheckpoint(playerid);
		TogglePlayerControllable(playerid,0);
		SendClientMessage(playerid, COLOR_ORANGE,"(Информация){FFFFFF} Подождите какое-то време, пока разгрузят фуру!");
		SetTimerEx("RazgruzFurui",15000,false,"i",playerid);
	}
	else if(Checkpoint[playerid] == 2)
	{
	    if(IsPlayerInAnyVehicle(playerid))
	    {
			if(!IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    SendClientMessage(playerid, COLOR_ORANGE,"(Информация){FFFFFF} Вы потеряли прицеп!");
			    DisablePlayerCheckpoint(playerid);
			    return true;
			}
			new zarplata = 500000 + random(500000);
			new string[64];
			format(string, sizeof(string), "(Информация){FFFFFF} Вы доставили груз и получили $%d", zarplata);
			SendClientMessage(playerid, COLOR_ORANGE,string);
			GivePlayerMoney(playerid, zarplata);
			Checkpoint[playerid] = 0;
		    DisablePlayerCheckpoint(playerid);
		    SetVehicleToRespawn(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
		}
	}
	return true;
}
public RazgruzFurui(playerid)
{
	TogglePlayerControllable(playerid,1);
	SendClientMessage(playerid, COLOR_WHITE,"(Информация){FFFFFF} Разгрузка фуры завершена...");
    SendClientMessage(playerid, COLOR_WHITE,"(Информация){FFFFFF} Верните прицеп обратно где взяли, там же вам выдадут зарплату за рейс");
 	Checkpoint[playerid] = 2;
	SetPlayerCheckpoint(playerid,1847.384521,2870.180908,12.564512,8.0);
	return true;
}
CMD:delivery(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    {
            new model = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER && model==515 || GetPlayerState(playerid) != PLAYER_STATE_DRIVER && model==514 || GetPlayerState(playerid) != PLAYER_STATE_DRIVER && model==403)
			{
		    	SendClientMessage(playerid,COLOR_ORANGE,"(Информация){FFFFFF} Вы должны быть в Фуре за рулём!");
		    	return true;
			}
			if(!IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
		    	SendClientMessage(playerid,COLOR_ORANGE,"(Информация){FFFFFF} Вы не подцепили прицеп!");
		    	return true;
			}
			DisablePlayerCheckpoint(playerid);
		 	GameTextForPlayer(playerid, "~r~Goto redmarker", 2500, 1);
			Checkpoint[playerid] = 1;
			new traileid = GetVehicleTrailer(GetPlayerVehicleID(playerid));
			if(traileid == Pricep[5] || traileid == Pricep[6] || traileid == Pricep[7]) // Стройки
			{
 		    	new rand666=random(4);
		    	switch (rand666)
		    	{
			    	case 0:SetPlayerCheckpoint(playerid,-2101.1555,208.4684,34.8973,8.0);
			    	case 1:SetPlayerCheckpoint(playerid,2801.4639,-2436.1069,13.2421,8.0);
			    	case 2:SetPlayerCheckpoint(playerid,2619.9587,833.6466,4.9254,8.0);
			    	case 3:SetPlayerCheckpoint(playerid,680.4613,896.6621,-40.3721,8.0);
		    	}
			}
			if(traileid == Pricep[3] || traileid == Pricep[9]) // Заправки
			{
 		    	new rand666=random(4);
		    	switch (rand666)
		    	{
			    	case 0:SetPlayerCheckpoint(playerid,2193.5149,2476.3335,10.8203,8.0);
			    	case 1:SetPlayerCheckpoint(playerid,-2442.1062,953.0255,45.2969,8.0);
			    	case 2:SetPlayerCheckpoint(playerid,-1624.4644,-2697.6082,48.5391,8.0);
			    	case 3:SetPlayerCheckpoint(playerid,1918.5468,-1792.2303,13.3828,8.0);
		    	}
			}
			if(traileid == Pricep[8] || traileid == Pricep[4]) // Продукты +
			{
 		    	new rand666=random(4);
		    	switch (rand666)
		    	{
			    	case 0:SetPlayerCheckpoint(playerid,-320.741210,447.800659,12.823649,8.0);
			    	case 1:SetPlayerCheckpoint(playerid,16.256748,910.539733,12.150400,8.0);
			    	case 2:SetPlayerCheckpoint(playerid,293.988037,1517.688720,11.998137,8.0);
			    	case 3:SetPlayerCheckpoint(playerid,177.320098,743.018920,12.161949,8.0);
		    	}
			}
			if(traileid == Pricep[2]) // Одежда +
			{
 		    	new rand666=random(4);
		    	switch (rand666)
		    	{
			    	case 0:SetPlayerCheckpoint(playerid,308.441284,1661.488281,11.998137,8.0); //+
			    	case 1:SetPlayerCheckpoint(playerid,259.447967,1053.459838,12.160900,8.0); //+
			    	case 2:SetPlayerCheckpoint(playerid,214.731582,832.547363,12.167430,8.0); // +
			    	case 3:SetPlayerCheckpoint(playerid,132.849563,639.502319,11.986743,8.0); // +
		    	}
			}
			if(traileid == Pricep[1]) // Закуска +
			{
 		    	new rand666=random(4);
		    	switch (rand666)
		    	{
			    	case 0:SetPlayerCheckpoint(playerid,-320.741210,447.800659,12.823649,8.0); //+
			    	case 1:SetPlayerCheckpoint(playerid,16.256748,910.539733,12.150400,8.0);//+
			    	case 2:SetPlayerCheckpoint(playerid,293.988037,1517.688720,11.998137,8.0);//+
			    	case 3:SetPlayerCheckpoint(playerid,177.320098,743.018920,12.161949,8.0);//+
		    	}
			}
			if(traileid == Pricep[0]) // Амуниция +
			{
 		    	new rand666=random(4);
		    	switch (rand666)
		    	{
			    	case 0:SetPlayerCheckpoint(playerid,102.497825,391.729064,10.544574,8.0); //1 +
			    	case 1:SetPlayerCheckpoint(playerid,1941.512329,2099.600097,15.698137,8.0);//2 +
			    	case 2:SetPlayerCheckpoint(playerid,-2244.068359,157.951080,24.798036,8.0);//3 +
			    	case 3:SetPlayerCheckpoint(playerid,-2539.188232,2943.120849,37.637039,8.0);//4 +
		    	}
			}
		}
		{
	    	SendClientMessage(playerid,COLOR_ORANGE,"(Информация){FFFFFF} Вы не находитесь на дальнобое или у вас уже есть груз!");
		}
	}
	return true;
}
CMD:quitdelivery(playerid)
{
	Checkpoint[playerid] = 0;
    DisablePlayerCheckpoint(playerid);
    SetVehicleToRespawn(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
}
