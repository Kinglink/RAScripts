// Due to issues with RA script and new RA integration, these scripts are out of date. 

// Metroid Prime 2: Echoes
// #ID = 7683

// Take the number of player locations for EU and US, and calculate an offset we can use. 
US_OFFSET = 0x3DDDF8 - 0x3DCBD8
POINTER_OFFSET_FIX = 0x80000000
// $000000: US Version 0x47324d4530310000
//          EU Version 0x47324d5030310000
function versionNumbers() => dword_be(0x000000)

function isUSVersion() => versionNumbers() == 0x47324d45
function isEUVersion() => versionNumbers() == 0x47324d50


// $3B32B0: [EU] Pointer to Samus HUD [32-Bit BE]
//          +0x32c=HUD Samus Health [Float BE]
//          +0x330=HUD Energy Tanks Display [32-Bit BE]
//          +0x334=HUD Current Missiles Display [32-Bit]
//          +0x338=HUD Max Missiles Display
//          +0x6b0=Pointer To Boss Energy Interface [32-Bit BE]
//          ..|+0x08=HUD Boss Current Health [Float BE]
//          ..|+0x0c=HUD Boss Max Health [Float BE]
SAMUS_HUD_MEMORY_LOCATION_EU = 0x3B32B0
// US has a different location, not based on the US_OFFSET
SAMUS_HUD_MEMORY_LOCATION_US = 0x003b1f30
function pointerToSamusHudEU() => dword_be(SAMUS_HUD_MEMORY_LOCATION_EU)
function pointerToSamusHudUS() => dword_be(SAMUS_HUD_MEMORY_LOCATION_US)

BOSS_HEALTH_OFFSET = 0x6b0 + POINTER_OFFSET_FIX
BOSS_HEALTH_SECOND_OFFSET = 0x08 + POINTER_OFFSET_FIX

function bossHealthPointerUS() => dword_be(pointerToSamusHudUS() + BOSS_HEALTH_OFFSET) 
function bossHealthPointerEU() => dword_be(pointerToSamusHudEU() + BOSS_HEALTH_OFFSET)
function bossHealthUS() => float_be(bossHealthPointerUS() + BOSS_HEALTH_SECOND_OFFSET)
function bossHealthEU() => float_be(bossHealthPointerEU() + BOSS_HEALTH_SECOND_OFFSET)
// Visor change check.  
function bossHealthVisorCheckUS() => bossHealthPointerUS() == prev(bossHealthPointerUS())
function bossHealthVisorCheckEU() => bossHealthPointerEU() == prev(bossHealthPointerEU())

// $3c6dc0: [EU][32-BIT BE]  Main Menu/loading detection
//          
//          0x07 = Main Menu, loading. 
//          0x06 = Main gameplay.
//          Appears to cycle between 0x04-0x06 as it enters into game. 
//          Changing to 7 in game causes Memory read issues.
MAIN_MENU_MEMORY_LOCATION_EU = 0x3c6dc0
GAMEPLAY_VALUE = 0x06
function mainMenuDetectionEU() => dword_be(MAIN_MENU_MEMORY_LOCATION_EU)
function mainMenuDetectionUS() => dword_be(MAIN_MENU_MEMORY_LOCATION_EU - US_OFFSET)

