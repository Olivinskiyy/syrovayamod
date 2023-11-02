new default_vehicle_width_wheel[MAX_VEHICLES] = 100;
new default_vehicle_wheel_offset_x[MAX_VEHICLES] = 0;
new default_vehicle_wheel_angle[MAX_VEHICLES] = 0;

stock ShowTuning(playerid)
{
    TextDrawShowForPlayer(playerid, tuning_TD[0]);
    TextDrawShowForPlayer(playerid, tuning_TD[1]);
    PlayerTextDrawShow(playerid, tuning_PTD[playerid][0]);
    PlayerTextDrawShow(playerid, tuning_PTD[playerid][1]);
    PlayerTextDrawShow(playerid, tuning_PTD[playerid][2]);
    PlayerTextDrawShow(playerid, tuning_PTD[playerid][3]);
    PlayerTextDrawShow(playerid, tuning_PTD[playerid][4]);
    PlayerTextDrawShow(playerid, tuning_PTD[playerid][5]);
    PlayerTextDrawShow(playerid, tuning_PTD[playerid][6]);

    TogglePlayerControllable(playerid, 0);
    TogglePlayerAllHudElements(playerid, HUD_ELEMENT_HIDE);

    SelectTextDraw(playerid, 0xB0C4DEFF ) ;
    return 1;
}
stock HideTuning(playerid)
{
    TextDrawHideForPlayer(playerid, tuning_TD[0]);
    TextDrawHideForPlayer(playerid, tuning_TD[1]);
    PlayerTextDrawHide(playerid, tuning_PTD[playerid][0]);
    PlayerTextDrawHide(playerid, tuning_PTD[playerid][1]);
    PlayerTextDrawHide(playerid, tuning_PTD[playerid][2]);
    PlayerTextDrawHide(playerid, tuning_PTD[playerid][3]);
    PlayerTextDrawHide(playerid, tuning_PTD[playerid][4]);
    PlayerTextDrawHide(playerid, tuning_PTD[playerid][5]);
    PlayerTextDrawHide(playerid, tuning_PTD[playerid][6]);

    TogglePlayerControllable(playerid, 1);
    TogglePlayerAllHudElements(playerid, HUD_ELEMENT_SHOW);

    CancelSelectTextDraw(playerid);
    DeletePVar(playerid, "TypeTunig");

    ShowPlayerDialog(playerid, D_ATUNE, DIALOG_STYLE_LIST, !""SERVER"Автосервис {afafaf}[Тюнинг]", !"\
    1. Перекрасить элементы\n\
    2. Установить нитро\n\
    3. Винилы\n\
    4. Неон\n\
    5. Страбоскопы\n\
    6. Смена цвета фар\n\
    7. Тонировка\n\
    8. Тюнинг колес", !"Далее", !"Выехать");
    return 1;
}
stock ClickTuningPlayerTextdraw(playerid, textdrawid)
{
    switch(textdrawid)
    {
        case 0: 
        {
            SendClientMessage(playerid, -1, "playertextdrawid = 0");
            HideTuning(playerid);
        }
        case 1:
        {
            SendClientMessage(playerid, -1, "playertextdrawid = 1");
            HideTuning(playerid);
        }
        case 2: 
        {
            new typebutton = GetPVarInt(playerid, "TypeTuning");
            if(typebutton < 4)
            {
                return SendClientMessage(playerid, -1, "Сначала выберите тип тюнинга.");
            }
            DownTuningWheel(playerid, typebutton);
            SendClientMessage(playerid, -1, "playertextdrawid = 2");
        }
        case 3: 
        {
            new typebutton = GetPVarInt(playerid, "TypeTuning");

            if(typebutton < 4)
            {
                return SendClientMessage(playerid, -1, "Сначала выберите тип тюнинга.");
            }
            UpTuningWheel(playerid, typebutton);
            SendClientMessage(playerid, -1, "playertextdrawid = 3");
        }
        case 4: 
        {
            if( GetPVarInt(playerid, "TypeTunig") == 5 || GetPVarInt(playerid, "TypeTunig") == 6)
            {
                DeletePVar(playerid, "TypeTunig");
            }
            
            if (GetPVarInt(playerid, "TypeTunig") != 4)
            {
                SetPVarInt(playerid, "TypeTuning", 4);
            }
            SendClientMessage(playerid, -1, "playertextdrawid = 4");
        }
        case 5: 
        {
            if(GetPVarInt(playerid, "TypeTunig") == 4 || GetPVarInt(playerid, "TypeTunig") == 6)
            { 
                DeletePVar(playerid, "TypeTunig");
            }
            if (GetPVarInt(playerid, "TypeTunig") != 5)
            {
                SetPVarInt(playerid, "TypeTuning", 5);
            }
            
            SendClientMessage(playerid, -1, "playertextdrawid = 5");
        }
        case 6: 
        {
            if(GetPVarInt(playerid, "TypeTunig") == 4 || GetPVarInt(playerid, "TypeTunig") == 5)
            {
                DeletePVar(playerid, "TypeTunig");
            }

            if (GetPVarInt(playerid, "TypeTunig") != 6)
            {
                SetPVarInt(playerid, "TypeTuning", 6);
            }
            SendClientMessage(playerid, -1, "playertextdrawid = 6");
        }
    }
    return 1;
}
stock UpTuningWheel(playerid, buttonid)
{
    new veh = GetPlayerVehicleID(playerid);
    switch(buttonid) 
    {
        case 4:
        {
            if(default_vehicle_wheel_offset_x[veh] >= 5)
            {
                return SendClientMessage(playerid, -1, "Братан больше не надо пон?");
            }
            new upwheel = default_vehicle_wheel_offset_x[veh]+1;
            
            SetVehicleWheelOffsetX(veh, 0, upwheel);
            SetVehicleWheelOffsetX(veh, 1, upwheel);
        }
        case 5:
        {
            if(default_vehicle_width_wheel[veh] >= 130)
            {
                return SendClientMessage(playerid, -1, "Братан больше не надо пон?");
            }
            new upwheel = default_vehicle_width_wheel[veh]+1;
            
            SetVehicleWidthWheel(veh, upwheel);
        }
        case 6:
        {
            if(default_vehicle_wheel_angle[veh] >= 15)
            {
                return SendClientMessage(playerid, -1, "Братан больше не надо пон?");
            }
            new upwheel = default_vehicle_wheel_angle[veh]+1;
            
            SetVehicleWheelAngle(veh, 0, upwheel);
            SetVehicleWheelAngle(veh, 1, upwheel);
        }
    }
    return 1;
}
stock DownTuningWheel(playerid, buttonid)
{
    new veh = GetPlayerVehicleID(playerid);
    switch(buttonid)
    {
        case 4:
        {
            if(default_vehicle_wheel_offset_x[veh] <= -5 )
            {
                return SendClientMessage(playerid, -1, "Братан больше не надо пон?");
            }

            new downwheel = default_vehicle_wheel_offset_x[veh]-1;
            
            SetVehicleWheelOffsetX(veh, 0, downwheel);
            SetVehicleWheelOffsetX(veh, 1, downwheel);
        }
        case 5:
        {
            if(default_vehicle_width_wheel[veh] <= 100 )
            {
                return SendClientMessage(playerid, -1, "Братан больше не надо пон?");
            }
            new downwheel = default_vehicle_width_wheel[veh]-1;
            
            SetVehicleWidthWheel(veh, downwheel);
        }
        case 6:
        {
            if(default_vehicle_wheel_angle[veh] <= 0)
            {
                return SendClientMessage(playerid, -1, "Братан больше не надо пон?");
            }
            new downwheel = default_vehicle_wheel_angle[veh]-1;
            
            SetVehicleWheelAngle(veh, 0, downwheel);
            SetVehicleWheelAngle(veh, 1, downwheel);
        }
    }
    return 1;
}