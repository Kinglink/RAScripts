// Samurai Warriors - Xtreme Legends
// #ID = 20790

ONE_PLAYER_STRING = " (1p)"

// Helper Functions
function pointer_plus_offset(Pointer, Offset) => (pointer() + offset)

function bitOffset(InitialOffset, BitValue)
{
    offset = BitValue / 8
    
    targetBit = BitValue % 8
    targetLocation = InitialOffset+offset
    return bit(targetBit, targetLocation)
}

function ContainsKey(dictionary, key_name)
{
    for key in dictionary 
        if(key == key_name) return true
    return false
}

// $4F8530: (32-bit) Pointer to First Player information
//          
//          May be duplicated by 0x51c498, 0x69ecb0, check those if this proves untrue.
//          
//          +0x0270=(16-bit signed) First Player's max HP divided by 10.  Note, thie second byte may not be exact, but does contribute to the MAX
//          +0x0272=(16-bit signed)First Player's HP
//          +0x0276=(16-bit signed) First Player's max MP divided by 10.  Note, thie second byte may not be exact, but does contribute to the MAX
//          +0x0276=(16-bit signed)First Player's MP (Musou Power)
function pointerToFirstPlayerObject() => word(0x4F8530)

// $4F8585: (8-bit) Second Player Controller Control
//          
//          0x00= Player one controls the second player
//          0x01 = Second player's inputs accepted
// THIS HAS BEEN PROVEN FALSE, Don't Use
//function secondPlayerController() => byte(0x4F8585)
// SECOND_PLAYER_CONTROLLER_ENABLE = 0x01

// $4F8586: (8-bit) Second Player animation Control
//          
//          0x00= Player one controls the second player
//          0x01 = Second player's animation is frozen.
function secondPlayerAnimation() => byte(0x4F8586)
SECOND_PLAYER_ANIMATION_CONTROL = 0x01

function isSecondPlayerActive() => secondPlayerAnimation() == SECOND_PLAYER_ANIMATION_CONTROL

// $4FF7E4: (352-bit) Yukimura Sanada's stats
//          
//          11 Stats 32 bits a piece. Note most of these won't be larger than 255. Order
//          
//          Life
//          Musou
//          Attack
//          Defense
//          Ranged Attack
//          Ranged Defense
//          Horse Attack
//          Horse Defense
//          Agility
//          Jump
//          Speed
//          
//          Note those last three are reversed on the character screen.  Be aware.
function arrayOfCharacterStats() => dword(0x4FF7E4)

// $4FF822: (40-bit) Yukimura's equip array.
//          
//          0x00 = Solar Gem
//          0x01 = Moon Stone
//          0x02 = Power Bracer
//          0x03 = Himiko's Rune
//          0x04 = Vixen Tail
//          0x05 = Tengu Sandals
//          0x06 = Hare Greaves
//          0x07 = Kappa Amulet
//          0x08 = Wind Gloves
//          0x09 = Cloak of Might
//          0x0A = Demon Staff
//          0x0B = Serpent Bracer
//          0x0C = Saddle
//          0x0D = Arabian Saddle
//          0x0E = Matsukaze Saddle
//          0x0F = Horse Armor
//          0x10 = Warrior's Tale
//          0x11 = Battle Drum
//          0x12 = Gold Incense
//          0x13 = War Rations
//          0x14 = Guiding Doll
//          0x15 = Healing Balm
//          0x16 = Hachiman Bell
//          0x17 = Lantern
//          0x18 = Element Rune
//          0x19 = Ninja Suit
//          0x1A = The Kage Scroll
//          0x1B = War Baton
//          0x1C = Book of Healing
//          0x1D = Shield Wall
//          0x1E = Golden Rune
//          0x1F = Book of Earth
//          0x20 = Book of Water
//          0x21 = Book of Fire
//          0x22 = Book of Wind
//          0x23 = Book of Air
//          0x24 = no item.
YUKIMURA_ITEM_LOCATION = 0x4FF822
KEIJI_MAEDE_ITEM_LOCATION = 0x4FF89E
function yukimuraItems() => byte(YUKIMURA_ITEM_LOCATION)

// $4FF827: (384-bit) Yukimura's Skills.
//          
//          Exact values not determined (But available when looking at his screen.
//          
//          Note: He will NOT be able to purchase most of these abilities
//          
//          If a value only allows 0x01 that's the max value.  However if any additional purchases can be had, players can add up to 255 on the purchase screen.
//          
//          This 8-bit value for this one is 2x Jump (can only be bought once).  However it allows Yukimura to jump twice. Even though his character model doesn't have an animation for it.
function yukimurasStoredSkills() => byte(0x4FF827)

// $4FF857: (8-bit) Yukimura's Stored Level
MEMORY_LOCATION_OF_OFFICER_LEVEL = 0x4FF857

function yukimurasStoredLevel() => byte(MEMORY_LOCATION_OF_OFFICER_LEVEL)

// $4FF89E: (40-bit) Keiji's Maeda's equipped items
KEIJI_MAEDE_ITEM_LOCATION = 0x4FF89E
function keijiMaedaItems() => byte(KEIJI_MAEDE_ITEM_LOCATION)

OFFSET_FOR_EACH_CHARACTER_STATS = KEIJI_MAEDE_ITEM_LOCATION - YUKIMURA_ITEM_LOCATION
function officerOffsetHelper(location, index) => byte(location + (SIZE_OF_NEW_OFFICER_OBJECT * index))

RANK_20_VALUE = 19
RANK_19_VALUE = 18
function officersLevel20Check() => all_of(range(0,LAST_OFFICIAL_OFFICER), index => officerOffsetHelper(MEMORY_LOCATION_OF_OFFICER_LEVEL, index) == RANK_20_VALUE)
function officersWasLevel19Check() => any_of(range(0,LAST_OFFICIAL_OFFICER), index => prev(officerOffsetHelper(MEMORY_LOCATION_OF_OFFICER_LEVEL, index)) == RANK_19_VALUE)
                                    

// $500155: (8-bit) Musket for New Officer 1
//          
//          Given by Magouchi
MEMORY_LOCATION_OF_NEW_OFFICER_MUSKET_SKILL = 0x500155
function newOfficerMusketSkill() => byte(MEMORY_LOCATION_OF_NEW_OFFICER_MUSKET_SKILL)

// $500156: (40-bit)Array of items for first New Officer
ARRAY_OF_FIRST_NEW_OFFICER_ITEMS = 0x500156
function newOfficerArrayItemsFirstOfficer() => byte(ARRAY_OF_FIRST_NEW_OFFICER_ITEMS)

// $50015E: (8-bit) Frenzy Skill for New Officer 1
//          
//          Given by Ranmaru
MEMORY_LOCATION_OF_NEW_OFFICER_FRENZY_SKILL = 0x50015E
function newOfficerFrenzySkill() => byte(MEMORY_LOCATION_OF_NEW_OFFICER_FRENZY_SKILL)

// $50015F: (8-Bit) Reach for New Officer 1
//          
//          Given by Keiji Maeda
MEMORY_LOCATION_OF_NEW_OFFICER_REACH_SKILL = 0x50015F
function newOfficerReachSkill() => byte(MEMORY_LOCATION_OF_NEW_OFFICER_REACH_SKILL)

// $500160: (8-bit) Rage skill for New Officer 1
//          
//          Date Masamune gives you the skill
MEMORY_LOCATION_OF_NEW_OFFICER_RAGE_SKILL = 0x500160
function newOfficerRageSkill() => byte(MEMORY_LOCATION_OF_NEW_OFFICER_RAGE_SKILL)

// $500166: (8-bit) Drive skill for New Officer.
//          
//          Given by Okuni
MEMORY_LOCATION_OF_NEW_OFFICER_DRIVE_SKILL = 0x500166
function newOfficerDriveSkill() => byte(MEMORY_LOCATION_OF_NEW_OFFICER_DRIVE_SKILL)

// $500169: (8-bit) Focus skill for New Officer 1
//          
//          Kunoichi gives you the ability
MEMORY_LOCATION_OF_NEW_OFFICER_FOCUS_SKILL = 0x500169
function newOfficerFocusSkill() => byte(MEMORY_LOCATION_OF_NEW_OFFICER_FOCUS_SKILL)

// $50016A: (8-bit) Forttitude Skill for New Officer 1
//          
//          Dokkimaru gives you this
MEMORY_LOCATION_OF_NEW_OFFICER_FORTITUDE_SKILL = 0x50016A
function newOfficerFortitudeSkill() => byte(MEMORY_LOCATION_OF_NEW_OFFICER_FORTITUDE_SKILL)

// $50016B: (8-bit) New Officer's Discern skill
//          
//          Goemon  gives this.
MEMORY_LOCATION_OF_NEW_OFFICER_DISCERN_SKILL = 0x50016B
function newOfficerDiscernSkill() => byte(MEMORY_LOCATION_OF_NEW_OFFICER_DISCERN_SKILL)

// $50018b: (8-bit) Level for New Officer 1 
MEMORY_LOCATION_OF_NEW_OFFICER_LEVEL = 0x050018b

// $5001D2: (40-bit)Array of weapons for second New Officer
ARRAY_OF_SECOND_NEW_OFFICER_ITEMS = 0x5001D2
function newOfficerArrayWeaponsSecondOfficer() => byte(ARRAY_OF_SECOND_NEW_OFFICER_ITEMS)

SIZE_OF_NEW_OFFICER_OBJECT = ARRAY_OF_SECOND_NEW_OFFICER_ITEMS - ARRAY_OF_FIRST_NEW_OFFICER_ITEMS

TOTAL_NEW_OFFICERS = 15
function newOfficerOffsetHelper(Location, index) => byte(Location + (SIZE_OF_NEW_OFFICER_OBJECT * index))
function newOfficerAnyOfHelper(Location) => any_of(range(0,TOTAL_NEW_OFFICERS), index => newOfficerOffsetHelper(Location, index) == 0x1 &&
                                                                                          prev(newOfficerOffsetHelper(Location, index)) == 0x0)
function newOfficerMusketUnlock() =>  newOfficerAnyOfHelper(MEMORY_LOCATION_OF_NEW_OFFICER_MUSKET_SKILL)
function newOfficerFrenzyUnlock() =>  newOfficerAnyOfHelper(MEMORY_LOCATION_OF_NEW_OFFICER_FRENZY_SKILL)
function newOfficerReachUnlock() =>  newOfficerAnyOfHelper(MEMORY_LOCATION_OF_NEW_OFFICER_REACH_SKILL)
function newOfficerRageUnlock() =>  newOfficerAnyOfHelper(MEMORY_LOCATION_OF_NEW_OFFICER_RAGE_SKILL)
function newOfficerDriveUnlock() =>  newOfficerAnyOfHelper(MEMORY_LOCATION_OF_NEW_OFFICER_DRIVE_SKILL)
function newOfficerFocusUnlock() =>  newOfficerAnyOfHelper(MEMORY_LOCATION_OF_NEW_OFFICER_FOCUS_SKILL)
function newOfficerFortitudeUnlock() =>  newOfficerAnyOfHelper(MEMORY_LOCATION_OF_NEW_OFFICER_FORTITUDE_SKILL)
function newOfficerDiscernUnlock() =>  newOfficerAnyOfHelper(MEMORY_LOCATION_OF_NEW_OFFICER_DISCERN_SKILL)

function newOfficersLevel20Check() => any_of(range(0,TOTAL_NEW_OFFICERS), index => newOfficerOffsetHelper(MEMORY_LOCATION_OF_NEW_OFFICER_LEVEL, index) == RANK_20_VALUE)
function newOfficerJustLevel19Check() => any_of(range(0,TOTAL_NEW_OFFICERS), index => newOfficerOffsetHelper(MEMORY_LOCATION_OF_NEW_OFFICER_LEVEL, index) == RANK_20_VALUE &&
                                                                                      prev(newOfficerOffsetHelper(MEMORY_LOCATION_OF_NEW_OFFICER_LEVEL, index)) == RANK_19_VALUE)
                                                                                          
// $50133d: (8-bit Bitfield) Owned Weapon Indicator (1 of 17)
// 
//          Bit 0 = Yukimura's Sickle Spear (1st)
//          Bit 1 = Yukimura's Cross Spear (2nd)
//          Bit 2 = Yukimura's Lunar Spear (3rd)
//          Bit 3 = Yukimura's Kouryuga (4th)
//          Bit 4 = Yukimura's Susano (5th)
//          Bit 5 = Yukimura's Rakan (6th)
//          Bit 6 = Keiji Maeda's Double Pike (1st)
//          Bit 7 = Keiji Maeda's Koto Pike (2nd)       
MEMORY_LOCATION_OF_OWNED_WEAPONS = 0x50133d

function everOwnedWeapon(weaponId) => bitOffset(MEMORY_LOCATION_OF_OWNED_WEAPONS, weaponId) == 1

// $500b24: (8-bit) Yukimura's First Owned Weapon  ID
//          
//          Weapons are 28-bytes long. 
//          
//          0x00 = Yukimura's Sickle Spear (1st)
//          0x01 = Yukimura's Cross Spear (2nd)
//          0x02 = Yukimura's Lunar Spear (3rd)
//          0x03 = Yukimura's Kouryuga (4th)
//          0x04 = Yukimura's Susano (5th)
//          0x05 = Yukimura's Rakan (6th)
//          0x06 = Keiji Maeda's Double Pike (1st)
//          0x07 = Keiji Maeda's Koto Pike (2nd)
//          0x08 = Keiji Maeda's Crimson Pike (3rd)
//          0x09 = Keiji Maeda's Kagura (4th)
//          0x0A = Keiji Maeda's Izanagi (5th)
//          0x0B = Keiji Maeda's Ni-Oh Pike (6th)
//          0x0C = Nobunaga's Kumo-giri (1st)
//          0x0D = Nobunaga's Oni-giri (2nd)
//          0x0E = Nobunaga's Hasebe (3rd)
//          0x0F = Nobunaga's Muramasa (4th)
//          0x10 = Nobunaga's Orochi (5th)
//          0x11 = Nobunaga's Dai-Rokuten (6th)
//          0x12 = Mitsuhide's Nameless (1st)
//          0x13 = Mitsuhide's Masterpiece (2nd)
//          0x14 = Mitsuhide's Chikakage (3rd)
//          0x15 = Mitsuhide's Juzumaru (4th)
//          0x16 = Mitsuhide's Futsu-Mitama (5th)
//          0x17 = Mitsuhide's Rasetsu (6th)
//          0x18 = Goemon's Stone Splitter (1st)
//          0x19 = Goemon's Rock Crusher (2nd)
//          0x1A = Goemon's Bond Breaker (3rd)
//          0x1B = Goemon's Kai-Basara (4th)
//          0x1C = Goemon's Takemikazuchi (5th)
//          0x1D = Goemon's Obliterator (6th)
//          0x1E = Kenshin's Wave Blade (1st)
//          0x1F = Kenshin's Shichitsuka (2nd)
//          0x20 = Kenshin's Seven Spirits (3rd)
//          0x21 = Kenshin's Ichimonji (4th)
//          0x22 = Kenshin's Murakumo (5th)
//          0x23 = Kenshin's Bishamonten (6th)
//          0x24 = Oichi's Ume (1st)
//          0x25 = Oichi's Fuji (2nd)
//          0x26 = Oichi's Yuri (3rd)
//          0x27 = Oichi's Sumire (4th)
//          0x28 = Oichi's Sakura (5th)
//          0x29 = Oichi's Kiku (6th)
//          0x2A = Okuni's Ban-Gasa (1st)
//          0x2B = Okuni's Mai-Gasa (2nd)
//          0x2C = Okuni's Butoh-Gasa (3rd)
//          0x2D = Okuni's Gekka (4th)
//          0x2E = Okuni's Hikage (6th)
//          0x2F = Okuni's Kishouten (6th)
//          0x30 = Kunoichi's Dagger (1st)
//          0x31 = Kunoichi's Whirlwind (2nd)
//          0x32 = Kunoichi's Cyclone (3rd)
//          0x33 = Kunoichi's Shiranui (4th)
//          0x34 = Kunoichi's Kushinada (5th)
//          0x35 = Kunoichi's Kokuanten (6th)
//          0x36 = Magoichi's Sakai Musket (1st)
//          0x37 = Magoichi's Tanegashima (2nd)
//          0x38 = Magoichi's Kunitomo (3rd)
//          0x39 = Magoichi's Gokuraku (4th)
//          0x3A = Magoichi's Gokuen (5th)
//          0x3B = Magoichi's Yatagarasu (6th)
//          0x3C = Shingen's War Fan (1st)
//          0x3D = Shingen's Shogun Fan (2nd)
//          0x3E = Shingen's Furinkazan (3rd)
//          0x3F = Shingen's Kokushimusou (4th)
//          0x40 = Shingen's Kourin (5th)
//          0x41 = Shingen's Shinju (6th)
//          0x42 = Masamune's Oak Sword (1st)
//          0x43 = Masamune's Mauler Blade (2nd)
//          0x44 = Masamune's Divine Spruce (3rd)
//          0x45 = Masamune's Bontenmaru (4th)
//          0x46 = Masamune's Mikaboshi (5th)
//          0x47 = Masamune's Ashura (6th)
//          0x48 = Noh's Tokage (1st)
//          0x49 = Noh's Kamakiri (2nd)
//          0x4A = Noh's Kumo (3rd)
//          0x4B = Noh's Mukade (4th)
//          0x4C = Noh's Hiruko (5th)
//          0x4D = Noh's Mamushi (6th)
//          0x4E = Hanzo's Kusarigama (1st)
//          0x4F = Hanzo's Iga-Gama (2nd)
//          0x50 = Hanzo's Kubinagi (3rd)
//          0x51 = Hanzo's Hiryuu (4th)
//          0x52 = Hanzo's Yamikiba (5th)
//          0x53 = Hanzo's Marishiten (6th)
//          0x54 = Ranmaru's Nodachi (1st)
//          0x55 = Ranmaru's Zamba (2nd)
//          0x56 = Ranmaru's Yukimitsu (3rd)
//          0x57 = Ranmaru's Tomonari (4th)
//          0x58 = Ranmaru's Kamudo (5th)
//          0x59 = Ranmaru's Gohotendo (6th)
//          0x5A = Hideyoshi's Sansetsukon (1st)
//          0x5B = Hideyoshi's Steel Sansetsu (2nd)
//          0x5C = Hideyoshi's Great Sansetsu (3rd)
//          0x5D = Hideyoshi's Shouki (4th)
//          0x5E = Hideyoshi's Mihashira (5th)
//          0x5F = Hideyoshi's Monju (6th)
//          0x60 = Yoshimoto's Leather Kemari (1st)
//          0x61 = Yoshimoto's Cloth Kemari (2nd)
//          0x62 = Yoshimoto's Silk Kemari (3rd)
//          0x63 = Yoshimoto's Champion Kemari (4th)
//          0x64 = Yoshimoto's Velvet Kemari (5th)
//          0x65 = Yoshimoto's Phoenix Kemari (6th)
//          0x66 = Tadakatsu's Iron Spear (1st)
//          0x67 = Tadakatsu's Great Spear (2nd)
//          0x68 = Tadakatsu's Tiger Slayer (3rd)
//          0x69 = Tadakatsu's Bukotsu (4th)
//          0x6A = Tadakatsu's Arahabaki (5th)
//          0x6B = Tadakatsu's Emma (6th)
//          0x6C = Ina's Bow (1st)
//          0x6D = Ina's Long Bow (2nd)
//          0x6E = Ina's Great Bow (3rd)
//          0x6F = Ina's Yoichi Bow (4th)
//          0x70 = Ina's Omoikane (5th)
//          0x71 = Ina's Aisen (6th)
//          0x72 = Sword's Katana (1st)
//          0x73 = Sword's Ishi-Kiri (2nd)
//          0x74 = Sword's Doudanuki (3rd)
//          0x75 = Sword's Kanemitsu (4th)
//          0x76 = Sword's Douji-Kiri (5th)
//          0x77 = Sword's Munechika (6th)
//          0x78 = Spear's Spear (1st)
//          0x79 = Spear's Great Spear (2nd)
//          0x7A = Spear's Piercer (3rd)
//          0x7B = Spear's Nihon-Gou (4th)
//          0x7C = Spear's Tombo-Giri (5th)
//          0x7D = Spear's Otegine (6th)
//          0x7E = Naginata Officer's Polearm (1st)
//          0x7F = Naginata Officer's Naginata (2nd)
//          0x80 = Naginata Officer's Onitake (3rd)
//          0x81 = Naginata Officer's Tomoe (4th)
//          0x82 = Naginata Officer's Benkei (5th)
//          0x83 = Naginata Officer's Goryo (6th)
//          0x84 = No Weapon
// Only represented here for Data 

// $5013b1 (4-bit Lowt) New Officers Face Unlocks
// 
// Each bit is a new face.  Eventually this becomes 0x0f 
function newOfficerFaces() => byte(0x5013b1)

FULL_FACE_UNLOCK_VALUE = 0x0f
FULL_FACE_UNLOCK_PREV_VALUE = 0x07

function newOfficerFaceUnlock() => newOfficerFaces() == FULL_FACE_UNLOCK_VALUE && 
                                 prev(newOfficerFaces()) == FULL_FACE_UNLOCK_PREV_VALUE

// $50125C: (8-bit) Solar Gem Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Life Power
//          
//          See 0x0050134e for the unlock array
MEMORY_LOCATION_SOLAR_GEM_POWER = 0x50125C
function solarGemPower() => byte(MEMORY_LOCATION_SOLAR_GEM_POWER)

// $50125D: (8-bit) Moon Stone Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Musou Power
//          
//          See 0x0050134e for the unlock array
function moonStonePower() => byte(0x50125D)

// $50125E: (8-bit) Power Bracer Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Attack
//          
//          See 0x0050134e for the unlock array
function powerBracerPower() => byte(0x50125E)

// $50125F: (8-bit) Himko's Rune Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Defense Power
//          
//          See 0x0050134e for the unlock array
function himikoRunePower() => byte(0x50125F)

// $501260: (8-bit) Vixen Tail Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Musou Charge Power
//          
//          See 0x0050134e for the unlock array
function vixenTailPower() => byte(0x501260)

// $501261: (8-bit) Tengu Sandals Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Speed Power
//          
//          See 0x0050134e for the unlock array
function tenguSandalsPower() => byte(0x501261)

// $501262: (8-bit) Hare Greavs Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Jump Power
//          
//          See 0x0050134e for the unlock array
function hareGreavesPower() => byte(0x501262)

// $501263: (8-bit) Kappa Amulet Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Luck Power
//          
//          See 0x0050134e for the unlock array
function kappaAmuletPower() => byte(0x501263)

// $501264: (8-bit) Wind Gloves Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Ranged Attack Power
//          
//          See 0x0050134e for the unlock array
function windGlovesPower() => byte(0x501264)

// $501265: (8-bit) Cloak of Might Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Ranged Defense Power
//          
//          See 0x0050134e for the unlock array
function cloakOfMightPower() => byte(0x501265)

// $501266: (8-bit) Demon Staff Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Horse Attack Power
//          
//          See 0x0050134e for the unlock array
function demonStaffPower() => byte(0x501266)

// $501267: (8-bit) Serpent Bracer Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Horse Defense Power
//          
//          See 0x0050134e for the unlock array
function serpentBracerPower() => byte(0x501267)

// $501268: (8-bit) Saddle Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Horse Power Power (Called just Power, assuming it's horse power)
//          
//          See 0x0050134e for the unlock array
MEMORY_LOCATION_SADDLE_POWER = 0x501268
function saddlePower() => byte(MEMORY_LOCATION_SADDLE_POWER)

function itemsReachedAtXPower(PowerLevel) => all_of(range(MEMORY_LOCATION_SOLAR_GEM_POWER,MEMORY_LOCATION_SADDLE_POWER), 
                                                        index => byte(index) >= PowerLevel) &&
                                             any_of(range(MEMORY_LOCATION_SOLAR_GEM_POWER,MEMORY_LOCATION_SADDLE_POWER), 
                                                        index => prev(byte(index)) < PowerLevel)

// $50134E: (8-bit)(Bitfield)  Item Owned Bitfield (1 of 5)
//          
//          Bit 0=Solar Gem
//          Bit 1=Moon Stone
//          Bit 2=Power Bracer
//          Bit 3=Himiko's Rune
//          Bit 4=Vixen Tail
//          Bit 5=Tengu Sandals
//          Bit 6=Hare Greaves
//          Bit 7=Kappa Amulet
INITIAL_LOCATION_ITEM_OWNED_BITFIELD = 0x50134E
function itemOwnedBitfield1() => byte(INITIAL_LOCATION_ITEM_OWNED_BITFIELD)

// $50134F: (8-bit)(Bitfield) Item Owned Bitfield (2 of 5)
//          
//          Bit 0=Wind Gloves
//          Bit 1=Cloak of Might
//          Bit 2=Demon Staff
//          Bit 3=Serpent Bracer
//          Bit 4=Saddle
//          Bit 5=Arabian Saddle
//          Bit 6=Matsukaze Saddle
//          Bit 7=Horse Armor
function itemOwnedBitfield2() => byte(0x50134F)

// $501350: (8-bit)(Bitfield) Item Owned Bitfield (3 of 5)
//          
//          Bit 0=Warrior's Tale
//          Bit 1=Battle Drum
//          Bit 2=Gold Incense
//          Bit 3=War Rations
//          Bit 4=Guiding Doll
//          Bit 5=Healing Balm
//          Bit 6=Hachiman Bell
//          Bit 7=Lantern
function itemOwnedBitfield3() => byte(0x501350)

// $501351: (8-bit)(Bitfield) Item Owned Bitfield (4 of 5)
//          
//          Bit 0=Element Rune
//          Bit 1=Ninja Suit
//          Bit 2=The Kage Scroll
//          Bit 3=War Baton
//          Bit 4=Book of Healing
//          Bit 5=Sheild Wall
//          Bit 6=Golden Rune
//          Bit 7=Book of Earth
function itemOwnedBitfield4() => byte(0x501351)

// $501352: (8-bit)(Bitfield) Item Owned Bitfield (5 of 5)
//          
//          Bit 0=Book of Water
//          Bit 1=Book of Fire
//          Bit 2=Book of Wind
//          Bit 3=Book of Air
//          
//          Other values are not used.
function itemOwnedBitfield5() => byte(0x501352)

SOLAR_GEM = 0x00
MOON_STONE = 0x01
POWER_BRACER = 0x02
HIMIKOS_RUNE = 0x03
VIXEN_TAIL = 0x04
TENGU_SANDALS = 0x05
HARE_GREAVES = 0x06
KAPPA_AMULET = 0x07
WIND_GLOVES = 0x08
CLOAK_OF_MIGHT = 0x09
DEMON_STAFF = 0x0a
SERPENT_BRACER = 0x0b
SADDLE = 0x0c
ARABIAN_SADDLE = 0x0d
MATSUKAZE_SADDLE = 0x0e
HORSE_ARMOR = 0x0f
WARRIORS_TALE = 0x10
BATTLE_DRUM = 0x11
GOLD_INCENSE = 0x12
WAR_RATIONS = 0x13
GUIDING_DOLL = 0x14
HEALING_BALM = 0x15
HACHIMAN_BELL = 0x16
LANTERN = 0x17
ELEMENT_RUNE = 0x18
NINJA_SUIT = 0x19
KAGE_SCROLL = 0x1a
WAR_BATON = 0x1b
BOOK_OF_HEALING = 0x1c
SHIELD_WALL = 0x1d
GOLDEN_RUNE = 0x1e
BOOK_OF_EARTH = 0x1f
BOOK_OF_WATER = 0x20
BOOK_OF_FIRE = 0x21
BOOK_OF_WIND = 0x22
BOOK_OF_AIR = 0x23
INVALID_ITEM = 0x024

