local name, addonTable = ...
local L = LibStub("AceLocale-3.0"):GetLocale("HandyNotes_FlightMasters (Classic)")

nodes = addonTable['nodes']

nodes[1413] = {
	[44405900] = {
		name = L["Camp Taurajo, The Barrens"],
		npcName = L["Omusa Thunderhorn"],
		faction = "Horde",
	},
	[51503030] = {
		name = L["Crossroads, The Barrens"],
		npcName = L["Devrak"],
		faction = "Horde",
	},
	[63003700] = {
		name = L["Ratchet, The Barrens"],
		npcName = L["Bragok"],
		faction = "Neutral",
	},
}
nodes[1417] = { -- Arathi Highlands
	[45804620] = {
		name = L["Refuge Pointe, Arathi"],
		npcName = L["Cedrik Prose"],
		faction = "Alliance",
	},
	[73003260] = {
		name = L["Hammerfall, Arathi"],
		npcName = L["Urda"],
		faction = "Horde",
	},
}
nodes[1418] = {
	[04404500] = {
		name = L["Kargath, Badlands"],
		npcName = L["Gorrik"],
		faction = "Horde",
	},
}
nodes[1419] = {
	[65602440] = {
		name = L["Nethergarde Keep, Blasted Lands"],
		npcName = L["Alexandra Constantine"],
		faction = "Alliance",
	},
}
nodes[1421] = { -- Silverpine Forest
	[45604240] = {
		name = L["The Sepulcher, Silverpine Forest"],
		npcName = L["Karos Razok"],
		faction = "Horde",
	},
}
nodes[1422] = { -- Western Plaguelands
	[43008520] = {
		name = L["Chillwind Camp, Western Plaguelands"],
		npcName = L["Bibilfaz Featherwhistle"],
		faction = "Alliance",
	},
}
nodes[1423] = { -- Eastern Plaguelands
	[80205750] = {
		name = L["Light's Hope Chapel, Eastern Plaguelands"],
		npcName = L["Georgia"],
		faction = "Horde",
	},
	[81605920] = {
		name = L["Light's Hope Chapel, Eastern Plaguelands"],
		npcName = L["Khaelyn Steelwing"],
		faction = "Alliance",
	},
}
nodes[1424] = { -- Hillsbrad Foothills
	[49405240] = {
		name = L["Southshore, Hillsbrad"],
		npcName = L["Darla Harris"],
		faction = "Alliance",
	},
	[60201860] = {
		name = L["Tarren Mill, Hillsbrad"],
		npcName = L["Zarise"],
		faction = "Horde",
	},
}
nodes[1425] = {
	[11004600] = {
		name = L["Aerie Peak, The Hinterlands"],
		npcName = L["Guthrum Thunderfist"],
		faction = "Alliance",
	},
	[81608180] = {
		name = L["Revantusk Village, The Hinterlands"],
		npcName = L["Gorkas"],
		faction = "Horde",
	},
}
nodes[1427] = {
	[34803080] = {
		name = L["Thorium Point, Searing Gorge"],
		npcName = L["Grisha"],
		faction = "Horde",
	},
	[37803060] = {
		name = L["Thorium Point, Searing Gorge"],
		npcName = L["Lanie Reed"],
		faction = "Alliance",
	},
}
nodes[1428] = {
	[65602420] = {
		name = L["Flame Crest, Burning Steppes"],
		npcName = L["Vahgruk"],
		faction = "Horde",
	},
	[84406820] = {
		name = L["Morgan's Vigil, Burning Steppes"],
		npcName = L["Borgus Stoutarm"],
		faction = "Alliance",
	},
}
nodes[1431] = {
	[77604440] = {
		name = L["Darkshire, Duskwood"],
		npcName = L["Felicia Maline"],
		faction = "Alliance",
	},
}
nodes[1432] = {
	[33805080] = {
		name = L["Thelsamar, Loch Modan"],
		npcName = L["Thorgrum Borrelson"],
		faction = "Alliance",
	},
}
nodes[1433] = {
	[30605920] = {
		name = L["Lakeshire, Redridge"],
		npcName = L["Ariena Stormfeather"],
		faction = "Alliance",
	},
}
nodes[1434] = { -- Stranglethorn
	[32402920] = {
		npcName = L["Thysta"],
		name = L["Grom'gol, Stranglethorn"],
		faction = "Horde",
	},
	[26807700] = {
		npcName = L["Gringer"],
		name = L["Booty Bay, Stranglethorn"],
		faction = "Horde",
	},
	[27407780] = {
		npcName = L["Gyll"],
		name = L["Booty Bay, Stranglethorn"],
		faction = "Alliance",
	},
	[38200400] = {
		npcName = L["Nizzle"],
		name = L["Rebel Camp, Stranglethorn Vale"],
		faction = "Alliance",
	},
}
nodes[1435] = {
	[46005460] = {
		name = L["Stonard, Swamp of Sorrows"],
		npcName = L["Breyk"],
		faction = "Horde",
	},
}
nodes[1436] = {
	[56405260] = {
		name = L["Sentinel Hill, Westfall"],
		npcName = L["Thor"],
		faction = "Alliance",
	},
}
nodes[1437] = { -- Wetlands
	[09605960] = {
		name = L["Menethil Harbor, Wetlands"],
		npcName = L["Shellei Brondir"],
		faction = "Alliance",
	},
}
nodes[1438] = {
	[58409400] = {
		name = L["Rut'theran Village, Teldrassil"],
		npcName = L["Vesprystus"],
		faction = "Alliance",
	},
}
nodes[1439] = {
	[36404560] = {
		name = L["Auberdine, Darkshore"],
		npcName = L["Caylais Moonfeather"],
		faction = "Alliance"
	},
}
nodes[1440] = {
	[12203380] = {
		name = L["Zoram'gar Outpost, Ashenvale"],
		npcName = L["Andruk"],
		faction = "Horde",
	},
	[34404800] = {
		name = L["Astranaar, Ashenvale"],
		npcName = L["Daelyshia"],
		faction = "Alliance",
	},
	[73206160] = {
		name = L["Splintertree Post, Ashenvale"],
		npcName = L["Vhulgra"],
		faction = "Horde",
	},
	[85004340] = {
		npcName = L["Suralais Farwind"],
		name = L["Forest Song, Ashenvale"],
		faction = "Alliance",
	},
}
nodes[1441] = {
	[45004920] = {
		name = L["Freewind Post, Thousand Needles"],
		npcName = L["Nyse"],
		faction = "Horde",
	},
}
nodes[1442] = {
	[36400720] = {
		name = L["Stonetalon Peak, Stonetalon Mountains"],
		npcName = L["Teloren"],
		faction = "Alliance",
	},
	[45205980] = {
		name = L["Sun Rock Retreat, Stonetalon Mountains"],
		npcName = L["Tharm"],
		faction = "Horde",
	},
}
nodes[1443] = {
	[21607400] = {
		name = L["Shadowprey Village, Desolace"],
		npcName = L["Thalon"],
		faction = "Horde",
	},
	[64601040] = {
		name = L["Nijel's Point, Desolace"],
		npcName = L["Baritanas Skyriver"],
		faction = "Alliance",
	},
}
nodes[1444] = {
	[30204320] = {
		name = L["Feathermoon, Feralas"],
		npcName = L["Fyldren Moonfeather"],
		faction = "Alliance",
	},
	[75404420] = {
		name = L["Camp Mojache, Feralas"],
		npcName = L["Shyn"],
		faction = "Horde",
	},
	[89404580] = {
		name = L["Thalanaar, Feralas"],
		npcName = L["Thyssiana"],
		faction = "Alliance",
	},
}
nodes[1445] = {
	[67405120] = {
		npcName = L["Baldruc"],
		name = L["Theramore, Dustwallow Marsh"],
		faction = "Alliance",
	},
	[35603180] = {
		npcName = L["Shardi"],
		name = L["Brackenwall Village, Dustwallow Marsh"],
		faction = "Horde",
	},
	[42807240] = {
		npcName = L["Dyslix Silvergrub"],
		name = L["Mudsprocket, Dustwallow Marsh"],
		faction = "Neutral",
	},
}
nodes[1446] = {
	[51002920] = {
		name = L["Gadgetzan, Tanaris"],
		npcName = L["Bera Stonehammer"],
		faction = "Alliance",
	},
	[51602560] = {
		name = L["Gadgetzan, Tanaris"],
		npcName = L["Bulkrek Ragefist"],
		faction = "Horde",
	},
}
nodes[1447] = {
	[11807740] = {
		name = L["Talrendis Point, Azshara"],
		npcName = L["Jarrodenus"],
		faction = "Alliance",
	},
	[22004960] = {
		name = L["Valormok, Azshara"],
		npcName = L["Kroum"],
		faction = "Horde",
	},
}
nodes[1448] = {
	[34405380] = {
		npcName = L["Brakkar"],
		name = L["Bloodvenom Post, Felwood"],
		faction = "Horde",
	},
	[62402420] = {
		npcName = L["Mishellena"],
		name = L["Talonbranch Glade, Felwood"],
		faction = "Alliance",
	},
	[51408220] = {
		npcName = L["Gorrim"],
		name = L["Emerald Sanctuary, Felwood"],
		faction = "Neutral",
	},
}
nodes[1449] = {
	[45200580] = {
		name = L["Marshal's Refuge, Un'Goro Crater"],
		npcName = L["Gryfe"],
		faction = "Neutral",
	},
}
nodes[1450] = {
	[32206640] = {
		name = L["Moonglade"],
		npcName = L["Faustron"],
		faction = "Horde",
	},
	[44204520] = {
		name = L["Darnassus Flight Master"],
		npcName = L["Silva Fil'naveth"],
		faction = "Alliance",
		classes = { DRUID = true },
	},
	[44404540] = {
		name = L["Thunder Bluff Flight Master"],
		npcName = L["Bunthen Plainswind"],
		faction = "Horde",
		classes = { DRUID = true },
	},
	[48006700] = {
		name = L["Moonglade"],
		npcName = L["Sindrayl"],
		faction = "Alliance",
	},
}
nodes[1451] = {
	[48803660] = {
		name = L["Cenarion Hold, Silithus"],
		npcName = L["Runk Windtamer"],
		faction = "Horde",
	},
	[50603440] = {
		name = L["Cenarion Hold, Silithus"],
		npcName = L["Cloud Skydancer"],
		faction = "Alliance",
	},
}
nodes[1452] = {
	[60403620] = {
		name = L["Everlook, Winterspring"],
		npcName = L["Yugrek"],
		faction = "Horde",
	},
	[62203660] = {
		name = L["Everlook, Winterspring"],
		npcName = L["Maethrya"],
		faction = "Alliance",
	},
}
nodes[1453] = {
	[66206240] = {
		name = L["Stormwind, Elwynn"],
		npcName = L["Dungar Longdrink"],
		faction = "Alliance",
	},
}
nodes[1454] = { -- Orgrimmar
	[45206380] = {
		name = L["Orgrimmar, Durotar"],
		npcName = L["Doras"],
		faction = "Horde",
	},
}
nodes[1455] = { -- Ironforge
	[55604820] = {
		name = L["Ironforge, Dun Morogh"],
		npcName = L["Gryth Thurden"],
		faction = "Alliance",
	},
}
nodes[1456] = {
	[46805000] = {
		name = L["Thunder Bluff, Mulgore"],
		npcName = L["Tal"],
		faction = "Horde",
	},
}
nodes[1458] = { -- Undercity
	[63404860] = {
		name = L["Undercity, Tirisfal"],
		npcName = L["Michael Garrett"],
		faction = "Horde",
	},
}