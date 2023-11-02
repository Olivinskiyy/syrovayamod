/*----------------------------------------------------------------
������ ������� Igor_Stalker
��������� Pa4enka �� ������!

��� ������ ���� �����������
� ������� Samp - ������ ���������� ������

���������� � ������: �� ������ � ������� 10 ����� ��������� ������
�� ������.��� ������ ��� ���� ���������

��� ����������� �� ������ � �������,���������� ������ Igor_Stalker
�� �������� Skype (igorkrutoi3)
------------------------------------------------------------------*/
#include <a_samp>

forward job(playerid);//��� �������� ������� ������� ������������ ��������

//����������
new bike1,//����������
bike5,
pickup,//����� ������
gazeta[MAX_PLAYERS char],//������
timer_job[MAX_PLAYERS];//������

new Float:job_coord[39][3]=//���������� ����������
{
	{2117.7920,2781.5730,10.3300},//1
	{2087.1497,2776.9431,10.3299},//2
	{2046.4521,2750.5498,10.3318},
	{1996.9301,2750.1809,10.3321},
	{1954.0177,2749.7798,10.3325},
	{1896.7904,2720.8408,10.3278},
	{1699.5061,2721.1201,10.3323},
	{1694.6061,2805.8516,10.3318},
	{1664.7766,2829.1855,10.3316},
	{1551.2095,2829.0281,10.3325},
	{1558.4940,2814.4146,10.3251},
	{1618.1321,2813.3032,10.3328},
	{1674.7928,2813.2476,10.3312},
	{1679.5026,2743.3391,10.3323},
	{1645.3352,2741.8022,10.3304},
	{1599.2686,2741.4404,10.3284},
	{1536.9817,2720.8381,10.3256},
	{1552.6332,2670.7439,10.3326},
	{1579.7229,2663.6450,10.3325},
	{1579.3661,2603.8621,10.3237},
	{1539.3322,2598.0623,10.3300},
	{1487.1046,2597.7407,10.3296},
	{1348.8503,2598.1309,10.3256},
	{1267.6985,2598.2493,10.3305},
	{1279.2122,2582.5315,10.3304},
	{1347.5929,2581.7451,10.3315},
	{1416.1440,2582.4121,10.3321},
	{1512.4664,2581.4185,10.3254},
	{1563.6720,2582.0237,10.3325},
	{1594.8137,2602.5059,10.3315},
	{1593.7792,2673.9614,10.3325},
	{1568.5520,2725.4263,10.3249},
	{1651.6514,2725.1770,10.3330},
	{1673.9342,2725.4160,10.3257},
	{1703.0023,2705.6509,10.3302},
	{1887.7975,2705.6663,10.3255},
	{1931.7177,2734.8918,10.3309},
	{2056.5820,2734.5193,10.3327},
	{2135.9753,2833.2402,10.2240}
};

main(){}

//public OnFilterScriptInit()//���� ������������ ��� ��
public OnGameModeInit()//���� ������������ ��� ���
{
	bike1 = AddStaticVehicleEx(509,2139.2957,2841.2310,10.3323,176.8398,7,7,60);//����������
	AddStaticVehicleEx(509,2140.7749,2841.1785,10.3328,175.2333,7,7,60);
	AddStaticVehicleEx(509,2142.4055,2841.0923,10.3324,178.2330,7,7,60);
	AddStaticVehicleEx(509,2143.9443,2841.0537,10.3326,181.7920,7,7,60);
	bike5 = AddStaticVehicleEx(509,2145.6948,2841.2000,10.3323,173.1840,7,7,60);//
	
	pickup = CreatePickup(1550,23,2158.4492,-1945.0065,18.8125,0);//����� ������
	
	Create3DTextLabel(!"�����: {00FF00}�������� �����!",0xFF0000FF,2158.4492,-1945.0065,18.8125,15,0,1);// 3 � ����� �� ������
	return 1;
}

