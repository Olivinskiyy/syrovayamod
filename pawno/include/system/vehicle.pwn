#if defined _SYSTEM_VEHICLE
	#endinput
#endif
#define _SYSTEM_VEHICLE

// ------------------------------------
#define GetVehicleInfo(%0,%1)		g_vehicle_info[%0][%1]
#define GetVehicleName(%0)			GetVehicleInfo(GetVehicleData(%0, V_MODELID)-400, VI_NAME)

// ------------------------------------
#define GetVehicleData(%0,%1)		g_vehicle_data[%0][%1]
#define SetVehicleData(%0,%1,%2)	g_vehicle_data[%0][%1] = %2
#define ClearVehicleData(%0)		g_vehicle_data[%0] = g_vehicle_default_values
#define IsValidVehicleID(%0)		(1 <= %0 < MAX_VEHICLES)

// ------------------------------------
#define GetVehicleParamEx(%0,%1) g_vehicle_params[%0][%1]

// ------------------------------------
#define VEHICLE_ACTION_TYPE_NONE 	-1
#define VEHICLE_ACTION_ID_NONE 		-1
#define VEHICLE_ACTION_RANK_NONE    -1

// ------------------------------------
#define VEHICLE_PARAM_ON	(1)
#define VEHICLE_PARAM_OFF	(0)

// ------------------------------------
native IsValidVehicle(vehicleid);

// ------------------------------------
enum E_VEHICLE_STRUCT
{
	V_MODELID,
	Float: V_SPAWN_X,
	Float: V_SPAWN_Y,
	Float: V_SPAWN_Z,
	Float: V_SPAWN_ANGLE,
	V_COLOR_1,
	V_COLOR_2,
	V_RESPAWN_DELAY,
	V_ADDSIREN,
	// -------------
	V_ACTION_TYPE,
	V_ACTION_ID,
	V_ACTION_RANK, // Only Family
	// -------------
	V_DRIVER_ID,
	// -------------
	V_LIMIT,
	V_ALARM,
	Float: V_FUEL,
	Float: V_MILEAGE,
	// -------------
	Text3D: V_LABEL,
	// -------------
	Float: V_HEALTH,
	V_LAST_LOAD_TIME,
	V_BAGAGE_AMOUNT_GUN
};

// ------------------------------------
enum E_VEHICLE_PARAMS_STRUCT
{
	V_ENGINE, 	// двигатель
	V_LIGHTS, 	// фары
	V_ALARM,	// сигнализация
	V_LOCK, 	// закрыто ли
	V_BONNET, 	// капот
	V_BOOT, 	// багажник
	V_OBJECTIVE // отображене стрелки над автоqa
};

// ------------------------------------

// ------------------------------------
new g_vehicle_data[MAX_VEHICLES][E_VEHICLE_STRUCT];
new 
	g_vehicle_default_values[E_VEHICLE_STRUCT] = 
{
	0,
	0.0,
	0.0,
	0.0,
	0.0,
	0,
	0,
	0,
	0,
	VEHICLE_ACTION_TYPE_NONE,
	VEHICLE_ACTION_ID_NONE,
	VEHICLE_ACTION_RANK_NONE,
	INVALID_PLAYER_ID,
	false,
	false,
	40.0,
	0.0,
	Text3D:-1,
	1000.0,
	0
};
new g_vehicle_params[MAX_VEHICLES][E_VEHICLE_PARAMS_STRUCT];

enum E_VEHICE_INFO_STRUCT
{
	VI_NAME[21],				// название
	VI_PRICE,					// гос. стоимость
};

