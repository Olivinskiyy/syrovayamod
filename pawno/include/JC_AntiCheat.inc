/*
	AntiCheat �� ��������/Health
	AntiCheat �� �����/Armour
	AntiCheat �� ������/GodMode
	AntiCheat �� NOP SetPlayerHealth
	AntiCheat �� NOP SetPlayerArmour
	AntiCheat �� ������/Weapon
	AntiCheat �� �������/Ammo
	AntiCheat �� ����������� ������� ��� �����������/Infinite ammo without reloading
	AntiCheat �� ������� ��������/Rapid fire (����� +� Bug)
	AntiCheat �� ����������� �����/Magnifier damage
	AntiCheat �� ������/Killer
	AntiCheat �� �������/SpeedHack(���������)
	AntiCheat �� Pizdorvanka/�����������(���������)
	AntiCheat �� ������/Carshot(���������)
	AntiCheat �� ������� ����������/Repair of transport
	AntiCheat �� ������/Tune
	AntiCheat �� ���� ����������/Color transport
	AntiCheat �� ����������� ������/The painting work
	AntiCheat �� ��������/AirBreak(�����)
	AntiCheat �� ��������/Teleport(�����)
	AntiCheat �� �����������/CoordMaster(�����)
	AntiCheat �� ��������/AirBreak(���������)
	AntiCheat �� ��������/Teleport(���������)
	AntiCheat �� �����������/CoordMaster(���������)
	AntiCheat �� �����������,�������� � ���������,����� �����,������*������,�������*������,�������*�������,������*��������������,���������� ������ �����������
	AntiCheat �� ��� �����������/God of cars
	AntiCheat �� ���� ����������,��������/Flood Death/Spawn
	AntiCheat �� �������� ����������/Teleport transport
*/
/*----------------------------------------------------------------------------*/
#define _public:%0(%1) forward %0(%1); public %0(%1)
#define _Kick(%0) SetTimerEx("_KICK", 300, false, "d", %0)
_public: _KICK(playerid)return /*Kick(playerid),*/1;
/*----------------------------------------------------------------------------*/
#define SetPlayerHealth AC_SetPlayerHealth
#define SetPlayerArmour AC_SetPlayerArmour
#define GivePlayerWeapon AC_GivePlayerWeapon
#define ResetPlayerWeapons AC_ResetPlayerWeapons
#define SetPlayerAmmo AC_SetPlayerAmmo
#define SetPlayerArmedWeapon AC_SetPlayerArmedWeapon
#define SetPlayerPos AC_SetPlayerPos
#define SetVehiclePos AC_SetVehiclePos
#define PutPlayerInVehicle AC_PutPlayerInVehicle
#define SetVehicleHealth AC_SetVehicleHealth
#define RepairVehicle AC_RepairVehicle
#define ChangeVehicleColor AC_ChangeVehicleColor
#define ChangeVehiclePaintjob AC_ChangeVehiclePaintjob
#define AddStaticVehicle AC_AddStaticVehicle
#define AddStaticVehicleEx AC_AddStaticVehicleEx
#define CreateVehicle AC_CreateVehicle
#define DestroyVehicle AC_DestroyVehicle
#define AddVehicleComponent AC_AddVehicleComponent
#define RemoveVehicleComponent AC_RemoveVehicleComponent
/*----------------------------------------------------------------------------*/
stock AC_SetPlayerHealth(playerid,Float:health)return CallRemoteFunction("AC_SetPlayerHealth","df",playerid,Float:health);
stock AC_SetPlayerArmour(playerid,Float:armour)return CallRemoteFunction("AC_SetPlayerArmour","df",playerid,Float:armour);
stock AC_GivePlayerWeapon(playerid,weaponid,ammo)return CallRemoteFunction("AC_GivePlayerWeapon","ddd",playerid,weaponid,ammo);
stock AC_ResetPlayerWeapons(playerid)return CallRemoteFunction("AC_ResetPlayerWeapons","d",playerid);
stock AC_SetPlayerAmmo(playerid,weaponid,ammo)return CallRemoteFunction("AC_SetPlayerAmmo","ddd",playerid,weaponid,ammo);
stock AC_SetPlayerArmedWeapon(playerid,weaponid)return CallRemoteFunction("AC_SetPlayerArmedWeapon","dd",playerid,weaponid);
stock AC_SetPlayerPos(playerid,Float:x,Float:y,Float:z)return CallRemoteFunction("AC_SetPlayerPos","dfff",playerid,Float:x,Float:y,Float:z);
stock AC_SetVehiclePos(vehicleid,Float:x,Float:y,Float:z)return CallRemoteFunction("AC_SetVehiclePos","dfff",vehicleid,Float:x,Float:y,Float:z);
stock AC_PutPlayerInVehicle(playerid,vehicleid,seatid)return CallRemoteFunction("AC_PutPlayerInVehicle","ddd",playerid,vehicleid,seatid);
stock AC_SetVehicleHealth(vehicleid,Float:health)return CallRemoteFunction("AC_SetVehicleHealth","df",vehicleid,Float:health);
stock AC_RepairVehicle(vehicleid)return CallRemoteFunction("AC_RepairVehicle","d",vehicleid);
stock AC_AddStaticVehicle(modelid,Float:spawn_x,Float:spawn_y,Float:spawn_z,Float:z_angle,color1,color2)return CallRemoteFunction("AC_AddStaticVehicle","dffffdd",modelid,Float:spawn_x,Float:spawn_y,Float:spawn_z,Float:z_angle,color1,color2);
stock AC_AddStaticVehicleEx(modelid,Float:spawn_x,Float:spawn_y,Float:spawn_z,Float:z_angle,color1,color2,respawn_delay)return CallRemoteFunction("AC_AddStaticVehicleEx","dffffddd",modelid,Float:spawn_x,Float:spawn_y,Float:spawn_z,Float:z_angle,color1,color2,respawn_delay);
stock AC_CreateVehicle(modelid,Float:x,Float:y,Float:z,Float:angle,color1,color2,respawn_delay)return CallRemoteFunction("AC_CreateVehicle", "dffffddd",modelid,Float:x,Float:y,Float:z,Float:angle,color1,color2,respawn_delay);
stock AC_DestroyVehicle(currentveh)return CallRemoteFunction("AC_DestroyVehicle","d",currentveh);
stock AC_AddVehicleComponent(vehicleid,componentid)return CallRemoteFunction("AC_AddVehicleComponent","dd",vehicleid,componentid);
stock AC_RemoveVehicleComponent(vehicleid,componentid)return CallRemoteFunction("AC_RemoveVehicleComponent","dd",vehicleid,componentid);
stock AC_ChangeVehicleColor(vehicleid,color1,color2)return CallRemoteFunction("AC_ChangeVehicleColor","ddd",vehicleid,color1,color2);
stock AC_ChangeVehiclePaintjob(vehicleid,paintjobid)return CallRemoteFunction("AC_ChangeVehiclePaintjob","dd",vehicleid,paintjobid);
/*----------------------------------------------------------------------------*/
/*
	AntiCheat �� ��������/Health
*/
_public: _HealthCheat(playerid,Float:health)/* playerid - �� ������ | health - ������� ���� �������� */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #001");
    SetPlayerHealth(playerid,health);/* ����� ������ ������� �������� ������ */
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat �� �����/Armour
*/
_public: _ArmourCheat(playerid,Float:armour)/* playerid - �� ������ | armour - ������� ���� ����� */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #002");
    SetPlayerArmour(playerid,armour);/* ����� ������ ������� ����� ������ */
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat �� ������/GodMode
	AntiCheat �� NOP SetPlayerHealth
	AntiCheat �� NOP SetPlayerArmour
