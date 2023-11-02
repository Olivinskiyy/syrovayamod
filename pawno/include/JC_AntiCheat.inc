/*
	AntiCheat на Здоровье/Health
	AntiCheat на Броню/Armour
	AntiCheat на ГодМод/GodMode
	AntiCheat на NOP SetPlayerHealth
	AntiCheat на NOP SetPlayerArmour
	AntiCheat на Оружие/Weapon
	AntiCheat на Патроны/Ammo
	AntiCheat на Бесконечные патроны без перезарядки/Infinite ammo without reloading
	AntiCheat на Быстрая стрельба/Rapid fire (также +С Bug)
	AntiCheat на Увеличитель урона/Magnifier damage
	AntiCheat на Киллер/Killer
	AntiCheat на СпидХак/SpeedHack(транспорт)
	AntiCheat на Pizdorvanka/Пиздорванка(транспорт)
	AntiCheat на Каршот/Carshot(транспорт)
	AntiCheat на Починка транспорта/Repair of transport
	AntiCheat на Тюнинг/Tune
	AntiCheat на Цвет транспорта/Color transport
	AntiCheat на Покрасочная работа/The painting work
	AntiCheat на АирБрейк/AirBreak(пешка)
	AntiCheat на Телепорт/Teleport(пешка)
	AntiCheat на КоордМастер/CoordMaster(пешка)
	AntiCheat на АирБрейк/AirBreak(транспорт)
	AntiCheat на Телепорт/Teleport(транспорт)
	AntiCheat на КоордМастер/CoordMaster(транспорт)
	AntiCheat на Автодрайвер,Телепорт в транспорт,Супер пушка,Лаггер*Солнце,Торнадо*Магнит,Спавнер*Граббер,Змейка*Антигравитация,Управление другим транспортом
	AntiCheat на Бог автомобилей/God of cars
	AntiCheat на Флуд убийствами,смертями/Flood Death/Spawn
	AntiCheat на Телепорт транспорта/Teleport transport
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
	AntiCheat на Здоровье/Health
*/
_public: _HealthCheat(playerid,Float:health)/* playerid - ид читера | health - сколько было здоровья */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #001");
    SetPlayerHealth(playerid,health);/* Задаём старый уровень здоровья игрока */
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat на Броню/Armour
*/
_public: _ArmourCheat(playerid,Float:armour)/* playerid - ид читера | armour - сколько было брони */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #002");
    SetPlayerArmour(playerid,armour);/* Задаём старый уровень брони игрока */
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat на ГодМод/GodMode
	AntiCheat на NOP SetPlayerHealth
	AntiCheat на NOP SetPlayerArmour