new const
	g_vehicle_info[211][E_VEHICE_INFO_STRUCT] = 
{
	{"Landstalker",				170000		},	// 400
	{"Bravura",					50000		},	// 401
	{"Buffalo",					550000		},	// 402
	{"Linerunner", 				0 			},	// 403
	{"Perenniel",				165000		},	// 404
	{"Sentinel",				8000000		},	// 405
	{"Dumper", 					0 			},	// 406
	{"Firetruck", 				0			},	// 407
	{"Trashmaster", 			0			},	// 408
	{"Stretch",					13000000	},	// 409
	{"Manana",					6000000		},	// 410
	{"Infernus",				1300000		},	// 411
	{"Voodoo",					230000		},	// 412
	{"Pony",					0			},	// 413
	{"Mule", 					0			},	// 414
	{"Cheetah",					750000		},	// 415
	{"Ambulance", 				0			},	// 416
	{"Leviathan",				0			},	// 417
	{"Moonbeam", 				640000		},	// 418
	{"Esperanto",				750000		},	// 419
	{"Taxi", 					0			},	// 420
	{"Washington",				220000		},	// 421
	{"Bobcat",					320000		},	// 422
	{"Mr Whoopee", 				0			},	// 423
	{"BF Injection",			10000		},	// 424
	{"Hunter", 					0			},	// 425
	{"Premier",					3800000		},	// 426
	{"Enforcer", 				0			},	// 427
	{"Securicar", 				0			},	// 428
	{"Banshee", 				600000		},	// 429
	{"Predator", 				0			},	// 430
	{"Bus", 					0			},	// 431
	{"Rhino", 					0			},	// 432
	{"Barracks", 				0			},	// 433
	{"Hotknife",				700000		},	// 434
	{"Article Trailer", 		0			},	// 435
	{"Previon",					12300		},	// 436
	{"Coach", 					7000000		},	// 437
	{"Cabbie", 					0			},	// 438
	{"Stallion",				130000		},	// 439
	{"Rumpo", 					600000		},	// 440
	{"RC Bandit", 				0			},	// 441
	{"Romero", 					60000		},	// 442
	{"Packer", 					0			},	// 443
	{"Monster", 				0			},	// 444
	{"Admiral",					230000		},	// 445
	{"Squalo", 					1750000		},	// 446
	{"Seasparrow", 				2300000		},	// 447
	{"Pizzaboy", 				0			},
	{"Tram", 					0			},	// 449
	{"Article Trailer 2", 		0			},	// 450
	{"Turismo",					950000		},	// 451
	{"Speeder", 				1500000		},	// 452
	{"Reefer", 					1500000		},	// 453
	{"Tropic", 					3500000		},	// 454
	{"Flatbed", 				0			},	// 455
	{"Yankee", 					0			},	// 456
	{"Caddy", 					0			},	// 457
	{"Solair",			    	1100000		},	// 458
	{"Berkley's RC", 			650000		},	// 459
	{"Skimmer", 				0			},	// 460
	{"PCJ-600",					105000		},	// 461
	{"Faggio",			    	3000		},	// 462
	{"Freeway",					93500		},	// 463
	{"RC Baron", 				0			},	// 464
	{"RC Raider", 				0			},	// 465
	{"Glendale",				6000000		},	// 466
	{"Oceanic",					115000		},	// 467
	{"Sanchez",					56000		},	// 468
	{"Sparrow", 				2500000		},	// 469
	{"Patriot", 				0			},	// 470
	{"Quad",					35000		},	// 471
	{"Coastguard", 				0			},	// 472
	{"Dinghy",					25000		},	// 473
	{"Hermes",					60000		},	// 474
	{"Sabre",	            	370000		},	// 475
	{"Rustler", 				0			},	// 476
	{"ZR-350",					750000		},	// 477
	{"Walton",					22000		},	// 478
	{"Regina",					450000		},	// 479
	{"Comet",					670000		},	// 480
	{"BMX",		            	6000		},	// 481
	{"Burrito", 				225000		},	// 482
	{"Camper", 					0			},	// 483
	{"Marquis", 				670000		},	// 484
	{"Baggage", 				0			},	// 485
	{"Dozer", 					0			},	// 486
	{"Maverick", 				9100000		},	// 487
	{"SAN News Maverick", 		0			},	// 488
	{"Rancher",					220000		},	// 489
	{"FBI Rancher", 			7300000		},	// 490
	{"Virgo",					970000		},	// 491
	{"Greenwood",				190000		},	// 492
	{"Jetmax", 					7300000		},	// 493
	{"Hotring Racer", 			4300000		},	// 494
	{"Sandking", 				1300000		},	// 495
	{"Blista Compact",			350000		},	// 496
	{"Police Maverick", 		0			},	// 497
	{"Boxville", 				0			},	// 498
	{"Benson", 					0			},	// 499
	{"Mesa",					180000		},	// 500
	{"RC Goblin", 				0			}, // 501
	{"Hotring Racer A", 		13500000	}, // 502
	{"Hotring Racer B", 		1300000		}, // 503
	{"Bloodring Banger", 		0			}, // 504
	{"Rancher",					4800000		},	// 505
	{"Super GT",				12400000	},	// 506
	{"Elegant",					500000		}, 	// 507
	{"Journey",					490000		}, 	// 508
	{"Bike",					5000		}, 	// 509
	{"Mountain Bike",			5000		}, 	// 510
	{"Beagle", 					5000000		}, 	// 511
	{"Cropduster", 				4000000		}, 	// 512
	{"Stuntplane", 				3500000		}, 	// 513
	{"Tanker",					0			}, 	// 514
	{"Roadtrain", 				0			}, 	// 515
	{"Nebula",					900000		}, 	// 516
	{"Majestic",				12400		}, 	// 517
	{"Buccaneer",				23000		}, 	// 518
	{"Shamal", 					7500000		}, 	// 519
	{"Hydra", 					0			}, 	// 520
	{"FCR-900",					110000		}, 	// 521
	{"NRG-500", 				354000		}, 	// 522
	{"HPV1000",					32000		}, 	// 523
	{"Cement Truck", 			0			}, 	// 524
	{"Towtruck", 				0			}, 	// 525
	{"Fortune",					14200		}, 	// 526
	{"Cadrona",					13300		}, 	// 527
	{"FBI Truck", 				0			},	// 528
	{"Willard",					250000		},	// 529
	{"Forklift", 				0			}, 	// 530
	{"Tractor", 				10000000	}, 	// 531
	{"Combine Harvester", 		0			}, 	// 532
	{"Feltzer",					140000		}, 	// 533
	{"Remington",			    187000		}, 	// 534
	{"Slamvan",					210000		}, 	// 535
	{"Blade",					200000		}, 	// 536
	{"Freight (Train)", 		0			}, 	// 537
	{"Brownstreak (Train)", 	0			}, 	// 538
	{"Vortex", 					0			}, 	// 539
	{"Vincent",					780000		}, 	// 540
	{"Bullet",					950000		}, 	// 541
	{"Clover",					10500		}, 	// 542
	{"Sadler", 					16400		}, 	// 543
	{"Firetruck LA", 			0			}, 	// 544
	{"Hustler", 				11500 		}, 	// 545
	{"Intruder",				15400		}, 	// 546
	{"Primo",					13500		}, 	// 547
	{"Cargobob", 				0 			},	// 548
	{"Tampa",					9600		},	// 549
	{"Sunrise",					270000		}, 	// 550
	{"Merit",			    	1300000		}, 	// 551
	{"Utility Van", 			210000		}, 	// 552
	{"Nevada", 					0			}, 	// 553
	{"Yosemite", 				360000		}, 	// 554
	{"Windsor",					25000		}, 	// 555
	{"Monster A", 				0			}, 	// 556
	{"Monster B", 				0			}, 	// 557
	{"Uranus",					4000000		}, 	// 558
	{"Jester",					550000		}, 	// 559
	{"Sultan",					500000		}, 	// 560
	{"Stratum",					210000		},	// 561
	{"Elegy",					450000	    }, 	// 562
	{"Raindance", 				0			}, 	// 563
	{"RC Tiger", 				0			}, 	// 564
	{"Flash",					145000		}, 	// 565
	{"Tahoma",					270000		}, 	// 566
	{"Savanna",					210000		}, 	// 567
	{"Bandito",					50000		},	// 568
	{"Freight Flat Trailer", 	0			}, 	// 569
	{"Streak Trailer", 			0			}, 	// 570
	{"Kart", 					0			}, 	// 571
	{"Mower", 					0			}, 	// 572
	{"Dune", 					18000000	}, 	// 573
	{"Sweeper", 				0			},	// 574
	{"Broadway",				60000		}, 	// 575
	{"Tornado",					50000		}, 	// 576
	{"AT400", 					0			}, 	// 577
	{"DFT-30", 					0			}, 	// 578
	{"Huntley",					340000		},	// 579
	{"Stafford",				2000000		}, 	// 580
	{"BF-400",					1400000		}, 	// 581
	{"Newsvan",					0			}, 	// 582
	{"Tug", 					0			}, 	// 583
	{"Petrol Trailer", 			0			}, 	// 584
	{"Emperor",					1800000		}, 	// 585
	{"Wayfarer",				96000		}, 	// 586
	{"Euros",					420000		}, 	// 587
	{"Hotdog", 					0			}, 	// 588
	{"Club",					300000	    }, 	// 589
	{"Freight Box Trailer", 	0			}, 	// 590
	{"Article Trailer 3", 		0			}, 	// 591
	{"Andromada", 				0			}, 	// 592
	{"Dodo", 					0			}, 	// 593
	{"RC Cam", 					0			}, 	// 594
	{"Launch", 					0			}, 	// 595
	{"Police Car (LSPD)", 		12000000	}, 	// 596
	{"Police Car (SFPD)", 		12000000	}, 	// 597
	{"Police Car (LVPD)", 		12000000	}, 	// 598
	{"Police Ranger", 			0			}, 	// 599
	{"Picador",					50000		}, 	// 600
	{"S.W.A.T.", 				0			}, 	// 601
	{"Alpha",					3400000		}, 	// 602
	{"Phoenix", 				550000		}, 	// 603
	{"Glendale Shit", 			12000000	}, 	// 604
	{"Sadler Shit", 			0			},	// 605
	{"Baggage Trailer A", 		0			},	// 606
	{"Baggage Trailer B", 		0			},	// 607
	{"Tug Stairs Trailer", 		0			},	// 608
	{"Boxville", 				0			},	// 609
	{"Farm Trailer", 			0			}	// 610
};

