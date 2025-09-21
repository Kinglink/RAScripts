// Dynasty Warriors 3: Xtreme Legends
// #ID = 34509

function ContainsKey(dictionary, key_name)
{
    for key in dictionary 
        if(key == key_name) return true
    return false
}

// $021904: (32-bit) Load Indicator
//          
//          Any other value, doing something else.
//          0x0007f448 = Loading
function LoadIndicator() => dword(0x021904)

LOADING_VALUE = 0x0007f448

function isNotLoading() => LoadIndicator() != LOADING_VALUE

// $29C9C0: (8-bit) Novice Mode
//          
//          0x00 = Off
//          0x01 = On
function NoviceModeIndicator() => byte(0x29C9C0)

NOVICE_MODE_VALUE = 0x01 

function isNoviceMode() => NoviceModeIndicator() == NOVICE_MODE_VALUE


// $29CCF8: (32-bit) Lu Bu's third outfit
//
//          0x00 = No Outfit
//          0x01 = Lu Bu's third outfit is unlocked
//          Any other = No Outfit
function LuBuThirdOutfitIndicator() => dword(0x29CCF8)

LU_BU_NO_OUTFIT_VALUE = 0x00
LU_BU_THIRD_OUTFIT_VALUE = 0x01

function justUnlockedLuBuThirdOutfit() => LuBuThirdOutfitIndicator() == LU_BU_THIRD_OUTFIT_VALUE &&
                                          prev(LuBuThirdOutfitIndicator()) == LU_BU_NO_OUTFIT_VALUE

// $29CCFC: (32-bit) Sun Shang Xiang's third outfit
//
//          0x00 = No Outfit
//          0x01 = SSX's third outfit is unlocked
//          Any other = No Outfit
function SunShangXiangThirdOutfitIndicator() => dword(0x29CCFC)  

SUN_SHANG_XIANG_NO_OUTFIT_VALUE = 0x00
SUN_SHANG_XIANG_THIRD_OUTFIT_VALUE = 0x01

function justUnlockedSunShangXiangThirdOutfit() => SunShangXiangThirdOutfitIndicator() == SUN_SHANG_XIANG_THIRD_OUTFIT_VALUE &&
                                                   prev(SunShangXiangThirdOutfitIndicator()) == SUN_SHANG_XIANG_NO_OUTFIT_VALUE

// $2AFF77: Off by one of the Array of every playable character.  
//          Appears to be 24 Bytes between characters.  
//          Starts with 16 bit Heatlh, 16 bit Musou, 8 bit Attack, 8 bit Defense , 
//                  Array of 5 8-bit equipped Items, 
//                  32 bit of Experience, 32 bit marker of Class? 
//                  And finally 8-bit for stages complete.



function InfoOnArray() => byte(0x2AFF77)

// $2AFF78: (16-bit) Stored Zhao Yun's Max Life
function ZhaoYunMaxLife() => word(0x2AFF78)

// $2AFF7A: (16-bit) Stored Zhao Yun's Max Musou
function ZhaoYunMaxMusou() => word(0x2AFF7A)

// $2AFF7C: (8-bit) Stored Zhao Yun's Max Attack
function ZhaoYunAttack() => byte(0x2AFF7C)

// $2AFF7D: (16-bit) Stored Zhao Yun's Max Defense
function ZhaoYunDefense() => word(0x2AFF7D)

// $2AFF7E: (8-bit) Stored Zhao Yun's Equipped Weapons
function ZhaoYunEquippedWeapon() => byte(0x2AFF7E)

// $2AFF7F: (Array of 5 8-bit numbers) Stored Zhao Yun's Equipped items.
function ZhaoYunEquippedItems() => byte(0x2AFF7F)

// $2AFF84: (32-bit) Stored Zhao Yun's Experience
function ZhaoYunExperience() => dword(0x2AFF84)

// $2AFF88: (32-bit) Zhao Yun's Stored Class Rank
//          
//          Copied from DW 3
//          
//          Starting at bit 2, this is the current Class level.  All characters start at 16, and MAX their rank at 0  Note:
//          Further examination makes me think this is wrong, however this IS how the rank is stored, but it's not necessarily straight forward after examination.  (or maybe I'm misunderstanding what I said in the note above. Bit 0 and Bit 1 are unknown at this time, but not believed to be related to class
function ZhaoYunClassRank() => dword(0x2AFF88)

// $2AFF8C: (8-bit) Cleared stages for Zhao Yun
//          
//          This increases, but it's not entirely clear how.  Might be based on each save.
//          0x0a = Cleared marker on the character select screen.
function ZhaoYunClearedStages() => byte(0x2AFF8C)

// $2AFF9C: (32-bit) Stored Guan Yu's Experience
function GuanYuExperience() => dword(0x2AFF9C)
ZHAO_YUN_EXPERIENCE_MEMORY_LOCATION = 0x2AFF84
GUAN_YU_EXPERIENCE_MEMORY_LOCATION = 0x2AFF9C
CHARACTER_MEMORY_OFSET = GUAN_YU_EXPERIENCE_MEMORY_LOCATION - ZHAO_YUN_EXPERIENCE_MEMORY_LOCATION
// Is this needed? 

// $2B0350: (Array of 40 * 16-bit) Array of Stored items owned by the player.
//          
//          The following array is a 16-bit entries that will show which items users currently own.   The first value is 28 or the item id.  The second value is the 'power' of an item (Assuming it has one.)
//          
//          The first 25 items are the same as the original game, likely to make it so it's easier to import.
//          
//          The first 13 items have power levels.  The first 3 of the new array (0x18-0x20) have power levels.  All other do not.  However they are 16 bit values, where first 8 bits are index, and second 8 bits are "power".
//          
//          This is the item Index.
//          0x00=Speed Scroll
//          0x01=Wing boots
//          0x02=Dragon Amulet
//          0x03=Peacock Urn
//          0x04=Tiger Amulet
//          0x05=Tortoise Amulet
//          0x06=Huang's Bow
//          0x07=Shell Armor
//          0x08=Horned Helmet
//          0x09=Cavalry Armor
//          0x0a=Seven Star Orb
//          0x0b=Wind Scroll
//          0x0c=Elixir
//          0x0d=Red Hare Saddle
//          0x0e=Hex Mark Saddle
//          0x0f=Imperial Saddle
//          0x10=The Art of War
//          0x11=Bodyguard Manual
//          0x12=The Way of the Musou
//          0x13=Survival Guide
//          0x14=Defender
//          0x15=Fire Arrows
//          0x16=Buckler
//          0x17=Power Scroll
//          0x18=Golden Harness
//          
//          New Items
//          0x19 = Mountain Quiver
//          0x1a = Mountain Pouch
//          0x1b = Bronze Flask
//          0x1c = Divine Helm
//          0x1d = Scroll of Accuracy
//          0x1e =Imperial Harness
//          0x1f = Seven Star Blade
//          0x20 = Lightning Bow
//          0x21 = Seal of Darkness
//          0x22 = Beast Harness
//          0x23 = Marching Drum
//          0x24 = Divine Gauntlet
//          0x25 = Master's Cloak
//          0x26 = Legendary Scroll
//          0x27 = Musou Armor
function StoredItemsArray() => byte(0x2B0350)
STARTING_ITEM_MEMORY_LOCATION = 0x2B0350

function itemLevelLookup(itemId) => byte(STARTING_ITEM_MEMORY_LOCATION + itemId * 2 + 1)
function itemIdLookup(itemId) => byte(STARTING_ITEM_MEMORY_LOCATION + itemId * 2)

// Common Items ID 
SPEED_SCROLL_ID = 0x00
WING_BOOTS_ID = 0x01
DRAGON_AMULET_ID = 0x02
PEACOCK_URN_ID = 0x03
TIGER_AMULET_ID = 0x04
TORTOISE_AMULET_ID = 0x05
HUANG_BOW_ID = 0x06
SHELL_ARMOR_ID = 0x07
HORNED_HELMET_ID = 0x08
CAVALRY_ARMOR_ID = 0x09
SEVEN_STAR_ORB_ID = 0x0a
WIND_SCROLL_ID = 0x0b
ELIXER_ID = 0x0c

// Rare items
RED_HARE_ID = 0x0d
HEXMARK_SADDLE_ID = 0x0e
IMPERIAL_SADDLE_ID = 0x0f
ART_OF_WAR_ID = 0x10
BODYGUARD_MANUAL_ID = 0x11
WAY_OF_MUSOU_ID = 0x12
SURVIVAL_GUIDE_ID = 0x13
DEFENDER_ID = 0x14
FIRE_ARROWS_ID = 0x15
BUCKLER_ID = 0x16
POWER_SCROLL_ID = 0x17
GOLDEN_HARNESS_ID = 0x18

//NEW ITEMS
MOUNTAIN_QUIVER_ID = 0x19
MOUNTAIN_POUCH_ID = 0x1a
BRONZE_FLASK_ID = 0x1b
DIVINE_HELM_ID = 0x1c
SCROLL_OF_ACCURACY_ID = 0x1d
IMPERIAL_HARNESS_ID = 0x1e
SEVEN_STAR_BLADE_ID = 0x1f
LIGHTNING_BOW_ID = 0x20
SEAL_OF_DARKNESS_ID = 0x21
BEAST_HARNESS_ID = 0x22
MARCHING_DRUM_ID = 0x23
DIVINE_GAUNTLET_ID = 0x24
MASTERS_CLOAK_ID = 0x25
LEGENDARY_SCROLL_ID = 0x26
MUSOU_ARMOR_ID = 0x27
INVALID_ITEM_ID = 0x28

FIRST_NEW_BLUE_ITEM_ID = MOUNTAIN_QUIVER_ID
LAST_NEW_BLUE_ITEM_ID = BRONZE_FLASK_ID

FIRST_NEW_RED_ITEM_ID = DIVINE_HELM_ID
LAST_NEW_RED_ITEM_ID = MUSOU_ARMOR_ID

ItemNameLookup = 
{
    SPEED_SCROLL_ID : "Speed Scroll",
    WING_BOOTS_ID : "Wing Boots",
    DRAGON_AMULET_ID : "Dragon Amulet",
    PEACOCK_URN_ID : "Peacock Urn",
    TIGER_AMULET_ID : "Tiger Amulet",
    TORTOISE_AMULET_ID : "Tortoise Amulet",
    HUANG_BOW_ID : "Huang's Bow",
    SHELL_ARMOR_ID : "Shell Armor",
    HORNED_HELMET_ID : "Horned Helmet",
    CAVALRY_ARMOR_ID : "Cavalry Armor",
    SEVEN_STAR_ORB_ID : "Seven Star Orb",
    WIND_SCROLL_ID : "Wind Scroll",
    ELIXER_ID : "Elixer",
    RED_HARE_ID : "Red Hare Saddle",
    HEXMARK_SADDLE_ID : "Hex Mark Saddle",
    IMPERIAL_SADDLE_ID : "Imperial Saddle",
    ART_OF_WAR_ID : "The Art of War",
    BODYGUARD_MANUAL_ID : "Bodyguard Manual",
    WAY_OF_MUSOU_ID : "The Way of the Musou",
    SURVIVAL_GUIDE_ID : "Survival Guide",
    DEFENDER_ID : "Defender",
    FIRE_ARROWS_ID : "Fire Arrows",
    BUCKLER_ID : "Buckler",
    POWER_SCROLL_ID : "Power Scroll",
    GOLDEN_HARNESS_ID : "Golden Harness",
    MOUNTAIN_QUIVER_ID : "Mountain Quiver",
    MOUNTAIN_POUCH_ID : "Mountain Pouch",
    BRONZE_FLASK_ID : "Bronze Flask",
    DIVINE_HELM_ID : "Divine Helm",
    SCROLL_OF_ACCURACY_ID : "Scroll of Accuracy",
    IMPERIAL_HARNESS_ID : "Imperial Harness",
    SEVEN_STAR_BLADE_ID : "Seven Star Blade",
    LIGHTNING_BOW_ID : "Lightning Bow",
    SEAL_OF_DARKNESS_ID : "Seal of Darkness",
    BEAST_HARNESS_ID : "Beast Harness",
    MARCHING_DRUM_ID : "Marching Drum",
    DIVINE_GAUNTLET_ID : "Divine Gauntlet",
    MASTERS_CLOAK_ID : "Master's Cloak",
    LEGENDARY_SCROLL_ID : "Legendary Scroll",
    MUSOU_ARMOR_ID : "Musou Armor"
}


