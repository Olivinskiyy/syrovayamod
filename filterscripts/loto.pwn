/*

	About: Loto
	Author: Felix
	Tester: Dmitry Savin

*/

/*������ ����������*/
/*
1.	[�����������] GivePlayerMoney(playerid, Loto_prize); ����� � �������� �� ���� �������, ����� ������ ����� ������ ��������� ���������, � � ��������� ������� �� ������� �������
2.  /startloto �������� ������ ��� rcon ���������������, ������������� ��� ���� ���� �������������� ��� ����������� /rcon login
3.  ���� ��������� �������� � ��������� (��������� ������, �� ������ ����), ������ ������� �������� � fs ��������� ������. ���� � ��� ��� ������� - ������� � ShowPlayerDialogEx
*/
/*������ ����������*/

#define FILTERSCRIPT

#include <a_samp>
#include <sscanf2>

/*SETTINGS*/
new timer = 7; //0 - ��������� ������ (��������� /startloto); ����� �����, ����� 0 - ������ ���� ������ n-���
#define random1 0 //0 - ��� �������� �������������; ������ ���������� =) ��������� �������� range - 1, attempts - 2, timetoattempt - 4, prize - 8. ��������, �� ����� ������� ��������� ����� � ����, �� ��������� �������� ��������������, ������ ������ ������: 1+0+0+8
#define timetoattempt 30 //�������� ������� �� ����� / �������� ������� (� ����������� �� �������� random1) � ��������
#define range 33 //�������� ����� / ������������ ����� (� ����������� �� �������� random1)
#define attempts 2 //�������� ������� / �������� ������� (� ����������� �� �������� random1)
#define prize 33333 //�������� ��������� ����� / ���� �� ������ ����� (� ����������� �� �������� random1)
/*SETTINGS*/

#define Loto_GiveMoney(%0,%1) CallRemoteFunction("Loto_GiveMoney", "ii", %0,%1)
/*forward Loto_GiveMoney(playerid, money);//�������� � ��� � �����������������
public Loto_GiveMoney(playerid, money)
{
	GivePlayerMoney(playerid, money); //GivePlayerMoney - �������� �� ���� ������� ������ � �������� ������
	return true;
}*/

new
	Loto_attempts, Loto_bonus, Loto_endtime, Loto_true,
	Loto_attempt[MAX_PLAYERS], Loto_Timer, Loto_prize;
	
new lstr[2700];

public OnFilterScriptInit()
{
	print("-----------------------------------------------------");
	printf(" ������� '�������' ����������!");
  	printf(" �����������: Felix");
   	printf(" ������: 1.0.0");
	print("-----------------------------------------------------");
	
	if(timer)SetTimer("Loto_ResultEx", (60*1000*timer)+(1000*timetoattempt), true);
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
	    case 10000:
	    {
     		if(!response)return 1;
		    if(sscanf(inputtext, "d", Loto_bonus) || !(5 <= Loto_bonus <= 9999))
			{
				SendClientMessage(playerid, -1, "[������] ���������� �������� �� 5!");
				return ShowPlayerDialog(playerid, 10000, DIALOG_STYLE_INPUT, "����", "������� ������������ �����:", "�����", "������");
			}
			ShowPlayerDialog(playerid, 10001, DIALOG_STYLE_INPUT, "����", "������� ���-�� �������:", "�����", "�����");
			return 1;
	    }
	    case 10001:
	    {
	        if(!response)return ShowPlayerDialog(playerid, 10000, DIALOG_STYLE_INPUT, "����", "������� ������������ �����:", "�����", "������");
		    if(sscanf(inputtext, "d", Loto_attempts) || !(1 <= Loto_attempts <= 9999))
			{
			    SendClientMessage(playerid, -1, "[������] ���������� �������� �� 1!");
				return ShowPlayerDialog(playerid, 10001, DIALOG_STYLE_INPUT, "����", "������� ���-�� �������:", "�����", "�����");
			}
			ShowPlayerDialog(playerid, 10002, DIALOG_STYLE_INPUT, "����", "������� ����� �� ����� (���):", "�����", "�����");
		    return 1;
	    }
	    case 10002:
	    {
	        if(!response)return ShowPlayerDialog(playerid, 10001, DIALOG_STYLE_INPUT, "����", "������� ���-�� �������:", "�����", "�����");
		    if(sscanf(inputtext, "d", Loto_endtime) || !(5 <= Loto_endtime <= 9999))
			{
			  	SendClientMessage(playerid, -1, "[������] ���������� �������� �� 5!");
				return ShowPlayerDialog(playerid, 10002, DIALOG_STYLE_INPUT, "����", "������� ����� �� ����� (���):", "�����", "�����");
			}
			ShowPlayerDialog(playerid, 10003, DIALOG_STYLE_INPUT, "����", "������� ����� ��������:", "�����", "�����");
		    return 1;
	    }
	    case 10003:
	    {
	        if(!response)return ShowPlayerDialog(playerid, 10002, DIALOG_STYLE_INPUT, "����", "������� ����� �� ����� (���):", "�����", "�����");
		    if(sscanf(inputtext, "d", Loto_prize) || !(1 <= Loto_prize <= 99999999))
			{
			  	SendClientMessage(playerid, -1, "[������] ���������� �������� �� 1!");
				return ShowPlayerDialog(playerid, 10003, DIALOG_STYLE_INPUT, "����", "������� ����� ��������:", "�����", "�����");
			}
			Loto_true = random(Loto_bonus)+1;
			_Loto_Create();
		    return 1;
	    }
	}
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if(strcmp(cmdtext, "/startloto",true) == 0)
	{
		if(!IsPlayerAdmin(playerid))return 1;// ����� ������������ ������� ���������� ���� �������������� ��� rcon
		else if(timer)return 1;
		else if(Loto_endtime)return SendClientMessage(playerid, -1,"[������] ������� ��� ��������!");
		ShowPlayerDialog(playerid, 10000, DIALOG_STYLE_INPUT, "����", "������� ������������ �����:", "�����", "������");
		return 1;
	}
	return 0;
}