itemLookup=
{
    SOLAR_GEM : "Solar Gem", 
    MOON_STONE : "Moon Stone", 
    POWER_BRACER : "Power Bracer", 
    HIMIKOS_RUNE : "Himiko's Rune", 
    VIXEN_TAIL : "Vixen Tail", 
    TENGU_SANDALS : "Tengu Sandals", 
    HARE_GREAVES : "Hare Greaves", 
    KAPPA_AMULET : "Kappa Amulet", 
    WIND_GLOVES : "Wind Gloves", 
    CLOAK_OF_MIGHT : "Cloak of Might", 
    DEMON_STAFF : "Demon Staff", 
    SERPENT_BRACER : "Serpent Bracer", 
    SADDLE : "Saddle", 
    ARABIAN_SADDLE : "Arabian Saddle", 
    MATSUKAZE_SADDLE : "Matsukaze Saddle", 
    HORSE_ARMOR : "Horse Armor", 
    WARRIORS_TALE : "Warrior's Tale", 
    BATTLE_DRUM : "Battle Drum", 
    GOLD_INCENSE : "Gold Incense", 
    WAR_RATIONS : "War Rations", 
    GUIDING_DOLL : "Guiding Doll", 
    HEALING_BALM : "Healing Balm", 
    HACHIMAN_BELL : "Hachiman Bell", 
    LANTERN : "Lantern", 
    ELEMENT_RUNE : "Element Rune", 
    NINJA_SUIT : "Ninja Suit", 
    KAGE_SCROLL : "The Kage Scroll", 
    WAR_BATON : "War Baton", 
    BOOK_OF_HEALING : "Book of Healing", 
    SHIELD_WALL : "Sheild Wall", 
    GOLDEN_RUNE : "Golden Rune", 
    BOOK_OF_EARTH : "Book of Earth", 
    BOOK_OF_WATER : "Book of Water", 
    BOOK_OF_FIRE : "Book of Fire", 
    BOOK_OF_WIND : "Book of Wind", 
    BOOK_OF_AIR : "Book of Air", 
    INVALID_ITEM : "None"
}

commonItems =
[
    SOLAR_GEM,
    MOON_STONE,
    POWER_BRACER,
    HIMIKOS_RUNE,
    VIXEN_TAIL,
    TENGU_SANDALS,
    HARE_GREAVES,
    KAPPA_AMULET,
    WIND_GLOVES,
    CLOAK_OF_MIGHT,
    DEMON_STAFF,
    SERPENT_BRACER,
    SADDLE
]

rareItems = 
[
    ARABIAN_SADDLE,
    MATSUKAZE_SADDLE,
    HORSE_ARMOR,
    WARRIORS_TALE,
    BATTLE_DRUM,
    GOLD_INCENSE,
    WAR_RATIONS,
    GUIDING_DOLL,
    HEALING_BALM,
    HACHIMAN_BELL,
    LANTERN,
    ELEMENT_RUNE,
    NINJA_SUIT,
    KAGE_SCROLL,
    WAR_BATON,
    BOOK_OF_HEALING,
    SHIELD_WALL,
    GOLDEN_RUNE,
    BOOK_OF_EARTH,
    BOOK_OF_WATER,
    BOOK_OF_FIRE,
    BOOK_OF_WIND,
    BOOK_OF_AIR
]

function justOwnedAllCommonItems() => all_of(commonItems, 
                                             index => bitOffset(INITIAL_LOCATION_ITEM_OWNED_BITFIELD, index) == 1) &&
                                      any_of(commonItems, 
                                             index => prev(bitOffset(INITIAL_LOCATION_ITEM_OWNED_BITFIELD, index)) == 0)

function justUnlockItem(key) => bitOffset(INITIAL_LOCATION_ITEM_OWNED_BITFIELD, key) == 1 &&
                                prev(bitOffset(INITIAL_LOCATION_ITEM_OWNED_BITFIELD, key)) == 0

// $5015F8: (8-bit)(bitfield) Completed Missions for Kenshin Uesugi's The Battle of Anegawa
//          
//          bit0 = Showdown begins
//          bit1 = Wave Attack
//          bit2 = Wind
//          bit3 = Forest
//          bit4 = Fire
//          bit5 = Mountain
function completeKenshinBattleOfAnegawa() => 0x5015F8

// $5015FC: (8-bit)(bitfield) Completed Missions for Oichi's The Battle of Anegawa
//          
//          bit0 = Engage the Enemy
//          bit1 = Keiji's Dance
//          bit2 = Sister-In-Law
//          bit3 = Three Mino Generals
//          bit4 = Brother and Sister
function completeOichiBattleOfAnegawa() => 0x5015FC

// $501600: (8-bit)(bitfield) Completed Missions for Magoichi Saika's The Battle of Echizen
//          
//          bit0 = Salvation or Destruction
//          bit1 = Target: Mitsuhide
//          bit2 = Flee
//          bit3 = Predator or Prey
//          bit4 = Dance with the Shadow
//          bit5 = The Second Shot
//          bit6 = Go if you want
//          bit7 = Talent
function completeMagioichiBattleOfEchizen() => 0x501600

// $501604: (8-bit)(bitfield) Completed Missions for Noh's The Battle of Anegawa
//          
//          bit0 = Vanguard
//          bit1 = Asakura's Fall
//          bit2 = Keiji's Stand
//          bit3 = Stronghold Defense
//          bit4 = Side Attack
//          bit5 = The Weak and the Strong
//          bit6 = Tearful Revolution
function completeNohBattleOfAnegawa() => 0x501604

// $501608: (8-bit)(bitfield) Completed Missions for Ranmaru Mori's The Battle of Anegawa
//          
//          bit0 = Regroup
//          bit1 = Masamune's Assault
//          bit2 = Protect the Middle
//          bit3 = Unseen Foe
//          bit4 = !!UNUSED!!
//          bit5 = Query
//          bit6 = Doubt
//          bit7 = Sorrow
function completeRanmaruBattleOfAnegawa() => 0x501608

// $50160C: (8-bit)(bitfield) Completed Missions for Hideyoshi Hashiba Retreat at Kanegasaki
//          
//          bit0 = Rain of Fire
//          bit1 = Crossing Bridges
//          bit2 = Friends for now
//          bit3 = Retreat to Victory
//          bit4 = Monkey Business
//          bit5 = Ready, Aim Fire
//          bit6 = Against the Wall
function completeHideyoshiRetreatAtKanegasaki() => 0x50160C

// $501610: (8-bit)(bitfield) Completed Missions for Tadakatsu Honda's Retreat at Kanegasaki
//          
//          bit0 = Licking One's Wounds
//          bit1 = The Japanese Zhang Fei
//          bit2 = Roar of the Rat
//          bit3 = Lending a Hand
//          bit4 = Reckless
//          bit5 = Carelessness Ahead
//          bit6 = Running Earnestly
function completeTadakatsuRetreatAtKanegasaki() => 0x501610

// $501614: (8-bit)(bitfield) Completed Missions Ina's Retreat at Kanegasaki
//          
//          
//          bit0 = Cuts Like a Sharp Knife
//          bit1 = Look Where You're go
//          bit2 = In a PIncer
//          bit3 = Fear of Ambush
//          bit4 = Reversal of Fortune
//          bit5 = A Way Out
function completeInaRetreateAtKanegasaki() => 0x501614

// $501618: (8-bit)(bitfield) Completed Missions for Keiji Maeda's The Battle of Ise
//          
//          bit0 = Ready Fire Attack
//          bit1 = Ready Cannons
//          bit2 = Rekindling
//          bit3 = Fire Ploy
//          bit4 = Occupation
//          bit5 = Surrender
//          bit6 = Life is Power
//          bit7 = Peasant's Escape
function completeKeijiBattleOfIse() => 0x501618

// $50161C: (8-bit)(bitfield) Complete Missions for Nobunaga Oda's The Battle of Ise
//          
//          bit0 = Ready Fire Attack
//          bit1 = Ready Cannons
//          bit2 = Rekindling
//          bit3 = Fire Ploy
//          bit4 = Occupation
//          bit5 = No Surrender
//          bit6 = Destroy and Create
function completeNobunagaBattleOfIse() => 0x50161C

// $501620: (8-bit)(bitfield) Completed Missions for Mitsuhide Akechi's The Battle of Ise
//          
//          bit0 = Ready Fire Attack
//          bit1 = Ready Cannons
//          bit2 = Rekindling
//          bit3 = Fire Ploy
//          bit4 = Occupation
//          bit5 = Surrender
//          bit6 = Life is Power
//          bit7 = Pesants' Escape
function completeMitsuhideBattleOfIse() => 0x501620

// $501624: (8-bit)(bitfield) Completed Missions for Goemon Ishikawa's Crossing Iga
//          
//          bit0 = Stop Ieyasu
//          bit1 = Fake Trap
//          bit2 = Which is the Decoy?
//          bit3 = The Real Trap
//          bit4 = No Escape
//          bit5 = Lonely Guy
//          bit6 = The Real Shadow
function completeGoemonCrossingIga() => 0x501624

// $501628: (8-bit)(bitfield) Completed Missions for Goemon Ishikawa's Dance of Ise
//          
//          bit0 = One Mind, One Body
//          bit1 = No one passes
//          bit2 = Brat in the Way
//          bit3 = !! UNUSED !!
//          bit4 = Thinking Ahead
//          bit5 = !!UNUSED!!
//          bit6 = Greatest Obstacle
function completeGoemonDanceofIse() => 0x501628

// $50162C: (8-bit)(bitfield) Completed Missions for Okuni's Dance of Ise
//          
//          bit0 = One Mind, One Body
//          bit1 = !! UNUSED !!
//          bit2 = Beauty in the Way
//          bit3 = Ranmaru, my Love
//          bit4 = Thinking Ahead
//          bit5 = Mitsuhide, my Love
//          bit6 = Greatest Obstacle
//          bit7= Hanzo, my Love
function completeOkuniDanceOfIse() => 0x50162C

// $501630: (8-bit)(bitfield) Completed Missions for Magoichi Saika's The Battle of Ise
//          
//          bit0 = Cannon
//          bit1 = Barrage
//          bit2 = Escort
//          bit3 = Retreat
//          bit4 = Safety
//          bit5 = The Preview
function completeMagoichiBattleofIse() => 0x501630

// $501634: (16-bit)(bitfield) Completed Missions for Masamune Date's Ise Campaign
//          
//          bit0 = Ikko Fortress
//          bit1 = Oda Army
//          bit2 = Monks
//          bit3 = Magoichi's Arrival
//          bit4 = Elimination!
//          bit5 = Silence the Cannons
//          bit6 = Foil the Fire Attack
//          bit7 = Nobunaga must fall
//          bit8 = Peasants approaching
//          
//          Note it's one bit in the next byte.
function completeMasaumeIseCampaign() => 0x501634

// $501638: (8-bit)(bitfield) Completed Missions for Hanzo Hattori's Crossing Iga
//          
//          bit0 = Escape Route
//          bit1 = All for One
//          bit2 = Lure
//          bit3 = Obedience
//          bit4 = Subterfuge
//          bit5 = Beckoning
//          bit6 = Compatriots
function completeHanzoCrossingIga() => 0x501638

// $50163C: (8-bit)(bitfield) Completed Missions for Ranmaru Mori's The Battle of Ise
//          
//          bit0 = Ready Fire Attack
//          bit1 = Ready Cannons
//          bit2 = Rekindling
//          bit3 = Fire Ploy
//          bit4 = Occupation
//          bit5 = No Surrender
//          bit6 = Destroy and Create
function completeRanmaruBattleOfIse() => 0x50163C

// $501640: (8-bit)(bitfield) Completed Missions for Tadakatsu Honda's Crossing Iga
//          
//          bit0 = Guiding the Guide
//          bit1 = Shadow Warrior
//          bit2 = Regrouping
//          bit3 = Calm Closing
//          bit4 = Welcome Home
//          bit5 = Rear Guard
//          bit6 = Lord Hunting
function completeTadakatsuCrossingIge() => 0x501640

// $501644: (8-bit)(bitfield) Completed Missions for Ina's Crossing Iga
//          
//          bit0 = Shadowing the Shadow Warrior
//          bit1 = Here's the Shadow Warrior
//          bit2 = Shooting Gallery
//          bit3 = Blood Boiling
//          bit4 = Merge Ahead
//          bit5 = All's Well
//          bit6 = Drastic Measures
//          bit7 = Crimson Sea
function completeInaCrossingIga() => 0x501644

// $501648: (8-bit)(bitfield) Completed Missions for Hideyoshi Hashiba The battle of Komaki-Nagakute
//          
//          bit0 = A Castle Amidst the Chaos
//          bit1 = The Unparalleled Warrior
//          bit2 = Two Brothers for the Ages
//          bit3 = The Time is Now
//          bit4 = The Long Road to Peace
//          bit5 = History Repeats Itself
//          bit6 = The Enemy Moves
//          bit7 = Penetrating the Shadows
function completeHideyoshiTheBattleOfKomakiNagaku() => 0x501648

// $50164C: (8-bit)(bitfield) Completed Missions for Yoshimoto Imagawa's The Battle of Komaki- Nagakute
//          
//          bit0 = The Castle Falls Today
//          bit1 = Lambs to the Slaughter
//          bit2 = Death will Find You
//          bit3 = The Four Guardians Attack
//          bit4 = On to Komakiyama
//          bit5 = The Mysterious Komakiyama Castle
//          bit6 = The End is Near
function completeYoshimotoBattleOfKomaki() => 0x50164C

// $501650: (8-bit)(bitfield) Completed Missions for Tadakatsu Honda's The Battle of Komaki-Nagakute
//          
//          Check 0x00501650 for completed and values
//          
//          bit0 = Strategic Location
//          bit1 = That's the Way
//          bit2 = Weak Eaten by the Strong
//          bit3 = The Meaning of Endurance
//          bit4 = Justice in a Nutshell
//          bit5 = Winner Takes All
//          bit6 = Pincher in Pursuit
//          bit7 = Hanging Out to Dry
function completeTadakatsuBattleOfKomaki() => 0x501650

// $501654: (16-bit)(bitfield) Completed Missions for Ina's The Battle of Komaki-Nagakute
//          
//          bit0 = Breakwater
//          bit1 = The Winning Move
//          bit2 = One Keiji Villian
//          bit3 = Kessen
//          bit4 = Duel to the Death
//          bit5 = Supporting Cast
//          bit6 = Got Guts?
//          bit7 = Strategist Vs Tactician
//          bit8 = Tadakatsu Honda the Man
//          bit9 = Nobukatsu Oda the Man
function completeInaBattleOfKomaki() => 0x501654

// $501658: (8-bit)(bitfield) Completed Missions for Nobunaga Oda's The Battle of Okehazama
//          
//          bit0 = Smokescreen
//          bit1 = Help Hideyoshi
//          bit2 = Lightning Battle
//          bit3 = Storm Warning
//          bit4 = Old Friend
//          bit5 = All will be mine
//          bit6 = The Imagawa
//          bit7 = Faster than Shadow
function completeNobunagaBattleofOkehazama() => 0x501658

// $50165C: (8-bit)(bitfield) Completed Missions for Oichi's The Battle of Okehazama
//          
//          Check 0x0050165c for completed and values
//          
//          bit0 = Smokescreen
//          bit1 = Help Hideyoshi
//          bit2 = Lightning Battle
//          bit3 = Storm Warning
//          bit4 = Old Friend
//          bit5 = All will be mine
//          bit6 = The Imagawa
//          bit7 = Faster than Shadow
function completeOichiBattleOfOkehazama() => 0x50165C

// $501660: (8-bit)(bitfield) Completed Missions for Masamune Date's Okehazama Campaign
//          
//          bit0 = Get Yoshimoto
//          bit1 = Get Nobunaga
//          bit2 = Ambition
//          bit3 = Ieyasu flees
//          bit4 = Surpass Nobunaga!
//          bit5 = Sister
//          bit6 = Whirlwind
function completeMasaumeOkehazamaCampaign() => 0x501660

// $501664: (8-bit)(bitfield) Completed Missions for Noh's The Battle of Okehazama
//          
//          bit0 = Smokescreen
//          bit1 = Help Hideyoshi
//          bit2 = Lightning Battle
//          bit3 = Storm Warning
//          bit4 = Old Friend
//          bit5 = All will be Mine
//          bit6 = The Imagawa
//          bit7 = Faster than Shadow
function completeNohBattleOfOkehazama() => 0x501664

// $501668: (8-bit)(bitfield) Completed Missions for Hanzo Hattori's The Battle of Okehazama
//          
//          Check 0x00501668 for completed and values
//          
//          bit0 = Fly
//          bit1 = Narumi Castle
//          bit2 = Seal
//          bit3 = Master's Peril
//          bit4 = Finale
//          bit5 = Obliteration
//          bit6 = Shadow Path
function completeHanzoBattleOfOkehazama() => 0x501668

// $50166C: (8-bit)(bitfield) Completed Missions for New Officer's The Battle of Okehazama
//          
//          bit0 = Advance Force
//          bit1 = Protect Me!
//          bit2 = Ieyasu's Doubt
//          bit3 = Next Assailant
//          bit4 = No Escape
//          bit5 = Momentum
//          bit6 = Viper's Fangs
function completeNewOfficerBattleOfOkehazama() => 0x50166C

// $501670: (8-bit)(bitfield) Completed Missions for Yoshimoto Imagawa's The Battle of Okehazama
//          
//          bit0 = To the Capital!
//          bit1 = Eagle Hunting
//          bit2 = The Underdog
//          bit3 = A Shadowy Attack
//          bit4 = The Demon and Me
function completeYoshimotoBattleOfOkehazama() => 0x501670

// $501674: (8-bit)(bitfield) Completed Missions for Tadakatsu Honda's The Battle of Okehazama
//          
//          bit0 = Information War
//          bit1 = A Lord is..
//          bit2 = Governing the Land
//          bit3 = Lack of Foresight
//          bit4 = A Troubled Future
//          bit5 = The Main Camp In Danger
//          bit6 = Forget about Appearances
function completeTadakatsuBattleOfOkehazama() => 0x501674

// $501678: (16-bit)(bitfield) Completed Missions for Yukimura's The Battle of Kaawanakajima
//          Correct value appears to be 0x197
//          
//          bit0 = Pincer
//          bit1 = Return to Camp
//          bit2 = Defend Kaizu
//          bit3 = !!UNUSED!!
//          bit4 = Kenshin
//          bit5 = !!UNUSED!!
//          bit6 = !!UNUSED!!
//          bit7 = Power
//          bit8 = Peril
//          
//          What a strange bitfield.
function completeYukimuraBattleOfKawankajima() => 0x501678

// $50167C: (8-bit)(bitfield) Completed Missions for Keiji Maeda's Kawanakajima Challenge
//          
//          bit0 = The Great Keiji
//          bit1 = The Yukimura Kid
//          bit2 = Love is Blind
function completeKiejiKawanakajimaChallenge() => 0x50167C

// $501680: (8-bit)(bitfield) Completed Missions for Kenshin Uesugi's The Battle of Kawanakajima
//          
//          bit0 = It's a Pincer!
//          bit1 = Occupy Kaizu
//          bit2 = Famed Contest
//          bit3 = The Pincer will Fail
//          bit4 = Prayers
//          bit5 = The tide must flow
//          bit6 = Flanked
//          bit7 = Parting Shot
function completeKenshinBattleOfKawanakajima() => 0x501680

// $501684: (8-bit)(bitfield) Completed Missions for Kenshin Uesugi's Kawanakajima Showdown
//          
//          bit0 = Hachimanbara
//          bit1 = Attack Kaizu
//          bit2 = Mt. Saijyo
//          bit3 = Zenkouji
//          bit4 = Stop Yukimura
//          bit5 = Retreat for now
//          bit6 = Last Charge
//          bit7 = Mt. Chausu
function completeKenshinKawanakajimaShowdown() => 0x501684

// $501688: (16-bit)(bitfield) Completed Missions for Okuni's Dance of Kawanakima
//          
//          bit0 = Kawanakajima Dance
//          bit1 = Plea to Shingen
//          bit2 = Plea to Kenshin
//          bit3 = Rescue unit
//          bit4 = Shingen, my Love
//          bit5 = Destroy unit
//          bit6 = Kicked by Horse
//          bit7 = Kenshin, my Love
//          bit8 = Love's Retreat
//          bit9 = Three's a Crowd
//          bit10 = Yukimura, My Love 
//          bit11 = !UNUSED!
//          bit12 = By force, then
function completeOkuniDanceOfKawanakima() => 0x501688

// $50168C: (16-bit)(bitfield) Completed Missions for Kuniochi's The Battle of Kawanakajima
//          
//          Correct value appears to be 0x1fd
//          
//          bit0 = Pincer
//          bit1 = !!UNUSED!!
//          bit2 = Defend Kaizu
//          bit3 = Kunoichi's Flight
//          bit4 = Kenshin
//          bit5 = Sword and Fan
//          bit6 = Save Yukimura
//          bit7 = Power
//          bit8 = Peril
function completeKuniochiBattleOfKawanakajima() => 0x50168C

// $501690: (8-bit)(bitfield) Completed Missions for Shingen Takeda's The Battle of Kawanakajima
//          
//          bit0 = Night and Fog
//          bit1 = Defend the Camp
//          bit2 = Kenshin
//          bit3 = Tide has not changed
function completeShingenBattleOfKawankajima() => 0x501690

// $501694: (16-bit)(bitfield) Completed Missions for Shingen Takeda's Kawanakjima Showdown
//          
//          bit0 = Cattle Wagon
//          bit1 = One-Eyed Dragon
//          bit2 = Creeping Shadow
//          bit3 = The Young Dragon strikes
//          bit4 = A good time for prayer
//          bit5 = Doom from the North
//          bit6 = Defeat the Shadow
//          bit7 = The Wild One
//          bit8 = Lone Charge
//          bit9 = Last Gamble
function completeShingenKawanakijimaShowdown() => 0x501694

// $501698: (8-bit)(bitfield) Completed Missions for Masamune Date's Kawanakjima Campaign
//          
//          bit0 = Prelude to the Hunt
//          bit1 = Old Tiger
//          bit2 = Tiger Hunt
//          bit3 = No reinforcements!
//          bit4 = The Expert Retreater
//          bit5 = The Dragon awaits
//          bit6 = Dragon Hunt
//          bit7 = Fake Pincer
function completeMasamuneKawanakjimaCampaign() => 0x501698

// $50169C: (8-bit)(bitfield) Completed Missions for New Officer's The Battle of Kawanakajima
//          
//          bit0 = Night and Fog
//          bit1 = !!UNUSED!!
//          bit2 = Kenshin
//          bit3 = Tide has not changed
//          bit4 = Save Yukimura
function completeNewOfficerBattleOfKawanakajima() => 0x50169C

// $5016A0: (8-bit)(bitfield) Completed Missions for Yoshimoto Imagawa's The Battle of Kawanakajjima
//          
//          bit0 = The Peacemaker
//          bit1 = The Truth is in the Fog
//          bit2 = Justice?
//          bit3 = Virtue?
//          bit4 = The Path to Righteousness
//          bit5 = Wicked Ways
//          bit6 = Firm Resistance
//          bit7 = Bonds of Evil
function completeYoshimotoBattleOfKawanakajima() => 0x5016A0

// $5016A4: (8-bit)(bitfield) Completed Missions for Tadakatsu Honda's The Battle of Kawanakajira
//          
//          bit0 = Hachimanbara
//          bit1 = Rescue Yasumasa Sakakibara
//          bit2 = Sneak the Sneak
//          bit3 = Somebody's Waiting
//          bit4 = Through Annihilation
//          bit5 = Uesugi on the Move
//          bit6 = A Time for Vengeance
//          bit7 = Waves of Anger
function completeTadakatsuBattleOfKawanakajira() => 0x5016A4

// $5016A8: (8-bit)(bitfield) Completed Missions for Keiji Maeda's Dance of Kyoto
//          
//          bit0 = Show of Force
//          bit1 = Between Men
//          bit2 = Celebrity
//          bit3 = Unwanteds
//          bit4 = Miscreants
//          bit5 = Go Away
function completeKeijiDanceOfKyoto() => 0x5016A8

// $5016AC: (8-bit)(bitfield) Completed Missions for Nobunaga Oda's Betrayal at Honnouji
//          
//          bit0 = Sister
//          bit1 = Viper's Fangs
//          bit2 = Sacrifice
//          bit3 = Traitor
function completeNobunagaBetrayalAtHonnouji() => 0x5016AC

// $5016B0: (8-bit)(bitfield) Completed Missions for Mitsuhide Akechi's  Betrayal at Honnouji
//          
//          bit0 = Saying Goodbye
//          bit1 = Bellflower
//          bit2 = Promise to the Dead
//          bit3 = Innocence Lost
//          bit4 = The Enemy
function completeMitsuhideBetrayalAtHonnouji() => 0x5016B0

// $5016B4: (8-bit)(bitfield) Completed Missions for Goemon Ishikawa's Dance of Kyoto
//          
//          bit0 = Compete with Okuni
//          bit1 = Elusive, Part 1
//          bit2 = Elusive, Part 2
//          bit3 = Elusive, Part 3
//          bit4 = Elusive, Finale
//          bit5 = Uninvited Guests
//          bit6 = The Cycle ends
function completeGoemonDanceOfKyoto() => 0x5016B4

// $5016B8: (8-bit)(bitfield) Completed Missions for Goemon Ishikawa's Goemon the Wild
//          
//          bit0 = What's mine is mine
//          bit1 = Venting Anger
//          bit2 = Little Rat
//          bit3 = Help from my friends
//          bit4 = For Love
//          bit5 = Good Grief
function completeGoemonGoemonTheWild() => 0x5016B8

// $5016BC: (8-bit)(bitfield) Completed Missions for Oichi's Betrayal at Honnouji
//          
//          bit0 = Fire Safety
//          bit1 = Brother!
//          bit2 = Not Expendable
//          bit3 = Brother and Wife
//          bit4 = Blood Feud
//          bit5 = Escape Southeast
//          bit6 = Escape Northeast
//          bit7 = Score to Settle
function completeOichiBetrayalAtHonnouji() => 0x5016BC

// $5016C0: (16-bit)(bitfield) Completed Missions for Oichi's The Battle at Honnouji
//          
//          bit0 = Mitsuhide's Ambition
//          bit1 = Nagamasa's Effort
//          bit2 = Impatience
//          bit3 = Unrequited Love
//          bit4 = Monkey and Badger
//          bit5 = The Rivals
//          bit6 = Power Triangle
//          bit7 = The Badger
//          bit8 = I will stop you!
//          bit9 = Thank you and goodbye
function completeOichiBattleAtHonnouji() => 0x5016C0

// $5016C4: (8-bit)(bitfield) Completed Missions for Okuni's Dance of Kyoto
//          
//          Should be 0x7e
//          
//          bit0 = !! UNUSED !!
//          bit1 = Elusive, Part 1
//          bit2 = Elusive, Part 2
//          bit3 = Elusive, Part 3
//          bit4 = Elusive, Finale
//          bit5 = Uninvited Guests
//          bit6 = The Cycle ends
function completeOkuniDanceOfKyoto() => 0x5016C4

// $5016C8: (8-bit)(bitfield) Completed Missions for Magoichi Saika's Skirmish at Kyoto
//          
//          bit0 = For Starters...
//          bit1 = One-Trick Pony
//          bit2 = The Third Shot
//          bit3 = Beginning of the End
//          bit4 = Farewell to Arms
function completeMagoichiSkirmishAtKyoto() => 0x5016C8

// $5016CC: (8-bit)(bitfield) Completed Missions for Masamune Date's Attack on Honnouji
//          
//          bit0 = Endgame
//          bit1 = Ambition or Justice?
//          bit2 = Nobunaga's Trap
//          bit3 = Closure
//          bit4 = Rebellion
//          bit5 = Wavering Blade
//          bit6 = You cannot escape!
function completeMasamuneAttackOnHonnouji() => 0x5016CC

// $5016D0: (8-bit)(bitfield) Completed Missions for Noh's Betrayal at Honnouji
//          
//          bit0 = Head for the Main Hall
//          bit1 = Black Widow
//          bit2 = Fiery Escape
//          bit3 = Tragedy continues
//          bit4 = Naivete
//          bit5 = Impatience brings Death
function completeNohBetrayalAtHonnouji() => 0x5016D0

// $5016D4: (8-bit)(bitfield) Completed Missions for Noh's Betrayal at Honnouji (Second)
//          
//          bit0 = Show me the Way
//          bit1 = Protector of Love
//          bit2 = The Long Path
//          bit3 = Thorns
function completeNohBetrayalAtHonnoujiSecond() => 0x5016D4

// $5016D8: (8-bit)(bitfield) Completed Missions for Ranmaru Mori's Betrayal at Honnouji
//          
//          bit0 = Blockage
//          bit1 = Flames of Vengeance
//          bit2 = Blood of the Viper
//          bit3 = Blade of Judgment
//          bit4 = Trap
//          bit5 = Retribution
function completeRanmaruBetrayalAtHonnouji() => 0x5016D8

// $5016DC: (8-bit)(bitfield) Completed Missions for Hideyoshi Hashiba's Betrayal at Honnouji
//          
//          bit0 = A Strange Change
//          bit1 = A Mountain of Bodies
//          bit2 = The Sun is Falling
//          bit3 = Honnouji in Flames
//          bit4 = A Monkey's Love
//          bit5 = No Going Back
function completeHideyoshiBetrayalAtHonnouji() => 0x5016DC