// $2B03A0: (Array of 171 24 bytes ) Array of Weapon Owned Data
//          
//          This is the stored database entry for the weapon that gets saved to the memory card.   This is 5 16 bit values, The format is 0wxyz where wx is the strength of the ability, and yz is the type.  Type enumeration is at the end of this note.
//          
//          Following that is 16 bits.  This can be simply 0x00ab(171), which says the weapon is not 'owned' yet.
//          The other value is usually paired (0x0202 for instance).   This tells the weapon which weapon type and hit count to read from an array.  This will probably always be the same value as the row number
//          
//          Weapon Index.
//          
//          0x00 = Sword
//          0x01 = Steel Sword
//          0x02 = Broad Sword
//          0x03 = Long Sword
//          0x04 = Scimitar
//          0x05 = Great Scimitar
//          0x06 = Spear
//          0x07 = Long Spear
//          0x08 = Halberd
//          0x09 = Great Halberd
//          0x0A = Hand Axe
//          0x0B = Strike Axe
//          0x0C = Club
//          0x0D = Spiked Club
//          0x0E = Twin Sabers
//          0x0F = Wing Sabers
//          0x10 = Twin Rods
//          0x11 = Spiral Rods
//          0x12 = Mace
//          0x13 = Great Mace
//          0x14 = War Fan
//          0x15 = Warlord Fan
//          0x16 = Chakram
//          0x17 = Crescent Chakram
//          0x18 = Battle Axe
//          0x19 = War Axe
//          0x1A = Bronze Claw
//          0x1B = Steel Claw
//          0x1C = Iron Flute
//          0x1D = Steel Flute
//          0x1E = Iron Rod
//          0x1F = Steel Rod
//          0x20 = Tonfa
//          0x21 = Studded Tonfa
//          0x22 = Double Voulge
//          0x23 = Strike Voulge
//          0x24 = Staff
//          0x25 = Mirage Staff
//          0x26 = Nanman Gauntlet
//          0x27 = Beast Gauntlet
//          0x28 = Boomerang
//          0x29 = Hawk Boomerang
//          0x2A = Twin Fans
//          0x2B = Violet Fans
//          0x2C = Bastard Sword
//          0x2D = Great Sword
//          0x2E = Rapier
//          0x2F = Swift Rapier
//          0x30 = Dragon Spear
//          0x31 = Blue Dragon
//          0x32 = Snake Blade
//          0x33 = Kirin Sword
//          0x34 = Bull
//          0x35 = Bone Crusher
//          0x36 = Elder Sword
//          0x37 = Eagle
//          0x38 = Wolf Slayer
//          0x39 = Gold Orb
//          0x3A = White Feather
//          0x3B = Sword of Heaven
//          0x3C = Sky Piercer
//          0x3D = Luna Chakram
//          0x3E = Gold Dragon
//          0x3F = Lone Wolf
//          0x40 = King Wolf
//          0x41 = Star Sword
//          0x42 = Master Sword
//          0x43 = Steel Stallion
//          0x44 = Sage Sword
//          0x45 = Demon Sword
//          0x46 = Dragon Blade
//          0x47 = Black Feather
//          0x48 = Tiger Hook
//          0x49 = River Master
//          0x4A = Vapor
//          0x4B = Staff of Fire
//          0x4C = Destroyer
//          0x4D = Peacock Claw
//          0x4E = Moon Flute
//          0x4F = Shadow Rod
//          0x50 = Conqueror
//          0x51 = Double Star
//          0x52 = Staff of Wind
//          0x53 = Beast Master
//          0x54 = Fire Wheel
//          0x55 = Beauty
//          0x56 = Grace
//          0x57 = Holy Avenger
//          0x58 = Celestial Blade
//          0x59 = Fierce Dragon
//          0x5A = Blue Moon Dragon
//          0x5B = Viper Blade
//          0x5C = Kirin Fang
//          0x5D = Mad Bull
//          0x5E = Stone Crusher
//          0x5F = Ancients Sword
//          0x60 = Falcon
//          0x61 = Tiger Slayer
//          0x62 = Gold Globe
//          0x63 = Peacock Feather
//          0x64 = Wrath Of Heaven
//          0x65 = Sky Scorcher
//          0x66 = Sol Chakram
//          0x67 = Gold Moon Dragon
//          0x68 = Savage Wolf
//          0x69 = Master Wolf
//          0x6A = Grand Star
//          0x6B = Grand Master
//          0x6C = Steel Dragon
//          0x6D = Oracle Sword
//          0x6E = Demon Fang
//          0x6F = Dragon Breath
//          0x70 = Dark Feather
//          0x71 = White Tiger
//          0x72 = Sea Master
//          0x73 = Blink
//          0x74 = Volcano Staff
//          0x75 = Marauder
//          0x76 = Peacock Talon
//          0x77 = Dark Moon Flute
//          0x78 = Black Shadow
//          0x79 = Overlord
//          0x7A = Double Comet
//          0x7B = Tornado Staff
//          0x7C = King Of Beasts
//          0x7D = Magma Wheel
//          0x7E = True Beauty
//          0x7F = True Grace
//          0x80 = Fu Xi's Sword
//          0x81 = Nu Wa's Rapier
//          0x82 = War Dragon
//          0x83 = Divine Dragon
//          0x84 = Serpent Blade
//          0x85 = Tempest Sword
//          0x86 = Beast Axe
//          0x87 = Earthly Mace
//          0x88 = Elder Moon
//          0x89 = Flash Blade
//          0x8a = Tiger Wolf
//          0x8b = Imperial Mace
//          0x8c = Griffin Feather
//          0x8d = Blue Steel
//          0x8e = Demon Slayer
//          0x8f = Dragon Chakram
//          0x90 = Dragon Star
//          0x91 = Wolf Blade
//          0x92 = Heavenly Wolf
//          0x93 = Black Steel
//          0x94 = Imperial Saber
//          0x95 = Lightning Spear
//          0x96 = Mystic Blade
//          0x97 = Mystic Fang
//          0x98 = Dragon God
//          0x99 = Raven Feather
//          0x9a = Fighting Tiger
//          0x9b = Seven Seas Blade
//          0x9c = Starlight Pike
//          0x9d = Thunder Staff
//          0x9e = Tiger Fang
//          0x9f = Phoenix Talon
//          0xa0 = Half Moon Flute
//          0xa1 = Spiked Mace
//          0xa2 = God Of War
//          0xa3 = Twin Stars
//          0xa4 = Lightning Staff
//          0xa5 = Shadow Beast
//          0xa6 = Tri Blade
//          0xa7 = Yellow Beauty
//          0xa8 = Blue Grace
//          0xa9 = Dragon Slayer
//          0xaa = Dragon Rapier
//          
//          
//          (sorry copy and pasting the first 0x082 from The original. 
//          /          
//          
//          
//          
//          
//          Type:
//          0x00 = Speed
//          0x01 = Jump
//          0x02 = Musou Max
//          0x03 = Hp Max
//          0x04 = Attack
//          0x05 = Defense
//          0x06 = Bow Attack
//          0x07 = Bow Defense
//          0x08 = Mounted Attack
//          0x09 = Mounted Defense
//          0x0a = Luck
//          0x0b = Reach
//          0x0c = Musou Charge
//          
//          0x28 = None (note there's only 14 choices.
function WeaponOwnedArray() => byte(0x2B03A0)
SWORD_ID = 0x00
STEEL_SWORD_ID = 0x01
BROAD_SWORD_ID = 0x02
LONG_SWORD_ID = 0x03
SCIMITAR_ID = 0x04
GREAT_SCIMITAR_ID = 0x05
SPEAR_ID = 0x06
LONG_SPEAR_ID = 0x07
HALBERD_ID = 0x08
GREAT_HALBERD_ID = 0x09
HAND_AXE_ID = 0x0A
STRIKE_AXE_ID = 0x0B
CLUB_ID = 0x0C
SPIKED_CLUB_ID = 0x0D
TWIN_SABERS_ID = 0x0E
WING_SABERS_ID = 0x0F
TWIN_RODS_ID = 0x10
SPIRAL_RODS_ID = 0x11
MACE_ID = 0x12
GREAT_MACE_ID = 0x13
WAR_FAN_ID = 0x14
WARLORD_FAN_ID = 0x15
CHAKRAM_ID = 0x16
CRESCENT_CHAKRAM_ID = 0x17
BATTLE_AXE_ID = 0x18
WAR_AXE_ID = 0x19
BRONZE_CLAW_ID = 0x1A
STEEL_CLAW_ID = 0x1B
IRON_FLUTE_ID = 0x1C
STEEL_FLUTE_ID = 0x1D
IRON_ROD_ID = 0x1E
STEEL_ROD_ID = 0x1F
TONFA_ID = 0x20
STUDDED_TONFA_ID = 0x21
DOUBLE_VOULGE_ID = 0x22
STRIKE_VOULGE_ID = 0x23
STAFF_ID = 0x24
MIRAGE_STAFF_ID = 0x25
NANMAN_GAUNTLET_ID = 0x26
BEAST_GAUNTLET_ID = 0x27
BOOMERANG_ID = 0x28
HAWK_BOOMERANG_ID = 0x29
TWIN_FANS_ID = 0x2A
VIOLET_FANS_ID = 0x2B
BASTARD_SWORD_ID = 0x2C
GREAT_SWORD_ID = 0x2D
RAPIER_ID = 0x2E
SWIFT_RAPIER_ID = 0x2F
DRAGON_SPEAR_ID = 0x30
BLUE_DRAGON_ID = 0x31
SNAKE_BLADE_ID = 0x32
KIRIN_SWORD_ID = 0x33
BULL_ID = 0x34
BONE_CRUSHER_ID = 0x35
ELDER_SWORD_ID = 0x36
EAGLE_ID = 0x37
WOLF_SLAYER_ID = 0x38
GOLD_ORB_ID = 0x39
WHITE_FEATHER_ID = 0x3A
SWORD_OF_HEAVEN_ID = 0x3B
SKY_PIERCER_ID = 0x3C
LUNA_CHAKRAM_ID = 0x3D
GOLD_DRAGON_ID = 0x3E
LONE_WOLF_ID = 0x3F
KING_WOLF_ID = 0x40
STAR_SWORD_ID = 0x41
MASTER_SWORD_ID = 0x42
STEEL_STALLION_ID = 0x43
SAGE_SWORD_ID = 0x44
DEMON_SWORD_ID = 0x45
DRAGON_BLADE_ID = 0x46
BLACK_FEATHER_ID = 0x47
TIGER_HOOK_ID = 0x48
RIVER_MASTER_ID = 0x49
VAPOR_ID = 0x4A
STAFF_OF_FIRE_ID = 0x4B
DESTROYER_ID = 0x4C
PEACOCK_CLAW_ID = 0x4D
MOON_FLUTE_ID = 0x4E
SHADOW_ROD_ID = 0x4F
CONQUEROR_ID = 0x50
DOUBLE_STAR_ID = 0x51
STAFF_OF_WIND_ID = 0x52
BEAST_MASTER_ID = 0x53
FIRE_WHEEL_ID = 0x54
BEAUTY_ID = 0x55
GRACE_ID = 0x56
HOLY_AVENGER_ID = 0x57
CELESTIAL_BLADE_ID = 0x58
FIERCE_DRAGON_ID = 0x59
BLUE_MOON_DRAGON_ID = 0x5A
VIPER_BLADE_ID = 0x5B
KIRIN_FANG_ID = 0x5C
MAD_BULL_ID = 0x5D
STONE_CRUSHER_ID = 0x5E
ANCIENTS_SWORD_ID = 0x5F
FALCON_ID = 0x60
TIGER_SLAYER_ID = 0x61
GOLD_GLOBE_ID = 0x62
PEACOCK_FEATHER_ID = 0x63
WRATH_OF_HEAVEN_ID = 0x64
SKY_SCORCHER_ID = 0x65
SOL_CHAKRAM_ID = 0x66
GOLD_MOON_DRAGON_ID = 0x67
SAVAGE_WOLF_ID = 0x68
MASTER_WOLF_ID = 0x69
GRAND_STAR_ID = 0x6A
GRAND_MASTER_ID = 0x6B
STEEL_DRAGON_ID = 0x6C
ORACLE_SWORD_ID = 0x6D
DEMON_FANG_ID = 0x6E
DRAGON_BREATH_ID = 0x6F
DARK_FEATHER_ID = 0x70
WHITE_TIGER_ID = 0x71
SEA_MASTER_ID = 0x72
BLINK_ID = 0x73
VOLCANO_STAFF_ID = 0x74
MARAUDER_ID = 0x75
PEACOCK_TALON_ID = 0x76
DARK_MOON_FLUTE_ID = 0x77
BLACK_SHADOW_ID = 0x78
OVERLORD_ID = 0x79
DOUBLE_COMET_ID = 0x7A
TORNADO_STAFF_ID = 0x7B
KING_OF_BEASTS_ID = 0x7C
MAGMA_WHEEL_ID = 0x7D
TRUE_BEAUTY_ID = 0x7E
TRUE_GRACE_ID = 0x7F
FU_XI_SWORD_ID = 0x80
NU_WA_RAPIER_ID = 0x81
WAR_DRAGON_ID = 0x82
DIVINE_DRAGON_ID = 0x83
SERPENT_BLADE_ID = 0x84
TEMPEST_SWORD_ID = 0x85
BEAST_AXE_ID = 0x86
EARTHLY_MACE_ID = 0x87
ELDER_MOON_ID = 0x88
FLASH_BLADE_ID = 0x89
TIGER_WOLF_ID = 0x8A
IMPERIAL_MACE_ID = 0x8B
GRIFFIN_FEATHER_ID = 0x8C
BLUE_STEEL_ID = 0x8D
DEMON_SLAYER_ID = 0x8E
DRAGON_CHAKRAM_ID = 0x8F
DRAGON_STAR_ID = 0x90
WOLF_BLADE_ID = 0x91
HEAVENLY_WOLF_ID = 0x92
BLACK_STEEL_ID = 0x93
IMPERIAL_SABER_ID = 0x94
LIGHTNING_SPEAR_ID = 0x95
MYSTIC_BLADE_ID = 0x96
MYSTIC_FANG_ID = 0x97
DRAGON_GOD_ID = 0x98
RAVEN_FEATHER_ID = 0x99
FIGHTING_TIGER_ID = 0x9A
SEVEN_SEAS_BLADE_ID = 0x9B
STARLIGHT_PIKE_ID = 0x9C
THUNDER_STAFF_ID = 0x9D
TIGER_FANG_ID = 0x9E
PHOENIX_TALON_ID = 0x9F
HALF_MOON_FLUTE_ID = 0xA0
SPIKED_MACE_ID = 0xA1
GOD_OF_WAR_ID = 0xA2
TWIN_STARS_ID = 0xA3
LIGHTNING_STAFF_ID = 0xA4
SHADOW_BEAST_ID = 0xA5
TRI_BLADE_ID = 0xA6
YELLOW_BEAUTY_ID = 0xA7
BLUE_GRACE_ID = 0xA8
DRAGON_SLAYER_ID = 0xA9
DRAGON_RAPIER_ID = 0xAA