// $3C6EBC: [EU] Candidate Game State Pointer [32-Bit BE] (Other is 0x41a19c)
//          +0x04=Current World ID [32-Bit BE]
//          --1baa96c2 - Sanctuary Fortress / Ing Hive
//          --3bfa3eff - Temple Grounds / Sky Temple Grounds
//          --3dfd2249 - Torvus Bog / Dark Torvus Bog
//          --42b935e4 - Agon Wastes / Dark Agon Wastes
//          --863fcd72 - Great Temple / Sky Temple
//          --7b6eaa68 - Front End (aka Main Menu and Such)
//          --A50A80CC - [Multiplayer] Sidehopper Station
//          --AE171602 - [Multiplayer] Spires
//          --e3b0c703 - [Multiplayer] Crossfire Chaos
//          --233e42be - [Multiplayer] Pipeline
//          --406Add7f - [Multiplayer] Spider Complex
//          --7e19ed26 - [Multiplayer] Shooting Gallery
//          +0x14=Pointer to World States [32-Bit BE]
//          ..|+0x000=World States - Sanctuary Fortress/Ing Hive - Asset ID [32-Bit BE]
//          ..|+0x004=World States - Sanctuary Fortress/Ing Hive - Current Room ID [32-Bit BE]
//          ..|+0x008=World States - Sanctuary Fortress/Ing Hive - Pointer to Relay Tracker [32-Bit BE]
//          ..|+0x00C=World States - Sanctuary Fortress/Ing Hive - Pointer to Map Info [32-Bit BE]
//          ..|+0x024=World States - (MP) Pipeline - Asset ID [32-Bit BE]
//          ..|+0x028=World States - (MP) Pipeline - Current Room ID [32-Bit BE]
//          ..|+0x02C=World States - (MP) Pipeline - Pointer to Relay Tracker [32-Bit BE]
//          ..|+0x030=World States - (MP) Pipeline - Pointer to Map Info [32-Bit BE]
//          ..|+0x048=World States - [Sky] Temple Grounds - Asset ID [32-Bit BE]
//          ..|+0x04C=World States - [Sky] Temple Grounds - Current Room ID [32-Bit BE]
//          ..|+0x050=World States - [Sky] Temple Grounds - Pointer to Relay Tracker [32-Bit BE]
//          ..|+0x054=World States - [Sky] Temple Grounds - Pointer to Map Info [32-Bit BE]
//          ..|+0x06C=World States - [Dark] Torvus Bog] - Asset ID [32-Bit BE]
//          ..|+0x070=World States - [Dark] Torvus Bog] - Current Room ID [32-Bit BE]
//          ..|+0x074=World States - [Dark] Torvus Bog] - Pointer to Relay Tracker [32-Bit BE]
//          ..|+0x078=World States - [Dark] Torvus Bog] - Pointer to Map Info [32-Bit BE]
//          ..|+0x090=World States - (MP) Spider Complex - Asset ID [32-Bit BE]
//          ..|+0x094=World States - (MP) Spider Complex - Current Room ID [32-Bit BE]
//          ..|+0x098=World States - (MP) Spider Complex - Pointer to Relay Tracker [32-Bit BE]
//          ..|+0x09C=World States - (MP) Spider Complex - Pointer to Map Info [32-Bit BE]
//          ..|+0x0B4=World States - [Dark] Agon Wastes - Asset ID [32-Bit BE]
//          ..|+0x0B8=World States - [Dark] Agon Wastes - Current Room ID [32-Bit BE]
//          ..|+0x0BC=World States - [Dark] Agon Wastes - Pointer to Relay Tracker [32-Bit BE]
//          ..|+0x0C0=World States - [Dark] Agon Wastes - Pointer to Map Info [32-Bit BE]
//          ..|+0x0D8=World States - Front End (Main Menu) - Asset ID [32-Bit BE]
//          ..|+0x0DC=World States - Front End (Main Menu) - Current Room ID [32-Bit BE]
//          ..|+0x0E0=World States - Front End (Main Menu) - Pointer to Relay Tracker [32-Bit BE]
//          ..|+0x0E4=World States - Front End (Main Menu) - Pointer to Map Info [32-Bit BE]
//          ..|+0x0FC=World States - (MP) shooting Complex) - Asset ID [32-Bit BE]
//          ..|+0x100=World States - (MP) shooting Complex) - Current Room ID [32-Bit BE]
//          ..|+0x104=World States - (MP) shooting Complex) - Pointer to Relay Tracker [32-Bit BE]
//          ..|+0x108=World States - (MP) shooting Complex) - Pointer to Map Info [32-Bit BE]
//          ..|+0x120=World States - [Great|Sky] Temple - Asset ID [32-Bit BE]
//          ..|+0x124=World States - [Great|Sky] Temple - Current Room ID [32-Bit BE]
//          ..|+0x128=World States - [Great|Sky] Temple - Pointer to Relay Tracker [32-Bit BE]
//          ..|+0x12C=World States - [Great|Sky] Temple - Pointer to Map Info [32-Bit BE]
//          ..|+0x144=World States - (MP) Sidehopper Station - Asset ID [32-Bit BE]
//          ..|+0x148=World States - (MP) Sidehopper Station - Current Room ID [32-Bit BE]
//          ..|+0x14C=World States - (MP) Sidehopper Station - Pointer to Relay Tracker [32-Bit BE]
//          ..|+0x150=World States - (MP) Sidehopper Station - Pointer to Map Info [32-Bit BE]
//          ..|+0x168=World States - (MP) Spires - Asset ID [32-Bit BE]
//          ..|+0x16C=World States - (MP) Spires - Current Room ID [32-Bit BE]
//          ..|+0x170=World States - (MP) Spires - Pointer to Relay Tracker [32-Bit BE]
//          ..|+0x174=World States - (MP) Spires - Pointer to Map Info [32-Bit BE]
//          ..|+0x18C=World States - (MP) Crossfire Chaos - Asset ID [32-Bit BE]
//          ..|+0x190=World States - (MP) Crossfire Chaos - Current Room ID [32-Bit BE]
//          ..|+0x194=World States - (MP) Crossfire Chaos - Pointer to Relay Tracker [32-Bit BE]
//          ..|+0x198=World States - (MP) Crossfire Chaos - Pointer to Map Info [32-Bit BE]
//          +0x80=Sound Mode [32-Bit BE] (0x00=Mono, 0x01=Stereo, 0x02=Surround)
//          +0x84=Brightness [32-Bit BE]
//          +0x88=Screen X Offset [32-Bit BE]
//          +0x8c=Screen Y Offset [32-Bit BE]
//          +0x90=Screen Stretch [32-Bit BE]
//          +0x94=SFX Volume [32-Bit BE]
//          +0x98=Music Volume [32-Bit BE]
//          +0x9c=HUD Opacity [32-Bit BE] (0x00-0xff)
//          +0xa0=Helmet Opacity [32-Bit BE] (0x00-0xff)
//          +0xa4=Options
//          --Bit7=Hud Lag On
//          --Bit6=Invert Y-Axis
//          --Bit5=Rumble On
//          --Bit4=Swap Beam Controls (No exposed in options menu!)
//          --Bit3=Hint System On
GAME_STATE_MEMORY_LOCATION = 0x3C6EBC
function pointerToGameStateEU() => dword_be(GAME_STATE_MEMORY_LOCATION)
function pointerToGameStateUS() => dword_be(GAME_STATE_MEMORY_LOCATION - US_OFFSET)
 
 WORLD_ID_OFFSET = 0x04 + POINTER_OFFSET_FIX
function worldIDUS() => dword_be(pointerToGameStateUS() + WORLD_ID_OFFSET)
function worldIDEU() => dword_be(pointerToGameStateEU() + WORLD_ID_OFFSET)

// Yes these are duplicated, one for dark world, one for light. 
SANCTUARY_FORTRESS = 0x1baa96c2
ING_HIVE = 0x1baa96c2
TEMPLE_GROUNDS = 0x3bfa3eff
SKY_TEMPLE_GROUNDS = 0x3bfa3eff
TORVUS_BOG = 0x3dfd2249
DARK_TORVUS_BOG = 0x3dfd2249
AGON_WASTES = 0x42b935e4
DARK_AGON_WASTES = 0x42b935e4
GREAT_TEMPLE = 0x863fcd72
SKY_TEMPLE = 0x863fcd72
//         