*/
_public: _GodModeCheat(playerid,number)/* playerid - �� ������ | number - ����� �������� */
{
    switch(number)
	{
	    case 1:SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #003");
	    case 2:SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #004");
 	}
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat �� ������/Weapon
*/
_public: _WeaponCheat(playerid,weaponid)/* playerid - �� ������ | weaponid - �� ������ */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #005");
    ResetPlayerWeapons(playerid);/*�������� �� ������ � ������*/
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat �� �������/Ammo
*/
_public: _AmmoCheat(playerid,weaponid)/* playerid - �� ������ | weaponid - �� ������ */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #006");
    ResetPlayerWeapons(playerid);/*�������� �� ������ � ������*/
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat �� ����������� ������� ��� �����������/Infinite ammo without reloading
*/
_public: _AmmoReloadingCheat(playerid,weaponid)/* playerid - �� ������ | weaponid - �� ������ */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #007");
    ResetPlayerWeapons(playerid);/*�������� �� ������ � ������*/
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat �� ������� ��������/Rapid fire (����� +� Bug)
*/
_public: _RapidFireCheat(playerid,weaponid)/* playerid - �� ������ | weaponid - �� ������ */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #008");
    ResetPlayerWeapons(playerid);/*�������� �� ������ � ������*/
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat �� ����������� �����/Magnifier damage
*/
_public: _MagnifierDamagerCheat(playerid,weaponid)/* playerid - �� ������ | weaponid - �� ������ */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #009");
    ResetPlayerWeapons(playerid);/*�������� �� ������ � ������*/
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat �� ������/Killer
*/
_public: _KillerCheat(playerid)/* playerid - �� ������ */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #010");
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat �� �������/SpeedHack(���������)
	AntiCheat �� Pizdorvanka/�����������(���������)
	AntiCheat �� ������/Carshot(���������)
*/
_public: _SpeedVehCheat(playerid,number)/* playerid - �� ������ | number - ����� �������� */
{
    switch(number)
	{
	    case 1:SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #011");
	    case 2:SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #012");
	    case 3:SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #013");
	    case 4:SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #014");
	}
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat �� ������� ����������/Repair of transport
*/
_public: _VehHealthCheat(playerid,vehicleid,Float:hp)/* playerid - �� ������ | vehicleid - �� ���������� | hp - ������ ������� �������� ���������� */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #015");
    SetVehicleHealth(vehicleid,hp);/* ������������ ������ ������� �������� ���������� */
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat �� ������/Tune
*/
_public: _VehTunCheat(playerid,vehicleid,component)/* playerid - �� ������ | vehicleid - �� ���������� | component - ������������ ��������� */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #016");
    RemoveVehicleComponent(vehicleid,component);/* ������� ��������� � ���������� */
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat �� ���� ����������/Color transport
*/
_public: _ResprayVehCheat(playerid,vehicleid,color1,color2)/* playerid - �� ������ | vehicleid - �� ���������� | color1 - ������ ������ ���� ���������� | color2 - ������ ������ ���� ���������� */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #017");
    ChangeVehicleColor(vehicleid,color1,color2);/* �������� ���� ���������� �� ������ */
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat �� ����������� ������/The painting work
*/
_public: _PaintjobVehCheat(playerid,vehicleid,paintjobid)/* playerid - �� ������ | vehicleid - �� ���������� | paintjobid - ������ ����������� ������ */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #018");
	ChangeVehiclePaintjob(vehicleid,paintjobid);/* �������� ����������� ������ ���������� �� ������ */
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
 	AntiCheat �� ��������/AirBreak(�����)
   	AntiCheat �� ��������/Teleport(�����)
	AntiCheat �� �����������/CoordMaster(�����)
*/
_public: _PlayerPosCheat(playerid,Float:x,Float:y,Float:z)/* playerid - �� ������ | x,y,z ������ ������� ������ */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #019");
 	SetPlayerPos(playerid,Float:x,Float:y,Float:z);/* ������������� ������ ������� ������ */
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
 	AntiCheat �� ��������/AirBreak(���������)
   	AntiCheat �� ��������/Teleport(���������)
	AntiCheat �� �����������/CoordMaster(���������)
*/
_public: _VehPosCheat(playerid,Float:x,Float:y,Float:z)/* playerid - �� ������ | x,y,z ������ ������� ������ */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #020");
    RemovePlayerFromVehicle(playerid);/* ����������� ������ � ���������� */
 	SetPlayerPos(playerid,Float:x,Float:y,Float:z);/* ������������� ������ ������� ������ */
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat �� �����������,�������� � ���������,����� �����,������*������,�������*������,�������*�������,������*��������������,���������� ������ �����������
*/
_public: _VehTeleportCheat(playerid)/* playerid - �� ������  */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #021");
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat �� ��� �����������/God of cars
*/
_public: _Veh_GodOfCar(playerid,number)/* playerid - �� ������ | number - ����� �������� */
{
    switch(number)
	{
	    case 1:SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #022");
	    case 2:SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #023");
 	}
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat �� ���� ����������,��������/Flood Death/Spawn
*/
_public: _FloodDeathSpawn(playerid,number)/* playerid - �� ������ | number - ����� �������� */
{
    switch(number)
	{
	    case 1:SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #024");
	    case 2:SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: �� ������� �� ���������� � ���������! #025");
 	}
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