FIRST_FIFTH_WEAPON = 0x82
LAST_FIFTH_WEAPON = 0xAA

OFFSET_FOR_WEAPONS = 24

Weapon_Name_Lookup =
{
    SWORD_ID : "Sword",
    STEEL_SWORD_ID : "Steel Sword",
    BROAD_SWORD_ID : "Broad Sword",
    LONG_SWORD_ID : "Long Sword",
    SCIMITAR_ID : "Scimitar",
    GREAT_SCIMITAR_ID : "Great Scimitar",
    SPEAR_ID : "Spear",
    LONG_SPEAR_ID : "Long Spear",
    HALBERD_ID : "Halberd",
    GREAT_HALBERD_ID : "Great Halberd",
    HAND_AXE_ID : "Hand Axe",
    STRIKE_AXE_ID : "Strike Axe",
    CLUB_ID : "Club",
    SPIKED_CLUB_ID : "Spiked Club",
    TWIN_SABERS_ID : "Twin Sabers",
    WING_SABERS_ID : "Wing Sabers",
    TWIN_RODS_ID : "Twin Rods",
    SPIRAL_RODS_ID : "Spiral Rods",
    MACE_ID : "Mace",
    GREAT_MACE_ID : "Great Mace",
    WAR_FAN_ID : "War Fan",
    WARLORD_FAN_ID : "Warlord Fan",
    CHAKRAM_ID : "Chakram",
    CRESCENT_CHAKRAM_ID : "Crescent Chakram",
    BATTLE_AXE_ID : "Battle Axe",
    WAR_AXE_ID : "War Axe",
    BRONZE_CLAW_ID : "Bronze Claw",
    STEEL_CLAW_ID : "Steel Claw",
    IRON_FLUTE_ID : "Iron Flute",
    STEEL_FLUTE_ID : "Steel Flute",
    IRON_ROD_ID : "Iron Rod",
    STEEL_ROD_ID : "Steel Rod",
    TONFA_ID : "Tonfa",
    STUDDED_TONFA_ID : "Studded Tonfa",
    DOUBLE_VOULGE_ID : "Double Voulge",
    STRIKE_VOULGE_ID : "Strike Voulge",
    STAFF_ID : "Staff",
    MIRAGE_STAFF_ID : "Mirage Staff",
    NANMAN_GAUNTLET_ID : "Nanman Gauntlet",
    BEAST_GAUNTLET_ID : "Beast Gauntlet",
    BOOMERANG_ID : "Boomerang",
    HAWK_BOOMERANG_ID : "Hawk Boomerang",
    TWIN_FANS_ID : "Twin Fans",
    VIOLET_FANS_ID : "Violet Fans",
    BASTARD_SWORD_ID : "Bastard Sword",
    GREAT_SWORD_ID : "Great Sword",
    RAPIER_ID : "Rapier",
    SWIFT_RAPIER_ID : "Swift Rapier",
    DRAGON_SPEAR_ID : "Dragon Spear",
    BLUE_DRAGON_ID : "Blue Dragon",
    SNAKE_BLADE_ID : "Snake Blade",
    KIRIN_SWORD_ID : "Kirin Sword",
    BULL_ID : "Bull",
    BONE_CRUSHER_ID : "Bone Crusher",
    ELDER_SWORD_ID : "Elder Sword",
    EAGLE_ID : "Eagle",
    WOLF_SLAYER_ID : "Wolf Slayer",
    GOLD_ORB_ID : "Gold Orb",
    WHITE_FEATHER_ID : "White Feather",
    SWORD_OF_HEAVEN_ID : "Sword of Heaven",
    SKY_PIERCER_ID : "Sky Piercer",
    LUNA_CHAKRAM_ID : "Luna Chakram",
    GOLD_DRAGON_ID : "Gold Dragon",
    LONE_WOLF_ID : "Lone Wolf",
    KING_WOLF_ID : "King Wolf",
    STAR_SWORD_ID : "Star Sword",
    MASTER_SWORD_ID : "Master Sword",
    STEEL_STALLION_ID : "Steel Stallion",
    SAGE_SWORD_ID : "Sage Sword",
    DEMON_SWORD_ID : "Demon Sword",
    DRAGON_BLADE_ID : "Dragon Blade",
    BLACK_FEATHER_ID : "Black Feather",
    TIGER_HOOK_ID : "Tiger Hook",
    RIVER_MASTER_ID : "River Master",
    VAPOR_ID : "Vapor",
    STAFF_OF_FIRE_ID : "Staff of Fire",
    DESTROYER_ID : "Destroyer",
    PEACOCK_CLAW_ID : "Peacock Claw",
    MOON_FLUTE_ID : "Moon Flute",
    SHADOW_ROD_ID : "Shadow Rod",
    CONQUEROR_ID : "Conqueror",
    DOUBLE_STAR_ID : "Double Star",
    STAFF_OF_WIND_ID : "Staff of Wind",
    BEAST_MASTER_ID : "Beast Master",
    FIRE_WHEEL_ID : "Fire Wheel",
    BEAUTY_ID : "Beauty",
    GRACE_ID : "Grace",
    HOLY_AVENGER_ID : "Holy Avenger",
    CELESTIAL_BLADE_ID : "Celestial Blade",
    FIERCE_DRAGON_ID : "Fierce Dragon",
    BLUE_MOON_DRAGON_ID : "Blue Moon Dragon",
    VIPER_BLADE_ID : "Viper Blade",
    KIRIN_FANG_ID : "Kirin Fang",
    MAD_BULL_ID : "Mad Bull",
    STONE_CRUSHER_ID : "Stone Crusher",
    ANCIENTS_SWORD_ID : "Ancients Sword",
    FALCON_ID : "Falcon",
    TIGER_SLAYER_ID : "Tiger Slayer",
    GOLD_GLOBE_ID : "Gold Globe",
    PEACOCK_FEATHER_ID : "Peacock Feather",
    WRATH_OF_HEAVEN_ID : "Wrath Of Heaven",
    SKY_SCORCHER_ID : "Sky Scorcher",
    SOL_CHAKRAM_ID : "Sol Chakram",
    GOLD_MOON_DRAGON_ID : "Gold Moon Dragon",
    SAVAGE_WOLF_ID : "Savage Wolf",
    MASTER_WOLF_ID : "Master Wolf",
    GRAND_STAR_ID : "Grand Star",
    GRAND_MASTER_ID : "Grand Master",
    STEEL_DRAGON_ID : "Steel Dragon",
    ORACLE_SWORD_ID : "Oracle Sword",
    DEMON_FANG_ID : "Demon Fang",
    DRAGON_BREATH_ID : "Dragon Breath",
    DARK_FEATHER_ID : "Dark Feather",
    WHITE_TIGER_ID : "White Tiger",
    SEA_MASTER_ID : "Sea Master",
    BLINK_ID : "Blink",
    VOLCANO_STAFF_ID : "Volcano Staff",
    MARAUDER_ID : "Marauder",
    PEACOCK_TALON_ID : "Peacock Talon",
    DARK_MOON_FLUTE_ID : "Dark Moon Flute",
    BLACK_SHADOW_ID : "Black Shadow",
    OVERLORD_ID : "Overlord",
    DOUBLE_COMET_ID : "Double Comet",
    TORNADO_STAFF_ID : "Tornado Staff",
    KING_OF_BEASTS_ID : "King Of Beasts",
    MAGMA_WHEEL_ID : "Magma Wheel",
    TRUE_BEAUTY_ID : "True Beauty",
    TRUE_GRACE_ID : "True Grace",
    FU_XI_SWORD_ID : "Fu Xi's Sword",
    NU_WA_RAPIER_ID : "Nu Wa's Rapier",
    WAR_DRAGON_ID : "War Dragon",
    DIVINE_DRAGON_ID : "Divine Dragon",
    SERPENT_BLADE_ID : "Serpent Blade",
    TEMPEST_SWORD_ID : "Tempest Sword",
    BEAST_AXE_ID : "Beast Axe",
    EARTHLY_MACE_ID : "Earthly Mace",
    ELDER_MOON_ID : "Elder Moon",
    FLASH_BLADE_ID : "Flash Blade",
    TIGER_WOLF_ID : "Tiger Wolf",
    IMPERIAL_MACE_ID : "Imperial Mace",
    GRIFFIN_FEATHER_ID : "Griffin Feather",
    BLUE_STEEL_ID : "Blue Steel",
    DEMON_SLAYER_ID : "Demon Slayer",
    DRAGON_CHAKRAM_ID : "Dragon Chakram",
    DRAGON_STAR_ID : "Dragon Star",
    WOLF_BLADE_ID : "Wolf Blade",
    HEAVENLY_WOLF_ID : "Heavenly Wolf",
    BLACK_STEEL_ID : "Black Steel",
    IMPERIAL_SABER_ID : "Imperial Saber",
    LIGHTNING_SPEAR_ID : "Lightning Spear",
    MYSTIC_BLADE_ID : "Mystic Blade",
    MYSTIC_FANG_ID : "Mystic Fang",
    DRAGON_GOD_ID : "Dragon God",
    RAVEN_FEATHER_ID : "Raven Feather",
    FIGHTING_TIGER_ID : "Fighting Tiger",
    SEVEN_SEAS_BLADE_ID : "Seven Seas Blade",
    STARLIGHT_PIKE_ID : "Starlight Pike",
    THUNDER_STAFF_ID : "Thunder Staff",
    TIGER_FANG_ID : "Tiger Fang",
    PHOENIX_TALON_ID : "Phoenix Talon",
    HALF_MOON_FLUTE_ID : "Half Moon Flute",
    SPIKED_MACE_ID : "Spiked Mace",
    GOD_OF_WAR_ID : "God Of War",
    TWIN_STARS_ID : "Twin Stars",
    LIGHTNING_STAFF_ID : "Lightning Staff",
    SHADOW_BEAST_ID : "Shadow Beast",
    TRI_BLADE_ID : "Tri Blade",
    YELLOW_BEAUTY_ID : "Yellow Beauty",
    BLUE_GRACE_ID : "Blue Grace",
    DRAGON_SLAYER_ID : "Dragon Slayer",
    DRAGON_RAPIER_ID : "Dragon Rapier"
}