// $3DCBD8: [US](32-bit BE) Number of Players
function numberOfPlayersUS() => dword_be(0x3DCBD8)

// $3DCBEC: [US] (32-bit BE) Pointer to Main Character (Player State)
//          
//          Possible other choices is 0x003dd5c,  0x0042b32c
//          +0x14=(Float BE) Player Health
//          +0x134=(32-bit BE) Morph Ball Bomb Control
//          
//          0x00 = No Bomb (No dropping)
//          0x01 = Bombs enabled
//          +0x138= (32-bit BE) Morph Ball Bomb Display
//          
//          0x00 = No Bomb (No dropping)
//          0x01 = Bombs Displayed
//          +0x17c=(32-bit BE) Jump Boots Control
//          
//          0x00 = No Jump Boots (No Double Jumping)
//          0x01 = Jump Boots Enabled (Double Jump
//          +0x180=(32-bit BE) Jump Boots Display
//          
//          0x00 = No Jump Boots Owned
//          0x01 = Jump Boots Owned (Seen on menu)
//          +0x1dc = (32-bit BE)Dark Temple Key Owned
//          
//          Expected to be a control, currently untested
//          0x00 = No Dark Temple Key
//          0x01 =  Dark Temple Key Owned (Seen on menu)
//          +0x1e0 = (32-bit BE)Dark Temple Key Visibile
//          
//          0x00 = No Dark Temple Key Seen
//          0x01 =  Dark Temple Key Owned (Seen on menu)
//          +0x258=(32-bit BE)Energy Containers
//          +0x26C=(32-bit BE)Missile Count
//          +0x270=(32-bitBE)Max Missile Count
function pointToMainCharacterUS() => dword_be(0x3DCBEC)

// $3DDDF8: [EU](32-bit BE) Number of Players
function numberOfPlayersEU() => dword_be(0x3DDDF8)

// $3DDDFC: (32-bit BE) Pointer to player objects
function pointToMainCharacterObjectsEU() => dword_be(0x3DDDFC)

// $3DDE0D: [EU] (24-bit BE) Pointer to Main Character (Player State)
//          
//          Possible other choices is 0x003dd5c,  0x0042b32c
//          +0x14=(Float BE) Player Health
//          +0x134=(32-bit BE) Morph Ball Bomb Control
//          
//          0x00 = No Bomb (No dropping)
//          0x01 = Bombs enabled
//          +0x138= (32-bit BE) Morph Ball Bomb Display
//          
//          0x00 = No Bomb (No dropping)
//          0x01 = Bombs Displayed
//          +0x17c=(32-bit BE) Jump Boots Control
//          
//          0x00 = No Jump Boots (No Double Jumping)
//          0x01 = Jump Boots Enabled (Double Jump
//          +0x180=(32-bit BE) Jump Boots Display
//          
//          0x00 = No Jump Boots Owned
//          0x01 = Jump Boots Owned (Seen on menu)
//          +0x1dc = (32-bit BE)Dark Temple Key Owned
//          
//          Expected to be a control, currently untested
//          0x00 = No Dark Temple Key
//          0x01 =  Dark Temple Key Owned (Seen on menu)
//          +0x1e0 = (32-bit BE)Dark Temple Key Visibile
//          
//          0x00 = No Dark Temple Key Seen
//          0x01 =  Dark Temple Key Owned (Seen on menu)
//          +0x258=(32-bit BE)Energy Containers
//          +0x26C=(32-bit BE)Missile Count
//          +0x270=(32-bitBE)Max Missile Count
function pointToMainCharacterEU() => dword_be(0x3DDE0D)

// $3DDF04: (32-bit BE) M_world pointer.
function mWorldPointerEU() => dword_be(0x3DDF04)

