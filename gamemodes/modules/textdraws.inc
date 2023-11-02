new Text:tuning_TD[2];
new PlayerText:tuning_PTD[MAX_PLAYERS][7];
new PlayerText:tuning_buttons_PTD[MAX_PLAYERS][3];

stock CreateTuningTextDraw()
{
    tuning_TD[0] = TextDrawCreate(506.0000, 154.9331, "tuning:tuning_t_information_main"); // пусто
    TextDrawTextSize(tuning_TD[0], 128.8000, 156.0000);
    TextDrawAlignment(tuning_TD[0], 2);
    TextDrawColor(tuning_TD[0], -1);
    TextDrawFont(tuning_TD[0], 4);
    TextDrawSetProportional(tuning_TD[0], 0);
    TextDrawSetShadow(tuning_TD[0], 0);

    tuning_TD[1] = TextDrawCreate(220.5000, 357.2224, "tuning:tuning_t_button_main"); // пусто
    TextDrawTextSize(tuning_TD[1], 176.0000, 90.0000);
    TextDrawAlignment(tuning_TD[1], 1);
    TextDrawColor(tuning_TD[1], -1);
    TextDrawBackgroundColor(tuning_TD[1], 255);
    TextDrawFont(tuning_TD[1], 4);
    TextDrawSetProportional(tuning_TD[1], 0);
    TextDrawSetShadow(tuning_TD[1], 0);

    return 1;
}
stock CreateTuningPlayerTextDraws(playerid)
{ 
    tuning_buttons_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 225.5000, 374.6445, "tuning:tuning_t_button_s_disk"); // пусто
    PlayerTextDrawTextSize(playerid, tuning_buttons_PTD[playerid][0], 50.0000, 55.0000);
    PlayerTextDrawAlignment(playerid, tuning_buttons_PTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, tuning_buttons_PTD[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, tuning_buttons_PTD[playerid][0], 255);
    PlayerTextDrawFont(playerid, tuning_buttons_PTD[playerid][0], 4);
    PlayerTextDrawSetProportional(playerid, tuning_buttons_PTD[playerid][0], 0);
    PlayerTextDrawSetShadow(playerid, tuning_buttons_PTD[playerid][0], 0);

    tuning_buttons_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 283.5000, 373.3999, "tuning:tuning_t_button_w_disk"); // пусто
    PlayerTextDrawTextSize(playerid, tuning_buttons_PTD[playerid][1], 51.0000, 55.0000);
    PlayerTextDrawAlignment(playerid,tuning_buttons_PTD[playerid][1], 1);
    PlayerTextDrawColor(playerid, tuning_buttons_PTD[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, tuning_buttons_PTD[playerid][1], 255);
    PlayerTextDrawFont(playerid, tuning_buttons_PTD[playerid][1], 4);
    PlayerTextDrawSetProportional(playerid, tuning_buttons_PTD[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, tuning_buttons_PTD[playerid][1], 0);

    tuning_buttons_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 341.5000, 375.8887, "tuning:tuning_t_button_razval"); // пусто
    PlayerTextDrawTextSize(playerid, tuning_buttons_PTD[playerid][2], 50.0000, 52.0000);
    PlayerTextDrawAlignment(playerid, tuning_buttons_PTD[playerid][2], 1);
    PlayerTextDrawColor(playerid, tuning_buttons_PTD[playerid][2], -1);
    PlayerTextDrawBackgroundColor(playerid, tuning_buttons_PTD[playerid][2], 255);
    PlayerTextDrawFont(playerid, tuning_buttons_PTD[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, tuning_buttons_PTD[playerid][2], 0);
    PlayerTextDrawSetShadow(playerid, tuning_buttons_PTD[playerid][2], 0);

    tuning_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 514.5000, 281.9334, "tuning:64_white"); // подтвердить
    PlayerTextDrawTextSize(playerid, tuning_PTD[playerid][0], 52.0000, 23.0000);
    PlayerTextDrawAlignment(playerid, tuning_PTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, tuning_PTD[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, tuning_PTD[playerid][0], 255);
    PlayerTextDrawFont(playerid, tuning_PTD[playerid][0], 4);
    PlayerTextDrawSetProportional(playerid, tuning_PTD[playerid][0], 0);
    PlayerTextDrawSetShadow(playerid, tuning_PTD[playerid][0], 0);
    PlayerTextDrawSetSelectable(playerid, tuning_PTD[playerid][0], true);

    tuning_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 574.5000, 281.3110, "tuning:64_white"); // отмена
    PlayerTextDrawTextSize(playerid, tuning_PTD[playerid][1], 52.0000, 23.0000);
    PlayerTextDrawAlignment(playerid, tuning_PTD[playerid][1], 1);
    PlayerTextDrawColor(playerid, tuning_PTD[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, tuning_PTD[playerid][1], 255);
    PlayerTextDrawFont(playerid, tuning_PTD[playerid][1], 4);
    PlayerTextDrawSetProportional(playerid, tuning_PTD[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, tuning_PTD[playerid][1], 0);
    PlayerTextDrawSetSelectable(playerid, tuning_PTD[playerid][1], true);

    tuning_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 518.0000, 194.8222, "tuning:64_white"); // -- <<
    PlayerTextDrawTextSize(playerid, tuning_PTD[playerid][2], 16.0000, 24.0000);
    PlayerTextDrawAlignment(playerid, tuning_PTD[playerid][2], 1);
    PlayerTextDrawColor(playerid, tuning_PTD[playerid][2], -1);
    PlayerTextDrawBackgroundColor(playerid, tuning_PTD[playerid][2], 255);
    PlayerTextDrawFont(playerid, tuning_PTD[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, tuning_PTD[playerid][2], 0);
    PlayerTextDrawSetShadow(playerid, tuning_PTD[playerid][2], 0);
    PlayerTextDrawSetSelectable(playerid, tuning_PTD[playerid][2], true);

    tuning_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 608.5000, 194.1999, "tuning:64_white"); // ++ >>
    PlayerTextDrawTextSize(playerid, tuning_PTD[playerid][3], 16.0000, 24.0000);
    PlayerTextDrawAlignment(playerid, tuning_PTD[playerid][3], 1);
    PlayerTextDrawColor(playerid, tuning_PTD[playerid][3], -1);
    PlayerTextDrawBackgroundColor(playerid, tuning_PTD[playerid][3], 255);
    PlayerTextDrawFont(playerid, tuning_PTD[playerid][3], 4);
    PlayerTextDrawSetProportional(playerid, tuning_PTD[playerid][3], 0);
    PlayerTextDrawSetShadow(playerid, tuning_PTD[playerid][3], 0);
    PlayerTextDrawSetSelectable(playerid, tuning_PTD[playerid][3], true);

    tuning_PTD[playerid][4] = CreatePlayerTextDraw(playerid, 226.5000, 375.8887, "tuning:64_white"); // размер диска
    PlayerTextDrawTextSize(playerid, tuning_PTD[playerid][4], 48.0000, 52.0000);
    PlayerTextDrawAlignment(playerid, tuning_PTD[playerid][4], 1);
    PlayerTextDrawColor(playerid, tuning_PTD[playerid][4], -1);
    PlayerTextDrawBackgroundColor(playerid, tuning_PTD[playerid][4], 255);
    PlayerTextDrawFont(playerid, tuning_PTD[playerid][4], 4);
    PlayerTextDrawSetProportional(playerid, tuning_PTD[playerid][4], 0);
    PlayerTextDrawSetShadow(playerid, tuning_PTD[playerid][4], 0);
    PlayerTextDrawSetSelectable(playerid, tuning_PTD[playerid][4], true);

    tuning_PTD[playerid][5] = CreatePlayerTextDraw(playerid, 285.0000, 375.2666, "tuning:64_white"); // ширина колес
    PlayerTextDrawTextSize(playerid, tuning_PTD[playerid][5], 48.0000, 52.0000);
    PlayerTextDrawAlignment(playerid, tuning_PTD[playerid][5], 1);
    PlayerTextDrawColor(playerid, tuning_PTD[playerid][5], -1);
    PlayerTextDrawBackgroundColor(playerid, tuning_PTD[playerid][5], 255);
    PlayerTextDrawFont(playerid, tuning_PTD[playerid][5], 4);
    PlayerTextDrawSetProportional(playerid, tuning_PTD[playerid][5], 0);
    PlayerTextDrawSetShadow(playerid, tuning_PTD[playerid][5], 0);
    PlayerTextDrawSetSelectable(playerid, tuning_PTD[playerid][5], true);

    tuning_PTD[playerid][6] = CreatePlayerTextDraw(playerid, 343.0000, 376.5108, "tuning:64_white"); // развал
    PlayerTextDrawTextSize(playerid, tuning_PTD[playerid][6], 48.0000, 50.0000);
    PlayerTextDrawAlignment(playerid, tuning_PTD[playerid][6], 1);
    PlayerTextDrawColor(playerid, tuning_PTD[playerid][6], -1);
    PlayerTextDrawBackgroundColor(playerid, tuning_PTD[playerid][6], 255);
    PlayerTextDrawFont(playerid, tuning_PTD[playerid][6], 4);
    PlayerTextDrawSetProportional(playerid, tuning_PTD[playerid][6], 0);
    PlayerTextDrawSetShadow(playerid, tuning_PTD[playerid][6], 0);
    PlayerTextDrawSetSelectable(playerid, tuning_PTD[playerid][6], true);

   
    return 1;
}