// $2B03AA: (16-bit) First Weapon Item Type.
//          
//          0xab00 = Unowned.
//          0x0000 = This weapon
//          0x0101 = The second weapon and so on.
//          0xaaaa = The Final wepaon
//          
//          Note The second is item type, the first is high combo or such, but it doesn't matter too much for what we do with this.
function ItemTypeLocation() => word(0x2B03AA)
FIRST_TYPE_WEAPON_OWNED_MEMORY_LOCATION = 0x2B03AA

function WeaponOwnedCheck(index) => word(FIRST_TYPE_WEAPON_OWNED_MEMORY_LOCATION + (index * OFFSET_FOR_WEAPONS)) == (index * 0x101)

function justUnlockedWeapon(index) => !prev(WeaponOwnedCheck(index)) &&
                                      WeaponOwnedCheck(index)

// $2B13A8: (Array of 10 16-bit Values) BG Equipments
//          
//          SImilar to the normal Items.     Starts with Index (Always the same or 28 if None) And then power.   0x9 likely doesn't have a power.
//          
//          0x00 = BG Peacock Urn
//          0x01 = BG Dragon Amulet
//          0x02 = BG Tiger Amulet
//          0x03 = BG Tortoise Amulet
//          0x04 = Huang's Bow(BG)
//          0x05 = BG Shell Armor
//          0x06 = BG Speed Scroll
//          0x07 = BG Wind Scroll
//          0x08 = BG Elixer
//          0x09 = BG Healing Scroll
function BGEquipmentArray() => word(0x2B13A8)

BGEQUIPMENT_MEMORY_LOCATION = 0x2B13A8

function bgItemsLevelLookup(itemId) => byte(BGEQUIPMENT_MEMORY_LOCATION + itemId * 2 + 1)
function bgItemsIdLookup(itemId) => byte(BGEQUIPMENT_MEMORY_LOCATION + itemId * 2)

BG_PEACOCK_URN_ID = 0x00
BG_DRAGON_AMULET_ID = 0x01
BG_TIGER_AMULET_ID = 0x02
BG_TORTOISE_AMULET_ID = 0x03
BG_HUANGS_BOW_ID = 0x04
BG_SHELL_ARMOR_ID = 0x05
BG_SPEED_SCROLL_ID = 0x06
BG_WIND_SCROLL_ID = 0x07
BG_ELIXER_ID = 0x08
BG_HEALING_SCROLL_ID = 0x09

BodyguardCommonItems = range(BG_PEACOCK_URN_ID, BG_ELIXER_ID)
BodyguardRedItems = [BG_HEALING_SCROLL_ID]

Bodyguard_Item_lookup =
{
    BG_PEACOCK_URN_ID : "BG Peacock Urn",
    BG_DRAGON_AMULET_ID : "BG Dragon Amulet",
    BG_TIGER_AMULET_ID : "BG Tiger Amulet",
    BG_TORTOISE_AMULET_ID : "BG Tortoise Amulet",
    BG_HUANGS_BOW_ID : "Huang's Bow (BG)",
    BG_SHELL_ARMOR_ID : "BG Shell Armor",
    BG_SPEED_SCROLL_ID : "BG Speed Scroll",
    BG_WIND_SCROLL_ID : "BG Wind Scroll",
    BG_ELIXER_ID : "BG Elixer",
    BG_HEALING_SCROLL_ID : "BG Healing Scroll"
}



// $2B13C0: (Array of 15 Weapons each with 24 bytes) Body Guard Weapons.
//          
//          Starts with 5 16 byte info, (only 3 might be used?)  Pairing of weapon bonus type and power.  followed by 0x00, and then 8 bits for Weapon type.   There appears to be a lot of empty values, but the next weapon starts after 24 bytes)
//          
//          0x00 = Iron Sword
//          0x01 = Long Sword
//          0x02 = Elder Sword
//          0x03 = Spear
//          0x04 = Dragon Spear
//          0x05 = Crescent Blade
//          0x06 = Long Pike
//          0x07 = Heavenly Spear
//          0x08 = Tiger's Chin
//          0x09 = Iron Bow
//          0x0a = Steel Bow
//          0x0b = Gale Bow
//          0x0c = Iron Crossbow
//          0x0d = Steel Crossbow
//          0x0e = Wing Crossbow
//          
//          0x00 = HP Max
//          0x01 = Musou Max
//          0x02 = Attack
//          0x03 = Defense
//          0x04 = Bow Attack
//          0x05 = Bow Defense
//          0x06 = Speed
//          0x07 = Reach
//          0x08 = Musou Increase
//          0x28 = Not used
function BGWeaponsArray() => byte(0x2B13C0)

BG_WEAPON_ARRAY_MEMORY_LOCATION = 0x2B13C0
SIZE_OF_BG_WEAPON = 24

// $2B13CB: (8-bit) Value for First Body Guard Weapon
//
//          It's the value for the current weapon (0x00 here) or 0xab if unowned)
//
//          0x00 = Iron Sword
//          0x01 = Long Sword
//          0x02 = Elder Sword
//          0x03 = Spear
//          0x04 = Dragon Spear
//          0x05 = Crescent Blade
//          0x06 = Long Pike
//          0x07 = Heavenly Spear
//          0x08 = Tiger's Chin
//          0x09 = Iron Bow
//          0x0a = Steel Bow
//          0x0b = Gale Bow
//          0x0c = Iron Crossbow
//          0x0d = Steel Crossbow
//          0x0e = Wing Crossbow
//          0xab = Unowned
function FirstBodyguardWeaponValue() => byte(0x2B13CB)

BODYGUARD_WEAPON_MEMORY_LOCATION = 0x2B13CB

function BGWeaponOwnedCheck(index) => byte(BODYGUARD_WEAPON_MEMORY_LOCATION + (SIZE_OF_BG_WEAPON * index)) == index


IRON_SWORD_ID = 0x00
LONG_SWORD_ID = 0x01
ELDER_SWORD_ID = 0x02
SPEAR_ID = 0x03
DRAGON_SPEAR_ID = 0x04
CRESCENT_BLADE_ID = 0x05
LONG_PIKE_ID = 0x06
HEAVENLY_SPEAR_ID = 0x07
TIGERS_CHIN_ID = 0x08
IRON_BOW_ID = 0x09
STEEL_BOW_ID = 0x0A
GALE_BOW_ID = 0x0B
IRON_CROSSBOW_ID = 0x0C
STEEL_CROSSBOW_ID = 0x0D
WING_CROSSBOW_ID = 0x0E

BG_Weapon_Name_Lookup =
{
    IRON_SWORD_ID : "Iron Sword",
    LONG_SWORD_ID : "Long Sword",
    ELDER_SWORD_ID : "Elder Sword",
    SPEAR_ID : "Spear",
    DRAGON_SPEAR_ID : "Dragon Spear",
    CRESCENT_BLADE_ID : "Crescent Blade",
    LONG_PIKE_ID : "Long Pike",
    HEAVENLY_SPEAR_ID : "Heavenly Spear",
    TIGERS_CHIN_ID : "Tiger's Chin",
    IRON_BOW_ID : "Iron Bow",
    STEEL_BOW_ID : "Steel Bow",
    GALE_BOW_ID : "Gale Bow",
    IRON_CROSSBOW_ID : "Iron Crossbow",
    STEEL_CROSSBOW_ID : "Steel Crossbow",
    WING_CROSSBOW_ID : "Wing Crossbow"
}

BG_SWORD_CATEGORY = 0x00
BG_SPEAR_CATEGORY = 0x01
BG_PIKE_CATEGORY = 0x02
BG_BOW_CATEGORY = 0x03
BG_CROSSBOW_CATEGORY = 0x04

BG_CATEGORY_LOOKUP =
{
    BG_SWORD_CATEGORY : "Sword",
    BG_SPEAR_CATEGORY : "Spear",
    BG_PIKE_CATEGORY : "Pike",
    BG_BOW_CATEGORY : "Bow",
    BG_CROSSBOW_CATEGORY : "Crossbow"
}

// There's three in a category, but you immediately get the first. 
function BGCategorytoArray(category) => [category * 3 + 1, category * 3 + 2]

// $2B15D4: (32-bit) First Bodyguard Unit Experience
//
// Experience goes up to 99999. This updates after the count up (but before the save).
//
// Bodyguard Experience Milestones:
//   1000    - +1 Defense
//   2000    - +1 Defense
//   4000    - +1 Defense
//   6000    - +1 Rank
//   8000    - +1 Defense
//  10000    - +1 Rank
//  13000    - +1 Defense
//  16000    - +1 Rank
//  19000    - +1 Defense
//  23000    - +1 Defense
//  25000    - Increase to 4 bodyguards
//  27000    - +1 Defense
//  30000    - "Fighter" Title
//  31000    - +1 Defense
//  35000    - +1 Defense
//  39000    - +1 Defense
//  44000    - +1 Attack
//  49000    - +1 Life/Musou
//  50000    - Increase to 6 bodyguards
//  54000    - +1 Attack
//  59000    - +1 Life/Musou
//  60000    - "Warrior" Title
//  64000    - +1 Attack
//  69000    - +1 Life/Musou
//  75000    - Increase to 8 bodyguards
//  75000    - +1 Attack
//  81000    - +1 Life/Musou
//  87000    - +1 Attack
//  90000    - "Elite" Title
//  93000    - +1 Life/Musou
//  99999    - +1 Attack

function FirstBodyguardUnitExperience() => dword(0x2B15D4)
FIRST_BODYGUARD_EXPERIENCE_MEMORY_LOCATION = 0x2B15D4

