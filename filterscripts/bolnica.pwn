#include <a_samp>
#include <streamer>

#define COLOR_ORANGE       0xFF9900AA
#define COLOR_GRAD6        0xF0F0F0FF
#define COLOR_BLACK        0x000000AA
#define COLOR_GREY         0xAFAFAFAA
#define COLOR_GREEN        0x33AA33AA
#define COLOR_ORANGE       0xFF9900AA
#define COLOR_RED          0xAA3333AA

#define GetPlayerMoneyEx(%0)	GetPlayerData(%0, pCash) 			// деньги игрока

new vxod;
new vixod;
new hppick;

new Text3D:text;
new Text3D:hp;
new Text3D:vxxod;
new Text3D:viixod;

enum pInfo
{
	pCash
}

enum time
{
	pTime
}
new pNegr[MAX_PLAYERS][time];

forward hiniga(playerid);
forward dhsa(playerid);

main()
{
	print("\n----------------------------------");
	print("Больница загружена                  ");
	print("----------------------------------\n");
}
public OnGameModeInit()
{
	text = Create3DTextLabel("Выйти из больницы можно только через 120 секунд после\n появления в ней", COLOR_RED, 1802.8203,-111.1781,1400.9849, 25.0 , 0, 1);
	
		hp = Create3DTextLabel("Медицинская аптечка", COLOR_RED, 1809.7966,-114.4388,1400.9849, 25.0 , 0, 1);
	
	viixod = Create3DTextLabel("Выход из больницы", COLOR_ORANGE, 1802.8203,-111.1781,1402.9849, 25.0 , 0, 1);
	
	vxxod = Create3DTextLabel("Вход в больницу", COLOR_ORANGE, 2112.9692,-2392.0019,23.0851, 25.0 , 0, 1);
	
	vixod = CreatePickup(1318,23,1802.8203,-111.1781,1400.9849);
	
		vxod = CreatePickup(1318,23,2112.9692,-2392.0019,23.0851);
	
	hppick = CreatePickup(11736,23,1809.7966,-114.4388,1400.9849);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	SetTimer("dhsa", 5000, false);
	return 1;
}
public OnPlayerPickUpPickup(playerid, pickupid)
{
	if(pickupid == vixod)
	{
		if(pNegr[playerid][pTime] > 1) return true;
		{
		    SetPlayerPos(playerid,2112.4143,-2388.2714,21.9453);
			SetPlayerHealth(playerid, 100);
			SendClientMessage(playerid, COLOR_RED, "Вы успешно покинули больницу!");
		}
	}
	if(pickupid == vxod)
	{
	    SetPlayerPos(playerid,1802.6356,-112.8628,1400.9849);
		SendClientMessage(playerid, COLOR_RED, "Вы зашли в больницу!");
	}
		if(pickupid == hppick)
	{
			SetTimer("hiniga", 5000, false);
			SetPlayerHealth(playerid, 100);
			GivePlayerMoney(playerid, -500);
			SendClientMessage(playerid, COLOR_GREY, "Препараты начали действие! Вы сможете покинуть больницу через 5 секунд");
	}
	return 1;
}
public hiniga(playerid)
{
	SendClientMessage(playerid, COLOR_GREY, "Вы можете выйти с больницы");
	pNegr[playerid][pTime] = 0;
	return 1;
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}
public dhsa(playerid)
{
	pNegr[playerid][pTime] = 2;
 	SetPlayerVirtualWorld(playerid, 0);
 	SetPlayerHealth(playerid, 20);
	SetTimer("hiniga", 120000, false);
	SendClientMessage(playerid, COLOR_GREY, "Вы умерли и попали в больницу!");
	new randompiz=random(4);
	switch (randompiz)
	{
    	case 0:SetPlayerPos(playerid,1785.9396,-144.5528,1400.9849);
    	case 1:SetPlayerPos(playerid,1786.0725,-131.4051,1400.9849);
    	case 2:SetPlayerPos(playerid,1808.2281,-131.1235,1400.9849);
    	case 3:SetPlayerPos(playerid,1809.1158,-144.5570,1400.9849);
	}
	SetPlayerHealth(playerid, 20);
	return 1;
}