// $3DDF5C: [EU] Pointer to Player State [32-Bit BE] (Matches $0x003dde0c if 1 Player game)
//          +0x00=Player Index (0 for P1) [32-Bit BE]
//          +0x04=Bit7: Is Alive
//          +0x0c=Current Beam [32-Bit BE] (0x00=Power, 0x01=Dark, 0x02=Light, 0x03=Annihilator)
//          +0x010=Player Health [Float BE]
//          +0x014=Player Health [Float BE] (Yes, it's there twice in Health Info)
//          +0x018=Knockback Resistance [Float BE]
//          +0x030=Current Visor [32-Bit BE] (0x00=Combat, 0x01=Echo, 0x02=Scan, 0x03=Dark)
//          +0x034=Transitioning Visor [32-Bit BE]
//          +0x054=Current Suit [32-Bit BE] (0x00=Varia, 0x01=Dark, 0x01=Light
//          +0x058=Size of Power-Ups Vector (0x6d) [32-Bit BE]
//          +0x05c=Power Beam - Current Count [32-Bit BE] (For items that are have/don't have, this will match Capacity which is 0 or 1. Capacity is what truly controls if you have or don't have it.)
//          +0x060=Power Beam - Capacity [32-Bit BE] (0x00=Don't Have, 0x01=Have)
//          +0x064=Power Beam - Duration [Float BE] (Only Meaningful for Multi-Player Powerups)
//          +0x68=Dark Beam - Current Count [32-Bit BE]
//          +0x6C=Dark Beam - Capacity [32-Bit BE]
//          +0x74=Light Beam - Current Count [32-Bit BE]
//          +0x78=Light Beam - Capacity [32-Bit BE]
//          +0x80=Annihilator Beam - Current Count [32-Bit BE]
//          +0x84=Annihilator Beam - Capacity [32-Bit BE]
//          +0x8C=Super Missile - Current Count [32-Bit BE]
//          +0x90=Super Missile - Capacity [32-Bit BE]
//          +0x98=Darkburst - Current Count [32-Bit BE]
//          +0x9C=Darkburst - Capacity [32-Bit BE]
//          +0xA4=Sunburst - Current Count [32-Bit BE]
//          +0xA8=Sunburst - Capacity [32-Bit BE]
//          +0xB0=Sonic Boom - Current Count [32-Bit BE]
//          +0xB4=Sonic Boom - Capacity [32-Bit BE]
//          +0xBC=Combat Visor - Current Count [32-Bit BE]
//          +0xC0=Combat Visor - Capacity [32-Bit BE]
//          +0xC8=Scan Visor - Current Count [32-Bit BE]
//          +0xCC=Scan Visor - Capacity [32-Bit BE]
//          +0xD4=Dark Visor - Current Count [32-Bit BE]
//          +0xD8=Dark Visor - Capacity [32-Bit BE]
//          +0xE0=Echo Visor - Current Count [32-Bit BE]
//          +0xE4=Echo Visor - Capacity [32-Bit BE]
//          +0xEC=Varia Suit - Current Count [32-Bit BE]
//          +0xF0=Varia Suit - Capacity [32-Bit BE]
//          +0xF8=Dark Suit - Current Count [32-Bit BE]
//          +0xFC=Dark Suit - Capacity [32-Bit BE]
//          +0x104=Light Suit - Current Count [32-Bit BE]
//          +0x108=Light Suit - Capacity [32-Bit BE]
//          +0x110=Morph Ball - Current Count [32-Bit BE]
//          +0x114=Morph Ball - Capacity [32-Bit BE]
//          +0x11C=Boost Ball - Current Count [32-Bit BE]
//          +0x120=Boost Ball - Capacity [32-Bit BE]
//          +0x128=Spider Ball - Current Count [32-Bit BE]
//          +0x12C=Spider Ball - Capacity [32-Bit BE]
//          +0x134=Morph Ball Bombs - Current Count [32-Bit BE]
//          +0x138=Morph Ball Bombs - Capacity [32-Bit BE]
//          +0x164=Charge Beam - Current Count [32-Bit BE]
//          +0x168=Charge Beam - Capacity [32-Bit BE]
//          +0x170=Grapple Beam - Current Count [32-Bit BE]
//          +0x174=Grapple Beam - Capacity [32-Bit BE]
//          +0x17C=Space Jump Boots - Current Count [32-Bit BE]
//          +0x180=Space Jump Boots - Capacity [32-Bit BE]
//          +0x188=Gravity Boost - Current Count [32-Bit BE]
//          +0x18C=Gravity Boost - Capacity [32-Bit BE]
//          +0x194=Seeker Launcher - Current Count [32-Bit BE]
//          +0x198=Seeker Launcher - Capacity [32-Bit BE]
//          +0x1A0=Screw Attack - Current Count [32-Bit BE]
//          +0x1A4=Screw Attack - Capacity [32-Bit BE]
//          +0x1B8=Temple Key 1 - Current Count [32-Bit BE]
//          +0x1BC=Temple Key 1 - Capacity [32-Bit BE]
//          +0x1C4=Temple Key 2 - Current Count [32-Bit BE]
//          +0x1C8=Temple Key 2 - Capacity [32-Bit BE]
//          +0x1D0=Temple Key 3 - Current Count [32-Bit BE]
//          +0x1D4=Temple Key 3 - Capacity [32-Bit BE]
//          +0x1DC=Agon Key 1 - Current Count [32-Bit BE]
//          +0x1E0=Agon Key 1 - Capacity [32-Bit BE]
//          +0x1E8=Agon Key 2 - Current Count [32-Bit BE]
//          +0x1EC=Agon Key 2 - Capacity [32-Bit BE]
//          +0x1F4=Agon Key 3 - Current Count [32-Bit BE]
//          +0x1F8=Agon Key 3 - Capacity [32-Bit BE]
//          +0x200=Torvus Key 1 - Current Count [32-Bit BE]
//          +0x204=Torvus Key 1 - Capacity [32-Bit BE]
//          +0x20C=Torvus Key 2 - Current Count [32-Bit BE]
//          +0x210=Torvus Key 2 - Capacity [32-Bit BE]
//          +0x218=Torvus Key 3 - Current Count [32-Bit BE]
//          +0x21C=Torvus Key 3 - Capacity [32-Bit BE]
//          +0x224=Hive Key 1 - Current Count [32-Bit BE]
//          +0x228=Hive Key 1 - Capacity [32-Bit BE]
//          +0x230=Hive Key 2 - Current Count [32-Bit BE]
//          +0x234=Hive Key 2 - Capacity [32-Bit BE]
//          +0x23C=Hive Key 3 - Current Count [32-Bit BE]
//          +0x240=Hive Key 3 - Capacity [32-Bit BE]
//          +0x254=Energy Tanks - Current Count [32-Bit BE]
//          +0x258=Energy Tanks - Capacity [32-Bit BE]
//          +0x260=Powerbomb - Current Count [32-Bit BE]
//          +0x264=Powerbomb - Capacity [32-Bit BE]
//          +0x26C=Missile - Current Count [32-Bit BE]
//          +0x270=Missile - Capacity [32-Bit BE]
//          +0x278=Dark Ammo - Current Count [32-Bit BE]
//          +0x27C=Dark Ammo - Capacity [32-Bit BE]
//          +0x284=Light Ammo - Current Count [32-Bit BE]
//          +0x288=Light Ammo - Capacity [32-Bit BE]
//          +0x290=Item Percentage - Current Count [32-Bit BE]
//          +0x294=Item Percentage - Capacity [32-Bit BE]
//          +0x29C=(Start of Multiplayer Powerups) (A Count) [32-Bit BE]
//          +0x4E8=Violet Translator - Current Count [32-Bit BE]
//          +0x4EC=Violet Translator - Capacity [32-Bit BE]
//          +0x4F4=Amber Translator - Current Count [32-Bit BE]
//          +0x4F8=Amber Translator - Capacity [32-Bit BE]
//          +0x500=Emerald Translator - Current Count [32-Bit BE]
//          +0x504=Emerald Translator - Capacity [32-Bit BE]
//          +0x50C=Cobalt Translator - Current Count [32-Bit BE]
//          +0x510=Cobalt Translator - Capacity [32-Bit BE]
//          +0x518=Temple Key 4 - Current Count [32-Bit BE]
//          +0x51C=Temple Key 4 - Capacity [32-Bit BE]
//          +0x524=Temple Key 5 - Current Count [32-Bit BE]
//          +0x528=Temple Key 5 - Capacity [32-Bit BE]
//          +0x530=Temple Key 6 - Current Count [32-Bit BE]
//          +0x534=Temple Key 6 - Capacity [32-Bit BE]
//          +0x53C=Temple Key 7 - Current Count [32-Bit BE]
//          +0x540=Temple Key 7 - Capacity [32-Bit BE]
//          +0x548=Temple Key 8 - Current Count [32-Bit BE]
//          +0x54C=Temple Key 8 - Capacity [32-Bit BE]
//          +0x554=Temple Key 9 - Current Count [32-Bit BE]
//          +0x558=Temple Key 9 - Capacity [32-Bit BE]
//          +0x560=Energy Transfer Module - Current Count [32-Bit BE]
//          +0x564=Energy Transfer Module - Capacity [32-Bit BE]
//          +0x56C=Charge Beam - Current Count [32-Bit BE]
//          +0x570=Charge Beam - Capacity [32-Bit BE]
//          +0x574=Charge Beam (End of Powerups) - Duration (N/A For this one) [Float BE]
//          +0x578=Number of Logbook Scans [32-Bit BE] (That Count towards Scan % - Research Does Not)
//          +0x57c=Total Logbook Scans [32-Bit BE] (That Match 100% Scan Target)
//          +0x5a8=Pointer to Scan Times Table [32-Bit BE]
//          ..| Each entry has a length of 8 and is a 32-Bit BE asset ID followed by by an address that represents the scan time percentage achieved (0x00-0xff) 0xff is Fully Scanned, Following by another that is 0x01 if you've viewed the Logbook entry, plus 2 more addresses of unknown use.
//          ..|+0x08dc=[Creatures] Worker Splinter Scan Time [8-Bit]
ENERGY_TRANSFER_MODULE_OFFSET = 0x560 + POINTER_OFFSET_FIX
BOMB_COUNT_OFFSET = 0x134 + POINTER_OFFSET_FIX
DARK_BEAM_COUNT_OFFSET = 0x6C + POINTER_OFFSET_FIX
DARK_SUIT_COUNT_OFFSET = 0xFC + POINTER_OFFSET_FIX
BOOST_BALL_COUNT_OFFSET = 0x120 + POINTER_OFFSET_FIX
SEEKER_LAUNCHER_COUNT_OFFSET = 0x198 + POINTER_OFFSET_FIX
GRAPPLE_BEAM_COUNT_OFFSET = 0x174 + POINTER_OFFSET_FIX
SPIDER_BALL_COUNT_OFFSET = 0x12C + POINTER_OFFSET_FIX
SUN_BURST_COUNT_OFFSET = 0xA8 + POINTER_OFFSET_FIX
SCREW_ATTACK_COUNT_OFFSET = 0x1A4 + POINTER_OFFSET_FIX
LIGHT_SUIT_COUNT_OFFSET = 0x108 + POINTER_OFFSET_FIX