// $2B1684: (32-bit) Second Bodyguard Unit Experience
SECOND_BODYGUARD_EXPERIENCE_MEMORY_LOCATION = 0x2B1684
BODYGUARD_EXPERIENCE_OFFSET = 0xB0

function BodyguardExperienceLookup(index) => FIRST_BODYGUARD_EXPERIENCE_MEMORY_LOCATION + (index * BODYGUARD_EXPERIENCE_OFFSET)

function justPassedExperienceLevel(target) => any_of(range (0, 3), i => prev(dword(BodyguardExperienceLookup(i))) < target && dword(BodyguardExperienceLookup(i)) >= target)

BODYGUARD_TITLES = 
{
    30000 : "Fighter",
    60000 : "Warrior",
    90000 : "Elite"
}

MAX_BODYGUARD_EXPERIENCE = 99999


// $2D0398: (32-bit): Player's faction during stage.
//
//          Changing this modifies the team's name on the pause menu.
//
//          Values:
//          0x00 = Han Forces
//          0x01 = Allied Forces
//          0x02 = Wei Forces
//          0x03 = Wu Forces
//          0x04 = Shu Forces
//          0x05 = Yellow Turbans
//          0x06 = Nanman Forces
//          0x07 = Cao Cao's Forces
//          0x08 = Sun Jian's Forces
//          0x09 = Sun Ce's Forces
//          0x0a = Sun Quan's Forces
//          0x0b = Liu Bei's Forces
//          0x0c = Guan Yu's Forces
//          0x0d = Dong Zhuo's Forces
//          0x0e = Yuan Shao's Forces
//          0x0f = Zhang Xiu's Forces
//          0x10 = Liu Biao's Forces
//          0x11 = Liu Zhang's Forces
//          0x12 = Bandits
//          0x13 = Rogues
//          0x14 = Pirates
//          0x15 = Diao Chan's Forces
//          0x16 = Lu Bu's Forces
//          0x17 = Nanman Forces (again)
//          0x18 = Nanman Forces (third time)
function PlayerFaction() => dword(0x2D0398)


// Faction IDs
NO_FACTION_ID = 0xff
HAN_FORCES_FACTION_ID = 0x00 
ALLIED_FORCES_FACTION_ID = 0x01 
WEI_FORCES_FACTION_ID = 0x02 
WU_FORCES_FACTION_ID = 0x03 
SHU_FORCES_FACTION_ID = 0x04 
YELLOW_TURBAN_FACTION_ID = 0x05 
NANMAN_FORCES_FACTION_ID = 0x06 
CAO_CAO_FORCES_FACTION_ID = 0x07 
SUN_JIAN_FORCES_FACTION_ID = 0x08 
SUN_CE_FORCES_FACTION_ID = 0x09 
SUN_QUAN_FORCES_FACTION_ID = 0x0a 
LIU_BEI_FORCES_FACTION_ID = 0x0b 
GUAN_YU_FORCES_FACTION_ID = 0x0c 
DONG_ZHUO_FORCES_FACTION_ID = 0x0d 
YUAN_SHAO_FORCES_FACTION_ID = 0x0e 
ZHANG_XIU_FORCES_FACTION_ID = 0x0f 
LIU_BIAO_FORCES_FACTION_ID = 0x10 
LIU_ZHANG_FORCES_FACTION_ID = 0x11 
BANDITS_FACTION_ID = 0x12 
ROGUES_FACTION_ID = 0x13 
PIRATES_FACTION_ID = 0x14 
DIAO_CHAN_FORCES_FACTION_ID = 0x15
LU_BU_FORCES_FACTION_ID = 0x16
MENG_HUO_FORCES_FACTION_ID = 0x17 // Listed asz Nanman Forces Siege of He Fei, but this is Meng Huo's forces in the game.
ZHU_RONG_FORCES_FACTION_ID = 0x18 // Listed as Nanman Forces in the game, but this is Zhu Rong's Forces are used in the game.  This is the one that appears in the Battle of He Fei.

// Faction Names
FactionNameLookup = 
{
    HAN_FORCES_FACTION_ID: "Han",
    ALLIED_FORCES_FACTION_ID: "Allies",
    WEI_FORCES_FACTION_ID: "Wei",
    WU_FORCES_FACTION_ID: "Wu",
    SHU_FORCES_FACTION_ID: "Shu",
    YELLOW_TURBAN_FACTION_ID: "Yellow Turbans",
    NANMAN_FORCES_FACTION_ID: "Nanman",
    CAO_CAO_FORCES_FACTION_ID: "Cao Cao",
    SUN_JIAN_FORCES_FACTION_ID: "Sun Jian",
    SUN_CE_FORCES_FACTION_ID: "Sun Ce",
    SUN_QUAN_FORCES_FACTION_ID: "Sun Quan",
    LIU_BEI_FORCES_FACTION_ID: "Liu Bei",
    GUAN_YU_FORCES_FACTION_ID: "Guan Yu",
    DONG_ZHUO_FORCES_FACTION_ID: "Dong Zhuo",
    YUAN_SHAO_FORCES_FACTION_ID: "Yuan Shao",
    ZHANG_XIU_FORCES_FACTION_ID: "Zhang Xiu",
    LIU_BIAO_FORCES_FACTION_ID: "Liu Biao",
    LIU_ZHANG_FORCES_FACTION_ID: "Liu Zhang",
    BANDITS_FACTION_ID: "Bandits",
    ROGUES_FACTION_ID: "Rogues",
    PIRATES_FACTION_ID: "Pirates",
    DIAO_CHAN_FORCES_FACTION_ID: "Diao Chan",
    LU_BU_FORCES_FACTION_ID: "Lu Bu",
    MENG_HUO_FORCES_FACTION_ID: "Meng Huo",
    ZHU_RONG_FORCES_FACTION_ID: "Zhu Rong"
}

FactionForcesLookup = 
{
    HAN_FORCES_FACTION_ID: "Han Forces",
    ALLIED_FORCES_FACTION_ID: "Allied Forces",
    WEI_FORCES_FACTION_ID: "Wei Forces",
    WU_FORCES_FACTION_ID: "Wu Forces",
    SHU_FORCES_FACTION_ID: "Shu Forces",
    YELLOW_TURBAN_FACTION_ID: "Yellow Turbans",
    NANMAN_FORCES_FACTION_ID: "Nanman Forces",
    CAO_CAO_FORCES_FACTION_ID: "Cao Cao's Forces",
    SUN_JIAN_FORCES_FACTION_ID: "Sun Jian's Forces",
    SUN_CE_FORCES_FACTION_ID: "Sun Ce's Forces",
    SUN_QUAN_FORCES_FACTION_ID: "Sun Quan's Forces",
    LIU_BEI_FORCES_FACTION_ID: "Liu Bei's Forces",
    GUAN_YU_FORCES_FACTION_ID: "Guan Yu's Forces",
    DONG_ZHUO_FORCES_FACTION_ID: "Dong Zhuo's Forces",
    YUAN_SHAO_FORCES_FACTION_ID: "Yuan Shao's Forces",
    ZHANG_XIU_FORCES_FACTION_ID: "Zhang Xiu's Forces",
    LIU_BIAO_FORCES_FACTION_ID: "Liu Biao's Forces",
    LIU_ZHANG_FORCES_FACTION_ID: "Liu Zhang's Forces",
    BANDITS_FACTION_ID: "Bandits",
    ROGUES_FACTION_ID: "Rogues",
    PIRATES_FACTION_ID: "Pirates",
    DIAO_CHAN_FORCES_FACTION_ID: "Diao Chan's Forces",
    LU_BU_FORCES_FACTION_ID: "Lu Bu's Forces",
    MENG_HUO_FORCES_FACTION_ID: "Meng Huo's Forces",
    ZHU_RONG_FORCES_FACTION_ID: "Zhu Rong's Forces"
}



// $2D0640: (32-bit) Main Player Pointer
//          
//          +0x250=(8-bit) Arrow Count
//          
//          Note other locations appear to be 0x003022d0, 0x0030262c, 0x00334968, 0x003497b0, 0x004b03c 0,0x004b03c4
function MainPlayerPointer() => byte(0x2D0640)
// $2D0760: (32-bit) Loading Musou stage indicator 1
//
//          This is the indicators for when loading a stage (continuing)
//          0x0440 = Loading musou Stage. Maybe others
function LoadingMusouStageIndicator1() => dword(0x2D0760)

// $2D0760: (32-bit) Loading Musou stage indicator 1
//
//          This is the indicator for when loading a stage (continuing)
//          0x0440 = Loading Musou Stage. Maybe others
function LoadingMusouStageIndicator1() => dword(0x2D0760)
LOADING_MUSOU_STAGE_INDICATOR1_VALUE = 0x0440

// $2D0768: (32-bit) Loading Musou stage indicator 2
//
//          This is the indicator for when loading a stage (continuing)
//          0x01c0 = Loading Musou Stage. Maybe others
function LoadingMusouStageIndicator2() => dword(0x2D0768)
LOADING_MUSOU_STAGE_INDICATOR2_VALUE = 0x01c0

// Helper function to check if both Musou stage indicator is loading
function IsLoadingMusouStage() => 
    LoadingMusouStageIndicator1() == LOADING_MUSOU_STAGE_INDICATOR1_VALUE &&
    LoadingMusouStageIndicator2() == LOADING_MUSOU_STAGE_INDICATOR2_VALUE


// $2D07AC: (8-bit) Xtreme Mode Indicator.
//          
//          0x00 = Original Mode
//          0x01 = Xtreme Mode.
//          
//          Basically rename levels to the XTREME names.  Battle of Ru Nan when 0x01
function XtremeModeIndicator() => byte(0x2D07AC)

ORIGINAL_MODE_ID = 0x00
XTREME_MODE_ID = 0x01

function IsOriginalMode() => XtremeModeIndicator() == ORIGINAL_MODE_ID
function IsXtremeMode() => XtremeModeIndicator() == XTREME_MODE_ID
// $2D0E64: (32-bit) Alternate Demo Indicator
//
//          0x0000 = In game or menu
//          0x0395 = In demo (or video)
//          Other values: counting up to 0x0395.
//          May be 0x10 or 0x13 on entering a game
function DemoIndicator() => dword(0x2D0E64)

DEMO_VALUE = 0x0395

function IsDemoMode() => DemoIndicator() == DEMO_VALUE
function IsInGame() => DemoIndicator() != DEMO_VALUE

// $2D13EC: (8-bit) Challenge Mode for Xtreme Mode selector
//
//          0x00 = Speed Demon
//          0x01 = Balancing Act
//          0x02 = Combo Master
//          0x03 = Iron Man
//
//          0x2D141C or 0x2D142C may also be relevant.
//
//          Note: The Original mode also works here, but achievements are only for Xtreme mode.
//          Use 0x2D07AC to check if this is Xtreme mode.
function ChallengeModeSelector() => byte(0x2D13EC)

XtremeChallengeLookUp = 
{
    0x00 : "Speed Demon",
    0x01 : "Balancing Act",
    0x02 : "Combo Master",
    0x03 : "Iron Man"
}

OriginalChallengeLookUp = 
{
    0x00 : "Endurance",
    0x01 : "Time Attack"
}

// $334900: (32-bit) Time for current stage
//
//          60 Frames per second
function getStageTime() => dword(0x334900)

// Helper to get seconds elapsed in the current stage
function getSecondsElapsed() => getStageTime() / 60

