/* ///////////////////////////////////////////////////////////////////////
   |||||||||||||||||| СДЕЛАНО: 06.08.2017 : 0.26 |||||||||||||||||||||||||
   |||||||||||||||||| PAWNO-RUS.RU - PAWN скриптинг ||||||||||||||||||||||
*/
#include <a_samp>
#define GPVI GetPVarInt
#define DPVR DeletePVar
#define SPVI SetPVarInt
#define SCM SendClientMessage
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_PURPLE 0xC2A2DAAA
#define COLOR_LIGHTBLUE 0x33CCFFAA
new BigEar[MAX_PLAYERS];

new Meduzaplus[MAX_PLAYERS];
new meduza[26];

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" System cuted by Roman");
	print(" System paste on FilterScript by Vlad");
	print(" PAWNO-RUS.RU - ВСЕ ДЛЯ СКРИПТЕРА");
	print("--------------------------------------\n");
	// SYSTEM:
	meduza[0] = CreatePickup(1603,2,-797.6761,2485.2246,32.5267);//Медуза
	meduza[1] = CreatePickup(1603,2,-802.1709,2496.2864,32.2646);//Медуза
	meduza[2] = CreatePickup(1603,2,-811.7155,2504.5500,29.3333);//Медуза
	meduza[3] = CreatePickup(1603,2,-820.8770,2522.7083,32.4429);//Медуза
	meduza[4] = CreatePickup(1603,2,-804.4385,2527.2566,31.0371);//Медуза
	meduza[5] = CreatePickup(1603,2,-788.5790,2557.8230,33.0156);//Медуза
	meduza[6] = CreatePickup(1603,2,-769.9031,2566.3306,32.6665);//Медуза
	meduza[7] = CreatePickup(1603,2,-744.6867,2560.0764,32.3637);//Медуза
	meduza[8] = CreatePickup(1603,2,-731.7302,2576.7629,35.0796);//Медуза
	meduza[9] = CreatePickup(1603,2,-722.5411,2565.9683,33.0782);//Медуза
	meduza[10] = CreatePickup(1603,2,-709.9573,2564.5527,29.7683);//Медуза
	meduza[11] = CreatePickup(1603,2,-705.8895,2592.2661,35.4615);//Медуза
	meduza[12] = CreatePickup(1603,2,-694.2102,2588.3513,35.5619);//Медуза
	meduza[13] = CreatePickup(1603,2,-686.1837,2575.5193,31.9613);//Медуза
	meduza[14] = CreatePickup(1603,2,-685.3367,2551.4385,35.2500);//Медуза
	meduza[15] = CreatePickup(1603,2,-671.1393,2529.3293,35.3994);//Медуза
	meduza[16] = CreatePickup(1603,2,-682.1143,2499.5496,28.6526);//Медуза
	meduza[17] = CreatePickup(1603,2,-687.4024,2463.8342,32.5824);//Медуза
	meduza[18] = CreatePickup(1603,2,-724.5478,2439.0942,35.6000);//Медуза
	meduza[19] = CreatePickup(1603,2,-730.4103,2421.3210,35.5692);//Медуза
	meduza[20] = CreatePickup(1603,2,-730.5324,2383.6465,30.3319);//Медуза
	meduza[21] = CreatePickup(1603,2,-754.1667,2372.8894,35.4304);//Медуза
	meduza[22] = CreatePickup(1603,2,-777.0073,2394.1023,35.4765);//Медуза
	meduza[23] = CreatePickup(1603,2,-792.0909,2403.5374,29.1317);//Медуза
	meduza[24] = CreatePickup(1603,2,-795.7236,2435.5022,25.5704);//Медуза
	meduza[25] = CreatePickup(1603,2,-804.7744,2445.7029,34.2445);//Медуза
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnPlayerConnect(playerid)
{
    Meduzaplus[playerid] = 0;
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[128], idx;
	cmd = strtok(cmdtext, idx);
	if(strcmp(cmd, "/akvalang", true) == 0)
	{
	    if(!PlayerToPoint(2.0,playerid,-768.9856,2467.7817,39.9330)) return 1;
	    new s[35];
	    if(!GPVI(playerid, "AKVALANG"))
	    {
	        format(s, sizeof(s), "%s надевает акваланг", gn(playerid));
	        ProxDetector(15.0, playerid, s, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	        SetPlayerAttachedObject(playerid, 5, 1010, 1, 0.053070, -0.083673, -0.004646, 86.6, 354.2, 180.0, 1.0, 1.0, 1.0);
	        SPVI(playerid, "AKVALANG", 1);
	    }
	    else if(GPVI(playerid, "AKVALANG"))
	    {
	        format(s, sizeof(s), "%s снимает акваланг", gn(playerid));
	        ProxDetector(15.0, playerid, s, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	        RemovePlayerAttachedObject(playerid, 5);
	        DPVR(playerid, "AKVALANG");
	    }
	    return 1;
	}
	if(strcmp(cmd, "/sellmeduz", true) == 0)
	{
	    if(!PlayerToPoint(1.0, playerid, -767.5917,2465.5391,41.0703)) return 1;
	    if(Meduzaplus[playerid] <= 0) return SCM(playerid, COLOR_GREY, "У вас нет ни одной медузы!");
	    if(GPVI(playerid, "AKVALANG")) return SCM(playerid, COLOR_GREY, "Сначало сдайте обратно акваланг!");
	    new money = Meduzaplus[playerid] * 50;
	    GivePlayerMoney(playerid, money);
	    new ss[31];
	    format(ss, 30, "Вы продали своих медуз за %dр", money);
	    SCM(playerid,COLOR_LIGHTBLUE,ss);
	    Meduzaplus[playerid] = 0;
	    return 1;
	}
	return 1;
}


public OnPlayerPickUpPickup(playerid, pickupid)
{
    for(new i; i != 26; i++)
	{
    	if(pickupid == meduza[i] && GPVI(playerid, "AKVALANG"))
    	{
        	GameTextForPlayer(playerid, "~g~~h~+1 meduza", 1000, 3);
            Meduzaplus[playerid] += 1;
        	break;
    	}
	}
	return 1;
}
stock gn(playerid)
{
	new name[24];
	GetPlayerName(playerid, name, 24);
	return name;
}
stock strtok(const strrr[], &index,seperator= ' '){
	new length = strlen(strrr);
	new offset = index;
	new result[128];
	while ((index < length) && (strrr[index] != seperator) && ((index - offset) < (sizeof(result) - 1))){
		result[index - offset] = strrr[index];
		index++;}
	result[index - offset] = EOS;
	if ((index < length) && (strrr[index] == seperator))index++;return result;}
forward ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5);
public ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				if(!BigEar[i])
				{
					GetPlayerPos(i, posx, posy, posz);
					tempposx = (oldposx -posx);
					tempposy = (oldposy -posy);
					tempposz = (oldposz -posz);
					if (((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16)))
					{
						SendClientMessage(i, col1, string);
					}
					else if (((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8)))
					{
						SendClientMessage(i, col2, string);
					}
					else if (((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4)))
					{
						SendClientMessage(i, col3, string);
					}
					else if (((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2)))
					{
						SendClientMessage(i, col4, string);
					}
					else if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
					{
						SendClientMessage(i, col5, string);
					}
				}
				else
				{
					SendClientMessage(i, col1, string);
				}
			}
		}
	}
	return true;
}
forward PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z);
public PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		tempposx = (oldposx -x);
		tempposy = (oldposy -y);
		tempposz = (oldposz -z);
		if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
		{
			return true;
		}
	}
	return false;
}