PLAYER_STATE_MEMORY_LOCATION_EU = 0x3DDF5C
function pointerToPlayerStateEU() => dword_be(PLAYER_STATE_MEMORY_LOCATION_EU)
function pointerToPlayerStateUS() => dword_be(PLAYER_STATE_MEMORY_LOCATION_EU - US_OFFSET)

PLAYER_HEALTH_OFFSET = 0x014 + POINTER_OFFSET_FIX
function playerHealthUS() => float_be(pointerToPlayerStateUS() + PLAYER_HEALTH_OFFSET)
function playerHealthEU() => float_be(pointerToPlayerStateEU() + PLAYER_HEALTH_OFFSET)
MISSILE_COUNT_OFFSET = 0x26C + POINTER_OFFSET_FIX
function missileCountUS() => dword_be(pointerToPlayerStateUS() + MISSILE_COUNT_OFFSET)
function missileCountEU() => dword_be(pointerToPlayerStateEU() + MISSILE_COUNT_OFFSET)

LOGBOOK_SCANS_OFFSET = 0x578 + POINTER_OFFSET_FIX
TOTAL_LOGBOOK_SCANS = 0xd3
function logbookScansUS() => dword_be(pointerToPlayerStateUS() + LOGBOOK_SCANS_OFFSET)
function logbookScansEU() => dword_be(pointerToPlayerStateEU() + LOGBOOK_SCANS_OFFSET)

// $3DDF60: [EU] Pointer to Camera Manager? [32-Bit BE]
function pointerToCameraManagerEU() => dword_be(0x3DDF60)

// $3DDF7C: [EU] Pointer to Relay Tracker for Current World [32-Bit BE]
//          (Event Flags/Things Remembered)
//          +0x00=Number of Memory Relays triggered [32-Bit BE]
//          +0x04=Asset Key of First Memory Relay [32-Bit BE]
//          +0x08=Asset Key of Second Memory Relay [32-Bit BE]
//          etc
function pointerToRelayTrackerEU() => dword_be(0x3DDF7C)