// $33490D: (8-bit) Map/Level Index
//          
//          This is the index of the Map that the player is currently on.  This is a control so freezing this means you appear on the same map.  NOTE It doesn't modify the level, so the characters are laid out the same at the original game, but the map is where ever you expect to be.
//          
//          I'm lazy so the first 16 is the RAScript Values.
//          
//          YellowTurbanRebellionStageID = 0x00
//          BattleAtHuLaoGateStageID = 0x01
//          SurpriseAttackOnLiuBiaoStageID = 0x02
//          BattleAtWanCastleStageID = 0x03
//          AssaultOnTheWuTerritoryStageID = 0x04
//          BattleAtGuanDuStageID = 0x05
//          GuanYusEscapeStageID = 0x06
//          BattleOfChangBanStageID = 0x07
//          BattleOfChiBiStageID = 0x08
//          AssaultOnChengDuStageID = 0x09
//          BattleAtTongGateStageID = 0x0a
//          BattleAtHeFeiStageID = 0x0b
//          BattleAtFanCastleStageID = 0x0c
//          BattleOfMtDingJunStageID = 0x0d
//          BattleAtYiLingStageID = 0x0e
//          NanmanCampaignStageID = 0x0f
//          BattleOfJieTingStageID = 0x10
//          BattleAtYouTingStageID = 0x11
//          SiegeAtHeFeiCastleStageID = 0x12
//          BattleAtWuZhangPlainsStageID = 0x13
//          MountainBanditCampaignStageID = 0x14
//          RaidontheRogueFortressStageID = 0x15
//          PirateAttackontheHighSeasStageID = 0x16
//          
//          These are the same levels with different names for XL levels.
//          
//          0x00 = Battle of Ru Nan
//          0x06 = Diao Chan's Escape
//          0x07 = Wu Navy Skirmish
//          
//          
//          All others look the same.  Need to find the location to define if in Xtreme or not.
//          
//          All others are the same.
function MapIndex() => byte(0x33490D)

YELLOW_TURBAN_REBELLION_STAGE_ID = 0x00
BATTLE_AT_HU_LAO_GATE_STAGE_ID = 0x01
SURPRISE_ATTACK_ON_LIU_BIAO_STAGE_ID = 0x02
BATTLE_AT_WAN_CASTLE_STAGE_ID = 0x03
ASSAULT_ON_THE_WU_TERRITORY_STAGE_ID = 0x04
BATTLE_AT_GUAN_DU_STAGE_ID = 0x05
GUAN_YUS_ESCAPE_STAGE_ID = 0x06
BATTLE_OF_CHANG_BAN_STAGE_ID = 0x07
BATTLE_OF_CHI_BI_STAGE_ID = 0x08
ASSAULT_ON_CHENG_DU_STAGE_ID = 0x09
BATTLE_AT_TONG_GATE_STAGE_ID = 0x0A
BATTLE_AT_HE_FEI_STAGE_ID = 0x0B
BATTLE_AT_FAN_CASTLE_STAGE_ID = 0x0C
BATTLE_OF_MT_DING_JUN_STAGE_ID = 0x0D
BATTLE_AT_YI_LING_STAGE_ID = 0x0E
NANMAN_CAMPAIGN_STAGE_ID = 0x0F
BATTLE_OF_JIE_TING_STAGE_ID = 0x10
BATTLE_AT_YOU_TING_STAGE_ID = 0x11
SIEGE_AT_HE_FEI_CASTLE_STAGE_ID = 0x12
BATTLE_AT_WU_ZHANG_PLAINS_STAGE_ID = 0x13
MOUNTAIN_BANDIT_CAMPAIGN_STAGE_ID = 0x14
RAID_ON_THE_ROGUE_FORTRESS_STAGE_ID = 0x15
PIRATE_ATTACK_ON_THE_HIGH_SEAS_STAGE_ID = 0x16
OUT_OF_BOUNDS_STAGE_ID = 0x17 

OriginalMapNameLookup = 
{
    YELLOW_TURBAN_REBELLION_STAGE_ID : "Yellow Turban Rebellion",
    BATTLE_AT_HU_LAO_GATE_STAGE_ID : "Battle at Hu Lao Gate",
    SURPRISE_ATTACK_ON_LIU_BIAO_STAGE_ID : "Surprise Attack on Liu Biao",
    BATTLE_AT_WAN_CASTLE_STAGE_ID : "Battle at Wan Castle",
    ASSAULT_ON_THE_WU_TERRITORY_STAGE_ID : "Assault on the Wu Territory",
    BATTLE_AT_GUAN_DU_STAGE_ID : "Battle at Guan Du",
    GUAN_YUS_ESCAPE_STAGE_ID : "Guan Yu's Escape",
    BATTLE_OF_CHANG_BAN_STAGE_ID : "Battle of Chang Ban",
    BATTLE_OF_CHI_BI_STAGE_ID : "Battle of Chi Bi",
    ASSAULT_ON_CHENG_DU_STAGE_ID : "Assault on Cheng Du",
    BATTLE_AT_TONG_GATE_STAGE_ID : "Battle at Tong Gate",
    BATTLE_AT_HE_FEI_STAGE_ID : "Battle at He Fei",
    BATTLE_AT_FAN_CASTLE_STAGE_ID : "Battle at Fan Castle",
    BATTLE_OF_MT_DING_JUN_STAGE_ID : "Battle of Mt. Ding Jun",
    BATTLE_AT_YI_LING_STAGE_ID : "Battle at Yi Ling",
    NANMAN_CAMPAIGN_STAGE_ID : "Nanman Campaign",
    BATTLE_OF_JIE_TING_STAGE_ID : "Battle of Jie Ting",
    BATTLE_AT_YOU_TING_STAGE_ID : "Battle at You Ting",
    SIEGE_AT_HE_FEI_CASTLE_STAGE_ID : "Siege at He Fei Castle",
    BATTLE_AT_WU_ZHANG_PLAINS_STAGE_ID : "Battle at Wu Zhang Plains",
    MOUNTAIN_BANDIT_CAMPAIGN_STAGE_ID : "Mountain Bandit Campaign",
    RAID_ON_THE_ROGUE_FORTRESS_STAGE_ID : "Raid on the Rogue Fortress",
    PIRATE_ATTACK_ON_THE_HIGH_SEAS_STAGE_ID : "Pirate Attack on the High Seas"
}

XtremeMapNameLookup = 
{
    YELLOW_TURBAN_REBELLION_STAGE_ID : "Battle of Ru Nan",
    BATTLE_AT_HU_LAO_GATE_STAGE_ID : "Battle at Hu Lao Gate",
    SURPRISE_ATTACK_ON_LIU_BIAO_STAGE_ID : "Surprise Attack on Liu Biao",
    BATTLE_AT_WAN_CASTLE_STAGE_ID : "Battle at Wan Castle",
    ASSAULT_ON_THE_WU_TERRITORY_STAGE_ID : "Assault on the Wu Territory",
    BATTLE_AT_GUAN_DU_STAGE_ID : "Battle at Guan Du",
    GUAN_YUS_ESCAPE_STAGE_ID : "Diao Chan's Escape",
    BATTLE_OF_CHANG_BAN_STAGE_ID : "Wu Navy Skirmish",
    BATTLE_OF_CHI_BI_STAGE_ID : "Battle of Chi Bi",
    ASSAULT_ON_CHENG_DU_STAGE_ID : "Assault on Cheng Du",
    BATTLE_AT_TONG_GATE_STAGE_ID : "Battle at Tong Gate",
    BATTLE_AT_HE_FEI_STAGE_ID : "Battle at He Fei",
    BATTLE_AT_FAN_CASTLE_STAGE_ID : "Battle at Fan Castle",
    BATTLE_OF_MT_DING_JUN_STAGE_ID : "Battle of Mt. Ding Jun",
    BATTLE_AT_YI_LING_STAGE_ID : "Battle at Yi Ling",
    NANMAN_CAMPAIGN_STAGE_ID : "Nanman Campaign",
    BATTLE_OF_JIE_TING_STAGE_ID : "Battle of Jie Ting",
    BATTLE_AT_YOU_TING_STAGE_ID : "Battle at You Ting",
    SIEGE_AT_HE_FEI_CASTLE_STAGE_ID : "Siege at He Fei Castle",
    BATTLE_AT_WU_ZHANG_PLAINS_STAGE_ID : "Battle at Wu Zhang Plains",
    MOUNTAIN_BANDIT_CAMPAIGN_STAGE_ID : "Mountain Bandit Campaign",
    RAID_ON_THE_ROGUE_FORTRESS_STAGE_ID : "Raid on the Rogue Fortress",
    PIRATE_ATTACK_ON_THE_HIGH_SEAS_STAGE_ID : "Pirate Attack on the High Seas" 
}


// $334944: (32-bit) First Player K.O. Count
//
//          Set to 0 on entering a stage, and counts up on each kill.
//          There's a similar number at 0x471924, but this is the main counter.
//          Also used for the Knock outs in Challenge Xtreme Balancing Act.
function getFirstPlayerStageKillCount() => dword(0x334944)


// $334970: (8-bit) Current Player Index.
//          
//          This is tied to the character model in game.  (Freezing it makes it impossible to change the character. Doesn't control the waepon, might not control everything but character model is a strong link. )
//          
//          Assumed to be the same as the DW3.  Not investigated beyond spot check (Zhao Yun, Zhurong, DiaoChan, and Lu bu match.)
//          
//          ZhaoYun = 0x00
//          GuanYu = 0x01
//          ZhangFei = 0x02
//          XiahouDun = 0x03
//          DianWei = 0x04
//          XuZhu = 0x05
//          ZhouYu = 0x06
//          LuXun = 0x07
//          TaishiCi = 0x08
//          DiaoChan = 0x09
//          ZhugeLiang = 0x0A
//          CaoCao = 0x0B
//          LuBu = 0x0C
//          SunShangXiang = 0x0D
//          LiuBei = 0x0E
//          SunJian = 0x0F
//          SunQuan = 0x10
//          DongZhuo = 0x11
//          YuanShao = 0x12
//          MaChao = 0x13
//          HuangZhong = 0x14
//          XiahouYuan = 0x15
//          ZhangLiao = 0x16
//          SimaYi = 0x17
//          LuMeng = 0x18
//          GanNing = 0x19
//          JiangWei = 0x1A
//          ZhangJiao = 0x1B
//          XuHuang = 0x1C
//          ZhangHe = 0x1D
//          ZhenJi = 0x1E
//          HuangGai = 0x1F
//          SunCe = 0x20
//          WeiYan = 0x21
//          PangTong = 0x22
//          MengHuo = 0x23
//          ZhuRong = 0x24
//          DaQiao = 0x25
//          XiaoQiao = 0x26
//          FuXi = 0x27
//          NuWa = 0x28
function CurrentPlayerID() => byte(0x334970)

ZHAO_YUN_ID = 0x00
GUAN_YU_ID = 0x01
ZHANG_FEI_ID = 0x02
XIAHOU_DUN_ID = 0x03
DIAN_WEI_ID = 0x04
XU_ZHU_ID = 0x05
ZHOU_YU_ID = 0x06
LU_XUN_ID = 0x07
TAISHI_CI_ID = 0x08
DIAO_CHAN_ID = 0x09
ZHUGE_LIANG_ID = 0x0A
CAO_CAO_ID = 0x0B
LU_BU_ID = 0x0C
SUN_SHANG_XIANG_ID = 0x0D
LIU_BEI_ID = 0x0E
SUN_JIAN_ID = 0x0F
SUN_QUAN_ID = 0x10
DONG_ZHUO_ID = 0x11
YUAN_SHAO_ID = 0x12
MA_CHAO_ID = 0x13
HUANG_ZHONG_ID = 0x14
XIAHOU_YUAN_ID = 0x15
ZHANG_LIAO_ID = 0x16
SIMA_YI_ID = 0x17
LU_MENG_ID = 0x18
GAN_NING_ID = 0x19
JIANG_WEI_ID = 0x1A
ZHANG_JIAO_ID = 0x1B
XU_HUANG_ID = 0x1C
ZHANG_HE_ID = 0x1D
ZHEN_JI_ID = 0x1E
HUANG_GAI_ID = 0x1F
SUN_CE_ID = 0x20
WEI_YAN_ID = 0x21
PANG_TONG_ID = 0x22
MENG_HUO_ID = 0x23
ZHU_RONG_ID = 0x24
DA_QIAO_ID = 0x25
XIAO_QIAO_ID = 0x26
FU_XI_ID = 0x27
NU_WA_ID = 0x28