// $5016E0: (8-bit)(bitfield) Completed Missions for Yoshimoto Imagawa's Kemari in the Capital
//          
//          bit0 = A Strategic Detour
//          bit1 = The Southern Gate
//          bit2 = Raising Dogs
//          bit3 = Show Strength, Feel Fear
//          bit4 = If not Kunoichi then who?
//          bit5 = Is the Betrayal Real?
//          bit6 = Red and White
//          bit7 = The Final Battle
function completeYoshimotoKemariInTheCapital() => 0x5016E0

// $5016E4: (8-bit)(bitfield) Completed Missions for Yoshimoto Imagawa's Struggle at Honnouji
//          
//          bit0 = Trials of the Ultimate Warrior
//          bit1 = Trials of the Kabuki
//          bit2 = Trials of the One Eyed Dragon
//          bit3 = Trials of the Demon
//          bit4 = Screams within Honnouji
function completeYoshimotoStruggleAtHonnouji() => 0x5016E4

// $5016E8: (8-bit)(bitfield) Completed Missions for Yukimura's The Battle of Mikatagahara
//          
//          bit0 = Youth
//          bit1 = Tadakatsu
//          bit2 = Sinking Ship
//          bit3 = Harsh Lesson
//          bit4 = Assassination
//          bit5 = !!UNUSED!!
//          bit6 = Last Stand
function completeYukimuraBattleOfMikatagahara() => 0x5016E8

// $5016EC: (8-bit)(bitfield) Completed Missions for Yukimura's The Battle of Nagashino
//          
//          bit0 = Nagashino
//          bit1 = Prodigy
//          bit2 = Counterattack
//          bit3 = Spear and Musket
//          bit4 = Rain of Fire
//          bit5 = Blue Bullet
function completeYukimuraBattleOfNagashino() => 0x5016EC

// $5016F0: (8-bit)(bitfield) Completed Missions for Yukimura's The Battle of Nagashino (Second)
//          
//          bit0 = Severance
//          bit1 = Rear Guard
//          bit2 = Tiger awakens
//          bit3 = Rain and Bullets
//          bit4 = !!UNUSED
//          bit5 = Champions
//          bit6 = Raw Power
//          bit7 = Tiger and Demon
function completeYukimuraBattleOfNagashinoSecond() => 0x5016F0

// $5016F4: (16-bit)(bitfield) Completed Missions for Keiji Maeda's The Battle of Nagashino
//          
//          bit0 = Front Line
//          bit1 = Distraction
//          bit2 = Mayhem
//          bit3 = !! UNUSED !!
//          bit4 = Katsuyori
//          bit5 = Sound of Terror
//          bit6 = Barricade
//          bit7 = Young Tiger
//          bit8 = Go Home
function completeKeijiBattleOfNagashino() => 0x5016F4

// $5016F8: (8-bit)(bitfield) Completed Missions for Nobunaga Oda's The Battle of Nagashino
//          
//          bit0 = Front Line
//          bit1 = Distraction
//          bit2 = Mayhem
//          bit3 = Divine Wind
//          bit4 = Katsuyori
//          bit5 = Sound of Terror
//          bit6 = Barricade
function completeNobunagaBattleOfNagahino() => 0x5016F8

// $5016FC: (8-bit)(bitfield) Completed Missions for Nobunaga Oda's The Battle of Nagashino (Second)
//          
//          bit0 = Masakage
//          bit1 = Nobufusa
//          bit2 = Tainted Hands
//          bit3 = Withdrawal
//          bit4 = Crumbling
//          bit5 = Friendly Fire
function completeNobunagaBattleOfNagashinoSecond() => 0x5016FC

// $501700: (8-bit)(bitfield) Completed Missions for Kuniochi's The battle of Mikatagahara
//          
//          bit0 = Youth
//          bit1 = Tadakatsu
//          bit2 = Sinking Ship
//          bit3 = Harsh Lesson
//          bit4 = Ninja's Pride
//          bit5 = Last stand
function completeKunioichiBattleOfMikatagahara() => 0x501700

// $501704: (8-bit)(bitfield) Completed Missions for Shingen Takeda's The Battle of Nagashino
//          
//          bit0 = Severance
//          bit1 = Rear Guard
//          bit2 = Tiger awakens
//          bit3 = !!UNUSED!!
//          bit4 = Tactical Contest
//          bit5 = Champion
//          bit6 = Raw Power
//          bit7 = Tiger devours Demon
function completeShingenBattleOfNagashino() => 0x501704

// $501708: (8-bit)(bitfield) Completed Missions for Masamune Date's Nagashino Campaign
//          
//          bit0 = Musket Unit
//          bit1 = Cavalry
//          bit2 = Speed for Muskets
//          bit3 = Power for Cavalry
//          bit4 = The Rear Guardian
//          bit5 = Old Soldier
//          bit6 = Foolish Badger
function completeMasamuneNagashinoCampaign() => 0x501708

// $50170C: (8-bit)(bitfield) Completed Missions for Hanzo Hattorii's The battle of Mikatagahara
//          
//          bit0 = Falling Star
//          bit1 = Scale
//          bit2 = Blade of Justice
//          bit3 = Shadow Flight
//          bit4 = Assassin
//          bit5 = Falcon's Nest
//          bit6 = Tombo-Giri
//          bit7 = Our Mikawa
function completeHanzoBattleOfMikatagahara() => 0x50170C

// $501710: (8-bit)(bitfield) Completed Missions for New Officer's The battle of Nagashino
//          
//          bit0 = Nagashino
//          bit1 = Prodigy
//          bit2 = Counterattack
//          bit3 = Spear and Musket
//          bit4 = Rain of Fire
function completeNewOfficerBattleOfNagashino() => 0x501710

// $501714: (8-bit)(bitfield) Completed Missions for Tadakatsu Honda's The battle of Mikatagahara
//          
//          bit0 = The Decoy
//          bit1 = Gone Fishing
//          bit2 = The Cutting Edge
//          bit3 = An Impressive Figure
//          bit4 = On Wings of a Crane
//          bit5 = The Will to Power
//          bit6 = Capture the Ruler
function completeTadakatsuBattleOfMikatagahara() => 0x501714

// $501718: (8-bit)(bitfield) Completed Missions for Ina's The battle of Mikatagahara
//          
//          bit0 = Fishing Bait
//          bit1 = Tempered Tantrum
//          bit2 = Thanks to the Shadow
//          bit3 = Femme Fatale
//          bit4 = The Land is Ours
//          bit5 = Spread Your Wings
//          bit6 = Preparing to Withdraw
//          bit7 = Withdrawing the Withdrawal
function completeInaBattleOfMikatagahara() => 0x501718

// $50171C: (8-bit)(bitfield) Completed Missions for Yukimura Sanada's The battle of Yamasaki
//          
//          bit0 = Breaking through
//          bit1 = Keiji
//          bit2 = The Deep Fog
//          bit3 = Find Nobunaga
//          bit4 = Stop the Pincer
//          bit5 = Keiji, once again
//          bit6 = Cave Assau
function completeYukimuraBattleOfYamasaki() => 0x50171C

// $501720: (8-bit)(bitfield) Completed Missions for Nobunaga Oda's The battle of Yamasaki
//          
//          bit0 = Trapped
//          bit1 = Infernal Sniper
//          bit2 = True Samurai
//          bit3 = Hideyoshi isolated
//          bit4 = Cruel Fate
//          bit5 = Road to Victory
//          bit6 = Enemy in the Fog
function completeNobunagaBattleOfYamasaki() => 0x501720

// $501724: (8-bit)(bitfield) Completed Missions for Mitsuhide Akechi's The battle of Yamasaki
//          
//          bit0 = Mt. Ten-oh
//          bit1 = Saving Matsuda
//          bit2 = The Summit
//          bit3 = No Reinforcements
//          bit4 = Great Tiger
//          bit5 = Tragedy of War
//          bit6 = Clear the Cave
//          bit7 = Monkey Tactics
function completeMitsuhideBattleOfYamasaki() => 0x501724

// $501728: (8-bit)(bitfield) Completed Missions for Nobunaga Oda's The battle of Yamasaki (Second)
//          
//          bit0 = East Gate
//          bit1 = West Gate
//          bit2 = Dark Enemy
//          bit3 = Avenger
//          bit4 = Reason
//          bit5 = Nobunaga advances
function completeNobunagaBattleOfYamasakiSecond() => 0x501728

// $50172C: (8-bit)(bitfield) Completed Missions for Magoichi Saika's Yamasaki Crossfire
//          
//          bit0 = Advance Force
//          bit1 = The First Shot
//          bit2 = Furious Assault
//          bit3 = Ambush Party
//          bit4 = Cease resistance?
//          bit5 = Reason to fight
function completeMagoichiYamasakiCrossfire() => 0x50172C

// $501730: (8-bit)(bitfield) Completed Missions for Shingen Takeda's The Battle of Yamasaki
//          
//          bit0 = Breaking through
//          bit1 = Keiji
//          bit2 = The Deep Fog
//          bit3 = Find Nobunaga
//          bit4 = Stop the Pincer
//          bit5 = Keiji, once again
//          bit6 = Cave Assault
//          bit7 = Artistic Battle
function completeShingenBattleOfYamasaki() => 0x501730

// $501734: (8-bit)(bitfield) Completed Missions for Hideyoshi Hashiba's The battle of Yamasaki
//          
//          bit0 = The Battle for Mt. Ten-oh
//          bit1 = No Margin for Error
//          bit2 = The Defense of Mt. Ten-oh
//          bit3 = Monkeying Around
//          bit4 = Three Days to Glory
//          bit5 = The General of Mt. Ten-oh
//          bit6 = To Be Taken Seriously
//          bit7 = Until We Meet Again
function completeHideyoshiBattleOfYamasaki() => 0x501734

// $501738: (8-bit)(bitfield) Completed Missions for Tadakatsu Honda's The battle of Yamasaki
//          
//          bit0 = Turning Point
//          bit1 = Atop the Mountain
//          bit2 = Mountain Climbing
//          bit3 = A Princess from the West
//          bit4 = A Warrior from the North
//          bit5 = A Squire from the South
//          bit6 = Soul Searching
function completeTadatsuBattleOfYamasaki() => 0x501738

// $50173C: (8-bit)(bitfield) Completed Missions for Tadakatsu Honda's The battle of Yamasaki
//          
//          bit0 = Waiting for Luck
//          bit1 = A Cornered Rat
//          bit2 = Monkey Calling
//          bit3 = Foggy Mountain Cave
//          bit4 = Monkey on the Mountain
//          bit5 = Rodent Infestation
//          bit6 = Can't Wait on Luck
//          bit7 = Mitsuhide Returns
function completeInaBattleOfYamasaki() => 0x50173C

// $501740: (8-bit)(bitfield) Completed Missions for Yukimura Sanada's Siege of Azuchi Castle
//          
//          bit0 = Azuchi in flames
//          bit1 = !! Unused !!
//          bit2 = !! Unused !!
//          bit3 = !! Unused !!
//          bit4 = !! Unused !!
//          bit5 = Colossal Gate
//          bit6 = Trapped Tiger
//          bit7 = Mismatch
//          
//          
//          Additional Missions available at 0x00517ac
function completeYukimuraSiegeOfAzuchiCastle() => 0x501740

// $501744: (16-bit)(bitfield) Completed Missions for Nobunaga Oda 's Retaking of Azuchi Castle
//          
//          Continued at 0x005017b0
//          
//          bit0 = Burn
//          bit1 = Unsettled Business
//          bit2 = Invaders
//          bit3 = Inferno
//          bit4 = Destruction
//          bit5 = No Mercy in Battle
//          bit6 = Dangerous Man
//          bit7 = Desperation
//          bit8 = Dangerous Woman
//          bit9 = Unforgivable
function completeNobunagaRetakingAzuchiPart1() => 0x501744

// $501748: (8-bit)(bitfield) Completed Missions for Mitsuhide Akechi 's Defense of Azuchi Castle
//          
//          bit0 = Stop the Fire
//          bit1 = The Flames spread
//          bit2 = Prediction
//          bit3 = Stop the Hashiba
//          bit4 = Stop the Shibata
//          bit5 = Moth to a Flame
//          bit6 = Nothing Sacred
//          bit7 = Demon's March
function completeMitsuhideDefenseOfAzuchiCastle() => 0x501748

// $50174C: (8-bit)(bitfield) Completed Missions for Oichi 's Siege of Azuchi Castle
//          
//          Continued at 0x005017bc
//          
//          bit0 = Colossal Gate
//          bit1 = Castle Grounds
//          bit2 = Three for One
//          bit3 = Silence the Muskets
//          bit4 = Misunderstanding
//          bit5 = Pressure
//          bit6 = The Shield
//          bit7 = Azai victorious?
function completeOichiSiegeOfAzuchiCastlePart1() => 0x50174C

// $501750: (8-bit)(bitfield) Completed Missions for Shingen Takeda 's Siege of Azuchi Castle
//          
//          bit0 = Azuchi in Flames
//          bit1 = The Right Place
//          bit2 = Dull Blade
//          bit3 = War God's Challenge
//          bit4 = The Race is On
//          
//          4 missing missions
function completeShingenSiegeOfAzuchiCastlePart1() => 0x501750

// $501754: (8-bit)(bitfield) Completed Missions for Hideyoshi Hashiba's Siege of Azuchi Castle
//          
//          Continued at 0x005017d4
//          
//          bit0 = The Sun and the Moon
//          bit1 = Rodsent Logic
//          bit2 = Foolish Actions
//          bit3 = Conclusion - Lord
//          bit4 = Conclusion - Friend
//          bit5 = The Warrior's Way
//          bit6 = Foolish Thoughts
function completeHideyoshiSiegeOfAzuchiCastlePart1() => 0x501754

// $501758: (8-bit)(bitfield) Completed Missions for Nobunaga Oda's Defense of Gifu Castle
//          
//          bit0 = Siege Ramp
//          bit1 = Sunomata
//          bit2 = Kenshin and Keiji
//          bit3 = !! UNUSED!!
//          bit4 =Betrayal means Death
//          bit5 = War God's Army
//          bit6 = Luring Kenshin
//          bit7 = White Fangs
function completeNobunagaDefenseOfGifuCastle() => 0x501758

// $50175C: (8-bit)(bitfield) Completed Missions for Mitsuhide Akechi's Defense of Inabayama Castle
//          
//          bit0 = Inbayama
//          bit1 = Lumber
//          bit2 = Resolution
//          bit3 = Prove Yourself
//          bit4 = Hanbei's Revolt
function completeMitsuhideDefenseOfInabayamaCastl() => 0x50175C

// $501760: (16-bit)(bitfield) Completed Missions for Kenshin Uesugi's Siege of Gifu Castle
//          
//          Continued at 0x005017e0
//          
//          bit0 = Mighty Shibata
//          bit1 = Bridge to Heaven
//          bit2 = Take Sunomata
//          bit3 = Direct Attack
//          bit4 = Split Forces
//          bit5 = The Stalwart
//          bit6 = The Tactician
//          bit7 = Gods and Demons
//          bit8 = No contest
//          bit9 = Castle occupied!
//          bit10 = Sweep
function completeKenshinSiegeOfGifuCastlePart1() => 0x501760

// $501764: (8-bit)(bitfield) Completed Missions for Oichi's Siege of Inabayama Castle
//          
//          continued at 0x5017E4
//          
//          bit0 = One Night Castle
//          bit1 = Get the Lumber
//          bit2 = Clear the Fortress
//          bit3 = Ploy uncovered
//          bit4 = Reckless Charge
//          bit5 = Path of Thorns
function completeOichiSiegeOfInabayamaCastlePart1() => 0x501764

// $501768: (8-bit)(bitfield) Completed Missions for Noh's Siege of Inabayama Castle
//          
//          Continued at 0x005017ec
//          
//          bit0 = One Night Castle
//          bit1 = Get the Lumber
//          bit2 = Clear the Fortress!
//          bit3 = Ploy uncovered
//          bit4 = Reckless Charge
//          bit5 = Path of Thorns
function completeNohSiegeOfInabayamaPart1() => 0x501768

// $50176C: (8-bit)(bitfield) Completed Missions for Ranmaru Mori's Defense of Inabayama Castle
//          
//          bit0 = Inabayama
//          bit1 = Lumber
//          bit2 = Resolution
//          bit3 = Prove Yourself
//          bit4 = Hanbei's Revolt
function completeRanmaruDefenseOfInabayamaCastle() => 0x50176C

// $501770: (8-bit)(bitfield) Completed Missions for Hideyoshi Hashiba's Siege of Inabayama Castle
//          
//          Continued at 0x005017f8
//          
//          bit0 = Sunomata Castle- Lumber
//          bit1 = Sunomata Castle- Land
//          bit2 = Stairway to the Sky
//          bit3 = Western Whirlwind
//          bit4 = Sunomata Castle- People
//          bit5 = Be a Hero!
//          bit6 = The Raging Rodent
//          bit7 = The Theory of Evolution
function completeHideyoshiSiegeOfInabayamaCastle() => 0x501770

// $501774: (8-bit)(bitfield) Completed Missions for Yukimura Sanada's Defense of Ueda Castle
//          
//          bit0 = First Strike
//          bit1 = Diversion
//          bit2 = Flood
//          bit3 = Rage
//          bit4 = Assassin
//          bit5 = Father
//          bit6 = Brother
function completeYukimuraDefenseOfUedaCastle() => 0x501774

// $501778: (8-bit)(bitfield) Completed Missions for Kenshin Uesugi's Siege of Ueda Castle
//          
//          Continued at 0x005017fc
//          
//          bit0 = Sanada's Son
//          bit1 = Decoy
//          bit2 = Illusion
//          bit3 = Enchantment
//          bit4 = Camp Surrounded
//          bit5 = Relentless
//          bit6 = I see you, Nemesis
//          bit7 = Inside the Castle
function completeKenshinSeigeOfUedaPart1() => 0x501778

// $50177C: (8-bit)(bitfield) Completed Missions for New Officer's Siege of Ueda Castle
//          
//          Continued at 0x005017f8
//          
//          bit0 = Secret Plan
//          bit1 = Quick Strike
//          bit2 = Invasion
//          bit3 = Stone in the Water
//          bit4 = Badger Hunt
//          bit5 = Stop Yukimura
//          bit6 = Plan Continues
function completeNewOfficerSiegeOfUedaCastlePart1() => 0x50177C

// $501780: (8-bit)(bitfield) Completed Missions for Yoshimoto Imagawa's Siege of Ueda Castle
//          
//          Continued at 0x050180c
//          
//          bit0 = Triple Strike
//          bit1 = Sharpening Swords
//          bit2 = Attacking by Surprise
//          bit3 = Where There's Smoke
//          bit4 = Old Friends
//          bit5 = Surrounded
function completeYoshimotoSiegeOfUedaCastlePart1() => 0x501780

// $501784: (8-bit)(bitfield) Completed Missions for Ina's Defense of Ueda Castle
//          
//          bit0 = Bringing Back The Bow
//          bit1 = Why Wish for War?
//          bit2 = Dancing with Kunoichi
//          bit3 = A Messy Situation
//          bit4 = Ina's Last Bow
//          bit5 = The Princess Trials
function completeInaDefenseOfUedaCastle() => 0x501784

// $501788: (8-bit)(bitfield) Completed Missions for Yukimura Sanada's Siege of Osaka - Summer
//          
//          bit0 = Power of Sanada
//          bit1 = Cannon
//          bit2 = Distrust
//          bit3 = Supporter
//          bit4 = Resolve
//          bit5 = Burning Soul
//          bit6 = Withering Hope
//          bit7 = Legendary Maneuver
function completeYukimuraSiegeOfOsaka() => 0x501788

// $50178C: (8-bit)(bitfield) Completed Missions for Goemon Ishikawa's Dance of Osaka
//          
//          bit0 = Goddess of Victory
//          bit1 = Playtime is not over
//          bit2 = Forbidden Love
//          bit3 = Repel the Invader
function completeGoemonDanceOfOsaka() => 0x50178C

// $501790: (8-bit)(bitfield) Completed Missions for Okuni's Dance of Osaka
//          
//          bit0 = Goddess of Victory
//          bit1 = Playtime is not over
//          bit2 = Forbidden Love
//          bit3 = Repel the Invader
function completeOkuniDanceOfOsaka() => 0x501790

// $501794: (16-bit)(bitfield) Completed Missions for Kunoichi's Siege of Osaka - Summer
//          
//          bit0 = Power of Sanada
//          bit1 = Cannon
//          bit2 = !!UNUSED!!
//          bit3 = Supporter
//          bit4 = Resolve
//          bit5 = !! Unused !!
//          bit6 = Withering Hope
//          bit7 = !! Unused !!
//          bit8 = Threat
//          bit9 = Secret Passage
//          bit10 = !! Unused !!
//          bit11 = Might as well 
//          
function completeKunioichiSiegeOfOsaka() => 0x501794

// $501798: (8-bit)(bitfield) Completed Missions for Hanzo Hattori's Siege of Osaka - Summer
//          
//          Continued at 0x00501814
//          
//          bit0 = Crimson Fortress
//          bit1 = Undying Spirit
//          bit2 = Sanada Ninjas
//          bit3 = Lion's Roar
//          bit4 = Just in Time
//          bit5 = Burning Soul
//          bit6 = Withering Hope
//          bit7 = Legendary Maneuver
//          
//          
function completeHanzoSiegeOfOsakaSummerPart1() => 0x501798

// $50179C: (16-bit)(bitfield) Completed Missions for New Officer's Siege of Osaka - Summer
//          
//          bit0 = Power of Sanada
//          bit1 = Cannon
//          bit2 = Distrust
//          bit3 = Supporter
//          bit4 = Resolve
//          bit5 = !! UNUSED !!
//          bit6 = Withering Hope
//          bit7 = Legendary Maneuver
//          bit8 = !! UNUSED !!
//          bit9 = !! UNUSED !!
//          bit10 = To the Death
//        
function completeNewOfficerSiegeOfOsakaSummerUpper() => 0x50179C

// $5017A0: (8-bit)(bitfield) Completed Missions for New Officer's Siege of Osaka - Summer
//          
//          Continued at 0x0050181c
//          
//          bit0 = !! UNUSED!!
//          bit1 = Undying Spirit
//          bit2 = !! UNUSED!!
//          bit3 = Lion's Roar
//          bit4 = Just in time
//          bit5 = Sanada-Maru
//          
function completeNewOfficerSiegeOfOsakaSummerLowerPart1() => 0x5017A0

// $5017A4: (8-bit)(bitfield) Completed Missions for Hideyoshi Hashiba's The Saika Campaign
//          
//          bit0 = Start Quietly
//          bit1 = There's Nobody Left
//          bit2 = An Invisible Attack
//          bit3 = Fasting
//          bit4 = Hideyoshi the Hero
//          bit5 = Finish Strongly
function completeHideyoshiTheSaikaCampaign() => 0x5017A4

// $5017A8: (8-bit)(bitfield) Completed Missions for Ina's Siege of Osaka Castle
//          
//          Continued at 0x00501820
//          
//          bit0 = Waiting at the Sanada-Maru
//          bit1 = Filial Piety
//          bit2 = The Main Camp is Calling
//          bit3 = This is It!
//          bit4 = Pearls before Swine
//          bit5 = Osaka Castle before Monkeys
//          bit6 = The Coming Evil
//          bit7 = The Sound of Muskets
function completeInaSiegeOfOsakaCastlePart1() => 0x5017A8

// $5017AC: (8-bit)(bitfield) Completed Missions for Yukimura Sanad's Siege of Azuchi Castle Part 2
//          
//          Continuation of 0x00501740
//          
//          bit0 = Princess
//          bit1 = Brute
//          bit2 = !! UNUSED!!
//          bit3 = Squire
//          bit4 = Demon Lord
function completeYukimuraSiegeOfAzuchiCastlePart2() => 0x5017AC

// $5017B0: (16-bit)(bitfield) Completed Missions for Nobunaga Oda 's Retaking of Azuchi Castle
//          
//          Continued from 0x00501744
//          
//          bit0 = Desiring Death
//          bit1 = More Desperation
//          bit2 = Solitude
//          bit3 = Two Monsters
function completeNobunagaRetakingOfAzuchiCastlePart2() => 0x5017B0

// $5017B4: (8-bit)(bitfield) Completed Missions for Goemon Ishikawa's Dance of Azuchi Castle
//          
//          bit0 = Guide
//          bit1 = Patrol
//          bit2 = Food and Shelter
//          bit3 = Lineage
//          bit4 = Escort
function completeGoemonDanceOfAzuchiCastle() => 0x5017B4

// $5017B8: (8-bit)(bitfield) Completed Missions for Oichi's Azuchi Infiltration
//          
//          bit0 = Three Mino Generals
//          bit1 = Triple Threat 1
//          bit2 = Triple Threat 2
//          bit3 = Fight with no Glory
//          bit4 = My Brother and Mitsuhide
function completeOichiAzuchiInfiltration() => 0x5017B8

// $5017BC: (8-bit)(bitfield) Completed Missions for Oichi's Siege of Azuchi Castle Part 2
//          
//          Continued from 0x0050174c
//          
//          bit0 = Opening Battle
//          bit1 = Self Sacrifice
//          bit2 = Disruptive Monkey
//          bit3 = Between Siblings
function completeOichiSiegeOfAzuchiCastlePart2() => 0x5017BC

// $5017C0: (8-bit)(bitfield) Completed Missions for Okuni's Dance of Azuchi Castle
//          
//          bit0 = Guide
//          bit1 = Patrol
//          bit2 = Spare Time
//          bit3 = Lineage
//          bit4 = Choice
function completeOkuniDanceOfAzuchiCastle() => 0x5017C0

// $5017C4: (8-bit)(bitfield) Completed Missions for Magoichi Saika's Azuchi Infiltration
//          
//          bit0 = The Final Shot
//          bit1 = I'm hot toda!y
//          bit2 = Chivalry
//          bit3 = Last Scuffle
//          bit4 = Gentleman
function completeMagoichiAzuchiInfiltration() => 0x5017C4

// $5017C8: (8-bit)(bitfield) Completed Missions for Shingen Takeda's Siege of Azuchi Castle Part 2 
//          
//          bit0 = Princess
//          bit1 = Brute
//          bit2 = !!UNUSED
//          bit3 = Squire
//          bit4 = Demon Lord
function completeShingenSiegeOfAzuchiCastlePart2() => 0x5017C8

// $5017CC: (8-bit)(bitfield) Completed Missions for Noh's Azuchi Infiltration
//          
//          bit0 = Unsightly Beast
//          bit1 = Sniper's Passion
//          bit2 = Intruder!
//          bit3 = Tokugawa Menace
//          bit4 = The interloper
function completeNohAzuchiInfiltration() => 0x5017CC

// $5017D0: (8-bit)(bitfield) Completed Missions for Ranmaru Mori's Defense of Azuchi Castle
//          
//          bit0 = !!UNUSED!!
//          bit1 = Hate
//          bit2 = Danger
//          bit3 = Null
//          bit4 = Life
//          bit5 = Chaos
function completeRanmaruDefenseOfAzuchiCastle() => 0x5017D0

// $5017D4: (8-bit)(bitfield) Completed Missions for Hideyoshi Hashiba's  Siege of Azuchi Castle part 2
//          
//          Continued from 0x00501754
//          
//          bit0 = Together
//          bit1 = Destruction
//          bit2 = Companions
//          bit3 = Creation
//          bit4 = Farewell
function completeHideyoshiSiegeOfAzuchiCastlePart2() => 0x5017D4

// $5017D8: (8-bit)(bitfield) Completed Missions for Mitsuhide Akechi's Gifu Infiltration
//          
//          bit0 = Ninjas
//          bit1 = Ninja Master
//          bit2 = Beautiful Prey
//          bit3 = Trespass
//          bit4 = Conviction
function completeMitsuhideGifuIniltration() => 0x5017D8

// $5017DC: (8-bit)(bitfield) Completed Missions for Goemon Ishikawa's Gifu Infiltration
//          
//          bit0 = Treasure's mine!
//          bit1 = Brat
//          bit2 = Don't put on airs!
//          bit3 = Wife and Brat
//          bit4 = Silent Treatment
//          bit5 = Popular Guy
function completeGoemonGifuInfiltration() => 0x5017DC

// $5017E0: (8-bit)(bitfield) Completed Missions for Kenshin Uesugi's Siege of Gifu Castle Part 2
//          
//          Continued from 0x0501760
//          
//          bit0 = First Floor
//          bit1 = Second Floor
//          bit2 = Third Floor
//          bit3 = Fourth Floor
function completeKenshinSiegeOfGifuCastlePart2() => 0x5017E0