// $3DDF80: [EU] TMO Note: Probably the same as Current MapWorldInfo in Metroid Prime.
//          
//          Offset 0 would be how many bytes are allocated to maps visited bits. Offset 8 it seems is maps visited bits, as noted
//          
//          [EU](32-bit BE) Pointer to Current Map
//          
//          Pointer changes when changing zones.  Memory remains.
//          
//          +0x8 = (64-bit bitfield) Visited locations for current map
//          +0x10 = (64-bit bitfield) Map Revealed  for current map
function pointerToCurrentMapInfoEU() => dword_be(0x3DDF80)

// $3DDF81: [EU](32-bit BE) Pointer to Current Map
//          
//          Pointer changes when changing zones.  Memory remains.
//          
//          +0x8 = (64-bit bitfield) Visited locations for current map
//          +0x10 = (64-bit bitfield) Map Revealed  for current map
function pointerToCurrentMapEU() => dword_be(0x3DDF81)

// $3DDFA0: [EU][32-BIT BE] Room number in current area.
//          
//          Seems to be a Room index in the current area.  Changing this causes some issues (loading/unloading the current area)
ROOM_NUMBER_MEMORY_LOCATION_EU = 0x3DDFA0
function roomNumberEU() => dword_be(ROOM_NUMBER_MEMORY_LOCATION_EU)
function roomNumberUS() => dword_be(ROOM_NUMBER_MEMORY_LOCATION_EU - US_OFFSET)

// $3DDFA4: [EU][32-BIT BE] Previous Room number in current area.
//          
//          Set to 0xffffffff when changing areas.
//          
//          Note. Does not change when using a portal.
PREVIOUS_ROOM_NUMBER_MEMORY_LOCATION_EU = 0x3DDFA4
function previousRoomNumberEU() => dword_be(PREVIOUS_ROOM_NUMBER_MEMORY_LOCATION_EU)
function previousRoomNumberUS() => dword_be(PREVIOUS_ROOM_NUMBER_MEMORY_LOCATION_EU - US_OFFSET)

// $3DED44: [EU](Float BE) Boss Max HP
BOSS_MAX_HP_MEMORY_LOCATION_EU = 0x3DED44
function bossMaxHPEU() => float_be(BOSS_MAX_HP_MEMORY_LOCATION_EU)
function bossMaxHPUS() => float_be(BOSS_MAX_HP_MEMORY_LOCATION_EU - US_OFFSET)

// $3DED48: [EU](32-bit BE) Boss Display Name ID
BOSS_DISPLAY_NAME_ID_MEMORY_LOCATION_EU = 0x3DED48
function bossDisplayNameIDEU() => dword_be(BOSS_DISPLAY_NAME_ID_MEMORY_LOCATION_EU)
function bossDisplayNameIDUS() => dword_be(BOSS_DISPLAY_NAME_ID_MEMORY_LOCATION_EU - US_OFFSET)


function saveProtectionEU() => mainMenuDetectionEU() == GAMEPLAY_VALUE && numberOfPlayersEU() == 1
function saveProtectionUS() => mainMenuDetectionUS() == GAMEPLAY_VALUE && numberOfPlayersUS() == 1


TYPE = "TYPE"
OFFSET = "OFFSET"
TITLE = "TITLE"
ITEM_DESCRIPTION = "ITEM_DESCRIPTION"
POINTS = "POINTS"
ROOM = "ROOM"
ZONE = "ZONE"
PROGRESSION_TYPE = "Progression"
NO_TYPE = ""
MISSABLE_TYPE = "Missable"
TARGET = "TARGET"
DESCRIPTION = "DESCRIPTION"

function itemAchievement(data)
{
    achievement( title = data[TITLE],
                 description =  "Collect the " + data[ITEM_DESCRIPTION],
                 points =  data[POINTS],
                 type =  data[TYPE],
                 trigger =  ( isUSVersion() && 
                              dword_be(pointerToPlayerStateUS() + data[OFFSET]) != 0 && // Sometimes it's 1, sometimes 3, possibly 5.
                              prev(dword_be(pointerToPlayerStateUS() + data[OFFSET])) == 0 &&
                              roomNumberUS() == data[ROOM] && // just a safety check. 
                              worldIDUS() == data[ZONE] && 
                              saveProtectionUS()
                            ) ||
                            ( isEUVersion() &&
                              dword_be(pointerToPlayerStateEU() + data[OFFSET]) != 0 &&
                              prev(dword_be(pointerToPlayerStateEU() + data[OFFSET])) == 0 &&
                              roomNumberEU() == data[ROOM] && // just a safety check. 
                              worldIDEU() == data[ZONE] && 
                              saveProtectionEU()
                            )
    )
}



TRANSPORT_A_ACCESS = 0x01
TEMPLE_SANCTUARY_ROOM_NUMBER = 0x02
MAIN_ENERGY_CONTROLLER = 0x07

AGON_TEMPLE = 0x1A
STORAGE_D = 0x34
DARK_AGON_TEMPLE = 0x24
DARK_TORVUS_ARENA = 0x1C
HALL_OF_HONORED_DEAD = 0x07
SACRIFICIAL_CHAMBER_TUNNEL = 0x33
SACRIFICIAL_CHAMBER = 0x3b
DYNAMO_WORKS = 0x14
GRAND_WINDCHAMBER = 0x1D
VAULT = 0x2C
SANCTUM = 0xB  // EMPOROR ING