forward Loto_Result();
public Loto_Result()
{
 	if(Loto_endtime)
 	{
 		Loto_endtime--;
		static
		    lstr2[14];
		format(lstr2, sizeof(lstr2), "LOTO: %d sec!", Loto_endtime);
		GameTextForAll(lstr2, 1000, 6);
 	}
	else if(!Loto_endtime)
	{
		format(lstr, 90, "{40E0D0}������� ���������! ���������� ���! ���������� ������� ���� {B03060}%d{40E0D0}!", Loto_true);
  		SendClientMessageToAll(-1, lstr);
		KillTimer(Loto_Timer);
	}
	return 1;
}

public OnPlayerText(playerid, text[])
{
	if(Loto_endtime)
	{
	    for(new i; i<strlen(text); i++)
	    {
			if(text[i] >= '0' && text[i] <= '9')continue;
			else return 1;
	    }
	    if(Loto_attempt[playerid])
	    {
		 	static
		 	    otvet[4];
			format(otvet, sizeof(otvet), "%d", Loto_true);
	        if(!strcmp(text, otvet, false))
	        {
	            KillTimer(Loto_Timer);
	            Loto_endtime = 0;
            	static
  		 			playername[25];
				GetPlayerName(playerid, playername, sizeof(playername));
				format(lstr, 144, "{FF1493}������� ���������! ���������� {ff0000}%s{FF1493} � ������� {ff0000}%d{FF1493} (����: $%d)!", playername, Loto_true, Loto_prize);
				SendClientMessageToAll(-1, lstr);
    			Loto_GiveMoney(playerid, Loto_prize);
	        }
	        else
	        {
	       		Loto_attempt[playerid]--;
				format(lstr, 144, "{ff0000}����� �� ������! � ��� �������� {00ff00}%d {C1FFC1}�������!", Loto_attempt[playerid]);
				SendClientMessage(playerid, -1, lstr);
	        }
		}
	}
	return 1;
}