// $5017E4: (8-bit)(bitfield) Completed Missions for Oichi's Siege of Inabayama Castle Part 2
//          
//          Continued from 0x00501764
//          
//          bit0 = Talented Youth
//          bit1 = Clever Tactician
//          bit2 = A Stern Man
//          bit3 = Way of the Viper
function completeOichiSiegeOfInabayamaCastlePart2() => 0x5017E4

// $5017E8: (8-bit)(bitfield) Completed Missions for Kunoichi's Gifu Infiltration
//          
//          bit0 = Goemon Ruckus
//          bit1 = Mr. Serious
//          bit2 = The Snake Woman
//          bit3 = Ooh La La
//          bit4 = Goemon Explosion
//          bit5 = Ultimate Ninja
//          bit6 = Lies, Tears and Revenge
function completeKunoichiGifuInfilitration() => 0x5017E8

// $5017EC: (8-bit)(bitfield) Completed Missions for Noh's Siege of Inabayama Castle Part 2
//          
//          Continued from 0x00501768
//          
//          bit0 = Talented Youth
//          bit1 = Clever Tactician
//          bit2 = A Stern Man
//          bit3 = Way of the Viper
function completeNohSiegeOfInabayamaCastlePart2() => 0x5017EC

// $5017F0: (8-bit)(bitfield) Completed Missions for Noh's Gifu Infiltration
//          
//          bit0 = Scurrying Vixen
//          bit1 = Chasing Viper
//          bit2 = Relentless Sniper
//          bit3 = An Honest Man
//          bit4 = Doom, for you
//          bit5 = Gates of Chaos
//          bit6 = Principle and Conviction
//          bit7 = Because...
function completeNohGifuInfiltration() => 0x5017F0

// $5017F4: (8-bit)(bitfield) Completed Missions for Ranmaru Mori's Gifu Infiltration
//          
//          bit0 = Enemy Ninjas
//          bit1 = Dark Beast
//          bit2 = Vendetta
//          bit3 = Obstacle
//          bit4 = Persistence
//          bit5 = Wild One
//          bit6 = Friend and Foe
function completeRanmaruGifuInfiltration() => 0x5017F4

// $5017F8: (8-bit)(bitfield) Completed Missions for Hideyoshi Hashibai's Siege of Inabayama Castle Part 2
//          
//          Continued from 0x00501770
//          
//          bit0 = A Defenseless Defense
//          bit1 = The Enemy Within
//          bit2 = The Threads of Fate
//          bit3 = On the Brink
//          bit4 = Near Death
function completeHideyoshiSiegeInabayamaCastlePa2() => 0x5017F8

// $5017FC: (8-bit)(bitfield) Completed Missions for Kenshin Uesugi's Siege of Ueda Castle Part 2
//          
//          Continued from 0x00501778
//          
//          bit0 = Race is on
//          bit1 = Elder Sanada
//          bit2 = Younger Sanada
//          bit3 = Brothers
//          bit4 = Sanada Patriarch
function completeKenshinSiegeOfUedaCastlePart2() => 0x5017FC

// $501800: (8-bit)(bitfield) Completed Missions for Kunoichi's Rescue at Ueda Castle
//          
//          bit0 = Become the Wind
//          bit1 = Stealthy Steps
//          bit2 = Reach for Tomorrow
//          bit3 = End is near
//          bit4 = Iga Illusion
function completeKunoichiRescueAtUedaCastle() => 0x501800

// $501804: (8-bit)(bitfield) Completed Missions for Hanzo Hattori's Ueda Infiltration
//          
//          bit0 = Espionage
//          bit1 = Intelligence
//          bit2 = Confirmation
//          bit3 = Unbreakable
//          bit4 = Secrecy
function completeHanzoUedaInfiltration() => 0x501804

// $501808: (8-bit)(bitfield) Completed Missions for New Officer's Siege of Ueda Castle Part 2
//          
//          Continued from 0x0050177c
//          
//          bit0 = First Time
//          bit1 = Second Time
//          bit2 = Third Time
//          bit3 = Fourth Time
//          bit4 = Fifth Time
//          bit5 = Sixth Time
//          bit6 = Tokugawa Rule
//          bit7 = Sanada Rule
function completeNewOfficerSiegeOfUedaCastlePart2() => 0x501808

// $50180C: (8-bit)(bitfield) Completed Missions for Yoshimoto Imagawa's Siege of Ueda Castle Part 2
//          
//          Continued from 0x00501780
//          
//          bit0 = Like Father, Like Son
//          bit1 = Noble in Peace
//          bit2 = Fierce in War
//          bit3 = The Two Warriors
//          bit4 = The Mirage
//          bit5 = Under Pressure
function completeYoshimotoSiegeOfUedaCastlePart2() => 0x50180C

// $501810: (8-bit)(bitfield) Completed Missions for Goemon Ishikawa's Osaka Intrusion
//          
//          bit0 = Treasure found
//          bit1 = Bad Student
//          bit2 = Not over Yet
//          bit3 = Shake the Castle
//          bit4 = Burning Spirit
//          bit5 = No Cannons Allowed
function completeGoemonIshikawaOsakaIntrusion() => 0x501810

// $501814: (8-bit)(bitfield) Completed Missions for Hanzo Hattori's Siege of Osaka - Summer
//          
//          Continued from 0x00501798
//          
//          bit0 = Undisciplined Ninja
//          bit1 = Muddle
//          bit2 = True Ninja
//          bit3 = Ruse
function completeHanzoSiegeOfOsakaSummerPart2() => 0x501814

// $501818: (8-bit)(bitfield) Completed Missions for Hanzo Hattori's Osaka Infiltration
//          
//          bit0 = Goemon
//          bit1 = Way of Ninjitsu
//          bit2 = Rogue's Fate
//          bit3 = Rematch
//          bit4 = Battle Royale
//          bit5 = Light and Shadow
//          bit6 = The Darkness
function completeHanzoOsakaInfiltration() => 0x501818

// $50181C: (8-bit)(bitfield) Completed Missions for New Officer's Siege of Osaka - Summer Part 2
//          
//          Continued from 0x005017a0
//          
//          bit0 = Just in time
//          bit1 = Muddle
//          bit2 = True Ninja
//          bit3 = Ruse
function completeNewOfficerSiegeOfOsakaSummerPar2() => 0x50181C

// $501820: (8-bit)(bitfield) Completed Missions for Ina's Siege of Osaka Castle Part 2
//          
//          Continued from 0x005017a8
//          
//          bit0 = A Rhapsody for Keiji
//          bit1 = A Melody for Kunoichi
//          bit2 = Chasing Yukimura
//          bit3 = A Lullaby from Magoichi
//          bit4 = An Ode to Bow
//          bit5 = Kunoichi's Last Dance
//          bit6 = Dancing Monkeys
//          bit7 = A Duet with Father
function completeInaSiegeOfOsakaCastlePart2() => 0x501820

// $501824: (8-bit)(bitfield) Completed Missions for Keiji Maeda's Odawara Infiltration
//          
//          bit0 = Babysitting
//          bit1 = Serious Warrior
function completeKeijiOdawaraInfiltration() => 0x501824

// $501828: (8-bit)(bitfield) Completed Missions for Kenshin Uesugi's Odawara Infiltration
//          
//          bit0 = No Knowledge
//          bit1 = Stalling
//          bit2 = Appearances
//          bit3 = Aftermath
function completeKenshinOdawaraInfiltration() => 0x501828

// $50182C: (8-bit)(bitfield) Completed Missions for Kunoichi's Odawara Infiltration
//          
//          bit0 = Goemon again...
//          bit1 = Make it stop!
//          bit2 = Enough already!
//          bit3 = Dragon and Vixen
//          bit4 = Hi, I'm an assassin
//          bit5 = Got me but Good
//          bit6 = 5 seconds to Detonation!
function completeKunoichiOdawaraInfiltration() => 0x50182C

// $501830: (8-bit)(bitfield) Completed Missions for Shingen Takeda's Odawara Infiltration
//          
//          bit0 = Ominous Shadow
//          bit1 = The Shadow returns
//          bit2 = From the North
//          bit3 = The Nemesis cometh
//          bit4 = People are the Walls
function completeShingenOdawaraInfiltration() => 0x501830

// $501834: (8-bit)(bitfield) Completed Missions for Masamune Date's Odawara Campaign
//          
//          bit0 = Inconspicuous
//          bit1 = Love...?
//          bit2 = Personal Challenge
//          bit3 = Battle between Men
function completeMasamuneOdawaraCampaign() => 0x501834

// $501838: (8-bit)(bitfield) Completed Missions for Yoshimoto Imagawa's Odawara Infiltration
//          
//          bit0 = Watch Your Step!
//          bit1 = The Hojo Brothers
//          bit2 = Kemari for Kids
//          bit3 = Read My Lips
//          bit4 = Beatuiful yet Irrational
function completeYoshimotoOdawaraInfiltration() => 0x501838

// $521210: (8-bit) Current Mission ID
//          
//          Mission number is as follows (names are not recorded right now)
//          
//          0x00 = Yukimura's The Battle of Kawanakajima (First Mission)
//          0x01 = Yukimura's The Battle of Mikatagahara (Second Mission)
//          0x02 = Yukimura's The Battle of Nagashino (Third Mission Upper Path)
//          0x03 = Yukimura's Defense of Ueda Castle (Fourth Mission Upper Path)
//          0x04 = Yukimura's Siege of Osaka - Summer (Fifth Mission Upper Path)
//          0x05 = Yukimura's The Battle of Nagashino (Third Mission Lower Path)
//          0x06 = Yukimura's Siege of Azuchi Castle (Fourth Mission Lower Path)
//          0x07 = Yukimura's The Battle of Yamasaki (Fifth Mission Lower Path)
//          0x08 = Keiji's The Battle of Ise (First Mission)
//          0x09 = Keiji's The Battle of Nagashino (Second Mission)
//          0x0A = Keiji's Dance of Kyoto (Third Mission)
//          0x0B = Keiji's Odawara Infiltration (Fourth Mission)
//          0x0C = Keiji's Kawanakajima Challenge (Fifth Mission)
//          0x0D = Nobunaga's The Battle of Okehazama (First Mission)
//          0x0E = Nobunaga's The Battle of Ise (Second Mission)
//          0x0F = Nobunaga's The Battle of Nagashino (Third Mission Upper Path)
//          0x10 = Nobunaga's Betrayal At Honnouji (Fourth Mission Upper Path)
//          0x11 = Nobunaga's Retaking Azuchi Castle (Fifth Mission Upper Path)
//          0x12 = Nobunaga's The Battle of Nagashino (Third Mission Lower Path)
//          0x13 = Nobunaga's Defense of Gifu Castle (Fourth Mission Lower Path)
//          0x14 = Nobunaga's The Battle of Yamasaki (Fifth Mission Lower Path)
//          0x15 = Mitsuhide's Defense of Inabayama Castle (First Mission)
//          0x16 = Mitsuhide's The Battle of Ise (Second Mission)
//          0x17 = Mitsuhide's Betrayal at Honnouji (Third Mission)
//          0x18 = Mitsuhide's The Battle of Yamasaki (Fourth Mission Upper Path)
//          0x19 = Mitsuhide's Gifu Infiltration (Fifth Mission Upper Path)
//          0x1A = Mitsuhide's Defense of Azuchi Castle (Fourth Mission Lower Path)
//          0x1B = Mitsuhide's The Battle of Yamasaki (Fifth Mission Lower Path)
//          0x1C = Goemon's Gifu Infiltration (First Mission)
//          0x1D = Goemon's Dance of Kyoto (Second Mission)
//          0x1E = Goemon's Crossing Iga (Third Mission Upper Path)
//          0x1F = Goemon's Osaka Intrusion (Fourth Mission Lower Path)
//          0x20 = Goemon's Goemon the Wild (Fifth Mission Upper Path)
//          0x21 = Goemon's Dance of Osaka (Third Mission Lower Path)
//          0x22 = Goemon's Dance of Ise (Fourth Mission Lower Path)
//          0x23 = Goemon's Dance of Azuchi Castle (Fifth Mission Lower Path)
//          0x24 = Kenshin's The Battle of Kawanakajima (First Mission)
//          0x25 = Kenshin's Odawara Infiltration (Second Mission)
//          0x26 = Kenshin's Siege of Ueda Castle (Third Mission)
//          0x27 = Kenshin's Siege of Gifu Castle (Fourth Mission)
//          0x28 = Kenshin's Kawanakajima Showdown (Fifth Mission Upper Path)
//          0x29 = Kenshin's The Battle of Anegawa (Fifth Mission Lower Path)
//          0x2A = Oichi's The Battle of Okehazama (First Mission)
//          0x2B = Oichi's Siege of Inabayama Castle (Second Mission)
//          0x2C = Oichi's The Battle of Anegawa (Third Mission)
//          0x2D = Oichi's Azuchi Infiltration (Fourth Mission Upper Path)
//          0x2E = Oichi's Betrayal at Honnouji (Fifth Mission Upper Path)
//          0x2F = Oichi's Siege of Azuchi Castle (Fourth Mission Lower Path)
//          0x30 = Oichi's The Battle of Honnouji (Fifth Mission Lower Path)
//          0x31 = Okuni's Dance of Kyoto (First Mission)
//          0x32 = Okuni's Dance of Osaka (Second Mission)
//          0x33 = Okuni's Dance of Ise (Third Mission)
//          0x34 = Okuni's Dance of Kawanakajima (Fourth Mission)
//          0x35 = Okuni's Dance of Azuchi Castle (Fifth Mission)
//          0x36 = Kunoichi's The Battle of Kawanakajima (First Mission)
//          0x37 = Kunoichi's The Battle of Mikatagahara (Second Missions)
//          0x38 = Kunoichi's Gifu Infiltration (Third Mission)
//          0x39 = Kunoichi's Rescue at Ueda Castle (Fourth Mission)
//          0x3A = Kunoichi's Siege of Osaka - Summer (Fifth Mission Upper Path)
//          0x3B = Kunoichi's Odawara Infiltration (Fifth Mission Lower Path)
//          0x3C = Magoichi's The Battle of Ise (First Mission)
//          0x3D = Magoichi's Yamasaki Crossfire (Second Mission)
//          0x3E = Magoichi's The Battle of Echizen (Third Mission)
//          0x3F = Magoichi's Skirmish at Kyoto (Fourth Mission)
//          0x40 = Magoichi's Azuchi Infiltration (Fifth Mission)
//          0x41 = Shingen's The Battle of Kawanakajima (First Mission)
//          0x42 = Shingen's Odawara Infiltration (Second Mission)
//          0x43 = Shingen's The Battle of Nagashino (Third Mission)
//          0x44 = Shingen's Siege of Azuchi Castle (Fourth Mission)
//          0x45 = Shingen's The Battle of Yamasaki (Fifth Mission Upper Path)
//          0x46 = Shingen's Kawanakajima Showdown (Fifth Mission Lower Path)
//          0x47 = Masamune's Kawanakajima Campaign (First Mission)
//          0x48 = Masamune's Okehazama Campaign (Second Mission)
//          0x49 = Masamune's Ise Campaign (Third Mission)
//          0x4A = Masamune's Nagashino Campaign(Fourth Mission)
//          0x4B = Masamune's Attack on Honnouji (Fifth Mission Upper Path)
//          0x4C = Masamune's Odawara Campaign (Fifth Mission Lower Path)
//          0x4D = Noh's The Battle of Okehazama (First Mission)
//          0x4E = Noh's Siege of Inabayama Castle (Second Mission)
//          0x4F = Noh's The Battle of Anegawa (Third Mission)
//          0x50 = Noh's Betrayal at Honnouji (Fourth Mission Upper Path)
//          0x51 = Noh's Gifu Infiltration (Fifth Mission Upper Path)
//          0x52 = Noh's Betrayal at Honnouji (Fourth Mission Lower Mission)
//          0x53 = Noh's Azuchi Infiltration (Fifth Mission Lower Path)
//          0x54 = Hanzo's The Battle of Okehazama (First Mission)
//          0x55 = Hanzo's The Battle of Mikatagahara (Second Mission)
//          0x56 = Hanzo's Crossing Iga (Third Mission)
//          0x57 = Hanzo's Ueda Infiltration (Fourth Mission)
//          0x58 = Hanzo's Siege of Osaka - Summer (Fifth Mission Upper Path)
//          0x59 = Hanzo's Osaka Infiltration (Fifth Mission Lower Path)
//          0x5A = Ranmaru's Defense of Inabayama Castle (First Mission)
//          0x5B = Ranmaru's The Battle of Ise (Second Mission)
//          0x5C = Ranmaru's Betrayal at Honnouji (Third Mission)
//          0x5D = Ranmaru's The Battle of Anegawa (Fourth Mission)
//          0x5E = Ranmaru's Gifu Infiltration (Fifth Mission Upper Path)
//          0x5F = Defense of Azuchi Castle (Ranmaru's Fifth Mission Lower Path)
//          0x60 = Hideyoshi's Siege of Inabayama Castle (First Mission)
//          0x61 = Hideyoshi's Retreat at Kanegasaki (Second Mission)
//          0x62 = Hideyoshi's The Saika Campaign (Third Mission)
//          0x63 = Hideyoshi's The Battle of Yamasaki (Fourth Mission Upper Path)
//          0x64 = Hideyoshi's The Battle of Komaki-Nagakute (Fifth Mission Upper Path)
//          0x65 = Hideyoshi's Betrayal at Honnouji (Fourth Mission Lower Path)
//          0x66 = Hideyoshi's Siege of Azuchi Castle (Fifth Mission Lower Path)
//          0x67 = Yoshimoto's The Battle of Okehazama (First Mission)
//          0x68 = Yoshimoto's Odawara Infiltration (Second Mission)
//          0x69 = Yoshimoto's The Battle of Kawanakajima (Third Mission)
//          0x6A = Yoshimoto's The Battle of Komaki-Nagakute (Fourth Mission Upper Path)
//          0x6B = Yoshimoto's Kemari in the Capital (Fifth Mission Upper Path)
//          0x6C = Yoshimoto's Siege of Ueda Castle (Fourth Mission Lower Path)
//          0x6D = Yoshimoto's Struggle at Honnouji (Fifth Mission Lower Path)
//          0x6E = Tadakatsu's The Battle of Okehazama  (First Mission)
//          0x6F = Tadakatsu's Retreat at Kanegasaki (Second Mission)
//          0x70 = Tadakatsu's The Battle of Mikatagahara (Third Mission)
//          0x71 = Tadakatsu's Crossing Iga (Fourth Mission Upper Path)
//          0x72 = Tadakatsu's The Battle of Komaki-Nagakute (Fifth Mission Upper Path)
//          0x73 = Tadakatsu's The Battle of Kawanakajima (Fourth Mission Lower Path)
//          0x74 = Tadakatsu's The Battle of Yamasaki (Fifth Mission Lower Path)
//          0x75 = Ina's Retreat at Kanegasaki (First Mission)
//          0x76 = Ina's The Battle of Mikatagahara (Second Mission)
//          0x77 = Ina's Crossing Iga (Third Mission)
//          0x78 = Ina's The Battle of Komaki-Nagakute(Fourth Mission Upper Path)
//          0x79 = Ina's Defense Of Ueda Castle (Fifth Mission Upper Path)
//          0x7A = Ina's The Battle of Yamasaki (Fourth Mission Lower Path)
//          0x7B = Ina's Siege of Osaka Castle(Fifth Mission Lower Path)
//          0x7C = New Officer's The Battle of Okehazama (First Mission)
//          0x7D = New Officer's The Battle of Kawanakajima (Second Mission)
//          0x7E = New Officer's The Battle of Nagashino (Third Mission)
//          0x7F = New Officer's Siege of Ueda (Fourth Mission)
//          0x80 = New Officer's Siege Of Osaka - Summer (Fifth Mission Upper Path)
//          0x81 = New Officer's Siege Of Osaka - Summer 2 (Fifth Mission Lower Path)
//          0x82 = Melee Mission
//          0x83 = Combo Mission
//          0x84 = Musou Mission
//          0x85 = Archery Mission
//          0x86 =
//          0x87 = Deflect Mission
//          0x88 = Burst Mission
//          0x89 =
//          0x8A = Riding Mission
//          0x8N =
//          0x8c = Survival Mode
//          0x8d = High Tower
//          0X8e = Gold Rush
// Also known as Scenario
function currentScenarioId() => byte(0x521210)

// $5211f4: (8-bit) Character Id 
//          
//          Controls name on the pause menu 
//          
//          0x00 = YUKIMURA 
//          0x01 = KEIJI 
//          0x02 = NOBUNAGA 
//          0x03 = MITSUHIDE 
//          0x04 = GOEMON 
//          0x05 = KENSHIN 
//          0x06 = OICHI 
//          0x07 = OKUNI 
//          0x08 = KUNOICHI 
//          0x09 = MAGOICHI 
//          0x0A = SHINGEN 
//          0x0B = MASAMUNE 
//          0x0C = NOH 
//          0x0D = HANZO 
//          0x0E = RANMARU 
//          0x0F = HIDEYOSHI 
//          0x10 = YOSHIMOTO 
//          0x11 = TADAKATSU 
//          0x12 = INA 
//          0x13 = NEW_OFFICER01 
//          0x14 = NEW_OFFICER02 
//          0x15 = NEW_OFFICER03 
//          0x16 = NEW_OFFICER04 
//          0x17 = NEW_OFFICER05 
//          0x18 = NEW_OFFICER06 
//          0x19 = NEW_OFFICER07 
//          0x1A = NEW_OFFICER08 
//          0x1B = NEW_OFFICER09 
//          0x1C = NEW_OFFICER10 
//          0x1D = NEW_OFFICER11 
//          0x1E = NEW_OFFICER12 
//          0x1F = NEW_OFFICER13 
//          0x20 = NEW_OFFICER14 
//          0x21 = NEW_OFFICER15 
function characterId() => byte(0x005211f4)

YUKIMURA = 0x00 
KEIJI = 0x01 
NOBUNAGA = 0x02 
MITSUHIDE = 0x03 
GOEMON = 0x04 
KENSHIN = 0x05 
OICHI = 0x06 
OKUNI = 0x07 
KUNOICHI = 0x08 
MAGOICHI = 0x09 
SHINGEN = 0x0A 
MASAMUNE = 0x0B 
NOH = 0x0C 
HANZO = 0x0D 
RANMARU = 0x0E 
HIDEYOSHI = 0x0F 
YOSHIMOTO = 0x10 
TADAKATSU = 0x11 
INA = 0x12 
NEW_OFFICER01 = 0x13 
NEW_OFFICER02 = 0x14 
NEW_OFFICER03 = 0x15 
NEW_OFFICER04 = 0x16 
NEW_OFFICER05 = 0x17 
NEW_OFFICER06 = 0x18 
NEW_OFFICER07 = 0x19 
NEW_OFFICER08 = 0x1A 
NEW_OFFICER09 = 0x1B 
NEW_OFFICER10 = 0x1C 
NEW_OFFICER11 = 0x1D 
NEW_OFFICER12 = 0x1E 
NEW_OFFICER13 = 0x1F 
NEW_OFFICER14 = 0x20 
NEW_OFFICER15 = 0x21 
LAST_OFFICIAL_OFFICER = INA

YUKIMURA_BATTLE_OF_KAWANAKAJIMA = 0x00
YUKIMURA_BATTLE_OF_MIKATAGAHARA = 0x01
YUKIMURA_BATTLE_OF_NAGASHINO_UPPER = 0x02
YUKIMURA_DEFENSE_OF_UEDA_CASTLE = 0x03
YUKIMURA_SIEGE_OF_OSAKA_SUMMER= 0x04
YUKIMURA_BATTLE_OF_NAGASHINO_LOWER = 0x05
YUKIMURA_SIEGE_OF_AZUCHI_CASTLE = 0x06
YUKIMURA_BATTLE_OF_YAMASAKI = 0x07
KEIJI_BATTLE_OF_ISE = 0x08
KEIJI_BATTLE_OF_NAGASHINO = 0x09
KEIJI_DANCE_OF_KYOTO = 0x0A
KEIJI_ODAWARA_INFILTRATION = 0x0B
KEIJI_KAWANAKAJIMA_CHALLENGE = 0x0C
NOBUNAGA_BATTLE_OF_OKEHAZAMA = 0x0D
NOBUNAGA_BATTLE_OF_ISE = 0x0E
NOBUNAGA_BATTLE_OF_NAGASHINO_UPPER = 0x0F
NOBUNAGA_BETRAYAL_AT_HONNOUJI = 0x10
NOBUNAGA_RETAKING_AZUCHI_CASTLE = 0x11
NOBUNAGA_BATTLE_OF_NAGASHINO_LOWER = 0x12
NOBUNAGA_DEFENSE_OF_GIFU_CASTLE = 0x13
NOBUNAGA_BATTLE_OF_YAMASAKI = 0x14
MITSUHIDE_DEFENSE_OF_INABAYAM_CASTLE = 0x15
MITSUHIDE_BATTLE_OF_ISE = 0x16
MITSUHIDE_BETRAYAL_AT_HONNOUJI = 0x17
MITSUHIDE_BATTLE_OF_YAMASAKI_UPPER = 0x18
MITSUHIDE_GIFU_INFILTRATION = 0x19
MITSUHIDE_DEFENSE_OF_AZUCHI_CASTLE = 0x1A
MITSUHIDE_BATTLE_OF_YAMASAKI_LOWER = 0x1B
GOEMON_GIFU_INFILTRATION = 0x1C
GOEMON_DANCE_OF_KYOTO = 0x1D
GOEMON_CROSSING_IGA = 0x1E
GOEMON_OSAKA_INTRUSION = 0x1F
GOEMON_GOEMON_THE_WILD = 0x20
GOEMON_DANCE_OF_OSAKA = 0x21
GOEMON_DANCE_OF_ISE = 0x22
GOEMON_DANCE_OF_AZUCHI_CASTLE = 0x23
KENSHIN_BATTLE_OF_KAWANAKAJIMA = 0x24
KENSHIN_ODAWARA_INFILTRATION = 0x25
KENSHIN_SIEGE_OF_UEDA = 0x26
KENSHIN_SIEGE_OF_GIFU_CASTLE = 0x27
KENSHIN_KAWANAKAJIMA_SHOWDOWN = 0x28
KENSHIN_BATTLE_OF_ANEGAWA = 0x29
OICHI_BATTLE_OF_OKEHAZAMA = 0x2A
OICHI_SIEGE_OF_INABAYAMA_CASTLE = 0x2B
OICHI_BATTLE_OF_ANEGAWA = 0x2C
OICHI_AZUCHI_INFILTRATION = 0x2D
OICHI_BETRAYAL_AT_HONNOUJI = 0x2E
OICHI_SIEGE_OF_AZUCHI_CASTLE = 0x2F
OICHI_BATTLE_OF_HONNOUJI = 0x30
OKUNI_DANCE_OF_KYOTO = 0x31
OKUNI_DANCE_OF_OSAKA = 0x32
OKUNI_DANCE_OF_ISE = 0x33
OKUNI_DANCE_OF_KAWANAKAJIMA = 0x34
OKUNI_DANCE_OF_AZUCHI_CASTLE = 0x35
KUNOICHI_BATTLE_OF_KAWANAKAJIMA = 0x36
KUNOICHI_BATTLE_OF_MIKATAGAHARA = 0x37
KUNOICHI_GIFU_INFILTRATION = 0x38
KUNOICHI_RESCUE_AT_UEDA_CASTLE = 0x39
KUNOICHI_SIEGE_OF_OSAKA_SUMMER = 0x3A
KUNOICHI_ODWARA_INFILTRATION = 0x3B
MAGOICHI_BATTLE_OF_ISE = 0x3C
MAGOICHI_YAMASAKI_CROSSFIRE = 0x3D
MAGOICHI_BATTLE_OF_ECHIZEN = 0x3E
MAGOICHI_SKIRMISH_AT_KYOTO = 0x3F
MAGOICHI_AZUCHI_INFILTRATION = 0x40
SHINGEN_BATTLE_OF_KAWANKAJIMA = 0x41
SHINGEN_ODAWARA_INFILTRATION = 0x42
SHINGEN_BATTLE_OF_NAGASHINO = 0x43
SHINGEN_SIEGE_OF_AZUCHI_CASTLE = 0x44
SHINGEN_BATTLE_OF_YAMASAKI = 0x45
SHINGEN_KAWANAKAJIMA_SHOWDOWN = 0x46
MASAMUNE_KAWANAKAJIMA_CAMPAIGN = 0x47
MASAMUNE_OKEHAZAMA_CAMPAIGN = 0x48
MASAMUNE_ISE_CAMPAIGN = 0x49
MASAMUNE_NAGASHINO_CAMPAIGN = 0x4A
MASAMUNE_ATTACK_ON_HONNOUJI = 0x4B
MASAMUNE_ODAWARA_CAMPAIGN = 0x4C
NOH_BATTLE_OF_OKEHAZAMA = 0x4D
NOH_SIEGE_OF_INABAYAMA_CASTLE = 0x4E
NOH_BATTLE_OF_ANEGAWA = 0x4F
NOH_BETRAYAL_AT_HONNOUJI_UPPER = 0x50
NOH_GIFU_INFILTRATION = 0x51
NOH_BETRAYAL_AT_HONNOUJI_LOWER = 0x52
NOH_AZUCHI_INFILTRATION = 0x53
HANZO_BATTLE_OF_OKEHAZAMA = 0x54
HANZO_BATTLE_OF_MIKATAGAHARA = 0x55
HANZO_CROSSING_IGA = 0x56
HANZO_UEDA_INFILTRATION = 0x57
HANZO_SIEGE_OF_OSAKA = 0x58
HANZO_OSAKA_INFILTRATION = 0x59
RANMARU_DEFENSE_OF_INABAYAMA_CASTLE = 0x5A
RANMARU_BATTLE_OF_ISE = 0x5B
RANMARU_BETRAYAL_AT_HONNOUJI = 0x5C
RANMARU_BATTLE_OF_ANEGAWA = 0x5D
RANMARU_GIFU_INFILTRATION = 0x5E
RANMARU_DEFENSE_OF_AZUCHI_CASTLE = 0x5F
HIDEYOSHI_SIEGE_OF_INABAYAMA_CASTLE = 0x60
HIDEYOSHI_RETREAT_AT_KANEGASAKI = 0x61
HIDEYOSHI_SAIKA_CAMPAIGN = 0x62
HIDEYOSHI_BATTLE_OF_YAMASAKI = 0x63
HIDEYOSHI_BATTLE_OF_KOMAKI_NAGAKUTE = 0x64
HIDEYOSHI_BETRAYAL_AT_HONNOUJI = 0x65
HIDEYOSHI_SIEGE_OF_AZUCHI_CASTLE = 0x66
YOSHIMOTO_BATTLE_OF_OKEHAZAMA = 0x67
YOSHIMOTO_ODAWARA_INFILTRATION = 0x68
YOSHIMOTO_BATTLE_OF_KAWANAKAJIMA = 0x69
YOSHIMOTO_BATTLE_OF_KOMAKI_NAGAKUTE = 0x6A
YOSHIMOTO_KEMARI_IN_THE_CAPITAL = 0x6B
YOSHIMOTO_SIEGE_OF_UEDA_CASTLE = 0x6C
YOSHIMOTO_STRUGGLE_AT_HONNOUJI = 0x6D
TADAKATSU_BATTLE_OF_OKEHAZAMA = 0x6E
TADAKATSU_RETREAT_AT_KANEGASAKI = 0x6F
TADAKATSU_BATTLE_OF_MIKATAGAHARA = 0x70
TADAKATSU_CROSSING_IGA = 0x71
TADAKATSU_THE_BATTLE_OF_KOMAKI_NAGAKUTE = 0x72
TADAKATSU_BATTLE_OF_KAWANAKAJIMA = 0x73
TADAKATSU_BATTLE_OF_YAMASAKI = 0x74
INA_RETREAT_AT_KANEGASAKI = 0x75
INA_BATTLE_OF_MIKATAGAHARA = 0x76
INA_CROSSING_IGA = 0x77
INA_BATTLE_OF_KOMAKI_NAGAKUTE = 0x78
INA_DEFENSE_OF_UEDA_CASTLE = 0x79
INA_BATTLE_OF_YAMASAKI = 0x7A
INA_SIEGE_OF_OSAKA_CASTLE = 0x7B
NEW_OFFICER_BATTLE_OF_OKEHAZAMA = 0x7C
NEW_OFFICER_BATTLE_OF_KAWANAKAJIMA = 0x7D
NEW_OFFICER_BATTLE_OF_NAGASAHINO = 0x7E
NEW_OFFICER_SIEGE_OF_UEDA = 0x7F
NEW_OFFICER_SIEGE_OF_OSAKA_SUMMER_UPPER = 0x80
NEW_OFFICER_SIEGE_OF_OSAKA_SUMMER_LOWER = 0x81
MELEE_MISSION = 0x82
COMBO_MISSION = 0x83 
MUSOU_MISSION = 0x84
ARCHERY_MISSION = 0x85
DEFLECT_MISSION = 0x87
BURST_MISSION = 0x88
RIDING_MISSION = 0x8A
DEEP_ABYSS = 0x8C
HIGH_TOWER = 0x8D
GOLD_RUSH = 0x8E 