itemAchievement({TYPE: PROGRESSION_TYPE, 
                 OFFSET: ENERGY_TRANSFER_MODULE_OFFSET, 
                 TITLE: "Oh That’s What That Was", 
                 ITEM_DESCRIPTION: "Energy Transfer Module",
                 ROOM: MAIN_ENERGY_CONTROLLER,
                 ZONE: GREAT_TEMPLE,
                 POINTS: 2})

itemAchievement({TYPE: PROGRESSION_TYPE, 
                 OFFSET: BOMB_COUNT_OFFSET,
                 TITLE: "Bombs Away", 
                 ITEM_DESCRIPTION: "Morph Ball Bomb",
                 ROOM: AGON_TEMPLE,
                 ZONE: AGON_WASTES,
                 POINTS: 2})

itemAchievement({TYPE: PROGRESSION_TYPE,
                 OFFSET: DARK_BEAM_COUNT_OFFSET,
                 TITLE: "You'll Look Good in Black",
                 ITEM_DESCRIPTION: "Dark Beam",
                 ROOM: STORAGE_D,
                 ZONE: AGON_WASTES,
                 POINTS: 2})
itemAchievement({TYPE: PROGRESSION_TYPE,
                 OFFSET: DARK_SUIT_COUNT_OFFSET,
                 TITLE: "I am the Night",
                 ITEM_DESCRIPTION: "Dark Suit",
                 ROOM: DARK_AGON_TEMPLE,
                 ZONE: DARK_AGON_WASTES,
                 POINTS: 2})
itemAchievement({TYPE: PROGRESSION_TYPE,
                  OFFSET: BOOST_BALL_COUNT_OFFSET,
                  TITLE: "Hit it Samus!",
                  ITEM_DESCRIPTION: "Boost Ball",
                  ROOM: DARK_TORVUS_ARENA,
                  ZONE: DARK_TORVUS_BOG,
                  POINTS: 2})
itemAchievement({TYPE: PROGRESSION_TYPE,
                 OFFSET: SEEKER_LAUNCHER_COUNT_OFFSET,
                 TITLE: "You Can Hide, but I`ll Seek You",
                 ITEM_DESCRIPTION: "Seeker Launcher",
                 ROOM: HALL_OF_HONORED_DEAD,
                 ZONE: TEMPLE_GROUNDS,
                 POINTS: 2})
itemAchievement({TYPE: PROGRESSION_TYPE,
                 OFFSET: GRAPPLE_BEAM_COUNT_OFFSET,
                 TITLE: "It Don`t Mean a Thing If It Ain`t Got That Swing",
                 ITEM_DESCRIPTION: "Grapple Beam",
                 ROOM: SACRIFICIAL_CHAMBER,
                 ZONE: DARK_TORVUS_BOG,
                 POINTS: 2})
itemAchievement({TYPE: PROGRESSION_TYPE,
                 OFFSET: SPIDER_BALL_COUNT_OFFSET,
                  TITLE: "Grip It and Rip It",
                  ITEM_DESCRIPTION: "Spider Ball",
                  ROOM: DYNAMO_WORKS,
                  ZONE: SANCTUARY_FORTRESS,
                  POINTS: 2})
itemAchievement({TYPE: NO_TYPE,
                 OFFSET: SUN_BURST_COUNT_OFFSET,
                 TITLE: "Brightening Up the Place",
                 ITEM_DESCRIPTION: "Sunburst",
                 ROOM: GRAND_WINDCHAMBER,
                 ZONE: TEMPLE_GROUNDS,
                 POINTS: 2})
itemAchievement({TYPE: PROGRESSION_TYPE,
                  OFFSET: SCREW_ATTACK_COUNT_OFFSET,
                  TITLE: "You Spin Me Right 'Round, Baby, Right 'Round",
                  ITEM_DESCRIPTION: "Screw Attack",
                  ROOM: VAULT,
                  ZONE: SANCTUARY_FORTRESS,
                  POINTS: 2})
itemAchievement({TYPE: PROGRESSION_TYPE,
                 OFFSET: LIGHT_SUIT_COUNT_OFFSET,
                 TITLE: "Now I Don`t Fear the Darkness",
                 ITEM_DESCRIPTION: "Light Suit",
                 ROOM: MAIN_ENERGY_CONTROLLER,
                 ZONE: GREAT_TEMPLE,
                 POINTS: 2})

function bossRunsOutOfHPUS() => prev(bossHealthUS()) > 0x00000000 && bossHealthUS() <= 0x00000000 && bossHealthVisorCheckUS()
function bossRunsOutOfHPEU() => prev(bossHealthEU()) > 0x00000000 && bossHealthEU() <= 0x00000000 && bossHealthVisorCheckEU()
function playerLostHealthUS() => playerHealthUS() < prev(playerHealthUS()) 
function playerLostHealthEU() => playerHealthEU() < prev(playerHealthEU())
function playerUsedMissilesUS() => missileCountUS() < prev(missileCountUS())
function playerUsedMissilesEU() => missileCountEU() < prev(missileCountEU())

EMPEROR_ING_FINAL_FORM_MAX_HEALTH = 1000
EMPEROR_ING_ID = 0x39
DARK_MISSILE_TROOPER_NAME_ID = 0x43 
DARK_MISSILE_TROOPER_MAX_HEALTH = 600

achievement( title = "And Now the Obligatory Countdown",
             description = "Defeat Emperor Ing",
             points = 10,
             type = PROGRESSION_TYPE,
              trigger = ( isUSVersion() && 
                          bossDisplayNameIDUS() == EMPEROR_ING_ID &&
                          bossMaxHPUS() == EMPEROR_ING_FINAL_FORM_MAX_HEALTH &&
                          bossRunsOutOfHPUS() &&
                          roomNumberUS() == SANCTUM &&
                          saveProtectionUS()
                        ) ||
                        ( isEUVersion() &&
                          bossDisplayNameIDEU() == EMPEROR_ING_ID &&
                          bossMaxHPEU() == EMPEROR_ING_FINAL_FORM_MAX_HEALTH &&
                          bossRunsOutOfHPEU() &&
                          roomNumberEU() == SANCTUM &&
                          saveProtectionEU()
                        )
)