forward Loto_ResultEx();
public Loto_ResultEx()
{
	switch(random1)
	{
		case 0://��� ����� �������������
		{
		    Loto_bonus = range;
		    Loto_attempts = attempts;
		    Loto_endtime = timetoattempt;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = prize;
		    _Loto_Create();
		}
		case 1://������ ��������� �����
		{
		    Loto_bonus = random(range)+1;
		    Loto_attempts = attempts;
		    Loto_endtime = timetoattempt;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = prize;
		    _Loto_Create();
		}
		case 2://������ ��������� �������
		{
		    Loto_bonus = range;
		    Loto_attempts = random(attempts)+1;
		    Loto_endtime = timetoattempt;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = prize;
		    _Loto_Create();
		}
		case 3://������ ��������� ����� � �������
		{
		    Loto_bonus = random(range)+1;
		    Loto_attempts = random(attempts)+1;
		    Loto_endtime = timetoattempt;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = prize;
		    _Loto_Create();
		}
		case 4://������ ������� �� �����
		{
		    Loto_bonus = range;
		    Loto_attempts = attempts;
		    Loto_endtime = random(timetoattempt)+1;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = prize;
		    _Loto_Create();
		}
		case 5://������ ��������� ����� � ������� �� �����
		{
		    Loto_bonus = random(range)+1;
		    Loto_attempts = attempts;
		    Loto_endtime = random(timetoattempt)+1;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = prize;
		    _Loto_Create();
		}
		case 6://������ ��������� ������� � ������� �� �����
		{
		    Loto_bonus = range;
		    Loto_attempts = random(attempts)+1;
		    Loto_endtime = random(timetoattempt)+1;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = prize;
		    _Loto_Create();
		}
		case 7://������ �����, ��������� ������� � ������� �� �����
		{
		    Loto_bonus = random(range)+1;
		    Loto_attempts = random(attempts)+1;
		    Loto_endtime = random(timetoattempt)+1;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = prize;
		    _Loto_Create();
		}
		case 8://��������� ����
		{
		    Loto_bonus = range;
		    Loto_attempts = attempts;
		    Loto_endtime = timetoattempt;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = random(prize)+1;
		    _Loto_Create();
		}
		case 9://��������� ���� � �������� �����
		{
		    Loto_bonus = random(range)+1;
		    Loto_attempts = attempts;
		    Loto_endtime = timetoattempt;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = random(prize)+1;
		    _Loto_Create();
		}
		case 10://��������� ���� � �������
		{
		    Loto_bonus = range;
		    Loto_attempts = random(attempts)+1;
		    Loto_endtime = timetoattempt;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = random(prize)+1;
		    _Loto_Create();
		}
		case 11://��������� ����, �������� ����� � �������
		{
		    Loto_bonus = random(range)+1;
		    Loto_attempts = random(attempts)+1;
		    Loto_endtime = timetoattempt;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = random(prize)+1;
		    _Loto_Create();
		}
		case 12://��������� ���� � ����� �� �����
		{
		    Loto_bonus = range;
		    Loto_attempts = attempts;
		    Loto_endtime = random(timetoattempt)+1;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = random(prize)+1;
		    _Loto_Create();
		}
		case 13://��������� ����, �������� ����� � ����� �� �����
		{
		   	Loto_bonus = random(range)+1;
		    Loto_attempts = attempts;
		    Loto_endtime = random(timetoattempt)+1;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = random(prize)+1;
		    _Loto_Create();
		}
		case 14://��������� ����, ����� �� ����� � �������
		{
		    Loto_bonus = range;
		    Loto_attempts = random(attempts)+1;
		    Loto_endtime = random(timetoattempt)+1;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = random(prize)+1;
		    _Loto_Create();
		}
		case 15://������ �����
		{
		    Loto_bonus = random(range)+1;
		    Loto_attempts = random(attempts)+1;
		    Loto_endtime = random(timetoattempt)+1;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = random(prize)+1;
		    _Loto_Create();
		}

	}
	return 1;
}

stock _Loto_Create()
{
	static
	    lstr2[14];
	format(lstr2, sizeof(lstr2), "LOTO: %d sec!", Loto_endtime);
	GameTextForAll(lstr2, 1000, 6);
	Loto_Timer = SetTimer("Loto_Result", 1000, Loto_endtime);

	SendClientMessageToAll(-1, "{ff0000}��������! �������� �������!");
	format(lstr, 115, "{ff0000}�������� � ��� ����� �� {00ff00}1{ff0000} �� {00ff00}%d{ff0000}. � ��� {00ff00}%d{ff0000} �������!", Loto_bonus, Loto_attempts);
	SendClientMessageToAll(-1, lstr);
	format(lstr, 55, "{ff0000}������� �������� {00ff00}%d{ff0000} ���!", Loto_endtime);
	SendClientMessageToAll(-1, lstr);
	for(new i; i<MAX_PLAYERS; i++)
	{
	    Loto_attempt[i] = Loto_attempts;
	}
	return 1;
}