CharacterNameLookup =
{
    YUKIMURA:"Yukimura Sanada",
    KEIJI: "Keiji Maeda",
    NOBUNAGA: "Nobunaga Oda",
    MITSUHIDE: "Mitsuhide Akechi",
    GOEMON: "Goemon Ishikawa",
    KENSHIN: "Kenshin Uesagi",
    OICHI: "Oichi",
    OKUNI: "Okuni",
    KUNOICHI: "Kunoichi",
    MAGOICHI: "Magoichi Saika",
    SHINGEN: "Shingen Takeda",
    MASAMUNE: "Masamune Date",
    NOH: "Noh",
    HANZO: "Hanzo Hattori",
    RANMARU: "Ranmaru Mori",
    HIDEYOSHI: "Hideyoshi Hashiba",
    YOSHIMOTO: "Yoshimoto Imagawa",
    TADAKATSU: "Tadakatsu Honda",
    INA: "Ina",
    NEW_OFFICER01: "New Officer",
    NEW_OFFICER02: "New Officer",
    NEW_OFFICER03: "New Officer",
    NEW_OFFICER04: "New Officer",
    NEW_OFFICER05: "New Officer",
    NEW_OFFICER06: "New Officer",
    NEW_OFFICER07: "New Officer",
    NEW_OFFICER08: "New Officer",
    NEW_OFFICER09: "New Officer",
    NEW_OFFICER10: "New Officer",
    NEW_OFFICER11: "New Officer",
    NEW_OFFICER12: "New Officer",
    NEW_OFFICER13: "New Officer",
    NEW_OFFICER14: "New Officer",
    NEW_OFFICER15: "New Officer"
}

FIRST = "First"
LAST = "Last"
ID = "ID"
LevelLineup = 
{
    YUKIMURA: {FIRST: YUKIMURA_BATTLE_OF_KAWANAKAJIMA,
               LAST: YUKIMURA_BATTLE_OF_YAMASAKI,
              ID: 388570
              },
    KEIJI: {FIRST: KEIJI_BATTLE_OF_ISE,
               LAST: KEIJI_KAWANAKAJIMA_CHALLENGE,
              ID: 388571
              },
    NOBUNAGA: {FIRST: NOBUNAGA_BATTLE_OF_OKEHAZAMA,
               LAST: NOBUNAGA_BATTLE_OF_YAMASAKI,
              ID: 388572
              },
    MITSUHIDE: {FIRST: MITSUHIDE_DEFENSE_OF_INABAYAM_CASTLE,
               LAST: MITSUHIDE_BATTLE_OF_YAMASAKI_LOWER,
              ID: 388573
              },
    GOEMON: {FIRST: GOEMON_GIFU_INFILTRATION,
               LAST: GOEMON_DANCE_OF_AZUCHI_CASTLE,
              ID: 388574
              },
    KENSHIN: {FIRST: KENSHIN_BATTLE_OF_KAWANAKAJIMA,
              LAST: KENSHIN_BATTLE_OF_ANEGAWA,
              ID: 388650
              },
    OICHI: {FIRST: OICHI_BATTLE_OF_OKEHAZAMA,
               LAST: OICHI_BATTLE_OF_HONNOUJI,
              ID: 388575
              },
    OKUNI: {FIRST: OKUNI_DANCE_OF_KYOTO,
               LAST: OKUNI_DANCE_OF_AZUCHI_CASTLE,
              ID: 388576
              },
    KUNOICHI: {FIRST: KUNOICHI_BATTLE_OF_KAWANAKAJIMA,
               LAST: KUNOICHI_ODWARA_INFILTRATION,
              ID: 388577
              },
    MAGOICHI: {FIRST: MAGOICHI_BATTLE_OF_ISE,
               LAST: MAGOICHI_AZUCHI_INFILTRATION,
              ID: 388578
              },
    SHINGEN: {FIRST: SHINGEN_BATTLE_OF_KAWANKAJIMA,
               LAST: SHINGEN_KAWANAKAJIMA_SHOWDOWN,
              ID: 388579
              },
    MASAMUNE: {FIRST: MASAMUNE_KAWANAKAJIMA_CAMPAIGN,
               LAST: MASAMUNE_ODAWARA_CAMPAIGN,
              ID: 388580
              },
    NOH: {FIRST: NOH_BATTLE_OF_OKEHAZAMA,
               LAST: NOH_AZUCHI_INFILTRATION,
              ID: 388581
              },
    HANZO: {FIRST: HANZO_BATTLE_OF_OKEHAZAMA,
               LAST: HANZO_OSAKA_INFILTRATION,
              ID: 388582
              },
    RANMARU: {FIRST: RANMARU_DEFENSE_OF_INABAYAMA_CASTLE,
               LAST: RANMARU_DEFENSE_OF_AZUCHI_CASTLE,
              ID: 388583
              },
    HIDEYOSHI: {FIRST: HIDEYOSHI_SIEGE_OF_INABAYAMA_CASTLE,
               LAST: HIDEYOSHI_SIEGE_OF_AZUCHI_CASTLE,
              ID: 388584
              },
    YOSHIMOTO: {FIRST: YOSHIMOTO_BATTLE_OF_OKEHAZAMA,
               LAST: YOSHIMOTO_STRUGGLE_AT_HONNOUJI,
              ID: 388585
              },
    TADAKATSU: {FIRST: TADAKATSU_BATTLE_OF_OKEHAZAMA,
               LAST: TADAKATSU_BATTLE_OF_YAMASAKI,
              ID: 388586
              },
    INA: {FIRST: INA_RETREAT_AT_KANEGASAKI,
               LAST: INA_SIEGE_OF_OSAKA_CASTLE,
              ID: 388587
              },
    NEW_OFFICER01: {FIRST: NEW_OFFICER_BATTLE_OF_OKEHAZAMA,
               LAST: NEW_OFFICER_SIEGE_OF_OSAKA_SUMMER_LOWER,
              ID: 388588
              },
}

LevelLookup =
{
    YUKIMURA_BATTLE_OF_KAWANAKAJIMA: "Yukimura's The Battle of Kawanakajima",
    YUKIMURA_BATTLE_OF_MIKATAGAHARA: "Yukimura's The Battle of Mikatagahara",
    YUKIMURA_BATTLE_OF_NAGASHINO_UPPER: "Yukimura's The Battle of Nagashino (Upper Path)" ,
    YUKIMURA_DEFENSE_OF_UEDA_CASTLE: "Yukimura's Defense of Ueda Castle",
    YUKIMURA_SIEGE_OF_OSAKA_SUMMER: "Yukimura's Siege of Osaka - Summer",
    YUKIMURA_BATTLE_OF_NAGASHINO_LOWER: "Yukimura's The Battle of Nagashino (Lower Path)",
    YUKIMURA_SIEGE_OF_AZUCHI_CASTLE: "Yukimura's Siege of Azuchi Castle",
    YUKIMURA_BATTLE_OF_YAMASAKI: "Yukimura's The Battle of Yamasaki",
    KEIJI_BATTLE_OF_ISE: "Keiji's The Battle of Ise",
    KEIJI_BATTLE_OF_NAGASHINO: "Keiji's The Battle of Nagashino",
    KEIJI_DANCE_OF_KYOTO: "Keiji's Dance of Kyoto",
    KEIJI_ODAWARA_INFILTRATION: "Keiji's Odawara Infiltration",
    KEIJI_KAWANAKAJIMA_CHALLENGE: "Keiji's Kawanakajima Challenge",
    NOBUNAGA_BATTLE_OF_OKEHAZAMA: "Nobunaga's The Battle of Okehazama",
    NOBUNAGA_BATTLE_OF_ISE: "Nobunaga's The Battle of Ise",
    NOBUNAGA_BATTLE_OF_NAGASHINO_UPPER: "Nobunaga's The Battle of Nagashino (Upper Path)",
    NOBUNAGA_BETRAYAL_AT_HONNOUJI: "Nobunaga's Betrayal At Honnouji",
    NOBUNAGA_RETAKING_AZUCHI_CASTLE: "Nobunaga's Retaking Azuchi Castle",
    NOBUNAGA_BATTLE_OF_NAGASHINO_LOWER: "Nobunaga's The Battle of Nagashino (LowerPath)",
    NOBUNAGA_DEFENSE_OF_GIFU_CASTLE: "Nobunaga's Defense of Gifu Castle",
    NOBUNAGA_BATTLE_OF_YAMASAKI: "Nobunaga's The Battle of Yamasaki",
    MITSUHIDE_DEFENSE_OF_INABAYAM_CASTLE: "Mitsuhide's Defense of Inabayama Castle",
    MITSUHIDE_BATTLE_OF_ISE: "Mitsuhide's The Battle of Ise",
    MITSUHIDE_BETRAYAL_AT_HONNOUJI: "Mitsuhide's Betrayal at Honnouji",
    MITSUHIDE_BATTLE_OF_YAMASAKI_UPPER: "Mitsuhide's The Battle of Yamasaki(Upper Path)" ,
    MITSUHIDE_GIFU_INFILTRATION: "Mitsuhide's Gifu Infiltration",
    MITSUHIDE_DEFENSE_OF_AZUCHI_CASTLE: "Mitsuhide's Defense of Azuchi Castle",
    MITSUHIDE_BATTLE_OF_YAMASAKI_LOWER: "Mitsuhide's The Battle of Yamasaki(Lower Path)",
    GOEMON_GIFU_INFILTRATION: "Goemon's Gifu Infiltration",
    GOEMON_DANCE_OF_KYOTO: "Goemon's Dance of Kyoto",
    GOEMON_CROSSING_IGA: "Goemon's Crossing Iga",
    GOEMON_OSAKA_INTRUSION: "Goemon's Osaka Intrusion",
    GOEMON_GOEMON_THE_WILD: "Goemon's Goemon the Wild",
    GOEMON_DANCE_OF_OSAKA: "Goemon's Dance of Osaka",
    GOEMON_DANCE_OF_ISE: "Goemon's Dance of Ise",
    GOEMON_DANCE_OF_AZUCHI_CASTLE: "Goemon's Dance of Azuchi Castle",
    KENSHIN_BATTLE_OF_KAWANAKAJIMA: "Kenshin's The Battle of Kawanakajima",
    KENSHIN_ODAWARA_INFILTRATION: "Kenshin's Odawara Infiltration",
    KENSHIN_SIEGE_OF_UEDA: "Kenshin's Siege of Ueda Castle",
    KENSHIN_SIEGE_OF_GIFU_CASTLE: "Kenshin's Siege of Gifu Castle",
    KENSHIN_KAWANAKAJIMA_SHOWDOWN: "Kenshin's Kawanakajima Showdown",
    KENSHIN_BATTLE_OF_ANEGAWA: "Kenshin's The Battle of Anegawa",
    OICHI_BATTLE_OF_OKEHAZAMA: "Oichi's The Battle of Okehazama",
    OICHI_SIEGE_OF_INABAYAMA_CASTLE: "Oichi's Siege of Inabayama Castle",
    OICHI_BATTLE_OF_ANEGAWA: "Oichi's The Battle of Anegawa",
    OICHI_AZUCHI_INFILTRATION: "Oichi's Azuchi Infiltration",
    OICHI_BETRAYAL_AT_HONNOUJI: "Oichi's Betrayal at Honnouji",
    OICHI_SIEGE_OF_AZUCHI_CASTLE: "Oichi's Siege of Azuchi Castle",
    OICHI_BATTLE_OF_HONNOUJI: "Oichi's The Battle of Honnouji",
    OKUNI_DANCE_OF_KYOTO: "Okuni's Dance of Kyoto",
    OKUNI_DANCE_OF_OSAKA: "Okuni's Dance of Osaka",
    OKUNI_DANCE_OF_ISE: "Okuni's Dance of Ise",
    OKUNI_DANCE_OF_KAWANAKAJIMA: "Okuni's Dance of Kawanakajima",
    OKUNI_DANCE_OF_AZUCHI_CASTLE: "Okuni's Dance of Azuchi Castle",
    KUNOICHI_BATTLE_OF_KAWANAKAJIMA: "Kunoichi's The Battle of Kawanakajima",
    KUNOICHI_BATTLE_OF_MIKATAGAHARA: "Kunoichi's The Battle of Mikatagahara",
    KUNOICHI_GIFU_INFILTRATION: "Kunoichi's Gifu Infiltration",
    KUNOICHI_RESCUE_AT_UEDA_CASTLE: "Kunoichi's Rescue at Ueda Castle",
    KUNOICHI_SIEGE_OF_OSAKA_SUMMER: "Kunoichi's Siege of Osaka - Summer",
    KUNOICHI_ODWARA_INFILTRATION: "Kunoichi's Odawara Infiltration",
    MAGOICHI_BATTLE_OF_ISE: "Magoichi's The Battle of Ise",
    MAGOICHI_YAMASAKI_CROSSFIRE: "Magoichi's Yamasaki Crossfire",
    MAGOICHI_BATTLE_OF_ECHIZEN: "Magoichi's The Battle of Echizen",
    MAGOICHI_SKIRMISH_AT_KYOTO: "Magoichi's Skirmish at Kyoto",
    MAGOICHI_AZUCHI_INFILTRATION: "Magoichi's Azuchi Infiltration",
    SHINGEN_BATTLE_OF_KAWANKAJIMA: "Shingen's The Battle of Kawanakajima",
    SHINGEN_ODAWARA_INFILTRATION: "Shingen's Odawara Infiltration",
    SHINGEN_BATTLE_OF_NAGASHINO: "Shingen's The Battle of Nagashino",
    SHINGEN_SIEGE_OF_AZUCHI_CASTLE: "Shingen's Siege of Azuchi Castle",
    SHINGEN_BATTLE_OF_YAMASAKI: "Shingen's The Battle of Yamasaki",
    SHINGEN_KAWANAKAJIMA_SHOWDOWN: "Shingen's Kawanakajima Showdown",
    MASAMUNE_KAWANAKAJIMA_CAMPAIGN: "Masamune's Kawanakajima Campaign",
    MASAMUNE_OKEHAZAMA_CAMPAIGN: "Masamune's Okehazama Campaign",
    MASAMUNE_ISE_CAMPAIGN: "Masamune's Ise Campaign",
    MASAMUNE_NAGASHINO_CAMPAIGN: "Masamune's Nagashino Campaign",
    MASAMUNE_ATTACK_ON_HONNOUJI: "Masamune's Attack on Honnouji",
    MASAMUNE_ODAWARA_CAMPAIGN: "Masamune's Odawara Campaign",
    NOH_BATTLE_OF_OKEHAZAMA: "Noh's The Battle of Okehazama",
    NOH_SIEGE_OF_INABAYAMA_CASTLE: "Noh's Siege of Inabayama Castle",
    NOH_BATTLE_OF_ANEGAWA: "Noh's The Battle of Anegawa",
    NOH_BETRAYAL_AT_HONNOUJI_UPPER: "Noh's Betrayal at Honnouji(Upper Path)",
    NOH_GIFU_INFILTRATION: "Noh's Gifu Infiltration",
    NOH_BETRAYAL_AT_HONNOUJI_LOWER: "Noh's Betrayal at Honnouji(Lower Path)",
    NOH_AZUCHI_INFILTRATION: "Noh's Azuchi Infiltration",
    HANZO_BATTLE_OF_OKEHAZAMA: "Hanzo's The Battle of Okehazama",
    HANZO_BATTLE_OF_MIKATAGAHARA: "Hanzo's The Battle of Mikatagahara",
    HANZO_CROSSING_IGA: "Hanzo's Crossing Iga",
    HANZO_UEDA_INFILTRATION: "Hanzo's Ueda Infiltration",
    HANZO_SIEGE_OF_OSAKA: "Hanzo's Siege of Osaka - Summer",
    HANZO_OSAKA_INFILTRATION: "Hanzo's Osaka Infiltration",
    RANMARU_DEFENSE_OF_INABAYAMA_CASTLE: "Ranmaru's Defense of Inabayama Castle",
    RANMARU_BATTLE_OF_ISE: "Ranmaru's The Battle of Ise",
    RANMARU_BETRAYAL_AT_HONNOUJI: "Ranmaru's Betrayal at Honnouji",
    RANMARU_BATTLE_OF_ANEGAWA: "Ranmaru's The Battle of Anegawa",
    RANMARU_GIFU_INFILTRATION: "Ranmaru's Gifu Infiltration",
    RANMARU_DEFENSE_OF_AZUCHI_CASTLE: "Ranmaru's Defense of Azuchi Castle",
    HIDEYOSHI_SIEGE_OF_INABAYAMA_CASTLE: "Hideyoshi's Siege of Inabayama Castle",
    HIDEYOSHI_RETREAT_AT_KANEGASAKI: "Hideyoshi's Retreat at Kanegasaki",
    HIDEYOSHI_SAIKA_CAMPAIGN:"Hideyoshi's The Saika Campaign",
    HIDEYOSHI_BATTLE_OF_YAMASAKI: "Hideyoshi's The Battle of Yamasaki",
    HIDEYOSHI_BATTLE_OF_KOMAKI_NAGAKUTE: "Hideyoshi's The Battle of Komaki-Nagakute",
    HIDEYOSHI_BETRAYAL_AT_HONNOUJI: "Hideyoshi's Betrayal at Honnouji",
    HIDEYOSHI_SIEGE_OF_AZUCHI_CASTLE: "Hideyoshi's Siege of Azuchi Castle",
    YOSHIMOTO_BATTLE_OF_OKEHAZAMA: "Yoshimoto's The Battle of Okehazama",
    YOSHIMOTO_ODAWARA_INFILTRATION: "Yoshimoto's Odawara Infiltration",
    YOSHIMOTO_BATTLE_OF_KAWANAKAJIMA: "Yoshimoto's The Battle of Kawanakajima",
    YOSHIMOTO_BATTLE_OF_KOMAKI_NAGAKUTE: "Yoshimoto's The Battle of Komaki-Nagakute",
    YOSHIMOTO_KEMARI_IN_THE_CAPITAL: "Yoshimoto's Kemari in the Capital",
    YOSHIMOTO_SIEGE_OF_UEDA_CASTLE: "Yoshimoto's Siege of Ueda Castle",
    YOSHIMOTO_STRUGGLE_AT_HONNOUJI: "Yoshimoto's Struggle at Honnouji",
    TADAKATSU_BATTLE_OF_OKEHAZAMA: "Tadakatsu's The Battle of Okehazama",
    TADAKATSU_RETREAT_AT_KANEGASAKI: "Tadakatsu's Retreat at Kanegasaki",
    TADAKATSU_BATTLE_OF_MIKATAGAHARA: "Tadakatsu's The Battle of Mikatagahara",
    TADAKATSU_CROSSING_IGA: "Tadakatsu's Crossing Iga",
    TADAKATSU_THE_BATTLE_OF_KOMAKI_NAGAKUTE: "Tadakatsu's The Battle of Komaki-Nagakute",
    TADAKATSU_BATTLE_OF_KAWANAKAJIMA: "Tadakatsu's The Battle of Kawanakajima",
    TADAKATSU_BATTLE_OF_YAMASAKI: "Tadakatsu's The Battle of Yamasaki",
    INA_RETREAT_AT_KANEGASAKI: "Ina's Retreat at Kanegasaki",
    INA_BATTLE_OF_MIKATAGAHARA: "Ina's The Battle of Mikatagahara",
    INA_CROSSING_IGA: "Ina's Crossing Iga",
    INA_BATTLE_OF_KOMAKI_NAGAKUTE: "Ina's The Battle of Komaki-Nagakute",
    INA_DEFENSE_OF_UEDA_CASTLE: "Ina's Defense Of Ueda Castle",
    INA_BATTLE_OF_YAMASAKI: "Ina's The Battle of Yamasaki",
    INA_SIEGE_OF_OSAKA_CASTLE: "Ina's Siege of Osaka Castle",
    NEW_OFFICER_BATTLE_OF_OKEHAZAMA: "New Officer's The Battle of Okehazama",
    NEW_OFFICER_BATTLE_OF_KAWANAKAJIMA: "New Officer's The Battle of Kawanakajima",
    NEW_OFFICER_BATTLE_OF_NAGASAHINO: "New Officer's The Battle of Nagashino",
    NEW_OFFICER_SIEGE_OF_UEDA: "New Officer's Siege of Ueda",
    NEW_OFFICER_SIEGE_OF_OSAKA_SUMMER_UPPER: "New Officer's Siege Of Osaka - Summer (Upper Path)",
    NEW_OFFICER_SIEGE_OF_OSAKA_SUMMER_LOWER: "New Officer's Siege Of Osaka - Summer (Lower Path)",
    MELEE_MISSION: "Melee",
    COMBO_MISSION: "Combo",
    MUSOU_MISSION: "Musou",
    ARCHERY_MISSION: "Archery",
    DEFLECT_MISSION: "Deflect",
    BURST_MISSION: "Burst",
    RIDING_MISSION: "Riding",
    DEEP_ABYSS: "Deep Abyss",
    HIGH_TOWER: "High Tower",
    GOLD_RUSH: "Gold Rush",
}


MISSION_INFO = "Mission info"
EXTENDED_MISSION_INFO = "Extra Mission info"
EXPECTED_VALUE = "Expected Value"
EXTENDED_EXPECTED_VALUE = "Extra Expected Value"
POINTS = "POINTS"

BIT1_FULL = 0x03
BIT2_FULL = 0x07
BIT3_FULL = 0x0f
BIT4_FULL = 0x1f
BIT5_FULL = 0x3f
BIT6_FULL = 0x7f
BIT7_FULL = 0xff
BIT8_FULL = 0x1ff
BIT9_FULL = 0x3ff
BIT10_FULL = 0x7ff
BIT11_FULL = 0xfff
BIT12_FULL = 0x1fff
BIT0 = 1
BIT1 = 2
BIT2 = 4
BIT3 = 8
BIT4 = 16
BIT5 = 32
BIT6 = 64
BIT7 = 128
BIT8 = 256
BIT9 = 512
BIT10 = 1024
BIT11 = 2048