achievement( title = "Back, Bugs!",
             description = "Defeat Dark Alpha Splinter without taking damage or using missiles",
             points =  5,
             type = MISSABLE_TYPE,
             trigger=  ( isUSVersion() && 
                        once(roomNumberUS() == TEMPLE_SANCTUARY_ROOM_NUMBER && 
                             previousRoomNumberUS() == TRANSPORT_A_ACCESS &&
                             prev(roomNumberUS()) == TRANSPORT_A_ACCESS &&
                             dword_be(pointerToPlayerStateUS() + ENERGY_TRANSFER_MODULE_OFFSET) == 0 &&
                             worldIDUS() == GREAT_TEMPLE) &&
                        never( playerLostHealthUS() && isUSVersion()) &&
                        never( playerUsedMissilesUS() && isUSVersion()) &&
                        never(roomNumberUS() != TEMPLE_SANCTUARY_ROOM_NUMBER && isUSVersion()) &&
                        trigger_when(bossRunsOutOfHPUS()) &&
                        saveProtectionUS()
                      ) ||
                      ( isEUVersion() &&
                        once(roomNumberEU() == TEMPLE_SANCTUARY_ROOM_NUMBER && 
                             previousRoomNumberEU() == TRANSPORT_A_ACCESS &&
                             prev(roomNumberEU()) == TRANSPORT_A_ACCESS &&
                             dword_be(pointerToPlayerStateEU() + ENERGY_TRANSFER_MODULE_OFFSET) == 0 &&
                             worldIDEU() == GREAT_TEMPLE) &&
                        never( playerLostHealthEU()  && isEUVersion()) &&
                        never( playerUsedMissilesEU() && isEUVersion()) &&
                        never(roomNumberEU() != TEMPLE_SANCTUARY_ROOM_NUMBER && isEUVersion()) &&
                        trigger_when(bossRunsOutOfHPEU()) &&
                        saveProtectionEU()
                      )
)

achievement( title = "Dark Missile Trooper",
             description = "Defeat Dark Missile Trooper without taking damage or using missiles",
             points =  2,
             type = MISSABLE_TYPE,
             trigger=  ( isUSVersion() && 
                        once(bossDisplayNameIDUS() == DARK_MISSILE_TROOPER_NAME_ID &&
                             bossMaxHPUS() == DARK_MISSILE_TROOPER_MAX_HEALTH &&
                             prev(bossMaxHPUS()) == 0 &&
                             prev(bossDisplayNameIDUS()) == 0x00 ) &&
                        trigger_when(bossRunsOutOfHPUS()) &&
                        saveProtectionUS() &&
                        never( playerLostHealthUS() && isUSVersion()) &&
                        never( playerUsedMissilesUS() && isUSVersion())
                      ) ||
                      ( isEUVersion() &&
                        once(bossDisplayNameIDEU() == DARK_MISSILE_TROOPER_NAME_ID &&
                             bossMaxHPEU() == DARK_MISSILE_TROOPER_MAX_HEALTH &&
                             prev(bossMaxHPEU()) == 0 &&
                             prev(bossDisplayNameIDEU()) == 0x00 ) &&
                        trigger_when(bossRunsOutOfHPEU()) &&
                        saveProtectionEU() &&
                        never( playerLostHealthEU() && isEUVersion()) &&
                        never( playerUsedMissilesEU() && isEUVersion())
                      )
)


function scanPercentageAchievement(data)
{
    achievement( title = data[TITLE],
                 description =  data[DESCRIPTION],
                 points =  data[POINTS],
                 type =  data[TYPE],
                 trigger =  ( isUSVersion() && 
                              prev(logbookScansUS() )== data[TARGET] - 1 && 
                              logbookScansUS() == data[TARGET] && 
                              saveProtectionUS()
                            ) ||
                            ( isEUVersion() &&
                              prev(logbookScansEU() )== data[TARGET] - 1 && 
                              logbookScansEU() == data[TARGET] && 
                              saveProtectionEU()
                            )
    )
}

function calculateScans(target) => TOTAL_LOGBOOK_SCANS * target / 100 + 1

scanPercentageAchievement({TYPE: NO_TYPE, 
                           TARGET: calculateScans(20), 
                           TITLE: "Oh That's What That Is?", 
                           DESCRIPTION: "Scan 20 percent of the game (According to the pause menu)",
                           POINTS: 3})

scanPercentageAchievement({TYPE: NO_TYPE, 
                           TARGET: calculateScans(40), 
                           TITLE: "Archival Activist", 
                           DESCRIPTION: "Scan 40 percent of the game (According to the pause menu)",
                           POINTS: 4})

scanPercentageAchievement({TYPE: NO_TYPE, 
                           TARGET: calculateScans(60), 
                           TITLE: "Lore Librarian", 
                           DESCRIPTION: "Scan 60 percent of the game (According to the pause menu)",
                           POINTS: 5})

scanPercentageAchievement({TYPE: NO_TYPE, 
                           TARGET: calculateScans(80), 
                           TITLE: "Learning All Your Secrets", 
                           DESCRIPTION: "Scan 80 percent of the game (According to the pause menu)",
                           POINTS: 10})

scanPercentageAchievement({TYPE: MISSABLE_TYPE, 
                           TARGET: TOTAL_LOGBOOK_SCANS, 
                           TITLE: "Now I Know Everything", 
                           DESCRIPTION: "Scan 100 percent of the game (According to the pause menu)",
                           POINTS: 25})