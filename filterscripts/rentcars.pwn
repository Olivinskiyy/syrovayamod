/*
   ������ ���� [Rent a car] v 0.1
   |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   || �����: Spirit                                                           ||
   || ������������� �� ������: OFFREAL, OkStyle                               ||
   |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
*/
#include <a_samp>
//==============================================================================
#define R_F                                                                  943//�� �������
#define COLOR_WHITE                                                   0xFFFFFFAA//���� (�����)
#define MAX_RENT_VEH                                                          40//�������� ���� �� ������
//==============================================================================
enum RInfo
{
    Rcarid,
    Rprice,
    ROwned
};
new RentCar[MAX_RENT_VEH][RInfo];
new IsRentableVehicle[MAX_VEHICLES];
new OwnedName[MAX_PLAYER_NAME];


public OnFilterScriptInit()
{
    print("==========================================");
	print("[!]Rent Cars by Spirit Sucsessfuly loaded!");
	print("==========================================");
	SetTimer("CountRentedVehicles", 1000, 0);
/*    [���� ��� ������. ���������� ���� ������������ �� ���������� ���� ������.] */
/*��������� ����������: -AddRentVehicle(��, ������, X, Y, Z, Rot, ����1, ����2, ����);*/
//==============================================================================
	AddRentVehicle(1,405,-338.7367,352.5036,12.4323,90.0138,0,0,150);
		AddRentVehicle(1,480,-2335.9338, 222.6003, 22.6521,90.0138,0,0,150);
//==============================================================================
	return 1;
}
public OnFilterScriptExit()
{
    print("[!]Rent Cars by Spirit Unloaded!");
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    new rcs[205];
	if(newstate == 2)
    {
		if(RentCar[GetPlayerVehicleID(playerid)][ROwned] == 0 && IsRentableVehicle[GetPlayerVehicleID(playerid)])
		{
            format(rcs, sizeof(rcs), "{ffffff}������������! ���� ���������� ������ � ������!\n ���������� ����� - [{00ceff}%d{ffffff}]\n ���� ������ [{5da130}$%d{ffffff}]\n\n�� ������ ���������� ������ ����������?",RentCar[GetPlayerVehicleID(playerid)][Rcarid],RentCar[GetPlayerVehicleID(playerid)][Rprice]);
			ShowPlayerDialog(playerid,R_F,DIALOG_STYLE_MSGBOX,"������",rcs,"����������","������");
		}
		if(RentCar[GetPlayerVehicleID(playerid)][ROwned] != 0 && IsRentableVehicle[GetPlayerVehicleID(playerid)])
		{
		    if(RentCar[GetPlayerVehicleID(playerid)][ROwned] == GetPlayerName(playerid, OwnedName, sizeof(OwnedName)))
		    {
                 GetPlayerName(playerid, OwnedName, sizeof(OwnedName));
                 format(rcs, sizeof(rcs), "��� ������������ �������� ���������� �� ���, {ff8700}%s{ffffff}.",OwnedName);
                 SendClientMessage(playerid,-1,rcs);
			}
			if(RentCar[GetPlayerVehicleID(playerid)][ROwned] != GetPlayerName(playerid, OwnedName, sizeof(OwnedName)))
			{
                 SendClientMessage(playerid,-1,"��� ������������ �������� ��� ���������� ������ �������.");
                 RemovePlayerFromVehicle(playerid);
		         TogglePlayerControllable(playerid,1);
			}
	    }
	}
    return 1;
}


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == R_F)
     {
         if(response)
         {
	         new carprice = RentCar[GetPlayerVehicleID(playerid)][Rprice],string[80];
	         if(GetPlayerMoney(playerid) < carprice)
	         {
                 RemovePlayerFromVehicle(playerid);
                 TogglePlayerControllable(playerid,1);
                 SendClientMessage(playerid,COLOR_WHITE,"� ��� ������������ ������� ��� ������ ����������.");
                 return 1;
	         }
             format(string, sizeof(string), "�� ���������� ��� ������������ �������� ��  - {5da130}$%d{ffffff}.", carprice);
             SendClientMessage(playerid,COLOR_WHITE,string);
             TogglePlayerControllable(playerid,1);
             GivePlayerMoney(playerid,-carprice);
		     RentCar[GetPlayerVehicleID(playerid)][ROwned] = GetPlayerName(playerid, OwnedName, sizeof(OwnedName));
		     SetVehicleNumberPlate(GetPlayerVehicleID(playerid),"RENTED");
        }
            else
        {
            RemovePlayerFromVehicle(playerid);
		    TogglePlayerControllable(playerid,1);
        }
   }
    return 1;
}

stock AddRentVehicle(id ,model, Float:X, Float:Y, Float:Z, Float:Angle, color1, color2, price)
{
    new newvid;
    newvid = AddStaticVehicle(model, X, Y, Z, Angle, color1, color2);
    RentCar[newvid][Rprice] = price;
    RentCar[newvid][Rcarid] = id;
    RentCar[newvid][ROwned] = 0;
    IsRentableVehicle[newvid] = 1;
    SetVehicleNumberPlate(newvid,"RENT");
}

TotalVehicles()
{
	new vid;
	vid = CreateVehicle(411, 0, 0, 0, 0, -1, -1, 10);
	DestroyVehicle(vid);
	vid--;
	return vid;
}
forward CountRentedVehicles();
public CountRentedVehicles()
{
	new count;
	for(new R=1; R<TotalVehicles(); R++)
	{
	    if(IsRentableVehicle[R] == 1)
	    {
	        count++;
		}
	}
}