LevelInfo =
{
    YUKIMURA_BATTLE_OF_KAWANAKAJIMA: { MISSION_INFO: completeYukimuraBattleOfKawankajima(), 
                                       EXPECTED_VALUE: (BIT8_FULL - BIT3-
                                                        BIT5 - BIT6), 
                                       POINTS: 5},
    YUKIMURA_BATTLE_OF_MIKATAGAHARA: { MISSION_INFO: completeYukimuraBattleOfMikatagahara(), 
                                       EXPECTED_VALUE: (BIT6_FULL-BIT5), 
                                       POINTS: 5},
    YUKIMURA_BATTLE_OF_NAGASHINO_UPPER: { MISSION_INFO: completeYukimuraBattleOfNagashino(), 
                                       EXPECTED_VALUE: BIT5_FULL, 
                                       POINTS: 5},
    YUKIMURA_DEFENSE_OF_UEDA_CASTLE: { MISSION_INFO: completeYukimuraDefenseOfUedaCastle(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    YUKIMURA_SIEGE_OF_OSAKA_SUMMER: { MISSION_INFO: completeYukimuraSiegeOfOsaka(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    YUKIMURA_BATTLE_OF_NAGASHINO_LOWER: { MISSION_INFO: completeYukimuraBattleOfNagashinoSecond(), 
                                       EXPECTED_VALUE: (BIT7_FULL - BIT4), 
                                       POINTS: 5},
    YUKIMURA_SIEGE_OF_AZUCHI_CASTLE: { MISSION_INFO: completeYukimuraSiegeOfAzuchiCastle(), 
                                       EXPECTED_VALUE: (BIT7_FULL - BIT1 -
                                                        BIT2 - BIT3 - BIT4), 
                                       EXTENDED_MISSION_INFO: completeYukimuraSiegeOfAzuchiCastlePart2(),
                                       EXTENDED_EXPECTED_VALUE: (BIT4_FULL - BIT2),
                                       POINTS: 5},
    YUKIMURA_BATTLE_OF_YAMASAKI: { MISSION_INFO: completeYukimuraBattleOfYamasaki(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    KEIJI_BATTLE_OF_ISE: { MISSION_INFO: completeKeijiBattleOfIse(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    KEIJI_BATTLE_OF_NAGASHINO: { MISSION_INFO: completeKeijiBattleOfNagashino(), 
                                       EXPECTED_VALUE: (BIT8_FULL - BIT3), 
                                       POINTS: 5},
    KEIJI_DANCE_OF_KYOTO: { MISSION_INFO: completeKeijiDanceOfKyoto(), 
                                       EXPECTED_VALUE: BIT5_FULL, 
                                       POINTS: 5},
    KEIJI_ODAWARA_INFILTRATION: { MISSION_INFO: completeKeijiOdawaraInfiltration(), 
                                       EXPECTED_VALUE: BIT1_FULL, 
                                       POINTS: 5},
    KEIJI_KAWANAKAJIMA_CHALLENGE: { MISSION_INFO: completeKiejiKawanakajimaChallenge(), 
                                       EXPECTED_VALUE: BIT2_FULL, 
                                       POINTS: 5},
    NOBUNAGA_BATTLE_OF_OKEHAZAMA: { MISSION_INFO: completeNobunagaBattleofOkehazama(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    NOBUNAGA_BATTLE_OF_ISE: { MISSION_INFO: completeNobunagaBattleOfIse(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    NOBUNAGA_BATTLE_OF_NAGASHINO_UPPER: { MISSION_INFO: completeNobunagaBattleOfNagahino(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    NOBUNAGA_BETRAYAL_AT_HONNOUJI: { MISSION_INFO: completeNobunagaBetrayalAtHonnouji(), 
                                       EXPECTED_VALUE: BIT3_FULL, 
                                       POINTS: 5},
    NOBUNAGA_RETAKING_AZUCHI_CASTLE: { MISSION_INFO: completeNobunagaRetakingAzuchiPart1(), 
                                       EXPECTED_VALUE: BIT9_FULL, 
                                       EXTENDED_MISSION_INFO: completeNobunagaRetakingOfAzuchiCastlePart2(),
                                       EXTENDED_EXPECTED_VALUE: BIT3_FULL,
                                       POINTS: 5},
    NOBUNAGA_BATTLE_OF_NAGASHINO_LOWER: { MISSION_INFO: completeNobunagaBattleOfNagashinoSecond(), 
                                       EXPECTED_VALUE: BIT5_FULL, 
                                       POINTS: 5},
    NOBUNAGA_DEFENSE_OF_GIFU_CASTLE: { MISSION_INFO: completeNobunagaDefenseOfGifuCastle(), 
                                       EXPECTED_VALUE: (BIT7_FULL - BIT3), 
                                       POINTS: 5},
    NOBUNAGA_BATTLE_OF_YAMASAKI: { MISSION_INFO: completeNobunagaBattleOfYamasaki(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    MITSUHIDE_DEFENSE_OF_INABAYAM_CASTLE: { MISSION_INFO: completeMitsuhideDefenseOfInabayamaCastl(), 
                                       EXPECTED_VALUE: BIT4_FULL, 
                                       POINTS: 5},
    MITSUHIDE_BATTLE_OF_ISE: { MISSION_INFO: completeMitsuhideBattleOfIse(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    MITSUHIDE_BETRAYAL_AT_HONNOUJI: { MISSION_INFO: completeMitsuhideBetrayalAtHonnouji(), 
                                       EXPECTED_VALUE: BIT4_FULL, 
                                       POINTS: 5},
    MITSUHIDE_BATTLE_OF_YAMASAKI_UPPER: { MISSION_INFO: completeMitsuhideBattleOfYamasaki(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    MITSUHIDE_GIFU_INFILTRATION: { MISSION_INFO: completeMitsuhideGifuIniltration(), 
                                       EXPECTED_VALUE: BIT4_FULL, 
                                       POINTS: 5},
    MITSUHIDE_DEFENSE_OF_AZUCHI_CASTLE: { MISSION_INFO: completeMitsuhideDefenseOfAzuchiCastle(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    MITSUHIDE_BATTLE_OF_YAMASAKI_LOWER: { MISSION_INFO: completeNobunagaBattleOfYamasakiSecond(), 
                                       EXPECTED_VALUE: BIT5_FULL, 
                                       POINTS: 5},
    GOEMON_GIFU_INFILTRATION: { MISSION_INFO: completeGoemonGifuInfiltration(), 
                                       EXPECTED_VALUE: BIT5_FULL, 
                                       POINTS: 5},
    GOEMON_DANCE_OF_KYOTO: { MISSION_INFO: completeGoemonDanceOfKyoto(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    GOEMON_CROSSING_IGA: { MISSION_INFO: completeGoemonCrossingIga(), 
                                       EXPECTED_VALUE: (BIT6_FULL - BIT3), 
                                       POINTS: 5},
    GOEMON_OSAKA_INTRUSION: { MISSION_INFO: completeGoemonIshikawaOsakaIntrusion(), 
                                       EXPECTED_VALUE: BIT5_FULL, 
                                       POINTS: 5},
    GOEMON_GOEMON_THE_WILD: { MISSION_INFO: completeGoemonGoemonTheWild(), 
                                       EXPECTED_VALUE: BIT5_FULL, 
                                       POINTS: 5},
    GOEMON_DANCE_OF_OSAKA: { MISSION_INFO: completeGoemonDanceOfOsaka(), 
                                       EXPECTED_VALUE: BIT3_FULL, 
                                       POINTS: 5},
    GOEMON_DANCE_OF_ISE: { MISSION_INFO: completeGoemonDanceofIse(), 
                                       EXPECTED_VALUE: (BIT6_FULL - BIT3 - BIT5), 
                                       POINTS: 5},
    GOEMON_DANCE_OF_AZUCHI_CASTLE: { MISSION_INFO: completeGoemonDanceOfAzuchiCastle(), 
                                       EXPECTED_VALUE: BIT4_FULL, 
                                       POINTS: 5},
    KENSHIN_BATTLE_OF_KAWANAKAJIMA: { MISSION_INFO: completeKenshinBattleOfKawanakajima(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    KENSHIN_ODAWARA_INFILTRATION: { MISSION_INFO: completeKenshinOdawaraInfiltration(), 
                                       EXPECTED_VALUE: BIT3_FULL, 
                                       POINTS: 5},
    KENSHIN_SIEGE_OF_UEDA: { MISSION_INFO: completeKenshinSeigeOfUedaPart1(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       EXTENDED_MISSION_INFO: completeKenshinSiegeOfUedaCastlePart2(),
                                       EXTENDED_EXPECTED_VALUE: BIT4_FULL,
                                       POINTS: 5},
    KENSHIN_SIEGE_OF_GIFU_CASTLE: { MISSION_INFO: completeKenshinSiegeOfGifuCastlePart1(), 
                                       EXPECTED_VALUE: BIT10_FULL, 
                                       EXTENDED_MISSION_INFO: completeKenshinSiegeOfGifuCastlePart2(),
                                       EXTENDED_EXPECTED_VALUE: BIT3_FULL,
                                       POINTS: 5},
    KENSHIN_KAWANAKAJIMA_SHOWDOWN: { MISSION_INFO: completeKenshinKawanakajimaShowdown(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    KENSHIN_BATTLE_OF_ANEGAWA: { MISSION_INFO: completeKenshinBattleOfAnegawa(), 
                                       EXPECTED_VALUE: BIT5_FULL, 
                                       POINTS: 5},
    OICHI_BATTLE_OF_OKEHAZAMA: { MISSION_INFO: completeOichiBattleOfOkehazama(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    OICHI_SIEGE_OF_INABAYAMA_CASTLE: { MISSION_INFO: completeOichiSiegeOfInabayamaCastlePart1(), 
                                       EXPECTED_VALUE: BIT5_FULL, 
                                       EXTENDED_MISSION_INFO: completeOichiSiegeOfInabayamaCastlePart2(),
                                       EXTENDED_EXPECTED_VALUE: BIT3_FULL,
                                       POINTS: 5},
    OICHI_BATTLE_OF_ANEGAWA: { MISSION_INFO: completeOichiBattleOfAnegawa(), 
                                       EXPECTED_VALUE: BIT4_FULL, 
                                       POINTS: 5},
    OICHI_AZUCHI_INFILTRATION: { MISSION_INFO: completeOichiAzuchiInfiltration(), 
                                       EXPECTED_VALUE: BIT4_FULL, 
                                       POINTS: 5},
    OICHI_BETRAYAL_AT_HONNOUJI: { MISSION_INFO: completeOichiBetrayalAtHonnouji(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    OICHI_SIEGE_OF_AZUCHI_CASTLE: { MISSION_INFO: completeOichiSiegeOfAzuchiCastlePart1(), 
                                       EXPECTED_VALUE: BIT7_FULL,
                                       EXTENDED_MISSION_INFO: completeOichiSiegeOfAzuchiCastlePart2(),
                                       EXTENDED_EXPECTED_VALUE: BIT3_FULL, 
                                       POINTS: 5},
    OICHI_BATTLE_OF_HONNOUJI: { MISSION_INFO: completeOichiBattleAtHonnouji(), 
                                       EXPECTED_VALUE: BIT9_FULL, 
                                       POINTS: 5},
    OKUNI_DANCE_OF_KYOTO: { MISSION_INFO: completeOkuniDanceOfKyoto(), 
                                       EXPECTED_VALUE: (BIT6_FULL - BIT0), 
                                       POINTS: 5},
    OKUNI_DANCE_OF_OSAKA: { MISSION_INFO: completeOkuniDanceOfOsaka(), 
                                       EXPECTED_VALUE: BIT3_FULL, 
                                       POINTS: 5},
    OKUNI_DANCE_OF_ISE: { MISSION_INFO: completeOkuniDanceOfIse(), 
                                       EXPECTED_VALUE: (BIT7_FULL - BIT1), 
                                       POINTS: 5},
    OKUNI_DANCE_OF_KAWANAKAJIMA: { MISSION_INFO: completeOkuniDanceOfKawanakima(), 
                                       EXPECTED_VALUE: (BIT12_FULL-BIT11), 
                                       POINTS: 5},
    OKUNI_DANCE_OF_AZUCHI_CASTLE: { MISSION_INFO: completeOkuniDanceOfAzuchiCastle(), 
                                       EXPECTED_VALUE: BIT4_FULL, 
                                       POINTS: 5},
    KUNOICHI_BATTLE_OF_KAWANAKAJIMA: { MISSION_INFO: completeKuniochiBattleOfKawanakajima(), 
                                       EXPECTED_VALUE: (BIT8_FULL - BIT1), 
                                       POINTS: 5},
    KUNOICHI_BATTLE_OF_MIKATAGAHARA: { MISSION_INFO: completeKunioichiBattleOfMikatagahara(), 
                                       EXPECTED_VALUE: (BIT6_FULL-BIT4), 
                                       POINTS: 5},
    KUNOICHI_GIFU_INFILTRATION: { MISSION_INFO: completeKunoichiGifuInfilitration(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    KUNOICHI_RESCUE_AT_UEDA_CASTLE: { MISSION_INFO: completeKunoichiRescueAtUedaCastle(), 
                                       EXPECTED_VALUE: BIT4_FULL, 
                                       POINTS: 5},
    KUNOICHI_SIEGE_OF_OSAKA_SUMMER: { MISSION_INFO: completeKunioichiSiegeOfOsaka(), 
                                       EXPECTED_VALUE: (BIT11_FULL - BIT5 -
                                                       BIT7 - BIT10 - BIT2), 
                                       POINTS: 5},
    KUNOICHI_ODWARA_INFILTRATION: { MISSION_INFO: completeKunoichiOdawaraInfiltration(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    MAGOICHI_BATTLE_OF_ISE: { MISSION_INFO: completeMagoichiBattleofIse(), 
                                       EXPECTED_VALUE: BIT5_FULL, 
                                       POINTS: 5},
    MAGOICHI_YAMASAKI_CROSSFIRE: { MISSION_INFO: completeMagoichiYamasakiCrossfire(), 
                                       EXPECTED_VALUE: BIT5_FULL, 
                                       POINTS: 5},
    MAGOICHI_BATTLE_OF_ECHIZEN: { MISSION_INFO: completeMagioichiBattleOfEchizen(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    MAGOICHI_SKIRMISH_AT_KYOTO: { MISSION_INFO: completeMagoichiSkirmishAtKyoto(), 
                                       EXPECTED_VALUE: BIT4_FULL, 
                                       POINTS: 5},
    MAGOICHI_AZUCHI_INFILTRATION: { MISSION_INFO: completeMagoichiAzuchiInfiltration(), 
                                       EXPECTED_VALUE: BIT4_FULL, 
                                       POINTS: 5},
    SHINGEN_BATTLE_OF_KAWANKAJIMA: { MISSION_INFO: completeShingenBattleOfKawankajima(), 
                                       EXPECTED_VALUE: BIT3_FULL, 
                                       POINTS: 5},
    SHINGEN_ODAWARA_INFILTRATION: { MISSION_INFO: completeShingenOdawaraInfiltration(), 
                                       EXPECTED_VALUE: BIT4_FULL, 
                                       POINTS: 5},
    SHINGEN_BATTLE_OF_NAGASHINO: { MISSION_INFO: completeShingenBattleOfNagashino(), 
                                       EXPECTED_VALUE: (BIT7_FULL - BIT3), 
                                       POINTS: 5},
    SHINGEN_SIEGE_OF_AZUCHI_CASTLE: { MISSION_INFO: completeShingenSiegeOfAzuchiCastlePart1(), 
                                       EXPECTED_VALUE: BIT4_FULL, 
                                       EXTENDED_MISSION_INFO: completeShingenSiegeOfAzuchiCastlePart2(),
                                       EXTENDED_EXPECTED_VALUE: (BIT4_FULL - BIT2),
                                       POINTS: 5},
    SHINGEN_BATTLE_OF_YAMASAKI: { MISSION_INFO: completeShingenBattleOfYamasaki(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    SHINGEN_KAWANAKAJIMA_SHOWDOWN: { MISSION_INFO: completeShingenKawanakijimaShowdown(), 
                                       EXPECTED_VALUE: BIT9_FULL, 
                                       POINTS: 5},
    MASAMUNE_KAWANAKAJIMA_CAMPAIGN: { MISSION_INFO: completeMasamuneKawanakjimaCampaign(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    MASAMUNE_OKEHAZAMA_CAMPAIGN: { MISSION_INFO: completeMasaumeOkehazamaCampaign(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    MASAMUNE_ISE_CAMPAIGN: { MISSION_INFO: completeMasaumeIseCampaign(), 
                                       EXPECTED_VALUE: BIT8_FULL, 
                                       POINTS: 5},
    MASAMUNE_NAGASHINO_CAMPAIGN: { MISSION_INFO: completeMasamuneNagashinoCampaign(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    MASAMUNE_ATTACK_ON_HONNOUJI: { MISSION_INFO: completeMasamuneAttackOnHonnouji(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    MASAMUNE_ODAWARA_CAMPAIGN: { MISSION_INFO: completeMasamuneOdawaraCampaign(), 
                                       EXPECTED_VALUE: BIT3_FULL, 
                                       POINTS: 5},
    NOH_BATTLE_OF_OKEHAZAMA: { MISSION_INFO: completeNohBattleOfOkehazama(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    NOH_SIEGE_OF_INABAYAMA_CASTLE: { MISSION_INFO: completeNohSiegeOfInabayamaPart1(), 
                                       EXPECTED_VALUE: BIT5_FULL, 
                                       EXTENDED_MISSION_INFO: completeNohSiegeOfInabayamaCastlePart2(),
                                       EXTENDED_EXPECTED_VALUE: BIT3_FULL,
                                       POINTS: 5},
    NOH_BATTLE_OF_ANEGAWA: { MISSION_INFO: completeNohBattleOfAnegawa(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    NOH_BETRAYAL_AT_HONNOUJI_UPPER: { MISSION_INFO: completeNohBetrayalAtHonnouji(), 
                                       EXPECTED_VALUE: BIT5_FULL, 
                                       POINTS: 5},
    NOH_GIFU_INFILTRATION: { MISSION_INFO: completeNohGifuInfiltration(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    NOH_BETRAYAL_AT_HONNOUJI_LOWER: { MISSION_INFO: completeNohBetrayalAtHonnoujiSecond(), 
                                       EXPECTED_VALUE: BIT3_FULL, 
                                       POINTS: 5},
    NOH_AZUCHI_INFILTRATION: { MISSION_INFO: completeNohAzuchiInfiltration(), 
                                       EXPECTED_VALUE: BIT4_FULL, 
                                       POINTS: 5},
    HANZO_BATTLE_OF_OKEHAZAMA: { MISSION_INFO: completeHanzoBattleOfOkehazama(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    HANZO_BATTLE_OF_MIKATAGAHARA: { MISSION_INFO: completeHanzoBattleOfMikatagahara(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    HANZO_CROSSING_IGA: { MISSION_INFO: completeHanzoCrossingIga(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    HANZO_UEDA_INFILTRATION: { MISSION_INFO: completeHanzoUedaInfiltration(), 
                                       EXPECTED_VALUE: BIT4_FULL, 
                                       POINTS: 5},
    HANZO_SIEGE_OF_OSAKA: { MISSION_INFO: completeHanzoSiegeOfOsakaSummerPart1(), 
                                       EXPECTED_VALUE: BIT4_FULL, 
                                       EXTENDED_MISSION_INFO: completeHanzoSiegeOfOsakaSummerPart2(),
                                       EXTENDED_EXPECTED_VALUE: BIT3_FULL,
                                       POINTS: 5},
    HANZO_OSAKA_INFILTRATION: { MISSION_INFO: completeHanzoOsakaInfiltration(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    RANMARU_DEFENSE_OF_INABAYAMA_CASTLE: { MISSION_INFO: completeRanmaruDefenseOfInabayamaCastle(), 
                                       EXPECTED_VALUE: BIT4_FULL, 
                                       POINTS: 5},
    RANMARU_BATTLE_OF_ISE: { MISSION_INFO: completeRanmaruBattleOfIse(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    RANMARU_BETRAYAL_AT_HONNOUJI: { MISSION_INFO: completeRanmaruBetrayalAtHonnouji(), 
                                       EXPECTED_VALUE: BIT5_FULL, 
                                       POINTS: 5},
    RANMARU_BATTLE_OF_ANEGAWA: { MISSION_INFO: completeRanmaruBattleOfAnegawa(), 
                                       EXPECTED_VALUE: (BIT7_FULL - BIT4), 
                                       POINTS: 5},
    RANMARU_GIFU_INFILTRATION: { MISSION_INFO: completeRanmaruGifuInfiltration(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    RANMARU_DEFENSE_OF_AZUCHI_CASTLE: { MISSION_INFO: completeRanmaruDefenseOfAzuchiCastle(), 
                                       EXPECTED_VALUE: (BIT5_FULL - BIT0), 
                                       POINTS: 5},
    HIDEYOSHI_SIEGE_OF_INABAYAMA_CASTLE: { MISSION_INFO: completeHideyoshiSiegeOfInabayamaCastle(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       EXTENDED_MISSION_INFO: completeHideyoshiSiegeInabayamaCastlePa2(),
                                       EXTENDED_EXPECTED_VALUE: BIT4_FULL,
                                       POINTS: 5},
    HIDEYOSHI_RETREAT_AT_KANEGASAKI: { MISSION_INFO: completeHideyoshiRetreatAtKanegasaki(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    HIDEYOSHI_SAIKA_CAMPAIGN: { MISSION_INFO: completeHideyoshiTheSaikaCampaign(), 
                                       EXPECTED_VALUE: BIT5_FULL, 
                                       POINTS: 5},
    HIDEYOSHI_BATTLE_OF_YAMASAKI: { MISSION_INFO: completeHideyoshiBattleOfYamasaki(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    HIDEYOSHI_BATTLE_OF_KOMAKI_NAGAKUTE: { MISSION_INFO: completeHideyoshiTheBattleOfKomakiNagaku(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    HIDEYOSHI_BETRAYAL_AT_HONNOUJI: { MISSION_INFO: completeHideyoshiBetrayalAtHonnouji(), 
                                       EXPECTED_VALUE: BIT5_FULL, 
                                       POINTS: 5},
    HIDEYOSHI_SIEGE_OF_AZUCHI_CASTLE: { MISSION_INFO: completeHideyoshiSiegeOfAzuchiCastlePart1(),
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       EXTENDED_MISSION_INFO: completeHideyoshiSiegeOfAzuchiCastlePart2(),
                                       EXTENDED_EXPECTED_VALUE: BIT4_FULL,
                                       POINTS: 5},
    YOSHIMOTO_BATTLE_OF_OKEHAZAMA: { MISSION_INFO: completeYoshimotoBattleOfOkehazama(), 
                                       EXPECTED_VALUE: BIT4_FULL, 
                                       POINTS: 5},
    YOSHIMOTO_ODAWARA_INFILTRATION: { MISSION_INFO: completeYoshimotoOdawaraInfiltration(), 
                                       EXPECTED_VALUE: BIT4_FULL, 
                                       POINTS: 5},
    YOSHIMOTO_BATTLE_OF_KAWANAKAJIMA: { MISSION_INFO: completeYoshimotoBattleOfKawanakajima(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    YOSHIMOTO_BATTLE_OF_KOMAKI_NAGAKUTE: { MISSION_INFO: completeYoshimotoBattleOfKomaki(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    YOSHIMOTO_KEMARI_IN_THE_CAPITAL: { MISSION_INFO: completeYoshimotoKemariInTheCapital(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    YOSHIMOTO_SIEGE_OF_UEDA_CASTLE: { MISSION_INFO: completeYoshimotoSiegeOfUedaCastlePart1(), 
                                       EXPECTED_VALUE: BIT5_FULL, 
                                       EXTENDED_MISSION_INFO: completeYoshimotoSiegeOfUedaCastlePart2(),
                                       EXTENDED_EXPECTED_VALUE: BIT5_FULL,
                                       POINTS: 5},
    YOSHIMOTO_STRUGGLE_AT_HONNOUJI: { MISSION_INFO: completeYoshimotoStruggleAtHonnouji(), 
                                       EXPECTED_VALUE: BIT4_FULL, 
                                       POINTS: 5},
    TADAKATSU_BATTLE_OF_OKEHAZAMA: { MISSION_INFO: completeTadakatsuBattleOfOkehazama(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    TADAKATSU_RETREAT_AT_KANEGASAKI: { MISSION_INFO: completeTadakatsuRetreatAtKanegasaki(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    TADAKATSU_BATTLE_OF_MIKATAGAHARA: { MISSION_INFO: completeTadakatsuBattleOfMikatagahara(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    TADAKATSU_CROSSING_IGA: { MISSION_INFO: completeTadakatsuCrossingIge(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    TADAKATSU_THE_BATTLE_OF_KOMAKI_NAGAKUTE: { MISSION_INFO: completeTadakatsuBattleOfKomaki(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    TADAKATSU_BATTLE_OF_KAWANAKAJIMA: { MISSION_INFO: completeTadakatsuBattleOfKawanakajira(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    TADAKATSU_BATTLE_OF_YAMASAKI: { MISSION_INFO: completeTadatsuBattleOfYamasaki(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    INA_RETREAT_AT_KANEGASAKI: { MISSION_INFO: completeInaRetreateAtKanegasaki(), 
                                       EXPECTED_VALUE: BIT5_FULL, 
                                       POINTS: 5},
    INA_BATTLE_OF_MIKATAGAHARA: { MISSION_INFO: completeInaBattleOfMikatagahara(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    INA_CROSSING_IGA: { MISSION_INFO: completeInaCrossingIga(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    INA_BATTLE_OF_KOMAKI_NAGAKUTE: { MISSION_INFO: completeInaBattleOfKomaki(), 
                                       EXPECTED_VALUE: BIT9_FULL, 
                                       POINTS: 5},
    INA_DEFENSE_OF_UEDA_CASTLE: { MISSION_INFO: completeInaDefenseOfUedaCastle(), 
                                       EXPECTED_VALUE: BIT5_FULL, 
                                       POINTS: 5},
    INA_BATTLE_OF_YAMASAKI: { MISSION_INFO: completeInaBattleOfYamasaki(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       POINTS: 5},
    INA_SIEGE_OF_OSAKA_CASTLE: { MISSION_INFO: completeInaSiegeOfOsakaCastlePart1(), 
                                       EXPECTED_VALUE: BIT7_FULL, 
                                       EXTENDED_MISSION_INFO: completeInaSiegeOfOsakaCastlePart2(),
                                       EXTENDED_EXPECTED_VALUE: BIT7_FULL,
                                       POINTS: 5},
    NEW_OFFICER_BATTLE_OF_OKEHAZAMA: { MISSION_INFO: completeNewOfficerBattleOfOkehazama(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       POINTS: 5},
    NEW_OFFICER_BATTLE_OF_KAWANAKAJIMA: { MISSION_INFO: completeNewOfficerBattleOfKawanakajima(), 
                                       EXPECTED_VALUE: (BIT4_FULL - BIT1), 
                                       POINTS: 5},
    NEW_OFFICER_BATTLE_OF_NAGASAHINO: { MISSION_INFO: completeNewOfficerBattleOfNagashino(), 
                                       EXPECTED_VALUE: BIT4_FULL, 
                                       POINTS: 5},
    NEW_OFFICER_SIEGE_OF_UEDA: { MISSION_INFO: completeNewOfficerSiegeOfUedaCastlePart1(), 
                                       EXPECTED_VALUE: BIT6_FULL, 
                                       EXTENDED_MISSION_INFO: completeNewOfficerSiegeOfUedaCastlePart2(),
                                       EXTENDED_EXPECTED_VALUE: BIT7_FULL,
                                       POINTS: 5},
    NEW_OFFICER_SIEGE_OF_OSAKA_SUMMER_UPPER: { MISSION_INFO: completeNewOfficerSiegeOfOsakaSummerUpper(), 
                                       EXPECTED_VALUE: (BIT10_FULL - BIT5 -
                                                       BIT8 - BIT9), 
                                       POINTS: 5},
    NEW_OFFICER_SIEGE_OF_OSAKA_SUMMER_LOWER: { MISSION_INFO: completeNewOfficerSiegeOfOsakaSummerLowerPart1(), 
                                       EXPECTED_VALUE: (BIT5_FULL - BIT0 - BIT2), 
                                       EXTENDED_MISSION_INFO: completeNewOfficerSiegeOfOsakaSummerPar2(),
                                       EXTENDED_EXPECTED_VALUE: BIT3_FULL,
                                       POINTS: 5},
}



YUKIMURA_FIRST_ENDING =  0x00 
KEIJI_FIRST_ENDING =  0x01 
NOBUNAGA_FIRST_ENDING =  0x02 
MITSUHIDE_FIRST_ENDING =  0x03 
GOEMON_FIRST_ENDING =  0x04 
KENSHIN_FIRST_ENDING =  0x05 
OICHI_FIRST_ENDING =  0x06 
OKUNI_FIRST_ENDING =  0x07 
KUNOICHI_FIRST_ENDING =  0x08 
MAGOICHI_FIRST_ENDING =  0x09 
SHINGEN_FIRST_ENDING =  0x0a 
MASAMUNE_FIRST_ENDING =  0x0b 
NOH_FIRST_ENDING =  0x0c 
HANZO_FIRST_ENDING =  0x0d 
RANMARU_FIRST_ENDING =  0x0e 
HIDEYOSHI_FIRST_ENDING =  0x0f 
YOSHIMOTO_FIRST_ENDING =  0x10 
TADAKTSU_FIRST_ENDING =  0x11 
INA_FIRST_ENDING =  0x12 
YUKIMURA_SECOND_ENDING =  0x13 
KENJI_SECOND_ENDING =  0x14 
NOBUNAGA_SECOND_ENDING =  0x15 
MITSUHIDE_SECOND_ENDING =  0x16 
GOEMON_SECOND_ENDING =  0x17 
KENSHIN_SECOND_ENDING =  0x18 
OICHI_SECOND_ENDING =  0x19 
OKUNI_SECOND_ENDING =  0x1a 
KUNOICHI_SECOND_ENDING =  0x1b 
MAGOICHI_SECOND_ENDING =  0x1c 
SHINGEN_SECOND_ENDING =  0x1d 
MASAMUNE_SECOND_ENDING =  0x1e 
NOH_SECOND_ENDING =  0x1f 
HANZO_SECOND_ENDING =  0x20 
RANMARU_SECOND_ENDING =  0x21 
HIDEYOSHI_SECOND_ENDING =  0x22 
YOSHIMOTO_SECOND_ENDING =  0x23 
TADAKTSU_SECOND_ENDING =  0x24 
INA_SECOND_ENDING =  0x25 
OKUNI_NOBUNAGA_ENDING = 0x26 
OKUNI_NOH_ENDING = 0x27 
OKUNI_MAGOICHI_ENDING = 0x28 
OKUNI_MITSUHIDE_ENDING = 0x29 
OKUNI_RANMARU_ENDING = 0x2a 
OKUNI_HANZO_ENDING = 0x2b 
OKUNI_YUKIMURA_ENDING = 0x2c 
OKUNI_SHINGEN_ENDING = 0x2d 
OKUNI_KENSHIN_ENDING = 0x2e 
NEW_OFFICER_FIRST = 0x2f 
NEW_OFFICER_SECOND = 0x35 
NO_ENDING = 0x03b

endingNameLookup =
{
    YUKIMURA_FIRST_ENDING:  "True Warrior",
    KEIJI_FIRST_ENDING:  "Favored by the Heavens",
    NOBUNAGA_FIRST_ENDING: "Destruction",
    MITSUHIDE_FIRST_ENDING:  "White Blade",
    GOEMON_FIRST_ENDING:  "Hail to the King!",
    KENSHIN_FIRST_ENDING:   "Friend and Foe",
    OICHI_FIRST_ENDING:  "Hand in Hand",
    OKUNI_FIRST_ENDING:  "Grand Finale",
    KUNOICHI_FIRST_ENDING:  "Flower of the Night",
    MAGOICHI_FIRST_ENDING:  "Way of the Gun",
    SHINGEN_FIRST_ENDING:  "Triumph",
    MASAMUNE_FIRST_ENDING:  "Ambition",
    NOH_FIRST_ENDING:  "True Love",
    HANZO_FIRST_ENDING: "Fade to Shadow",
    RANMARU_FIRST_ENDING:  "The Next Life",
    HIDEYOSHI_FIRST_ENDING:  "The Mighty Conqueror",
    YOSHIMOTO_FIRST_ENDING:  "The Mighty Warrior",
    TADAKTSU_FIRST_ENDING:  "Loyalty",
    INA_FIRST_ENDING:  "Something to Protect",
    YUKIMURA_SECOND_ENDING: "Endless Battle",
    KENJI_SECOND_ENDING:  "War is but a Dream",
    NOBUNAGA_SECOND_ENDING:  "Tainted Hands",
    MITSUHIDE_SECOND_ENDING:  "End to Madness",
    GOEMON_SECOND_ENDING:  "Thieves, There will always be",
    KENSHIN_SECOND_ENDING:   "Ode to a Nemesis",
    OICHI_SECOND_ENDING:  "Requiem for the Fallen",
    OKUNI_SECOND_ENDING:  "The Dance of War",
    KUNOICHI_SECOND_ENDING:  "Once a Ninja...",
    MAGOICHI_SECOND_ENDING:  "Farewell to Arms",
    SHINGEN_SECOND_ENDING:  "Sundown",
    MASAMUNE_SECOND_ENDING:  "Victim of the Times",
    NOH_SECOND_ENDING:  "The Demon's Wife",
    HANZO_SECOND_ENDING: "Shadow in the Distance",
    RANMARU_SECOND_ENDING:  "True Intent",
    HIDEYOSHI_SECOND_ENDING:  "A Dream within a Dream",
    YOSHIMOTO_SECOND_ENDING:  "Way of the Warrior",
    TADAKTSU_SECOND_ENDING:  "The Impartial Spear",
    INA_SECOND_ENDING:  "Precious Life",
    OKUNI_NOBUNAGA_ENDING: "Dreams and Illusions (Nobunaga)",
    OKUNI_NOH_ENDING: "Dreams and Illusions (Noh)",
    OKUNI_MAGOICHI_ENDING:  "Dreams and Illusions (Magoichi)",
    OKUNI_MITSUHIDE_ENDING:  "Dreams and Illusions (Mitsuhide)",
    OKUNI_RANMARU_ENDING:  "Dreams and Illusions (Ranmaru)",
    OKUNI_HANZO_ENDING:  "Dreams and Illusions (Hanzo)",
    OKUNI_YUKIMURA_ENDING: "Dreams and Illusions (Yukimura)",
    OKUNI_SHINGEN_ENDING:  "Dreams and Illusions (Shingen)",
    OKUNI_KENSHIN_ENDING:  "Dreams and Illusions (Kenshin)",
    NEW_OFFICER_FIRST: "Way of The Samurai",
    NEW_OFFICER_SECOND: "Guardian of the East"
}

endingDescriptionLookup =
{
    YUKIMURA_FIRST_ENDING: "Yukimura Sanada's first ending" ,
    KEIJI_FIRST_ENDING: "Keiji Maeda's first ending" ,
    NOBUNAGA_FIRST_ENDING: "Nobunaga Oda's first ending" ,
    MITSUHIDE_FIRST_ENDING: "Mitsuhide Akechi's first ending" ,
    GOEMON_FIRST_ENDING: "Goemon Ishikawa's first ending" ,
    KENSHIN_FIRST_ENDING: "Kenshin Uesugi's first ending" ,
    OICHI_FIRST_ENDING: "Oichi's first ending" ,
    OKUNI_FIRST_ENDING: "Okuni's first ending" ,
    KUNOICHI_FIRST_ENDING: "Kunoichi's first ending" ,
    MAGOICHI_FIRST_ENDING: "Magoichi Saika's first ending" ,
    SHINGEN_FIRST_ENDING: "Shingen Takeda's first ending" ,
    MASAMUNE_FIRST_ENDING: "Masamune Date's first ending" ,
    NOH_FIRST_ENDING: "Noh's first ending" ,
    HANZO_FIRST_ENDING: "Hanzo Hattori's first ending" ,
    RANMARU_FIRST_ENDING: "Ranmaru Mori's first ending" ,
    HIDEYOSHI_FIRST_ENDING: "Hideyoshi Hashiba's first ending" ,
    YOSHIMOTO_FIRST_ENDING: "Yoshimoto Imagawa's first ending" ,
    TADAKTSU_FIRST_ENDING: "Tadaktsu Honda's first ending" ,
    INA_FIRST_ENDING: "Ina's first ending" ,
    YUKIMURA_SECOND_ENDING: "Yukimura Sanada's second ending",
    KENJI_SECOND_ENDING: "Kenji Maeda's second ending",
    NOBUNAGA_SECOND_ENDING: "Nobunaga Oda's second ending",
    MITSUHIDE_SECOND_ENDING: "Mitsuhide Akechi's second ending",
    GOEMON_SECOND_ENDING: "Goemon Ishikawa's second ending",
    KENSHIN_SECOND_ENDING: "Kenshin Uesugi's second ending",
    OICHI_SECOND_ENDING: "Oichi's second ending",
    OKUNI_SECOND_ENDING: "Okuni's second ending",
    KUNOICHI_SECOND_ENDING: "Kunoichi's second ending",
    MAGOICHI_SECOND_ENDING: "Magoichi Saika's second ending",
    SHINGEN_SECOND_ENDING: "Shingen Takeda's second ending",
    MASAMUNE_SECOND_ENDING: "Masamune Date's second ending",
    NOH_SECOND_ENDING: "Noh's second ending",
    HANZO_SECOND_ENDING: "Hanzo Hattori's second ending",
    RANMARU_SECOND_ENDING: "Ranmaru Mori's second ending",
    HIDEYOSHI_SECOND_ENDING: "Hideyoshi Hashiba's second ending",
    YOSHIMOTO_SECOND_ENDING: "Yoshimoto Imagawa's second ending",
    TADAKTSU_SECOND_ENDING: "Tadaktsu Honda's second ending",
    INA_SECOND_ENDING: "Ina's second ending",
    OKUNI_NOBUNAGA_ENDING: "Okuni's alternate endings with Nobunaga",
    OKUNI_NOH_ENDING: "Okuni's alternate endings with Noh",
    OKUNI_MAGOICHI_ENDING: "Okuni's alternate endings with Magoichi",
    OKUNI_MITSUHIDE_ENDING: "Okuni's alternate endings with Mitsuhide",
    OKUNI_RANMARU_ENDING: "Okuni's alternate endings with Ranmaru",
    OKUNI_HANZO_ENDING: "Okuni's alternate endings with Hanzo",
    OKUNI_YUKIMURA_ENDING: "Okuni's alternate endings with Yukimura",
    OKUNI_SHINGEN_ENDING: "Okuni's alternate endings with Shingen",
    OKUNI_KENSHIN_ENDING: "Okuni's alternate endings with Kenshin",
    NEW_OFFICER_FIRST: "New Officer's first ending",
    NEW_OFFICER_SECOND: "New Officer's second ending"
}

SUSANO = 0x04
RAKAN = 0x05
IZANAGI = 0x0A
NI_OH_PIKE = 0x0B
OROCHI = 0x10
DAI_ROKUTEN = 0x11
FUTSU_MITAMA = 0x16
RASETSU = 0x17
TAKEMIKAZUCHI = 0x1C
OBLITERATOR = 0x1D
MURAKUMO = 0x22
BISHAMONTEN = 0x23
SAKURA = 0x28
KIKU = 0x29
HIKAGE = 0x2E
KISHOUTEN = 0x2F
KUSHINADA = 0x34
KOKUANTEN = 0x35
GOKUEN = 0x3A
YATAGARASU = 0x3B
KOURIN = 0x40
SHINJU = 0x41
MIKABOSHI = 0x46
ASHURA = 0x47
HIRUKO = 0x4C
MAMUSHI = 0x4D
YAMIKIBA = 0x52
MARISHITEN = 0x53
KAMUDO = 0x58
GOHOTENDO = 0x59
MIHASHIRA = 0x5E
MONJU = 0x5F
VELVET_KEMARI = 0x64
PHOENIX_KEMARI = 0x65
ARAHABAKI = 0x6A
EMMA = 0x6B
OMOIKANE = 0x70
AISEN = 0x71
DOUJI_KIRI = 0x76
MUNECHIKA = 0x77
TOMBO_GIRI = 0x7C
OTEGINE = 0x7D
BENKEI = 0x82
GORYO = 0x83

FIFTH = "Fifth"
SIXTH = "Sixth"

WeaponList = 
{
    YUKIMURA: {FIFTH: SUSANO,
               SIXTH: RAKAN
              },
    KEIJI: {FIFTH: IZANAGI,
               SIXTH: NI_OH_PIKE
              },
    NOBUNAGA: {FIFTH: OROCHI,
               SIXTH: DAI_ROKUTEN
              },
    MITSUHIDE: {FIFTH: FUTSU_MITAMA,
               SIXTH: RASETSU
              },
    GOEMON: {FIFTH: TAKEMIKAZUCHI,
               SIXTH: OBLITERATOR
              },
    KENSHIN: {FIFTH: MURAKUMO,
               SIXTH: BISHAMONTEN
              },
    OICHI: {FIFTH: SAKURA,
               SIXTH: KIKU
              },
    OKUNI: {FIFTH: HIKAGE,
               SIXTH: KISHOUTEN
              },
    KUNOICHI: {FIFTH: KUSHINADA,
               SIXTH: KOKUANTEN
              },
    MAGOICHI: {FIFTH: GOKUEN,
               SIXTH: YATAGARASU
              },
    SHINGEN: {FIFTH: KOURIN,
               SIXTH: SHINJU
              },
    MASAMUNE: {FIFTH: MIKABOSHI,
               SIXTH: ASHURA
              },
    NOH: {FIFTH: HIRUKO,
               SIXTH: MAMUSHI
              },
    HANZO: {FIFTH: YAMIKIBA,
               SIXTH: MARISHITEN
              },
    RANMARU: {FIFTH: KAMUDO,
               SIXTH: GOHOTENDO
              },
    HIDEYOSHI: {FIFTH: MIHASHIRA,
               SIXTH: MONJU
              },
    YOSHIMOTO: {FIFTH: VELVET_KEMARI,
               SIXTH: PHOENIX_KEMARI
              },
    TADAKATSU: {FIFTH: ARAHABAKI,
               SIXTH: EMMA
              },
    INA: {FIFTH: OMOIKANE,
               SIXTH: AISEN
              },
    NEW_OFFICER01: {FIFTH: DOUJI_KIRI,
               SIXTH: MUNECHIKA
              }, // Sword
    NEW_OFFICER02: {FIFTH: TOMBO_GIRI,
               SIXTH: OTEGINE
              }, // Spear
    NEW_OFFICER03: {FIFTH: BENKEI,
               SIXTH: GORYO
              }, // Naginata
}

fifthWeapons = 
[
    SUSANO,
    IZANAGI,
    OROCHI,
    FUTSU_MITAMA,
    TAKEMIKAZUCHI,
    MURAKUMO,
    SAKURA,
    HIKAGE,
    KUSHINADA,
    GOKUEN,
    KOURIN,
    MIKABOSHI,
    HIRUKO,
    YAMIKIBA,
    KAMUDO,
    MIHASHIRA,
    VELVET_KEMARI,
    ARAHABAKI,
    OMOIKANE,
    DOUJI_KIRI,
    TOMBO_GIRI,
    BENKEI
]

sixthWeapons =
[
    RAKAN,
    NI_OH_PIKE,
    DAI_ROKUTEN,
    RASETSU,
    OBLITERATOR,
    BISHAMONTEN,
    KIKU,
    KISHOUTEN,
    KOKUANTEN,
    YATAGARASU,
    SHINJU,
    ASHURA,
    MAMUSHI,
    MARISHITEN,
    GOHOTENDO,
    MONJU,
    PHOENIX_KEMARI,
    EMMA,
    AISEN,
    MUNECHIKA,
    OTEGINE,
    GORYO
]

weaponNameLookup=
{
    SUSANO: "Susano",
    IZANAGI: "Izanagi",
    OROCHI: "Orochi",
    FUTSU_MITAMA: "Futsu-Mitama",
    TAKEMIKAZUCHI: "Takemikazuchi",
    MURAKUMO: "Murakumo",
    SAKURA: "Sakura",
    HIKAGE: "Hikage",
    KUSHINADA: "Kushinada",
    GOKUEN: "Gokuen",
    KOURIN: "Kourin",
    MIKABOSHI: "Mikaboshi",
    HIRUKO: "Hiruko",
    YAMIKIBA: "Yamikiba",
    KAMUDO: "Kamudo",
    MIHASHIRA: "Mihashira",
    VELVET_KEMARI: "Velvet Kemari",
    ARAHABAKI: "Arahabaki",
    OMOIKANE: "Omoikane",
    DOUJI_KIRI: "Douji-Kiri",
    TOMBO_GIRI: "Tombo-Giri",
    BENKEI: "Benkei",
    RAKAN: "Rakan",
    NI_OH_PIKE: "Ni-Oh Pike",
    DAI_ROKUTEN: "Dai-Rokuten",
    RASETSU: "Rasetsu",
    OBLITERATOR: "Obliterator",
    BISHAMONTEN: "Bishamonten",
    KIKU: "Kiku",
    KISHOUTEN: "Kishouten",
    KOKUANTEN: "Kokuanten",
    YATAGARASU: "Yatagarasu",
    SHINJU: "Shinju",
    ASHURA: "Ashura",
    MAMUSHI: "Mamushi",
    MARISHITEN: "Marishiten",
    GOHOTENDO: "Gohotendo",
    MONJU: "Monju",
    PHOENIX_KEMARI: "Phoenix Kemari",
    EMMA: "Emma",
    AISEN: "Aisen",
    MUNECHIKA: "Munechika",
    OTEGINE: "Otegine",
    GORYO: "Goryo"
}

weaponDescriptionLookup=
{
    SUSANO: "Yukimura Sanada's Susano",
    IZANAGI: "Keiji Maeda's Izanagi",
    OROCHI: "Nobunaga Oda's Orochi",
    FUTSU_MITAMA: "Mitsuhide Akechi's Futsu-Mitama",
    TAKEMIKAZUCHI: "Goemon Ishikawa's Takemikazuchi",
    MURAKUMO: "Kenshin Uesugi's Murakumo",
    SAKURA: "Oichi's Sakura",
    HIKAGE: "Okuni's Hikage",
    KUSHINADA: "Kunoichi's Kushinada",
    GOKUEN: "Magoichi Saika's Gokuen",
    KOURIN: "Shingen Takeda's Kourin",
    MIKABOSHI: "Masamune Date's Mikaboshi",
    HIRUKO: "Noh's Hiruko",
    YAMIKIBA: "Hanzo Hattori's Yamikiba",
    KAMUDO: "Ranmaru Mori's Kamudo",
    MIHASHIRA: "Hideyoshi Hashiba's Mihashira",
    VELVET_KEMARI: "Yoshimoto Imagawa's Velvet Kemari",
    ARAHABAKI: "Tadakatsu Honda's Arahabaki",
    OMOIKANE: "Ina's Omoikane",
    DOUJI_KIRI: "Sword Officer's Douji-Kiri",
    TOMBO_GIRI: "Spear Officer's Tombo-Giri",
    BENKEI: "Naginata Officer's Benkei",
    RAKAN: "Yukimura Sanada's Rakan",
    NI_OH_PIKE: "Keiji Maeda's Ni-Oh Pike",
    DAI_ROKUTEN: "Nobunaga Oda's Dai-Rokuten",
    RASETSU: "Mitsuhide Akechi's Rasetsu",
    OBLITERATOR: "Goemon Ishikawa's Obliterator",
    BISHAMONTEN: "Kenshin Uesugi's Bishamonten",
    KIKU: "Oichi's Kiku",
    KISHOUTEN: "Okuni's Kishouten",
    KOKUANTEN: "Kunoichi's Kokuanten",
    YATAGARASU: "Magoichi Saika's Yatagarasu",
    SHINJU: "Shingen Takeda's Shinju",
    ASHURA: "Masamune Date's Ashura",
    MAMUSHI: "Noh's Mamushi",
    MARISHITEN: "Hanzo Hattori's Marishiten",
    GOHOTENDO: "Ranmaru Mori's Gohotendo",
    MONJU: "Hideyoshi Hashiba's Monju",
    PHOENIX_KEMARI: "Yoshimoto Imagawa's Phoenix Kemari",
    EMMA: "Tadakatsu Honda's Emma",
    AISEN: "Ina's Aisen",
    MUNECHIKA: "Sword Officer's Munechika",
    OTEGINE: "Spear Officer's Otegine",
    GORYO: "Naginata Officer's Goryo"
}

// $521218: (8-bit) High Tower and Abyss Level count
//          
//          0x00 = First floor.
function survivalFloorLevel() => byte(0x521218)

// $521294: (8-bit) 2-player Indicator
//          
//          Unknown what this changes.
function secondPlayerIndicator() => byte(0x521294)

// $5212A8: (32-bit) First Dropped Item in level.
//          
//          Likely followed by a 32-bit for power.
//          
//          Then followed by up to 7 additional items.  Note 0x24 is "No item"
MEMORY_LOCATION_OF_DROPPED_ITEM = 0x5212A8
function firstDroppedItem() => dword(MEMORY_LOCATION_OF_DROPPED_ITEM)

NUM_DROPPED_ITEMS = 8
SIZE_OF_DROPPED_ITEM = 8
function itemHasDropped(targetId) => any_of(range(0, NUM_DROPPED_ITEMS - 1), index => byte(MEMORY_LOCATION_OF_DROPPED_ITEM + (index * SIZE_OF_DROPPED_ITEM )) == targetId )

// $5212E8: (32-bit) In Level First Dropped Weapon
//          
//          There's 20 bytes between objects
//          
//          Then followed by up to 7 additional weaponsNote 0x84 is "No Weapon"
MEMORY_LOCATION_OF_DROPPED_WEAPON = 0x5212E8
function firstDroppedWeapon() => dword(MEMORY_LOCATION_OF_DROPPED_WEAPON)


// 521308: (8-bit) Weapon ID for second character 
MEMORY_LOCATION_OF_SECOND_DROPPED_WEAPON = 0x521308


NUM_DROPPED_WEAPON = 8
SIZE_OF_DROPPED_WEAPON = MEMORY_LOCATION_OF_SECOND_DROPPED_WEAPON - MEMORY_LOCATION_OF_DROPPED_WEAPON
function weaponHasDropped(targetId) => any_of(range(0, NUM_DROPPED_WEAPON - 1), index => byte(MEMORY_LOCATION_OF_DROPPED_WEAPON + (index * SIZE_OF_DROPPED_WEAPON )) == targetId )

// $52140C: (8-bit) Actual Value of Points
//          
//          Used for New Officer's Combo training
function comboTrainingScore() => byte(0x52140C)


// $5211f0: (8-bit) Mode Select
//          
//          0x00 = Musou Mode
//          0x01 = Free Mode
//          0x02 = New Officer Mode
//          0x03 = Challenge Mode
//          0x04 = Versus Mode
//          0x05 = Survival Mode
//          0x08 = Main menu/OptionMenu
//          
//          Note this is set to the real value when in demo mode
function modeSelect() => byte(0x5211f0)

MUSOU_MODE = 0x00
FREE_MODE = 0x01
NEW_OFFICER_MODE = 0x02
CHALLENGE_MODE =  0x03
VERSUS_MODE = 0x04
SURVIVAL_MODE = 0x05
MAIN_MENU = 0x08
OPTION_MENU = 0x08

function musouMode() => modeSelect() == MUSOU_MODE
function freeMode() => modeSelect() == FREE_MODE
function newOfficerMode() => modeSelect() == NEW_OFFICER_MODE
function challengeMode() => modeSelect() == CHALLENGE_MODE
function versusMode() => modeSelect() == VERSUS_MODE
function survivalMode() => modeSelect() == SURVIVAL_MODE
function optionMenu() => modeSelect() == OPTION_MENU
function musouOrFreeMode() => musouMode() || freeMode()

// $521430: (8-bit) Gameplay indicator
//          
//          0x0c = In game  (Or demo)
//          0x00 = Won Stage
//          0x00= Won Abyss Mode
//          0x01= Lost Musou stage
//          0x00 = Won Gold Rush
//          0x01 Result from dying in deep abyss  or High Twoer
//          0x03 = Time out of watching Demo (or finished Mission byt "Failure" aka archery which always ends in failure)
//          0x04 =Time over "Success" in Mission.
//          0x06 = Exit from Game or player exit from demo.
//          0x08 = Mid level in Survival.
function gameplayIndicator() => byte(0x521430)

WON_STAGE = 0x0
IN_GAME = 0x0c 
LOST_GAME = 0x01
RESTART_STAGE = 0x06
function playerjustWonStage() => prev( gameplayIndicator()) == IN_GAME && 
                                 gameplayIndicator() == WON_STAGE
function playerjustWonSurvival() => prev( gameplayIndicator()) == IN_GAME &&
                                    gameplayIndicator() == WON_STAGE 
function playerjustFinishedHighTower() => prev( gameplayIndicator()) == IN_GAME && 
                                     gameplayIndicator() == LOST_GAME 
function playerJustFinishedChallenge() => prev( gameplayIndicator()) == IN_GAME &&
                                        gameplayIndicator() != IN_GAME &&
                                        gameplayIndicator() != RESTART_STAGE

// $521260: (8-bit) Ending movie to play.
//          
//          This gets set at the same frame the Gameplay indicator is set to 0x00 to indicate the player has won the level. 
//          
//          0x00 = Yukimura 1 "True Warrior
//          0x01 = Keiji 1 "Favored By Heavens"
//          0x02 = Nobunaga 1"Destruction"
//          0x03 = Mitsuhide 1 "White Blade"
//          0x04 = Goemon 1 "Hail to the King"
//          0x05 = Kenshin 1  "Friend and Foe"
//          0x06 = Oichi 1 "Hand in Hand"
//          0x07 = Okuni 1 "Grand Finale"
//          0x08 = Kunoichi 1 "Flower of the Night"
//          0x09 = Magoichi 1 "Way of the Gun"
//          0x0a = Shingen 1 "Triumph"
//          0x0b = Masamune 1 "Ambition"
//          0x0c = Noh 1 "True Love"
//          0x0d = Hanzo 1 "Fade to Shadow"
//          0x0e = Ranmaru 1 "The Next Life"
//          0x0f = Hideyoshi 1 "The Mighty Conqueror"
//          0x10 = Yoshimoto 1 "The Mighty Warrior"
//          0x11 = Tadaktsu 1 "Loyalty"
//          0x12 = Ina 1 "Something to Protect"
//          0x13 = Yukimura 2 :"Endless Battle"
//          0x14 = Kenji 2 "War is but a Dream"
//          0x15 = Nobunaga 2 "Tainted Hands"
//          0x16 = Mitsuhide 2 "End to Madness"
//          0x17 = Goemon 2 "Thieves, There will always be"
//          0x18 = Kenshin 2  "Ode to a Nemesis"
//          0x19 = Oichi 2 "Requiem for the Fallen"
//          0x1a = Okuni 2 "The Dance of War"
//          0x1b = Kunoichi 2 "Once a Ninja..."
//          0x1c = Magoichi 2 "Farewell to Arms"
//          0x1d = Shingen 2 "Sundown"
//          0x1e = Masamune 2 "Victim of the Times"
//          0x1f = Noh 2 "The Demon's Wife"
//          0x20 = Hanzo 2 "Shadow in the Distance"
//          0x21 = Ranmaru 2 "True Intent"
//          0x22 = Hideyoshi 2 "A Dream within a Dream"
//          0x23 = Yoshimoto 2 "Way of the Warrior"
//          0x24 = Tadaktsu 2 "The Impartial Spear"
//          0x25 = Ina 2 "Precious Life"
//          0x26 = Okuni/Nobunaga "Dreams and Illusions"
//          0x27 = Okuni/Noh "Dreams and Illusions"
//          0x28 = Okuni/Magoichi "Dreams and Illusions"
//          0x29 = Okuni/Mitsuhide "Dreams and Illusions"
//          0x2a = Okuni/Ranmaru "Dreams and Illusions"
//          0x2b = Okuni/Hanzo "Dreams and Illusions"
//          0x2c = Okuni/Yukimura "Dreams and Illusions"
//          0x2d = Okuni/Shingen "Dreams and Illusions"
//          0x2e = Okuni/Kenshin "Dreams and Illusions"
//          0x2f = New Officer 1 "Way of The Samurai
//          0x30 = New Officer 2 "Guardian of the East
//          0x3b = No Ending to show.
//          
//          Any number between 0x031 and 0x3a shows the same video as "Guardian of the East"
function endingMovieToPlay() => byte(0x521260)

NO_ENDING = 0x3b
FIRST_OKUNI_ALT_ENDING = 0x26
LAST_OKUNI_ALT_ENDING = 0x2e



// Okuni's ending are a little different and trigger earlier. 
function endingMovieTrigger(targetId) 
{
    if(targetId == NEW_OFFICER_FIRST || targetId == NEW_OFFICER_SECOND)
    {
        return playerjustWonStage() && 
               prev(endingMovieToPlay()) == NO_ENDING &&
               endingMovieToPlay() >= targetId &&
               endingMovieToPlay() <= targetId + 5
               
    }

    retValue =  playerjustWonStage() && endingMovieToPlay() == targetId
    if (targetId >= FIRST_OKUNI_ALT_ENDING  && targetId <= LAST_OKUNI_ALT_ENDING)
    {
        return retValue && prior(endingMovieToPlay()) == NO_ENDING 
    }
    else
    {
        return retValue && prev(endingMovieToPlay()) == NO_ENDING 
    }
}
                                        


// $521438: (32-bit) Time spent in a level.
//          
//          This counts up, but in game it is shown as Time left.
//          
//          Works on a normal level and Survival mode.
function timeSpentInLevelinFrames() => dword(0x521438)

// $521668: (16-bit) Gold in Gold Rush
//          
//          Does not appear to be the "real value"
function badGoldInGoldRush() => word(0x521668)

// The above appears to be incorrect in some cases (has been off by 4k?) we use this value instead. 
// $61e910: (16-bit) Real display for First Player KO Count/Gold Count
//
//          Use 0x0052d6b0 instead, as that appears to be the real value for Kos
function goldInGoldRush() => word(0x61e910)

// $521230: (8-bit) In-Game Difficulty
//          
//          Changing this will change what your "Difficulty" is on your in game save. 
//          0x01 = Novice
//          0x02 = Easy
//          0x03 = Normal
//          0x04 = Hard
//          0x05 = Chaos
function inGameDifficulty() => byte(0x521230)

HARD_DIFFICULTY = 0x03
CHAOS_DIFFICULTY = 0x04

function hardDifficulty() => inGameDifficulty() >= HARD_DIFFICULTY
function chaosDifficulty() => inGameDifficulty() >= CHAOS_DIFFICULTY

// $52D6B0: (16-bit) First Player KO Count
//          
//          Note: Going above 0x8000 seems to break the UI
//          
//          If this is proven wrong 0x0061e8f0, 0x0061e90c and 0x0061e910.  Those appear to be UI elements.
function firstPlayerKoCount() => word(0x52D6B0)

// $61E90E: Data Values
//          
//          Highest Leaderboards
//          Melee Mission 514
//          Musou Mission 702
//          Combo Mission 113
//          Archery Mission 41
//          Deflect Mission 74
//          Burst Mission 1'09'26 (out of 2 minutes)
//          Riding Mission 1'12'00 (out of 4:30?)
//          
//          Gold Rush 7000G
//          Deep Abyss 2000 KOs
//          Hugh Tower 30

// $695D6C: (32-bit) Save.load indicator Part 1
//          NOTE THIS HAS BEEN PROVEN FALSE ON BOOTUP
//          Check 0x00695d6c, 0x00695d70, 0x00695d74 (All 32-bit numbers technically)
//          
//          0x00 = Initial Save Load on boot up
//          0x01 = Save/Load in Options menu.
//          0x07 = All other time.
function saveLoadIndicatorPart1() => dword(0x695D6C)

SAVE_PROTECTION_PART_1_BOOTUP = 0x02
SAVE_PROTECTION_PART_1_OPTIONS = 0x01

// $695D70: (32-bit) Save.load indicator Part 2
//          NOTE THIS HAS BEEN PROVEN FALSE ON BOOTUP
//          Check 0x00695d6c, 0x00695d70, 0x00695d74 (All 32-bit numbers technically)
//          
//          0x01 = Initial Save Load on boot up
//          0x02 = Save/Load in Options menu.
//          0x07 = All other time.
function saveLoadIndicatorPart2() => dword(0x695D70)

SAVE_PROTECTION_PART_2_BOOTUP = 0x01
SAVE_PROTECTION_PART_2_OPTIONS = 0x02

// $695D74: (32-bit) Save.load indicator Part 1
//          NOTE THIS HAS BEEN PROVEN TO BE FALSE ON BOOTUP
//          Check 0x00695d6c, 0x00695d70, 0x00695d74 (All 32-bit numbers technically)
//          
//          0x02 = Initial Save Load on boot up
//          0x03 = Save/Load in Options menu.
//          0x07 = All other time.
function saveLoadIndicatorPart3() => dword(0x695D74)

SAVE_PROTECTION_PART_3_BOOTUP = 0x02
SAVE_PROTECTION_PART_3_OPTIONS = 0x03

// $6D7188: (32-bit) New Officer's Melee's Progression
//          
//          0x00000000 = Novice(Starting)
//          0x00000003 = Veteren
//          0x00000006 = Expert
//          0xffffffff = Disabled
//          
//          Note: 0xffffffff is just the value, it's not actually disabling the option.
//          
//          Numnbers in between are floored (0x02 = Novice) Any number higher than 0x06 is expert
function newOfficerMeleeProgression() => dword(0x6D7188)
EXPERT_NEW_OFFICER_PROGRESSION = 0x06

// $6D718C: (32-bit) New Officer's Combo's Progression
//          
//          0x00000000 = Novice(Starting)
//          0x00000003 = Veteren
//          0x00000006 = Expert
//          0xffffffff = Disabled
//          
//          Note: 0xffffffff is just the value, it's not actually disabling the option.
//          
//          Numnbers in between are floored (0x02 = Novice) Any number higher than 0x06 is expert
function newOfficerComboProgression() => dword(0x6D718C)

// $6D7190: (32-bit) New Officer's Musou's Progression
//          
//          0x00000000 = Novice(Starting)
//          0x00000003 = Veteren
//          0x00000006 = Expert
//          0xffffffff = Disabled
//          
//          Note: 0xffffffff is just the value, it's not actually disabling the option.
//          
//          Numnbers in between are floored (0x02 = Novice) Any number higher than 0x06 is expert
function newOfficerMusouProgression() => dword(0x6D7190)

// $6D7194: (32-bit) New Officer's Archery's Progression
//          
//          0x00000000 = Novice(Starting)
//          0x00000003 = Veteren
//          0x00000006 = Expert
//          0xffffffff = Disabled
//          
//          Note: 0xffffffff is just the value, it's not actually disabling the option.
//          
//          Numnbers in between are floored (0x02 = Novice) Any number higher than 0x06 is expert
function newOfficerArcheryProgression() => dword(0x6D7194)

// $6D719C: (32-bit) New Officer's Deflect's Progression
//          
//          0x00000000 = Novice(Starting)
//          0x00000003 = Veteren
//          0x00000006 = Expert
//          0xffffffff = Disabled
//          
//          Note: 0xffffffff is just the value, it's not actually disabling the option.
//          
//          Numnbers in between are floored (0x02 = Novice) Any number higher than 0x06 is expert
function newOfficerDeflectProgression() => dword(0x6D719C)

// $6D71A0: (32-bit) New Officer's Burst's Progression
//          
//          0x00000000 = Novice(Starting)
//          0x00000003 = Veteren
//          0x00000006 = Expert
//          0xffffffff = Disabled
//          
//          Note: 0xffffffff is just the value, it's not actually disabling the option.
//          
//          Numnbers in between are floored (0x02 = Novice) Any number higher than 0x06 is expert
function newOfficerBurstProgression() => dword(0x6D71A0)

// $6D71A8: (32-bit) New Officer's Riding's Progression
//          
//          0x00000000 = Novice(Starting)
//          0x00000003 = Veteren
//          0x00000006 = Expert
//          0xffffffff = Disabled
//          
//          Note: 0xffffffff is just the value, it's not actually disabling the option.
//          
//          Numnbers in between are floored (0x02 = Novice) Any number higher than 0x06 is expert
function newOfficerRidingProgression() => dword(0x6D71A8)

// On bootup time spent in level is 0.  Should never be 0 after a level. 
// NOTE: On bootup the game is set to Musou mode. 
function saveProtection() => !optionMenu() && (timeSpentInLevelinFrames() != 00 || prev(timeSpentInLevelinFrames()) != 00)

arrayOfNewOfficerSkills =
[
    newOfficerMeleeProgression(),
    newOfficerComboProgression(),
    newOfficerMusouProgression(),
    newOfficerArcheryProgression(),
    newOfficerDeflectProgression(),
    newOfficerBurstProgression(),
    newOfficerRidingProgression(),
]

function newOfficerSixExpertcheck() => tally_of(arrayOfNewOfficerSkills,
                                              6,  
                                              index => once( index >= 6  && index < 0xff)
        )

function power(value, powerValue)
{
    returnValue = 1
    if (powerValue >= 1)
    {
        for index in range(1,powerValue)
        {
            returnValue = returnValue * value
        }
    }
    return returnValue
}

function maxBitcount(value)
{
    for bitCount in range(0,32)
    {
        if(power(2,bitCount) > value)
        {
            return bitCount
        }
    }
    return 32
}

function scenarioAchievementAndLeaderboards(key)
{
    levelInfo = LevelInfo[key]
    measured_conditions = []
    
    for index in range(0, maxBitcount(levelInfo[EXPECTED_VALUE]))
    {
        targetValue = power(2, index)
        if ( targetValue & levelInfo[EXPECTED_VALUE] != 0 ) 
        {
            array_push(measured_conditions, bitOffset(levelInfo[MISSION_INFO], index))
        }         
    }
                  
    comparision = prev(word(levelInfo[MISSION_INFO])) & levelInfo[EXPECTED_VALUE] != levelInfo[EXPECTED_VALUE]
    reset_logic = prev(word(levelInfo[MISSION_INFO])) & word(levelInfo[MISSION_INFO]) != prev(word(levelInfo[MISSION_INFO])) 
    if (ContainsKey(levelInfo, EXTENDED_MISSION_INFO))
    {
        index = 0  
        
        for index in range(0, maxBitcount(levelInfo[EXTENDED_EXPECTED_VALUE]))
        {
            targetValue = power(2, index)
            if ( targetValue & levelInfo[EXTENDED_EXPECTED_VALUE] != 0 ) 
            {
                array_push(measured_conditions, bitOffset(levelInfo[EXTENDED_MISSION_INFO], index))
            }         
        }

        comparision = ( prev(word(levelInfo[MISSION_INFO])) & levelInfo[EXPECTED_VALUE] != levelInfo[EXPECTED_VALUE] ||
                        prev(word(levelInfo[EXTENDED_MISSION_INFO])) & levelInfo[EXTENDED_EXPECTED_VALUE] != levelInfo[EXTENDED_EXPECTED_VALUE] )
        reset_logic = prev(word(levelInfo[MISSION_INFO])) & word(levelInfo[MISSION_INFO]) != prev(word(levelInfo[MISSION_INFO])) || 
                      prev(word(levelInfo[EXTENDED_MISSION_INFO])) & word(levelInfo[EXTENDED_MISSION_INFO]) != prev(word(levelInfo[EXTENDED_MISSION_INFO])) 

    }
    achievement( title = format("{0} Missions", LevelLookup[key]),
                 description = format("Complete every mission in {0} in Story Mode", LevelLookup[key]),
                 points = levelInfo[POINTS],
                 trigger = comparision &&
                           measured(tally_of(measured_conditions, length(measured_conditions), bitValue => once(bitValue == 1))) &&
                           saveProtection() &&
                           currentScenarioId() == key && // Just a safety check.
                           never(reset_logic)
    )   
    
    leaderboard(
        title = format("Most Kills on {0}",  LevelLookup[key]),
        description = format("Get the most kills on {0} and win the scenario" + ONE_PLAYER_STRING,  LevelLookup[key]),
        start = 
        (
            musouOrFreeMode() &&
            currentScenarioId() == key &&
            !isSecondPlayerActive() &&
            playerjustWonStage() &&
            timeSpentInLevelinFrames() != 00

        ),
        cancel = always_false(),
        submit = always_true(),
        value = firstPlayerKoCount(),
        format = "VALUE"
    )

    leaderboard(
        title = format("Fastest Run on {0}", LevelLookup[key]),
        description = format("Get through the scenario {0} the fastest" + ONE_PLAYER_STRING, LevelLookup[key]),
        
        start  =
        (
            musouOrFreeMode() &&
            currentScenarioId() == key &&
            !isSecondPlayerActive() &&
            playerjustWonStage() &&
            timeSpentInLevelinFrames() != 00
        ),
        cancel = always_false(),
        submit = always_true(),
        value = timeSpentInLevelinFrames(),
        format = "FRAMES", 
        lower_is_better = true 
    )
    leaderboard(
        title = format("Chaos: Most Kills on {0}",  LevelLookup[key]),
        description = format("Get the most kills on {0} and win the scenario on chaos difficulty" + ONE_PLAYER_STRING,  LevelLookup[key]),
        start = 
        (
            musouOrFreeMode() &&
            currentScenarioId() == key &&
            !isSecondPlayerActive() &&
            playerjustWonStage() &&
            chaosDifficulty() &&
            timeSpentInLevelinFrames() != 00
        ),
        cancel = always_false(),
        submit = always_true(),
        value = firstPlayerKoCount(),
        format = "VALUE"
    )

    leaderboard(
        title = format("Chaos: Fastest Run on {0}", LevelLookup[key]),
        description = format("Get through the scenario {0} the fastest on chaos difficulty" + ONE_PLAYER_STRING, LevelLookup[key]),
        
        start  =
        (
            musouOrFreeMode() &&
            currentScenarioId() == key &&
            !isSecondPlayerActive() &&
            playerjustWonStage() &&
            chaosDifficulty() &&
            timeSpentInLevelinFrames() != 00
        ),
        cancel = always_false(),
        submit = always_true(),
        value = timeSpentInLevelinFrames(),
        format = "FRAMES", 
        lower_is_better = true 
    )
}



function endingAchievement(key, points)
{
    achievement( title = endingNameLookup[key],
                 description = format("Reach {0} in Story Mode or Free Mode" + ONE_PLAYER_STRING, endingDescriptionLookup[key]),
                 points = points,
                 trigger = musouOrFreeMode() &&
                           endingMovieTrigger(key) &&
                           !isSecondPlayerActive() &&
                           timeSpentInLevelinFrames() != 00
    )   
}


for key in range(YUKIMURA_FIRST_ENDING, INA_SECOND_ENDING)
{
    endingAchievement(key = key, points = 5)
}
for key in [NEW_OFFICER_FIRST, NEW_OFFICER_SECOND] 
{
    endingAchievement(key = key, points = 5)
}


for key in range(OKUNI_NOBUNAGA_ENDING, OKUNI_KENSHIN_ENDING)
{
    endingAchievement(key = key, points = 2)
}


function chaosAchievement(key) 
{
    achievement(title = format("Chaos Mode: {0}" , CharacterNameLookup[key]),
                description = format("Beat each of {0}'s story scenarios on Chaos Difficulty in one session in Story Mode" + ONE_PLAYER_STRING, CharacterNameLookup[key] ), 
                points = 25,
                trigger = measured(tally_of(range(LevelLineup[key][FIRST],LevelLineup[key][LAST]), 
                                            LevelLineup[key][LAST]-LevelLineup[key][FIRST] + 1,  
                                            index => once( currentScenarioId() == index && 
                                                 playerjustWonStage() &&
                                                 musouMode() &&
                                                 chaosDifficulty() &&
                                                 !isSecondPlayerActive() &&
                                                 saveProtection()
                                                 )
                                           )
                                  ),
                id = LevelLineup[key][ID]
                )
}

for key in LevelLineup
{
    chaosAchievement(key)
}

function weaponAchievement(key)
{
    record = WeaponList[key]
    ownerName = CharacterNameLookup[key]
    fifthId = record[FIFTH]
    fifthName = weaponNameLookup[fifthId]
    fifthDescription = weaponDescriptionLookup[fifthId]
    sixthId = record[SIXTH]
    sixthName = weaponNameLookup[sixthId]
    sixthDescription = weaponDescriptionLookup[sixthId]
    
    achievement( title = fifthName,
                 description = format("Obtain {0} on hard difficulty in Story Mode or Free Mode before obtaining {1}" + ONE_PLAYER_STRING, fifthDescription, sixthName),
                 points = 5,
                 trigger = musouOrFreeMode() &&
                           weaponHasDropped(fifthId) &&
                           !isSecondPlayerActive() &&
                           hardDifficulty() &&
                           trigger_when(playerjustWonStage()) &&
                           !everOwnedWeapon(sixthId)

    )   
    
    achievement( title = sixthName,
                 description = format("Obtain {0} on chaos difficulty in Story Mode or Free Mode" + ONE_PLAYER_STRING, sixthDescription),
                 points = 25,
                 trigger = musouOrFreeMode() &&
                           weaponHasDropped(sixthId) &&
                           !isSecondPlayerActive() &&
                           chaosDifficulty() &&
                           trigger_when(playerjustWonStage())
    )   
}

for key in WeaponList
{
    weaponAchievement(key = key)
}

achievement( title = "Top-Tier Officers",
             description = "Reach level 20 with all your officers and one of the new officers",
             points = 10,
             trigger = officersLevel20Check() && 
                       newOfficersLevel20Check() &&
                       (newOfficerJustLevel19Check() || 
                        officersWasLevel19Check()) &&
                       !optionMenu()  
            )



achievement( title = "Commons Collection", 
             description = "Collect Every Common item",
             points = 5, 
             trigger = justOwnedAllCommonItems() &&
                       saveProtection()
            )

achievement( title = "Commons Champion", 
             description = "Get Every Common item to have at least 50 item power",
             points = 5, 
             trigger = itemsReachedAtXPower(50) &&
                       saveProtection()
            )

function musouRareItemAchievement(key) 
{
    achievement(title = itemLookup[key],
                description = format("Obtain {0} in Story Mode or Free Mode" + ONE_PLAYER_STRING, itemLookup[key]),
                points = 5,
                trigger = itemHasDropped(key) &&
                          !isSecondPlayerActive() &&
                          saveProtection() &&
                          musouOrFreeMode() &&
                          trigger_when(playerjustWonStage())
                )
}

function oneTimeMission(key) 
{
    achievement(title = itemLookup[key],
                description = format("Obtain {0} for the first time in New Officer Mode", itemLookup[key]),
                points = 5,
                trigger = justUnlockItem(key) &&
                          newOfficerMode()
                )
}

function oneTimeSurvival(key) 
{
    achievement(title = itemLookup[key],
                description = format("Obtain {0} for the first time in Survival Mode", itemLookup[key]),
                points = 5,
                trigger = justUnlockItem(key) &&
                          survivalMode()
                )
}

function survivalRareItemAchievement(key) 
{
    achievement(title = itemLookup[key],
                description = format("Obtain {0} in Story Mode or Free Mode", itemLookup[key]),
                points = 5,
                trigger = itemHasDropped(key) &&
                          !isSecondPlayerActive() &&
                          saveProtection() &&
                          survivalMode()
                )
}

function versusRareItemAchievement(key) 
{
    achievement(title = itemLookup[key],
                description = format("Obtain {0} in Versus Mode", itemLookup[key]),
                points = 5,
                trigger = itemHasDropped(key) &&
                          saveProtection() &&
                          versusMode()
                )
}


musouRareItemAchievement(ARABIAN_SADDLE)
musouRareItemAchievement(MATSUKAZE_SADDLE)
musouRareItemAchievement(HORSE_ARMOR)
musouRareItemAchievement(WARRIORS_TALE)
musouRareItemAchievement(BATTLE_DRUM)
musouRareItemAchievement(GOLD_INCENSE)
oneTimeMission(WAR_RATIONS)
musouRareItemAchievement(GUIDING_DOLL)
survivalRareItemAchievement(HEALING_BALM)
musouRareItemAchievement(HACHIMAN_BELL)
musouRareItemAchievement(LANTERN)
musouRareItemAchievement(ELEMENT_RUNE)
musouRareItemAchievement(NINJA_SUIT)
musouRareItemAchievement(KAGE_SCROLL)
versusRareItemAchievement(WAR_BATON)
musouRareItemAchievement(BOOK_OF_HEALING)
musouRareItemAchievement(SHIELD_WALL)
oneTimeSurvival(GOLDEN_RUNE)
survivalRareItemAchievement(BOOK_OF_EARTH)
survivalRareItemAchievement(BOOK_OF_WATER)
survivalRareItemAchievement(BOOK_OF_FIRE)
survivalRareItemAchievement(BOOK_OF_WIND)
survivalRareItemAchievement(BOOK_OF_AIR)



for key in LevelInfo
{
    scenarioAchievementAndLeaderboards(key)
}

achievement( title = "Pacifist",
                description = "Complete a scenario with out killing anyone in Story Mode or Free Mode",
                points = 3,
                trigger = musouOrFreeMode() &&
                        !isSecondPlayerActive() &&
                        firstPlayerKoCount() == 0 &&
                        playerjustWonStage() &&
                        timeSpentInLevelinFrames() != 00
)

function missionLeaderboardAchievementAndLeaderboard(missionId, title, description, target, value)
{
    achievement( title = title,
                description = description,
                points = 5,
                trigger = challengeMode() &&
                          currentScenarioId() == missionId &&
                          !isSecondPlayerActive() &&
                          target > value &&
                          playerJustFinishedChallenge()
    )

    leaderboard(
        title = format("Best Score on {0}", LevelLookup[missionId]),
        description = format("Get the highest score on {0} challenge", LevelLookup[missionId]),
        
        start  =
        (
            challengeMode() &&
            currentScenarioId() == missionId &&
            !isSecondPlayerActive() &&
            playerJustFinishedChallenge()
        ),
        cancel = always_false(),
        submit = always_true(),
        value = target,
        format = "VALUE" 
    )
}

function missionLeaderboardAchievementAndLeaderboardLesser(missionId, title, description, target, value)
{
    achievement( title = title,
                description = description,
                points = 5,
                trigger = challengeMode() &&
                          currentScenarioId() == missionId &&
                          !isSecondPlayerActive() &&
                          target <= value &&
                          playerJustFinishedChallenge() &&
                          timeSpentInLevelinFrames() != 00 
    )

    leaderboard(
        title = format("Fastest Run on {0}", LevelLookup[missionId]),
        description = format("Get through the {0} challenge the fastest", LevelLookup[missionId]),
        
        start  =
        (
            challengeMode() &&
            currentScenarioId() == missionId &&
            !isSecondPlayerActive() &&
            playerJustFinishedChallenge() &&
            timeSpentInLevelinFrames() != 00 
        ),
        cancel = always_false(),
        submit = always_true(),
        value = timeSpentInLevelinFrames(),
        format = "FRAMES", 
        lower_is_better = true 
    )
}

missionLeaderboardAchievementAndLeaderboard(missionId = MELEE_MISSION,
                              title = "Melee Master",
                              description = "Earn more than 514 KOs for Melee in Challenge Mode", 
                              target = firstPlayerKoCount(),
                              value = 514)
missionLeaderboardAchievementAndLeaderboard(missionId = COMBO_MISSION,
                              title = "Combo Champion",
                              description = "Earn more than 113 points for Combo in Challenge Mode", 
                              target = comboTrainingScore(),
                              value = 113)
missionLeaderboardAchievementAndLeaderboard(missionId = MUSOU_MISSION,
                              title = "Musou Maniac",
                              description = "Earn more than 702 KOs for Musous in Challenge Mode", 
                              target = firstPlayerKoCount(),
                              value = 702)
missionLeaderboardAchievementAndLeaderboard(missionId = ARCHERY_MISSION,
                              title = "Archery Ace",
                              description = "Earn more than 41 Kos for Archery in Challenge Mode", 
                              target = firstPlayerKoCount(),
                              value = 41)
missionLeaderboardAchievementAndLeaderboard(missionId = DEFLECT_MISSION,
                              title = "Deflect Demon",
                              description = "Earn more than 74 Kos for Deflect in Challenge Mode", 
                              target = firstPlayerKoCount(),
                              value = 74)
missionLeaderboardAchievementAndLeaderboardLesser(missionId = BURST_MISSION,
                              title = "Blazing Burst",
                              description = "Finish Burst in Challenge Mode with 1'12'00 still on the clock", 
                              target = timeSpentInLevelinFrames(),
                              value = (2*60*60) - (((1 * 60 + 12) * 60)) )

missionLeaderboardAchievementAndLeaderboardLesser(missionId = RIDING_MISSION,
                              title = "Rapid Riding",
                              description = "Finish Riding in Challenge Mode with 1'12'00 still on the clock", 
                              target = timeSpentInLevelinFrames(),
                              value = ((4*60 + 30 )*60) - (((1 * 60 + 12) * 60) ) )

function survivalLeaderboardAchievement(missionId, title, description, target, value)
{
    achievement( title = title,
                description = description,
                points = 5,
                trigger = survivalMode() &&
                          !isSecondPlayerActive() &&
                          target > value &&
                          playerjustWonSurvival()
    )

    leaderboard(
        title = format("Best Score on {0}", LevelLookup[missionId]),
        description = format("Get the highest score on {0} challenge", LevelLookup[missionId]),
        
        start  =
        (
            survivalMode() &&
            currentScenarioId() == missionId &&
            !isSecondPlayerActive() &&
            playerjustWonSurvival()
        ),
        cancel = always_false(),
        submit = always_true(),
        value = target,
        format = "VALUE" 
    )
}


function highTowerLeaderboardAchievement(missionId, title, description, target, value)
{
    achievement( title = title,
                description = description,
                points = 5,
                trigger = survivalMode() &&
                          !isSecondPlayerActive() &&
                          target > value &&
                          playerjustFinishedHighTower()
    )

    leaderboard(
        title = format("Best Score on {0}", LevelLookup[missionId]),
        description = format("Get the highest score on {0} challenge", LevelLookup[missionId]),
        
        start  =
        (
            survivalMode() &&
            currentScenarioId() == missionId &&
            !isSecondPlayerActive() &&
            playerjustFinishedHighTower()
        ),
        cancel = always_false(),
        submit = always_true(),
        value = target,
        format = "VALUE" 
    )
}





survivalLeaderboardAchievement(missionId = GOLD_RUSH,
                              title = "Godly Gold Rush",
                              description = "Survive Gold Rush in Survival Mode with 7000G", 
                              target = goldInGoldRush(),
                              value = 7000)
survivalLeaderboardAchievement(missionId = DEEP_ABYSS,
                              title = "Devilish Deep Abyss",
                              description = "Finish Deep Abyss in Survival Mode with 2000 KOs", 
                              target = firstPlayerKoCount(),
                              value = 2000)
highTowerLeaderboardAchievement(missionId = HIGH_TOWER,
                              title = "Holy High Tower",
                              description = "Finish High Tower in Survival Mode with over 30 floor complete", 
                              target = survivalFloorLevel(),
                              value = 30)

function newOfficerAchievement(title, description, target)
{
    achievement( title = title,
                description = description,
                points = 10,
                trigger = newOfficerMode() &&
                          target
                )
}

newOfficerAchievement(title = "Musket Mastery",
                      description = "Learn the Musket Skill from Magoichi Saika in New Officer Mode",
                      target = newOfficerMusketUnlock())
newOfficerAchievement(title = "Fulfilling Frenzy",
                      description = "Learn the Frenzy Skill from Ranmaru Mori in New Officer Mode",
                      target = newOfficerFrenzyUnlock())
newOfficerAchievement(title = "Reliable Reach",
                      description = "Learn the Reach Skill from Kenji Maeda in New Officer Mode",
                      target = newOfficerReachUnlock())
newOfficerAchievement(title = "Robust Rage",
                      description = "Learn the Rage Skill from Masamune Date in New Officer Mode",
                      target = newOfficerRageUnlock())
newOfficerAchievement(title = "Dynamic Drive",
                      description = "Learn the Drive Skill from Okuni in New Officer Mode",
                      target = newOfficerDriveUnlock())
newOfficerAchievement(title = "Full Focus",
                      description = "Learn the Focus Skill from Kunoichi in New Officer Mode",
                      target = newOfficerFocusUnlock())
newOfficerAchievement(title = "Flourishing Fortitude",
                      description = "Learn the Fortitude Skill from Dokkimaru in New Officer Mode",
                      target = newOfficerFortitudeUnlock())
newOfficerAchievement(title = "Diligent Discern",
                      description = "Learn the Frenzy Skill from Ranmaru Mori in New Officer Mode",
                      target = newOfficerDiscernUnlock())

achievement(title = "Visage Variety",
            description = "Unlock four additional faces for your new officer",
            points = 10,
            trigger = newOfficerMode() &&
                      newOfficerFaceUnlock()
)

achievement(title = "The First of Many",
            description = "Beat any scenario in Story Mode or Free Mode for the first time",
            points = 1, 
            trigger = playerjustWonStage() &&
                      musouOrFreeMode() &&
                      saveProtection() &&
                      timeSpentInLevelinFrames() != 00 ,
            id = 388818
            )

rich_presence_conditional_display(optionMenu(), "In The Menus")

rich_presence_conditional_display(versusMode(), "In Versus Mode")

rich_presence_conditional_display(challengeMode(), "Challenge Mode: {0} attempting {1}",
                                  rich_presence_lookup("CharacterNameLookup", characterId(), CharacterNameLookup), 
                                  rich_presence_lookup("LevelLookup", currentScenarioId(), LevelLookup))


rich_presence_conditional_display(survivalMode(), "Survival Mode: {0} attempting {1}",
                                  rich_presence_lookup("CharacterNameLookup", characterId(), CharacterNameLookup), 
                                  rich_presence_lookup("LevelLookup", currentScenarioId(), LevelLookup))


rich_presence_conditional_display(newOfficerMode(), "New Officer Mode: Creating a new character")

rich_presence_conditional_display(musouMode(), "Story Mode: {0} playing through {1}",
                                  rich_presence_lookup("CharacterNameLookup", characterId(), CharacterNameLookup), 
                                  rich_presence_lookup("LevelLookup", currentScenarioId(), LevelLookup))


rich_presence_conditional_display(freeMode(), "Free Mode: {0} playing through {1}",
                                  rich_presence_lookup("CharacterNameLookup", characterId(), CharacterNameLookup), 
                                  rich_presence_lookup("LevelLookup", currentScenarioId(), LevelLookup))

// Unknown 
rich_presence_display("In Menus.") //Intentionally slightly different to say "issue with RP, with out saying issue with RP"


// One of every skill on a single character?