// ------------------------------------

stock SetVehicleDataAll(vehicleid, modelid, Float:x, Float:y, Float:z, Float:angle, color1, color2, respawn_delay, addsiren=0, action_type, action_id, action_rank = 0)
{
	if(IsValidVehicleID(vehicleid))
	{
		SetVehicleData(vehicleid, V_MODELID, modelid);

		SetVehicleData(vehicleid, V_SPAWN_X, 		x);
		SetVehicleData(vehicleid, V_SPAWN_Y, 		y);
		SetVehicleData(vehicleid, V_SPAWN_Z, 		z);
		SetVehicleData(vehicleid, V_SPAWN_ANGLE, 	angle);

		SetVehicleData(vehicleid, V_COLOR_1, 	color1);
		SetVehicleData(vehicleid, V_COLOR_2, 	color2);

		SetVehicleData(vehicleid, V_RESPAWN_DELAY, 	respawn_delay);
		SetVehicleData(vehicleid, V_ADDSIREN, 		addsiren);

		SetVehicleData(vehicleid, V_ACTION_TYPE, 	action_type);
		SetVehicleData(vehicleid, V_ACTION_ID, 		action_id);
		SetVehicleData(vehicleid, V_ACTION_RANK, 	action_rank); // only family

		SetVehicleData(vehicleid, V_DRIVER_ID, 		INVALID_PLAYER_ID);

		SetVehicleData(vehicleid, V_FUEL, 40.0);
		SetVehicleData(vehicleid, V_MILEAGE, 0.0);
		SetVehicleData(vehicleid, V_LIMIT, true);

		SetVehicleData(vehicleid, V_HEALTH, 1000.0);

		SetVehicleNumberPlate(vehicleid, "TAPE RP");

		SetVehicleParamsEx(vehicleid, IsABike(vehicleid) ? VEHICLE_PARAM_ON : VEHICLE_PARAM_OFF, VEHICLE_PARAM_OFF, VEHICLE_PARAM_OFF, VEHICLE_PARAM_OFF, VEHICLE_PARAM_OFF, VEHICLE_PARAM_OFF, VEHICLE_PARAM_OFF);
	}
}

