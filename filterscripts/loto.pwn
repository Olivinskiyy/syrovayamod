/*

	About: Loto
	Author: Felix
	Tester: Dmitry Savin

*/

/*ВАЖНАЯ ИНФОРМАЦИЯ*/
/*
1.	[неактуально] GivePlayerMoney(playerid, Loto_prize); найти и заменить на свою функцию, иначе деньги будут только создавать видимость, а в некоторых случаях их отнимет античит
2.  /startloto работает только для rcon администраторов, переписывайте под свои моды самостоятельно или используйте /rcon login
3.  Если возникают проблемы с диалогами (выводится другой, из вашего мода), значит задайте диалогам в fs свободные номера. Если у вас мод аризоны - фиксите в ShowPlayerDialogEx
*/
/*ВАЖНАЯ ИНФОРМАЦИЯ*/

#define FILTERSCRIPT

#include <a_samp>
#include <sscanf2>

/*SETTINGS*/
new timer = 7; //0 - отключить таймер (активация /startloto); Любое число, кроме 0 - запуск лото каждые n-мин
#define random1 0 //0 - все значения фиксированные; Дальше математика =) Принимаем значения range - 1, attempts - 2, timetoattempt - 4, prize - 8. Например, мы хотим сделать рандомное число и приз, но остальное оставить фиксированными, значит решаем пример: 1+0+0+8
#define timetoattempt 30 //Диапазон времени на ответ / максимум времени (в зависимости от значения random1) в секундах
#define range 33 //Диапазон чисел / максимальное число (в зависимости от значения random1)
#define attempts 2 //Диапазон попыток / максимум попыток (в зависимости от значения random1)
#define prize 33333 //Диапазон денежного приза / приз за каждый ответ (в зависимости от значения random1)
/*SETTINGS*/

#define Loto_GiveMoney(%0,%1) CallRemoteFunction("Loto_GiveMoney", "ii", %0,%1)
/*forward Loto_GiveMoney(playerid, money);//вставить в мод и раскомментировать
public Loto_GiveMoney(playerid, money)
{
	GivePlayerMoney(playerid, money); //GivePlayerMoney - заменяем на свою функцию работы с деньгами игрока
	return true;
}*/

new
	Loto_attempts, Loto_bonus, Loto_endtime, Loto_true,
	Loto_attempt[MAX_PLAYERS], Loto_Timer, Loto_prize;
	
new lstr[2700];