CharacterNameLookup =
{
    ZHAO_YUN_ID : "Zhao Yun",
    GUAN_YU_ID : "Guan Yu",
    ZHANG_FEI_ID : "Zhang Fei",
    XIAHOU_DUN_ID : "Xiahou Dun",
    DIAN_WEI_ID : "Dian Wei",
    XU_ZHU_ID : "Xu Zhu",
    ZHOU_YU_ID : "Zhou Yu",
    LU_XUN_ID : "Lu Xun",
    TAISHI_CI_ID : "Taishi Ci",
    DIAO_CHAN_ID : "Diao Chan",
    ZHUGE_LIANG_ID : "Zhuge Liang",
    CAO_CAO_ID : "Cao Cao",
    LU_BU_ID : "Lu Bu",
    SUN_SHANG_XIANG_ID : "Sun Shangxiang",
    LIU_BEI_ID : "Liu Bei",
    SUN_JIAN_ID : "Sun Jian",
    SUN_QUAN_ID : "Sun Quan",
    DONG_ZHUO_ID : "Dong Zhuo",
    YUAN_SHAO_ID : "Yuan Shao",
    MA_CHAO_ID : "Ma Chao",
    HUANG_ZHONG_ID : "Huang Zhong",
    XIAHOU_YUAN_ID : "Xiahou Yuan",
    ZHANG_LIAO_ID : "Zhang Liao",
    SIMA_YI_ID : "Sima Yi",
    LU_MENG_ID : "Lu Meng",
    GAN_NING_ID : "Gan Ning",
    JIANG_WEI_ID : "Jiang Wei",
    ZHANG_JIAO_ID : "Zhang Jiao",
    XU_HUANG_ID : "Xu Huang",
    ZHANG_HE_ID : "Zhang He",
    ZHEN_JI_ID : "Zhen Ji",
    HUANG_GAI_ID : "Huang Gai",
    SUN_CE_ID : "Sun Ce",
    WEI_YAN_ID : "Wei Yan",
    PANG_TONG_ID : "Pang Tong",
    MENG_HUO_ID : "Meng Huo",
    ZHU_RONG_ID : "Zhu Rong",
    DA_QIAO_ID : "Da Qiao",
    XIAO_QIAO_ID : "Xiao Qiao",
    FU_XI_ID : "Fu Xi",
    NU_WA_ID : "Nu Wa"
}


// $334997: (8-bit) Number of Bodyguards selected
function NumberBodyGuardsSelected() => byte(0x334996)

// $334A00: (8-bit) Second Player.  (used for Real Presence)
function SecondPlayer() => byte(0x334A00)

// $334A0C: (8-bit) Control Value for 2 Player
//          
//          0x00 = 1 Player
//          0x01 = 2 Player
//          If frozen, camera is set to a random box.
//          
//          IS not set for Versus mode.
function TwoPlayerIndicator() => byte(0x334A0C)
SINGLE_PLAYER_VALUE = 0x00

function isSinglePlayer() => TwoPlayerIndicator() == SINGLE_PLAYER_VALUE
function isTwoPlayerMode() => TwoPlayerIndicator() != SINGLE_PLAYER_VALUE

// $334AF1: (8-bit) Stage Index for Musou Mode
//          
//          0x00 = First level
//          0x02 = Second level
//          0x06 = Seventh Stage
//          0x07 = Musou Finished. (Note this is for 7 stage characters)
function howManStagesBeat() => byte(0x334AF1)

function isFactionLeader(characterIndex) => characterIndex == SUN_JIAN_ID || 
                                            characterIndex == CAO_CAO_ID || 
                                            characterIndex == LIU_BEI_ID

function numberofMusouStages(characterIndex)
{
    // Check what number of musou Stages should be complete 
    // 
    // characterIndex: target ID for the character
    if (isFactionLeader(characterIndex))
    {
        return 10
    }
    else
    {
        return 7
    }
}

function isMusouModeComplete(characterIndex) => howManStagesBeat() >= numberofMusouStages(characterIndex) &&
                                                prev(howManStagesBeat()) == numberofMusouStages(characterIndex) - 1

function leaderboardCompleteCheck(characterIndex) => (howManStagesBeat() == 10 || 
                                        (!isFactionLeader(characterIndex) && 
                                         howManStagesBeat() == 7))
// $334AF4: (4-bit Low) Gameplay mode
//          
//          This does not get cleared when returning to main menu with select+Start quick reset.
//          
//          Note: This gets set for Demo Mode as well.
//          
//          0x0 = Main Menu not always,  see 0x0036595c
//          0x4 = Musou Mode
//          0x7 = Free Mode
//          0x9 = Versus Mode
//          0xa = Challenge Mode
function GameplayMode() => byte(0x334AF4)
MUSOU_MODE_VALUE = 0x04
FREE_MODE_VALUE = 0x07
VERSUS_MODE_VALUE = 0x09
CHALLENGE_MODE_VALUE = 0x0A

function IsInMusouMode() => (GameplayMode()) == MUSOU_MODE_VALUE
function IsInFreeMode() => (GameplayMode()) == FREE_MODE_VALUE
function IsInVersusMode() => (GameplayMode()) == VERSUS_MODE_VALUE
function IsInChallengeMode() => (GameplayMode()) == CHALLENGE_MODE_VALUE
function IsInMusouModeOrFreeMode() => IsInMusouMode() || 
                                      IsInFreeMode()
function IsInMusouModeFreeModeOrChallengeMode() => IsInMusouMode() || 
                                                   IsInFreeMode() || 
                                                   IsInChallengeMode()


// $334AF6: (8-bit) Bodyguard ID 
//
//          Value for the Bodyguard. 
//
//          0x29 = Traditional Bodyguards.
function BodyguardID() => byte(0x334AF6)
TRADITIONAL_BODYGUARD_ID = 0x29


// $334AFC: (8-bit) Difficulty In Game
//          
//          0x00 = Easy (Novice is done elsewhere).
//          0x01 = Normal
//          0x02 = Hard
//          0x03 = Very Hard
function DifficultyInGame() => byte(0x334AFC)
EASY_DIFFICULTY_REAL_VALUE = 0x00
NORMAL_DIFFICULTY_REAL_VALUE = 0x01
HARD_DIFFICULTY_REAL_VALUE = 0x02
VERY_HARD_DIFFICULTY_REAL_VALUE = 0x03

NOVICE_DIFFICULTY_LOOKUP_VALUE = 0x00 
EASY_DIFFICULTY_LOOKUP_VALUE = 0x01
NORMAL_DIFFICULTY_LOOKUP_VALUE = 0x02
HARD_DIFFICULTY_LOOKUP_VALUE = 0x03
VERY_HARD_DIFFICULTY_LOOKUP_VALUE = 0x04

function DifficultyLookupValue(LookupValue)
{
    if (LookupValue == NOVICE_DIFFICULTY_LOOKUP_VALUE)
    {
        return isNoviceMode() && DifficultyInGame() == EASY_DIFFICULTY_LOOKUP_VALUE
    }
    else if (LookupValue == EASY_DIFFICULTY_LOOKUP_VALUE)
    {
        return ( !isNoviceMode()) && DifficultyInGame() == EASY_DIFFICULTY_REAL_VALUE
    }
    else if (LookupValue == NORMAL_DIFFICULTY_LOOKUP_VALUE)
    {
        return DifficultyInGame() == NORMAL_DIFFICULTY_REAL_VALUE
    }
    else if (LookupValue == HARD_DIFFICULTY_LOOKUP_VALUE)
    {
        return DifficultyInGame() == HARD_DIFFICULTY_REAL_VALUE
    }
    else if (LookupValue == VERY_HARD_DIFFICULTY_LOOKUP_VALUE)
    {
        return DifficultyInGame() == VERY_HARD_DIFFICULTY_REAL_VALUE
    }
    else
    {
        return false
    }
}

function DifficultyLookupValueAndAbove(LookupValue)
{
    if (LookupValue == NOVICE_DIFFICULTY_LOOKUP_VALUE)
    {
        return true
    }
    else if (LookupValue == EASY_DIFFICULTY_LOOKUP_VALUE)
    {
        return not isNoviceMode() && DifficultyInGame() >= EASY_DIFFICULTY_REAL_VALUE
    }
    else if (LookupValue == NORMAL_DIFFICULTY_LOOKUP_VALUE)
    {
        return DifficultyInGame() >= NORMAL_DIFFICULTY_REAL_VALUE
    }
    else if (LookupValue == HARD_DIFFICULTY_LOOKUP_VALUE)
    {
        return DifficultyInGame() >= HARD_DIFFICULTY_REAL_VALUE
    }
    else if (LookupValue == VERY_HARD_DIFFICULTY_LOOKUP_VALUE)
    {
        return DifficultyInGame() == VERY_HARD_DIFFICULTY_REAL_VALUE
    }
    else
    {
        return false
    }
}

DifficultyNameLookup =
{
    NOVICE_DIFFICULTY_LOOKUP_VALUE : "Novice",
    EASY_DIFFICULTY_LOOKUP_VALUE : "Easy",
    NORMAL_DIFFICULTY_LOOKUP_VALUE : "Normal",
    HARD_DIFFICULTY_LOOKUP_VALUE : "Hard",
    VERY_HARD_DIFFICULTY_LOOKUP_VALUE : "Very Hard"
}

RPDifficultyNameLookup =
{
    EASY_DIFFICULTY_REAL_VALUE : "Easy",
    NORMAL_DIFFICULTY_REAL_VALUE : "Normal",
    HARD_DIFFICULTY_REAL_VALUE : "Hard",
    VERY_HARD_DIFFICULTY_REAL_VALUE : "Very Hard"
}

// $587B94: (32-bit) Possible Win/Loss Indicator.
//          
//          0xffffffff = Main game
//          0xfc = Won match
//          0x01fc = Time out (in speed challenge)
//          0x02fc = Died (Time out in speed challenge)
//          
//          
//          Also can use 0x00587c35, 0x00588055, 0x005880f5
function WinLossIndicator() => dword(0x587B94)

MAIN_GAMEPLAY_VALUE = 0xFFFFFFFF
WON_MATCH_VALUE = 0x00000FC
TIME_OUT_VALUE = 0x000002FC
DIED_VALUE = 0x000003FC

function justWonStageCheck()
{
    return WinLossIndicator() == WON_MATCH_VALUE &&
           prev(WinLossIndicator()) == MAIN_GAMEPLAY_VALUE

}

function wonStageCheck()
{
    return WinLossIndicator() == WON_MATCH_VALUE
}

NewMusouModes = 
[
    LU_BU_ID,
    DIAO_CHAN_ID,
    DONG_ZHUO_ID,
    YUAN_SHAO_ID,
    ZHANG_JIAO_ID,
    MENG_HUO_ID,
    ZHU_RONG_ID
]

MUSOU_ACHIEVEMENT_ID = "MusuoAchievement"
HARD_MUSOU_ACHIEVEMENT_ID = "HardMusouAchievement"
VERY_HARD_MUSOU_ACHIEVEMENT_ID = "VeryHardMusouAchievement"