stock n_veh_AddStaticVehicleEx(modelid, Float:x, Float:y, Float:z, Float:angle, color1, color2, respawn_delay, addsiren=0, action_type=VEHICLE_ACTION_TYPE_NONE, action_id=VEHICLE_ACTION_ID_NONE, action_rank = 0)
{
	static n_veh_vehicleid = INVALID_VEHICLE_ID;

	n_veh_vehicleid = AddStaticVehicleEx(modelid, x, y, z, angle, color1, color2, respawn_delay);
	SetVehicleDataAll(n_veh_vehicleid, modelid, x, y, z, angle, color1, color2, respawn_delay, addsiren, action_type, action_id, action_rank);

	return n_veh_vehicleid;

	// The vehicle ID of the vehicle created (1 - MAX_VEHICLES).
	// INVALID_VEHICLE_ID (65535) if vehicle was not created (vehicle limit reached or invalid vehicle model ID passed).
}
#if defined _ALS_AddStaticVehicleEx
    #undef AddStaticVehicleEx
#else
    #define _ALS_AddStaticVehicleEx
#endif
#define AddStaticVehicleEx n_veh_AddStaticVehicleEx

stock n_veh_AddStaticVehicle(modelid, Float:x, Float:y, Float:z, Float:angle, color1, color2, action_type=VEHICLE_ACTION_TYPE_NONE, action_id=VEHICLE_ACTION_ID_NONE)
{
	static n_veh_vehicleid = INVALID_VEHICLE_ID;

	n_veh_vehicleid = AddStaticVehicle(modelid, x, y, z, angle, color1, color2);
	SetVehicleDataAll(n_veh_vehicleid, modelid, x, y, z, angle, color1, color2, 0, 0, action_type, action_id);

	return n_veh_vehicleid;

	// The vehicle ID of the vehicle created (1 - MAX_VEHICLES).
	// INVALID_VEHICLE_ID (65535) if vehicle was not created (vehicle limit reached or invalid vehicle model ID passed).
}
#if defined _ALS_AddStaticVehicle
    #undef AddStaticVehicle