public job(playerid)// ������ �������(����� 10 ����� ���������� ���� ������ ���� �� �� �������� �������)
{
	SendClientMessage(playerid,0xFF0000FF,!"�� �� ������ ��������� ������ ����������� � ����!");
	
	gazeta{playerid} = 0;//�������� ����������
	
	SetPlayerSkin(playerid,289);//����� ������ �������������� ����
	
	RemovePlayerAttachedObject(playerid,0);//������� ������
	
	SetVehicleToRespawn(GetPlayerVehicleID(playerid));//��������� ���������
	
	DisablePlayerCheckpoint(playerid);//������� �������� ������
	return 1;
}
public OnPlayerEnterCheckpoint(playerid)//������ ,������� ������������ ����� ����� ���������� ��������
{
	if(gazeta{playerid} >= 0 && GetPlayerVehicleID(playerid) >= bike1 && GetPlayerVehicleID(playerid) <= bike5)//�������� �� �� ����� �� ����� �� ����������
	{
	    gazeta{playerid} ++;
	    DisablePlayerCheckpoint(playerid);
	    switch(gazeta{playerid})
	    {
	        case 3,4,5,9,10,12,15,16,18,21,23,24,26,27,28,29,31,32,33,35,37,38:
	        {
	            {
			        switch(gazeta{playerid})
				    {
				        case 3:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}1{FFFFFF}/{FF0000}22");
				        case 4:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}2{FFFFFF}/{FF0000}22");
				        case 5:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}3{FFFFFF}/{FF0000}22");
				        case 9:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}4{FFFFFF}/{FF0000}22");
				        case 10:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}5{FFFFFF}/{FF0000}22");
				        case 12:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}6{FFFFFF}/{FF0000}22");
				        case 15:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}7{FFFFFF}/{FF0000}22");
				        case 16:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}8{FFFFFF}/{FF0000}22");
				        case 18:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}9{FFFFFF}/{FF0000}22");
				        case 21:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}10{FFFFFF}/{FF0000}22");
				        case 23:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}11{FFFFFF}/{FF0000}22");
				        case 24:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}12{FFFFFF}/{FF0000}22");
				        case 26:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}13{FFFFFF}/{FF0000}22");
				        case 27:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}14{FFFFFF}/{FF0000}22");
				        case 28:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}15{FFFFFF}/{FF0000}22");
				        case 29:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}16{FFFFFF}/{FF0000}22");
				        case 31:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}17{FFFFFF}/{FF0000}22");
				        case 32:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}18{FFFFFF}/{FF0000}22");
				        case 33:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}19{FFFFFF}/{FF0000}22");
				        case 35:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}20{FFFFFF}/{FF0000}22");
				        case 37:SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}21{FFFFFF}/{FF0000}22");
				        case 38:
				        {
							SendClientMessage(playerid,0xFFFFFFFF,!"���������� �����: {00FF00}22{FFFFFF}/{FF0000}22");
				            SendClientMessage(playerid,0xAA3333FF,!"������������� �� ��������!");
				        }
				    }
				    ApplyAnimation(playerid, !"RYDER", !"RYD_BECKON_01", 4.1, false, false, false, false, 1000, false);//�������� ����������� ������
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid,job_coord[gazeta{playerid}][0],job_coord[gazeta{playerid}][1],job_coord[gazeta{playerid}][2],2.0);//��� ���������� ������ �� ������� job_coord
					return 1;
				}
	        }
	    }
		if(gazeta{playerid} == 39)
		{
			gazeta{playerid} = 0;
			SetPlayerSkin(playerid,289);
			RemovePlayerAttachedObject(playerid,0);
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			DisablePlayerCheckpoint(playerid);
			//�������(������� �� ���)
			SendClientMessage(playerid,0x00FF00AA,!"��� ������ ��� ������� - ��� ������ ������� �� ���� �����!");
			SendClientMessage(playerid,0x33CCFFAA,!"�� ��������� ������ ����������� � ��������:");
			SendClientMessage(playerid,0xFF9900AA,!"������������� ����� � ����� ������! {00FF00}����������� � ��������� � ������.");
			SendClientMessage(playerid,0xFFFF00AA,!"������(20000 ����)!");
			SendClientMessage(playerid,0xFFFF00AA,!"����(8 exp)!");
			GivePlayerMoney(playerid,20000);
			//
			KillTimer(timer_job[playerid]);//������� ������
			return 1;
		}
		SetPlayerCheckpoint(playerid,job_coord[gazeta{playerid}][0],job_coord[gazeta{playerid}][1],job_coord[gazeta{playerid}][2], 2.0);
	}
	else//���� �� ��������� �������� �� ������ ����������,� �� ���������� �� ������ ������
	{
		SendClientMessage(playerid,0xFF0000FF,"");
		SendClientMessage(playerid,0xFF0000FF,!"�� ������ ���� �� ����������!�� ��������� ����� '�������� �����'!");
		SendClientMessage(playerid,0xFF0000FF,"");
		gazeta{playerid} = 0;//�������� ����������
		SetPlayerSkin(playerid,289);//����� ��� �������������� ����
		RemovePlayerAttachedObject(playerid,0);//������� ������
		SetVehicleToRespawn(GetPlayerVehicleID(playerid));//��������� ���������
		DisablePlayerCheckpoint(playerid);//������� ���������
		KillTimer(timer_job[playerid]);//������� ������(10 ����� )
	    return 1;
	}
	return 1;
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])//��� ������� �� ����� ������ ,����������� ������ � ������ ��� ����� ������
{
	if(dialogid == 17333)//���� ����������� ������ ��� ��,�� �������� �� ��������� �� ������� � ���� ����
	{
		if(response)//������
		{
		    if(gazeta{playerid} == 0)
		    {
			    SendClientMessage(playerid,0xFFFFFFFF,!"��������: ������!����� ������ ��������� ������ �����������.");
			    SendClientMessage(playerid,0xFFFFFFFF,!"��������: ������� ������ ���, ������� ����������!");
			    SendClientMessage(playerid,0xFFFFFFFF,!"��������: ���� ��������� � ���������� ������ ��������� ��� ������!");
			    SendClientMessage(playerid,0xAA3333FF,!"������������� � ����� �� �����! � ��� ���� 10 ����� �� ��� �������.");
			    SetPlayerSkin(playerid,36);//����� ����
			    SetPlayerAttachedObject(playerid,0,19559,1,0.051000,-0.056999,0.003000,-5.199950,85.300025,0.000000,1.168999,1.098000,0.962999);//����������� ������ � ������
			    SetPlayerCheckpoint(playerid,2119.8196,2824.0574,10.3323,2.0);//�������� 1 ��������
			    gazeta{playerid}--;
				timer_job[playerid] = SetTimer(!"job",550000,false);//�� ������� ����� 10 ���,���� �� �� ��������� ������ � ������� 10 ����� ������� �������������
				return 1;
			    
		    }
		}
		else//���������
		{
			SendClientMessage(playerid,0xFFFFFFFF,!"�� ���������� �� ������.");
		    gazeta{playerid} = 0;//�������� ����������
			SetPlayerSkin(playerid,289);//����� �������������� ����
			RemovePlayerAttachedObject(playerid,0);//������� ������
			DisablePlayerCheckpoint(playerid);//������� ��������
			return 1;
		}
	}
	return 1;
}
public OnPlayerDisconnect(playerid, reason)//��������� ���������� ������ � �������
{
	gazeta{playerid} = 
	timer_job[playerid] = 0;
	return 1;
}
public OnPlayerDeath(playerid, killerid, reason)//��� ������ ������ �������������
{
	gazeta{playerid} = 0;//�������� ����������
	SetPlayerSkin(playerid,289);//����� �������������� ����
	RemovePlayerAttachedObject(playerid,0);//������� ������
	SetVehicleToRespawn(GetPlayerVehicleID(playerid));//��������� ���������
	DisablePlayerCheckpoint(playerid);//������� ��������
	KillTimer(timer_job[playerid]);//������� ������
	return 1;
}
public OnPlayerStateChange(playerid, newstate, oldstate)//������ ������������ ����� ����� ������ ���� ������(��� � ��������� ,��� ������)
{
	if(newstate == PLAYER_STATE_DRIVER)
	{
	    if(gazeta{playerid} == 0)//�������� �� ���� �� ����� �����
		{
			SendClientMessage(playerid,0xFFFFFFFF,!"�� �� ����� ����� '�������� �����'!");
			RemovePlayerFromVehicle(playerid);//���������� �� ������ ���� ����� �� ���� �����
			return 1;
		}
	}
    return 1;
}
public OnPlayerPickUpPickup(playerid, pickupid)//������ ������������ ����� ����� ���������� �����
{
	if(pickupid == pickup)
	{
		ShowPlayerDialog(playerid,17333,DIALOG_STYLE_MSGBOX,!"{FF0000}�����",!"{00FF00}��� �� ������?",!"������",!"���������");//���� ����� ���������� ����� �� ���������� ������ ������
	}
	return 1;
}
public OnPlayerConnect(playerid)//������ "�"(����������) �� �����
{
	SetPlayerMapIcon(playerid,0,2145.4985,2834.3423,10.8203,42,0xbf8f8f,MAPICON_LOCAL);
	return 1;
}
public OnPlayerCommandText(playerid, cmdtext[])// ������� ��� �� � ����������(������� /�� )
{
}