MusouModeData =
{
    LU_BU_ID: { MUSOU_ACHIEVEMENT_ID : "Flying General", 
                HARD_MUSOU_ACHIEVEMENT_ID : "Lu Fengxian",
                VERY_HARD_MUSOU_ACHIEVEMENT_ID : "Demon on the Battlefield",
    },
    DIAO_CHAN_ID: { MUSOU_ACHIEVEMENT_ID : "Lady Diaochan", 
                    HARD_MUSOU_ACHIEVEMENT_ID : "The Great Songstress",
                    VERY_HARD_MUSOU_ACHIEVEMENT_ID : "Femme Fatale",
    },
    DONG_ZHUO_ID: { MUSOU_ACHIEVEMENT_ID : "Dong Zhongying", 
                    HARD_MUSOU_ACHIEVEMENT_ID : "Calamity Empire",
                    VERY_HARD_MUSOU_ACHIEVEMENT_ID : "Lust Demon",
    },
    YUAN_SHAO_ID: { MUSOU_ACHIEVEMENT_ID : "Yuan Benchu", 
                    HARD_MUSOU_ACHIEVEMENT_ID : "The Great Conqueror",
                    VERY_HARD_MUSOU_ACHIEVEMENT_ID : "The Coalition Leader",
    },
    ZHANG_JIAO_ID: { MUSOU_ACHIEVEMENT_ID : "General of Heaven", 
                    HARD_MUSOU_ACHIEVEMENT_ID : "Master of the Way Of Peace",
                    VERY_HARD_MUSOU_ACHIEVEMENT_ID : "The Yellowest Turban",
    },
    MENG_HUO_ID: { MUSOU_ACHIEVEMENT_ID : "King Meng Huo", 
                    HARD_MUSOU_ACHIEVEMENT_ID : "Great King",
                    VERY_HARD_MUSOU_ACHIEVEMENT_ID : "He Puts the Man in Nanman",
    },
    ZHU_RONG_ID: { MUSOU_ACHIEVEMENT_ID : "Lady Zhurong", 
                    HARD_MUSOU_ACHIEVEMENT_ID : "Goddess of Fire",
                    VERY_HARD_MUSOU_ACHIEVEMENT_ID : "Queen of Nanzhong",
    },
    ZHAO_YUN_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The Thousand Man General"},
    GUAN_YU_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The God of War"} ,
    ZHANG_FEI_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The Angry Brother"},
    XIAHOU_DUN_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "One Eyed General"},
    DIAN_WEI_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "Axe Man"},
    XU_ZHU_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "Tiger Fool "},
    ZHOU_YU_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "Soy Sauce"},
    LU_XUN_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The Tactician of Wu"},
    TAISHI_CI_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "You'll Find Me Between the Clubs"},
    ZHUGE_LIANG_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "Feather Fan"},
    CAO_CAO_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The Warlord"},
    SUN_SHANG_XIANG_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "SSX"},
    LIU_BEI_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The Benevolent"},
    SUN_JIAN_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The Old Tiger"},
    SUN_QUAN_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The Little Conquerer"},
    MA_CHAO_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The Horseman"},
    HUANG_ZHONG_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The Old Archer of Shu"},
    XIAHOU_YUAN_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The Skilled Archer of Wei"},
    ZHANG_LIAO_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The Forgiven General"},
    SIMA_YI_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The Last Man Standing"},
    LU_MENG_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The Pikeman"},
    GAN_NING_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The Pirate"},
    JIANG_WEI_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The Entrusted Strategist"},
    XU_HUANG_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The Polearm General"},
    ZHANG_HE_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The Flamboyant General"},
    ZHEN_JI_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The Lady of Wei"},
    HUANG_GAI_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "Full Package"},
    SUN_CE_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "Elder Brother"},
    WEI_YAN_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The Taciturn General"},
    PANG_TONG_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "The Clever Strategist"},
    DA_QIAO_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "Elder Sister"},
    XIAO_QIAO_ID: { VERY_HARD_MUSOU_ACHIEVEMENT_ID: "Younger Sister"}  
}


function saveProtection() => isNotLoading() && !IsLoadingMusouStage() && !isTwoPlayerMode() && IsInGame()



NewNormalItems =
[
    MOUNTAIN_QUIVER_ID,
    MOUNTAIN_POUCH_ID,
    BRONZE_FLASK_ID
]

AllCommonItems =
[
    SPEED_SCROLL_ID,
    WING_BOOTS_ID,
    DRAGON_AMULET_ID,
    PEACOCK_URN_ID,
    TIGER_AMULET_ID,
    TORTOISE_AMULET_ID,
    HUANG_BOW_ID,
    SHELL_ARMOR_ID,
    HORNED_HELMET_ID,
    CAVALRY_ARMOR_ID,
    SEVEN_STAR_ORB_ID,
    WIND_SCROLL_ID,
    ELIXER_ID,
    MOUNTAIN_QUIVER_ID,
    MOUNTAIN_POUCH_ID,
    BRONZE_FLASK_ID
]

MAX_LEVEL_TAG ="MAX_LEVEL"
SUPER_MAX_LEVEL_TAG = "SUPER_MAX_LEVEL"
LEVEL_12_ITEM_DATA = {MAX_LEVEL_TAG: 12, SUPER_MAX_LEVEL_TAG: 15 }
LEVEL_16_ITEM_DATA = {MAX_LEVEL_TAG: 16, SUPER_MAX_LEVEL_TAG: 20 }
LEVEL_20_ITEM_DATA = {MAX_LEVEL_TAG: 20, SUPER_MAX_LEVEL_TAG: 25 }
LEVEL_32_ITEM_DATA = {MAX_LEVEL_TAG: 32, SUPER_MAX_LEVEL_TAG: 40 }
LEVEL_40_ITEM_DATA = {MAX_LEVEL_TAG: 40, SUPER_MAX_LEVEL_TAG: 50 }
LEVEL_60_ITEM_DATA = {MAX_LEVEL_TAG: 60, SUPER_MAX_LEVEL_TAG: 75 }  
NormalItems = 
{
    SPEED_SCROLL_ID: LEVEL_16_ITEM_DATA,
    WING_BOOTS_ID: LEVEL_16_ITEM_DATA,
    DRAGON_AMULET_ID: LEVEL_60_ITEM_DATA,
    PEACOCK_URN_ID: LEVEL_60_ITEM_DATA,
    TIGER_AMULET_ID: LEVEL_20_ITEM_DATA,
    TORTOISE_AMULET_ID: LEVEL_40_ITEM_DATA,
    HUANG_BOW_ID: LEVEL_40_ITEM_DATA,
    SHELL_ARMOR_ID: LEVEL_40_ITEM_DATA,
    HORNED_HELMET_ID: LEVEL_40_ITEM_DATA,
    CAVALRY_ARMOR_ID: LEVEL_40_ITEM_DATA,
    SEVEN_STAR_ORB_ID: LEVEL_20_ITEM_DATA,
    WIND_SCROLL_ID: LEVEL_20_ITEM_DATA,
    ELIXER_ID: LEVEL_20_ITEM_DATA,
    MOUNTAIN_QUIVER_ID: LEVEL_32_ITEM_DATA,
    MOUNTAIN_POUCH_ID: LEVEL_20_ITEM_DATA,
    BRONZE_FLASK_ID: LEVEL_12_ITEM_DATA,
}
BodyguardCommonItems =
{
    BG_PEACOCK_URN_ID: LEVEL_32_ITEM_DATA,
    BG_DRAGON_AMULET_ID: LEVEL_32_ITEM_DATA,
    BG_TIGER_AMULET_ID: LEVEL_20_ITEM_DATA,
    BG_TORTOISE_AMULET_ID: LEVEL_20_ITEM_DATA,
    BG_HUANGS_BOW_ID: LEVEL_12_ITEM_DATA,
    BG_SHELL_ARMOR_ID: LEVEL_12_ITEM_DATA,
    BG_SPEED_SCROLL_ID: LEVEL_12_ITEM_DATA,
    BG_WIND_SCROLL_ID: LEVEL_12_ITEM_DATA,
    BG_ELIXER_ID: LEVEL_12_ITEM_DATA
}

function justUnlockedItem(itemID) => itemIdLookup(itemID) != INVALID_ITEM_ID && 
                                     prev(itemIdLookup(itemID)) == INVALID_ITEM_ID

function didntpreviouslyOwnAllItems(array) => any_of(array, itemID => prev(itemIdLookup(itemID)) == INVALID_ITEM_ID )
function ownAllItems(array) => tally_of(array, length(array), itemID => once(itemIdLookup(itemID) == itemID))
function didntpreviouslyMaxItems(array) => any_of(array, item_id => prev(itemLevelLookup(item_id)) < NormalItems[item_id][MAX_LEVEL_TAG] )
function ownAllMaxItems(array) => tally_of(array, length(array), item_id => once(itemLevelLookup(item_id) >= NormalItems[item_id][MAX_LEVEL_TAG]))
function anyItemJustPassedOverMaxLevel(array) => any_of(array, itemID => itemLevelLookup(itemID) > NormalItems[itemID][MAX_LEVEL_TAG] && 
                                                                         prev(itemLevelLookup(itemID)) <= NormalItems[itemID][MAX_LEVEL_TAG])
function didntpreviouslyTrueMaxItem(array) => any_of(array, itemID => prev(itemLevelLookup(itemID)) < NormalItems[itemID][SUPER_MAX_LEVEL_TAG])
function allItemsTrueMaxLevel(array) => tally_of(array, length(array), itemID => once(itemLevelLookup(itemID) >= NormalItems[itemID][SUPER_MAX_LEVEL_TAG]))




for itemId in AllCommonItems
{
    achievement(title = format("Item Break - {0}", ItemNameLookup[itemId]),
                description = format("Raise {0} to its true max level", ItemNameLookup[itemId]),
                points = 5,
                trigger = IsInMusouModeFreeModeOrChallengeMode() &&
                          itemIdLookup(itemId) != INVALID_ITEM_ID &&
                          prev(itemLevelLookup(itemId)) < NormalItems[itemId][SUPER_MAX_LEVEL_TAG] &&
                          itemLevelLookup(itemId) >= NormalItems[itemId][SUPER_MAX_LEVEL_TAG] &&
                          wonStageCheck() &&
                          saveProtection()
    )
}

function justUnlockedBGItem(itemID) => bgItemsIdLookup(itemID) != INVALID_ITEM_ID && 
                                     prev(bgItemsIdLookup(itemID)) == INVALID_ITEM_ID

function didntpreviouslyOwnAllBGItems(array) => any_of(array, itemID => prev(bgItemsIdLookup(itemID) == INVALID_ITEM_ID ))
function ownAllBGItems(array) => tally_of(array, length(array), itemID => once(bgItemsIdLookup(itemID) == itemID))
function didntpreviouslyMaxBGItems(array) => any_of(array, item_id => prev(bgItemsLevelLookup(item_id)) < BodyguardCommonItems[item_id][MAX_LEVEL_TAG] )
function ownAllMaxBGItems(array) => tally_of(array, length(array), item_id => once(bgItemsLevelLookup(item_id) >= BodyguardCommonItems[item_id][MAX_LEVEL_TAG]))
function didntpreviouslyTrueMaxBGItem(array) => any_of(array, itemID => prev(bgItemsLevelLookup(itemID)) < BodyguardCommonItems[itemID][SUPER_MAX_LEVEL_TAG])
function allBGItemsTrueMaxLevel(array) => tally_of(array, length(array), itemID => once(bgItemsLevelLookup(itemID) >= BodyguardCommonItems[itemID][SUPER_MAX_LEVEL_TAG]))


for itemId in BodyguardCommonItems
{
    achievement(title = format("Item Break - {0}", Bodyguard_Item_lookup[itemId]),
                description = format("Get {0} to its true max level", Bodyguard_Item_lookup[itemId]),
                points = 5,
                trigger = IsInMusouModeFreeModeOrChallengeMode() &&
                          bgItemsIdLookup(itemId) != INVALID_ITEM_ID &&
                          didntpreviouslyTrueMaxBGItem([itemId]) &&
                          allBGItemsTrueMaxLevel([itemId]) &&
                          wonStageCheck() &&
                          saveProtection()
    )
}