#else
    #define _ALS_AddStaticVehicle
#endif
#define AddStaticVehicle n_veh_AddStaticVehicle

stock n_veh_CreateVehicle(modelid, Float:x, Float:y, Float:z, Float:angle, color1, color2, respawn_delay, addsiren=0, action_type=VEHICLE_ACTION_TYPE_NONE, action_id=VEHICLE_ACTION_ID_NONE)
{
	static n_veh_vehicleid = INVALID_VEHICLE_ID;

	n_veh_vehicleid = CreateVehicle(modelid, x, y, z, angle, color1, color2, respawn_delay);
	SetVehicleDataAll(n_veh_vehicleid, modelid, x, y, z, angle, color1, color2, respawn_delay, addsiren, action_type, action_id);

	return n_veh_vehicleid;

	// The vehicle ID of the vehicle created (1 - MAX_VEHICLES).
	// INVALID_VEHICLE_ID (65535) if vehicle was not created (vehicle limit reached or invalid vehicle model ID passed).
}
#if defined _ALS_CreateVehicle
    #undef CreateVehicle
#else
    #define _ALS_CreateVehicle
#endif

#define CreateVehicle n_veh_CreateVehicle

stock n_veh_DestroyVehicle(vehicleid)
{
	if(IsValidVehicleID(vehicleid))
	{
		ClearVehicleData(vehicleid);
		DestroyVehicleLabel(vehicleid);
	}
	return DestroyVehicle(vehicleid);
}
#if defined _ALS_DestroyVehicle
    #undef DestroyVehicle