public OnFilterScriptInit()
{
	print("-----------------------------------------------------");
	printf(" Система 'Лотерея' загруженна!");
  	printf(" Разработчик: Felix");
   	printf(" Версия: 1.0.0");
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
				SendClientMessage(playerid, -1, "[Ошибка] Допустимое значение от 5!");
				return ShowPlayerDialog(playerid, 10000, DIALOG_STYLE_INPUT, "Лото", "Введите максимальное число:", "Далее", "Отмена");
			}
			ShowPlayerDialog(playerid, 10001, DIALOG_STYLE_INPUT, "Лото", "Введите кол-во попыток:", "Далее", "Назад");
			return 1;
	    }
	    case 10001:
	    {
	        if(!response)return ShowPlayerDialog(playerid, 10000, DIALOG_STYLE_INPUT, "Лото", "Введите максимальное число:", "Далее", "Отмена");
		    if(sscanf(inputtext, "d", Loto_attempts) || !(1 <= Loto_attempts <= 9999))
			{
			    SendClientMessage(playerid, -1, "[Ошибка] Допустимое значение от 1!");
				return ShowPlayerDialog(playerid, 10001, DIALOG_STYLE_INPUT, "Лото", "Введите кол-во попыток:", "Далее", "Назад");
			}
			ShowPlayerDialog(playerid, 10002, DIALOG_STYLE_INPUT, "Лото", "Введите время на ответ (сек):", "Далее", "Назад");
		    return 1;
	    }
	    case 10002:
	    {
	        if(!response)return ShowPlayerDialog(playerid, 10001, DIALOG_STYLE_INPUT, "Лото", "Введите кол-во попыток:", "Далее", "Назад");
		    if(sscanf(inputtext, "d", Loto_endtime) || !(5 <= Loto_endtime <= 9999))
			{
			  	SendClientMessage(playerid, -1, "[Ошибка] Допустимое значение от 5!");
				return ShowPlayerDialog(playerid, 10002, DIALOG_STYLE_INPUT, "Лото", "Введите время на ответ (сек):", "Далее", "Назад");
			}
			ShowPlayerDialog(playerid, 10003, DIALOG_STYLE_INPUT, "Лото", "Введите сумму выигрыша:", "Далее", "Назад");
		    return 1;
	    }
	    case 10003:
	    {
	        if(!response)return ShowPlayerDialog(playerid, 10002, DIALOG_STYLE_INPUT, "Лото", "Введите время на ответ (сек):", "Далее", "Назад");
		    if(sscanf(inputtext, "d", Loto_prize) || !(1 <= Loto_prize <= 99999999))
			{
			  	SendClientMessage(playerid, -1, "[Ошибка] Допустимое значение от 1!");
				return ShowPlayerDialog(playerid, 10003, DIALOG_STYLE_INPUT, "Лото", "Введите сумму выигрыша:", "Далее", "Назад");
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
		if(!IsPlayerAdmin(playerid))return 1;// чтобы использовать команду необходимо быть авторизованным под rcon
		else if(timer)return 1;
		else if(Loto_endtime)return SendClientMessage(playerid, -1,"[Ошибка] Лотерея уже запущена!");
		ShowPlayerDialog(playerid, 10000, DIALOG_STYLE_INPUT, "Лото", "Введите максимальное число:", "Далее", "Отмена");
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
		format(lstr, 90, "{40E0D0}Лотерея завершена! Победителя нет! Правильным ответом было {B03060}%d{40E0D0}!", Loto_true);
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
				format(lstr, 144, "{FF1493}Лотерея завершена! Победитель {ff0000}%s{FF1493} с ответом {ff0000}%d{FF1493} (приз: $%d)!", playername, Loto_true, Loto_prize);
				SendClientMessageToAll(-1, lstr);
    			Loto_GiveMoney(playerid, Loto_prize);
	        }
	        else
	        {
	       		Loto_attempt[playerid]--;
				format(lstr, 144, "{ff0000}Ответ не верный! У вас осталось {00ff00}%d {C1FFC1}попыток!", Loto_attempt[playerid]);
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
		case 0://все числа фиксированные
		{
		    Loto_bonus = range;
		    Loto_attempts = attempts;
		    Loto_endtime = timetoattempt;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = prize;
		    _Loto_Create();
		}
		case 1://рандом диапазона чисел
		{
		    Loto_bonus = random(range)+1;
		    Loto_attempts = attempts;
		    Loto_endtime = timetoattempt;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = prize;
		    _Loto_Create();
		}
		case 2://рандом диапазона попыток
		{
		    Loto_bonus = range;
		    Loto_attempts = random(attempts)+1;
		    Loto_endtime = timetoattempt;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = prize;
		    _Loto_Create();
		}
		case 3://рандом диапазона чисел и попыток
		{
		    Loto_bonus = random(range)+1;
		    Loto_attempts = random(attempts)+1;
		    Loto_endtime = timetoattempt;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = prize;
		    _Loto_Create();
		}
		case 4://рандом времени на ответ
		{
		    Loto_bonus = range;
		    Loto_attempts = attempts;
		    Loto_endtime = random(timetoattempt)+1;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = prize;
		    _Loto_Create();
		}
		case 5://рандом диапазона чисел и времени на ответ
		{
		    Loto_bonus = random(range)+1;
		    Loto_attempts = attempts;
		    Loto_endtime = random(timetoattempt)+1;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = prize;
		    _Loto_Create();
		}
		case 6://рандом диапазона попыток и времени на ответ
		{
		    Loto_bonus = range;
		    Loto_attempts = random(attempts)+1;
		    Loto_endtime = random(timetoattempt)+1;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = prize;
		    _Loto_Create();
		}
		case 7://рандом чисел, диапазона попыток и времени на ответ
		{
		    Loto_bonus = random(range)+1;
		    Loto_attempts = random(attempts)+1;
		    Loto_endtime = random(timetoattempt)+1;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = prize;
		    _Loto_Create();
		}
		case 8://рандомный приз
		{
		    Loto_bonus = range;
		    Loto_attempts = attempts;
		    Loto_endtime = timetoattempt;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = random(prize)+1;
		    _Loto_Create();
		}
		case 9://рандомный приз и диапазон чисел
		{
		    Loto_bonus = random(range)+1;
		    Loto_attempts = attempts;
		    Loto_endtime = timetoattempt;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = random(prize)+1;
		    _Loto_Create();
		}
		case 10://рандомный приз и попытки
		{
		    Loto_bonus = range;
		    Loto_attempts = random(attempts)+1;
		    Loto_endtime = timetoattempt;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = random(prize)+1;
		    _Loto_Create();
		}
		case 11://рандомный приз, диапазон чисел и попытки
		{
		    Loto_bonus = random(range)+1;
		    Loto_attempts = random(attempts)+1;
		    Loto_endtime = timetoattempt;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = random(prize)+1;
		    _Loto_Create();
		}
		case 12://рандомный приз и время на ответ
		{
		    Loto_bonus = range;
		    Loto_attempts = attempts;
		    Loto_endtime = random(timetoattempt)+1;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = random(prize)+1;
		    _Loto_Create();
		}
		case 13://рандомный приз, диапазон чисел и время на ответ
		{
		   	Loto_bonus = random(range)+1;
		    Loto_attempts = attempts;
		    Loto_endtime = random(timetoattempt)+1;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = random(prize)+1;
		    _Loto_Create();
		}
		case 14://рандомный приз, время на ответ и попыток
		{
		    Loto_bonus = range;
		    Loto_attempts = random(attempts)+1;
		    Loto_endtime = random(timetoattempt)+1;
		    Loto_true = random(Loto_bonus)+1;
		    Loto_prize = random(prize)+1;
		    _Loto_Create();
		}
		case 15://рандом всего
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

	SendClientMessageToAll(-1, "{ff0000}Внимание! Началась лотерея!");
	format(lstr, 115, "{ff0000}Введитие в чат число от {00ff00}1{ff0000} до {00ff00}%d{ff0000}. У вас {00ff00}%d{ff0000} попыток!", Loto_bonus, Loto_attempts);
	SendClientMessageToAll(-1, lstr);
	format(lstr, 55, "{ff0000}Времени осталось {00ff00}%d{ff0000} сек!", Loto_endtime);
	SendClientMessageToAll(-1, lstr);
	for(new i; i<MAX_PLAYERS; i++)
	{
	    Loto_attempt[i] = Loto_attempts;
	}
	return 1;
}

