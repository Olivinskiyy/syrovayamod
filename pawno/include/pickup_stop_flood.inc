//Pickup Stop Flood by vasyok28 (supported streamer)

static bool:sf__PlayerPickUp[MAX_PLAYERS char];
static Float:sf__x[MAX_PLAYERS], Float:sf__y[MAX_PLAYERS], Float:sf__z[MAX_PLAYERS];
forward PlayerPick();

#if	!defined	LossPickup
	#define		LossPickup	1.0
#endif

#if	!defined	TimeLossPickup
	#define		TimeLossPickup	1000
#endif

public OnGameModeInit()
{
	SetTimer(!"PlayerPick", TimeLossPickup, true);

	#if	defined	sf__OnGameModeInit
		sf__OnGameModeInit();
	#endif

	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	sf__PlayerPickUp{playerid} = false;

	#if	defined	sf__OnPlayerDisconnect
		sf__OnPlayerDisconnect(playerid, reason);
	#endif
	
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	if(sf__PlayerPickUp{playerid} == true) return 1;
	sf__PlayerPickUp{playerid} = true;
	GetPlayerPos(playerid, sf__x[playerid], sf__y[playerid], sf__z[playerid]);
	
	#if	defined	OnPlayerPickUpPickup
		sf__OnPlayerStateChange(playerid, pickupid);
	#endif
	return 1;
}

#if	!defined	OnPlayerPickUpDynamicPickup
public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
	if(sf__PlayerPickUp{playerid} == true) return 1;
	sf__PlayerPickUp{playerid} = true;
	GetPlayerPos(playerid, sf__x[playerid], sf__y[playerid], sf__z[playerid]);
	
	#if	defined	OnPlayerPickUpDynamicPickup
		sf__OnPlayerPickUpDynamicPickup(playerid, pickupid);
	#endif
	return 1;
}
#endif

public PlayerPick()
{
	for(new i, p = GetPlayerPoolSize()+1, Float:sf__p_x, Float:sf__p_y, Float:sf__p_z; i < p; i++)
	{
		if(!IsPlayerConnected(i) || sf__PlayerPickUp{i} == false) continue;
		GetPlayerPos(i, sf__p_x, sf__p_y, sf__p_z);

		if(VectorSize(sf__x[i] - sf__p_x, sf__y[i] - sf__p_y, 0.0) > LossPickup)
		{
			sf__PlayerPickUp{i} = false;
		}
		
	}
	return 1;
}


#if	defined	S_OnPlayerPickUpDynamicPickup
	#undef	OnPlayerPickUpDynamicPickup
#else
	#define	S_OnPlayerPickUpDynamicPickup
#endif

#define	OnPlayerPickUpDynamicPickup	sf__OnPlayerPickUpDynamicPickup
#if	defined	sf__OnPlayerPickUpDynamicPickup
forward sf__OnPlayerPickUpDynamicPickup();
#endif


#if	defined	_ALS_OnGameModeInit
	#undef	OnGameModeInit
#else
	#define	_ALS_OnGameModeInit
#endif

#define	OnGameModeInit	sf__OnGameModeInit
#if	defined	sf__OnGameModeInit
forward sf__OnGameModeInit();
#endif


#if	defined	_ALS_OnPlayerDisconnect
	#undef	OnPlayerDisconnect
#else
	#define	_ALS_OnPlayerDisconnect
#endif

#define	OnPlayerDisconnect	sf__OnPlayerDisconnect
#if	defined	sf__OnPlayerDisconnect
forward sf__OnPlayerDisconnect(playerid, reason);
#endif


#if	defined	_ALS_OnPlayerPickUpPickup
	#undef	OnPlayerPickUpPickup
#else
	#define	_ALS_OnPlayerPickUpPickup
#endif

#define	OnPlayerPickUpPickup	sf__OnPlayerStateChange
#if	defined	sf__OnPlayerStateChange
forward sf__OnPlayerStateChange(playerid, pickupid);
#endif