#else
    #define _ALS_DestroyVehicle
#endif
#define DestroyVehicle n_veh_DestroyVehicle

public OnGameModeInit()
{
    for(new idx = 0; idx < MAX_VEHICLES; idx ++)
	{
		ClearVehicleData(idx);
	}

#if defined n_veh_OnGameModeInit
    n_veh_OnGameModeInit();
#endif
    return 1;
}
#if defined _ALS_OnGameModeInit
    #undef OnGameModeInit
#else
    #define _ALS_OnGameModeInit
#endif
#define OnGameModeInit n_veh_OnGameModeInit
#if defined n_veh_OnGameModeInit
forward n_veh_OnGameModeInit();
#endif

// ---------------------------------------------------
stock SetVehicleParamsInit(vehicleid)
{
	GetVehicleParamsEx
	(
		vehicleid,
		g_vehicle_params[vehicleid][V_ENGINE],
		g_vehicle_params[vehicleid][V_LIGHTS],
		g_vehicle_params[vehicleid][V_ALARM],
		g_vehicle_params[vehicleid][V_LOCK],
		g_vehicle_params[vehicleid][V_BONNET],
		g_vehicle_params[vehicleid][V_BOOT],
		g_vehicle_params[vehicleid][V_OBJECTIVE]
	);
}

stock GetVehicleParam(vehicleid, E_VEHICLE_PARAMS_STRUCT:paramid)
{
	SetVehicleParamsInit(vehicleid);
	return g_vehicle_params[vehicleid][paramid];
}

stock SetVehicleParam(vehicleid, E_VEHICLE_PARAMS_STRUCT:paramid, set_value)
{
	SetVehicleParamsInit(vehicleid);
	g_vehicle_params[vehicleid][paramid] = bool: set_value;

	SetVehicleParamsEx
	(
		vehicleid,
		g_vehicle_params[vehicleid][V_ENGINE],
		g_vehicle_params[vehicleid][V_LIGHTS],
		g_vehicle_params[vehicleid][V_ALARM],
		g_vehicle_params[vehicleid][V_LOCK],
		g_vehicle_params[vehicleid][V_BONNET],
		g_vehicle_params[vehicleid][V_BOOT],
		g_vehicle_params[vehicleid][V_OBJECTIVE]
	);
}

stock CreateVehicleLabel(vehicleid, text[], color, Float:x, Float:y, Float:z, Float:drawdistance, testlos = 0, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_3D_TEXT_LABEL_SD)
{
	if(IsValidVehicle(vehicleid))
	{
		SetVehicleData(vehicleid, V_LABEL, CreateDynamic3DTextLabel(text, color, x, y, z, drawdistance, INVALID_PLAYER_ID, vehicleid, testlos, worldid, interiorid, playerid, streamdistance));
	}
	return 1;
}

stock UpdateVehicleLabel(vehicleid, color, text[])
{
	if(IsValidVehicleID(vehicleid))
	{
		if(IsValidDynamic3DTextLabel(GetVehicleData(vehicleid, V_LABEL)))
		{
			UpdateDynamic3DTextLabelText(GetVehicleData(vehicleid, V_LABEL), color, text);
		}
	}
	return 1;
}

stock DestroyVehicleLabel(vehicleid)
{
	if(IsValidVehicleID(vehicleid))
	{
		if(IsValidDynamic3DTextLabel(GetVehicleData(vehicleid, V_LABEL)))
		{
			DestroyDynamic3DTextLabel(GetVehicleData(vehicleid, V_LABEL));
			SetVehicleData(vehicleid, V_LABEL, Text3D: -1);
		}
	}
	return 1;
}

#if defined CreateVehicle
 	#undef CreateVehicle
#endif

#define CreateVehicle n_veh_CreateVehicle