*/
_public: _GodModeCheat(playerid,number)/* playerid - ид читера | number - номер античита */
{
    switch(number)
	{
	    case 1:SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #003");
	    case 2:SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #004");
 	}
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat на Оружие/Weapon
*/
_public: _WeaponCheat(playerid,weaponid)/* playerid - ид читера | weaponid - ид оружия */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #005");
    ResetPlayerWeapons(playerid);/*Отбираем всё оружие у игрока*/
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat на Патроны/Ammo
*/
_public: _AmmoCheat(playerid,weaponid)/* playerid - ид читера | weaponid - ид оружия */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #006");
    ResetPlayerWeapons(playerid);/*Отбираем всё оружие у игрока*/
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat на Бесконечные патроны без перезарядки/Infinite ammo without reloading
*/
_public: _AmmoReloadingCheat(playerid,weaponid)/* playerid - ид читера | weaponid - ид оружия */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #007");
    ResetPlayerWeapons(playerid);/*Отбираем всё оружие у игрока*/
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat на Быстрая стрельба/Rapid fire (также +С Bug)
*/
_public: _RapidFireCheat(playerid,weaponid)/* playerid - ид читера | weaponid - ид оружия */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #008");
    ResetPlayerWeapons(playerid);/*Отбираем всё оружие у игрока*/
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat на Увеличитель урона/Magnifier damage
*/
_public: _MagnifierDamagerCheat(playerid,weaponid)/* playerid - ид читера | weaponid - ид оружия */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #009");
    ResetPlayerWeapons(playerid);/*Отбираем всё оружие у игрока*/
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat на Киллер/Killer
*/
_public: _KillerCheat(playerid)/* playerid - ид читера */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #010");
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat на СпидХак/SpeedHack(транспорт)
	AntiCheat на Pizdorvanka/Пиздорванка(Транспорт)
	AntiCheat на Каршот/Carshot(транспорт)
*/
_public: _SpeedVehCheat(playerid,number)/* playerid - ид читера | number - номер античита */
{
    switch(number)
	{
	    case 1:SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #011");
	    case 2:SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #012");
	    case 3:SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #013");
	    case 4:SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #014");
	}
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat на Починка транспорта/Repair of transport
*/
_public: _VehHealthCheat(playerid,vehicleid,Float:hp)/* playerid - ид читера | vehicleid - ид транспорта | hp - старый уровень здоровья транспорта */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #015");
    SetVehicleHealth(vehicleid,hp);/* Устанавиваем старый уровень здоровья транспорта */
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat на Тюнинг/Tune
*/
_public: _VehTunCheat(playerid,vehicleid,component)/* playerid - ид читера | vehicleid - ид транспорта | component - начитеренный компонент */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #016");
    RemoveVehicleComponent(vehicleid,component);/* Удаляем компонент с транспорта */
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat на Цвет транспорта/Color transport
*/
_public: _ResprayVehCheat(playerid,vehicleid,color1,color2)/* playerid - ид читера | vehicleid - ид транспорта | color1 - старый первый цвет транспорта | color2 - старый второй цвет транспорта */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #017");
    ChangeVehicleColor(vehicleid,color1,color2);/* Изменяем цвет транспорта на старый */
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat на Покрасочная работа/The painting work
*/
_public: _PaintjobVehCheat(playerid,vehicleid,paintjobid)/* playerid - ид читера | vehicleid - ид транспорта | paintjobid - старая покрасочная работа */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #018");
	ChangeVehiclePaintjob(vehicleid,paintjobid);/* Изменяем покрасочную работу транспорта на старый */
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
 	AntiCheat на АирБрейк/AirBreak(пешка)
   	AntiCheat на Телепорт/Teleport(пешка)
	AntiCheat на КоордМастер/CoordMaster(пешка)
*/
_public: _PlayerPosCheat(playerid,Float:x,Float:y,Float:z)/* playerid - ид читера | x,y,z старая позиция игрока */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #019");
 	SetPlayerPos(playerid,Float:x,Float:y,Float:z);/* Устанавливаем старую позицию игрока */
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
 	AntiCheat на АирБрейк/AirBreak(транспорт)
   	AntiCheat на Телепорт/Teleport(транспорт)
	AntiCheat на КоордМастер/CoordMaster(транспорт)
*/
_public: _VehPosCheat(playerid,Float:x,Float:y,Float:z)/* playerid - ид читера | x,y,z старая позиция игрока */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #020");
    RemovePlayerFromVehicle(playerid);/* Выбрасываем игрока с транспорта */
 	SetPlayerPos(playerid,Float:x,Float:y,Float:z);/* Устанавливаем старую позицию игрока */
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat на Автодрайвер,Телепорт в транспорт,Супер пушка,Лаггер*Солнце,Торнадо*Магнит,Спавнер*Граббер,Змейка*Антигравитация,Управление другим транспортом
*/
_public: _VehTeleportCheat(playerid)/* playerid - ид читера  */
{
    SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #021");
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat на Бог автомобилей/God of cars
*/
_public: _Veh_GodOfCar(playerid,number)/* playerid - ид читера | number - номер античита */
{
    switch(number)
	{
	    case 1:SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #022");
	    case 2:SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #023");
 	}
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
/*
	AntiCheat на Флуд убийствами,смертями/Flood Death/Spawn
*/
_public: _FloodDeathSpawn(playerid,number)/* playerid - ид читера | number - номер античита */
{
    switch(number)
	{
	    case 1:SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #024");
	    case 2:SendClientMessage(playerid, 0xCC0000FF, "[JC_AntiCheat]: Вы кикнуты по подозрению в читерстве! #025");
 	}
    _Kick(playerid);
	return 1;
}
/*----------------------------------------------------------------------------*/
