// Devil Kings
// #ID = 20696


// For Dictionaries. 
ACHIEVEMENT_NAME = "Achievement Name"
ACHIEVEMENT_DESCRIPTION = "Achievement Description"
ACHIEVEMENT_POINTS = "Achievement_Points" 
ITEM_ID = "Item ID"
CHARACTER_ID = "Character ID"
FIRST_ITEM = "First Item"
SECOND_ITEM = "Second Item"
THIRD_ITEM = "Third Item"
CONQUEST_TITLE = "Conquest_Title"
HARD_CONQUEST_TITLE = "Hard_Conquest_Title"
LEVEL_TEN_TITLE = "Level_Ten_Title"
LEVEL_FIVE_TITLE = "Level_Five_Title"
WEAPON_ACHIEVEMENT_TITLE = "Weapon_Achievement_Title"
TIME_RUN_ACHIEVEMENT_NAME = "Time_Run_Achievement_Name"
HARD_TIME_RUN_ACHIEVEMENT_NAME = "Hard_Time_Run_Achievement_Name"  


// $488DE8: (8-Bit) Difficulty Setting
//          
//          0x00 = Easy
//          0x01 = Normal
//          0x02 = Hard
//          
//          Must be past the initial "Engage"   Probably best to ensure time is over 0 and at least at state 8.
function difficultySetting() => byte(0x488DE8)

EASY_DIFFICULTY_ID = 0x00
NORMAL_DIFFICULTY_ID = 0x01
HARD_DIFFICULTY_ID = 0x02

function isEasyDifficulty() => difficultySetting() == EASY_DIFFICULTY_ID
function isNormalDifficulty() => difficultySetting() == NORMAL_DIFFICULTY_ID
function isHardDifficulty() => difficultySetting() == HARD_DIFFICULTY_ID

DifficultyNameLookup = {
    0x00: "Easy",
    0x01: "Normal",
    0x02: "Hard"
}
// $54AE38: (8-bit) Number of named enemies killed
//
//          "Commanders"  But Captains and guard captains appear to count.  If it's more than 10 you earn 3000 EXP if using the Medal of Valor. 
function numberOfNamedEnemiesKilled() => byte(0x54AE38)

// $54C404: (8-bit) Post game Result.
//          
//          This changes after a match.  Note: It does NOT change when returning to the main menu.
//          
//          0x00 = Normal gameplay
//          0x01 = Won
//          0x02 = Game Over
//          
//          Freezing this will change what is shown after a win/death... But doesn't change the actual result.
//          
//          We don't need that, we can live with this.
function winCheck() => byte(0x54C404)


// $55CA70: (8-bit) Expected Scorpio Saved Level
//          
//          Look at 0x0055d094  for more info
function larkSaveStartFirst() => byte(0x55CA70)

// $55CC7C: (8-bit) Actual Azure Dragon Saved Level
//          
//          Look at 0x0055d094  for more info.
function azureDragonSaveData() => byte(0x55CC7C)

LAKA_SAVE_LOCATION = 0x55CA70
AZURE_DRAGON_SAVE_LOCATION = 0x55CC7C
CHARACTER_SAVE_SIZE = AZURE_DRAGON_SAVE_LOCATION - LAKA_SAVE_LOCATION  //0x20C

// $55CE88: (8-bit) Actual Scorpio Saved Level
//          
//          Look at 0x0055d094  for more info
function scorpioSaveData() => byte(0x55CE88)

// $55D094: (8-bit) Actual Devil King's Saved Level
//          This is the level for Devil King.  But this is updated when you save the game.  The game will pull from this when you go back to the main menu.   However it doesn't update the player chooses to Save the game  If he doesn't the level increases in game and NOT the front end.
//          
//          In addition once you've returned to the front end.  Changing this doesn't change the level.   Likely it's stored in a separate place once in the front end.
//          
//          830 415
function devilKingSaveData() => byte(0x55D094)

// $55D8C4: (8-bit) Hornet Saved Level
//          
//          See 0x0055d094 for more info
function hornetSaveData() => byte(0x55D8C4)

// $55EB20: (8-bit) Item Unlock: Spartan Brace
//          
//          0x00 = Unowned
//          All others Level. (0x11 = 17)
function spartanBraceItemLevel() => byte(0x55EB20)

// 0x553EB20 is the Front end location. 

// 0x00561094 is the In Game Location, we use that. 
FIRST_ITEM_LOCATION = 0x00561094
SPARTAN_BRACE_ITEM_ID = 0x00
ARMOR_ITEM_ID = 0x01
ENERGY_BEAD_ITEM_ID = 0x02
HEALTH_RING_ITEM_ID = 0x03
FIRE_CHARM_ITEM_ID = 0x04
LIGHTNING_CHARM_ITEM_ID = 0x05
ICE_CHARM_ITEM_ID = 0x06
DARK_CHARM_ITEM_ID = 0x07
FURY_QUEENCHER_ITEM_ID = 0x08
SHIELD_CRUSHER_ITEM_ID = 0x09
AWAKENING_VIAL_ITEM_ID = 0x0A
SAGE_HAIRPIN_ITEM_ID = 0x0B
RALLY_PIPE_ITEM_ID = 0x0C
FURY_SOUL_ITEM_ID = 0x0D
SADDLE_WHIRLWIND_ITEM_ID = 0x0E
HOURGLASS_OF_FATE_ITEM_ID = 0x0F
GROUND_KILLER_GAUNTLET_ITEM_ID = 0x10
AIR_KILLER_GAUNTLET_ITEM_ID = 0x11
FLAME_KILLER_GAUNTLET_ITEM_ID = 0x12
SHADOW_KILLER_GAUNTLET_ITEM_ID = 0x13
MACHINE_KILLER_GAUNTLET_ITEM_ID = 0x14
IRON_KILLER_GAUNTLET_ITEM_ID = 0x15
WOOD_KILLER_GAUNTLET_ITEM_ID = 0x16
PARCHMENT_OF_INFAMY_ITEM_ID = 0x17
DISCIPLINARIAN_PADDLE_ITEM_ID = 0x18
BRONZE_AWARD_ITEM_ID = 0x19
SILVER_AWARD_ITEM_ID = 0x1A
GOLD_AWARD_ITEM_ID = 0x1B
HEADDRESS_OF_THE_MINOTAUR_ITEM_ID = 0x1C
WHEEL_OF_GALE_I_ITEM_ID = 0x1D
WHEEL_OF_GALE_II_ITEM_ID = 0x1E
WHEEL_OF_GALE_III_ITEM_ID = 0x1F
HILT_OF_REFLECTION_ITEM_ID = 0x20
FACE_OF_THE_BERSERKER_ITEM_ID = 0x21
SKULL_OF_THE_BERSERKER_ITEM_ID = 0x22
EYES_OF_THE_BERSERKER_ITEM_ID = 0x23
POWER_SHOT_ITEM_ID = 0x24
BOUNTY_CHEST_I_ITEM_ID = 0x25
BOUNTY_CHEST_II_ITEM_ID = 0x26
BOUNTY_CHEST_III_ITEM_ID = 0x27
BACK_SCRATCHER_ITEM_ID = 0x28
RED_MASK_OF_DEMONESS_ITEM_ID = 0x29
WHITE_MASK_OF_DEMONESS_ITEM_ID = 0x2A
BLUE_MASK_OF_DEMONESS_ITEM_ID = 0x2B
HAMMER_DISPLACER_ITEM_ID = 0x2C
CURSED_MASK_ITEM_ID = 0x2D
CURSED_JACKET_ITEM_ID = 0x2E
CURSED_CLOAK_ITEM_ID = 0x2F
CHAIN_OF_NECROSIS_ITEM_ID = 0x30
BREAKTHROUGH_SECRET_ITEM_ID = 0x31
COUP_DETAT_SCALE_ITEM_ID = 0x32
JEWEL_OF_RAGE_ITEM_ID = 0x33
CHARM_OF_GOOD_FORTUNE_ITEM_ID = 0x34
TOP_LOTTERY_TICKET_FRAGMENT_ITEM_ID = 0x35
MIDDLE_LOTTERY_TICKET_FRAGMENT_ITEM_ID = 0x36
BOTTOM_LOTTERY_TICKET_FRAGMENT_ITEM_ID = 0x37
MEDAL_OF_VALOR_ITEM_ID = 0x38
CURSED_KING_DOLL_ITEM_ID = 0x39
CURSED_PRINCESS_DOLL_ITEM_ID = 0x3A
CURSED_MINSTREL_DOLL_ITEM_ID = 0x3B
SOOTHING_HARP_ITEM_ID = 0x3C
TAINTED_FIGURINE_HEAD_ITEM_ID = 0x3D
TAINTED_FIGURINE_TORSO_ITEM_ID = 0x3E
TAINTED_FIGURINE_LEGS_ITEM_ID = 0x3F
HELMET_OF_THE_BETRAYER_ITEM_ID = 0x40
BEADS_OF_MERCY_ITEM_ID = 0x41
GRAVE_POWER_ITEM_ID = 0x42
GIFT_BOX_OF_REWARDS_ITEM_ID = 0x43
SASH_OF_ATONEMENT_ITEM_ID = 0x44
DIE_OF_FORTUNE_I_ITEM_ID = 0x45
DIE_OF_FORTUNE_II_ITEM_ID = 0x46
DIE_OF_FORTUNE_III_ITEM_ID = 0x47
FOUL_INSCENSE_ITEM_ID = 0x48
BOOK_OF_IMMORTALITY_I_ITEM_ID = 0x49
BOOK_OF_IMMORTALITY_II_ITEM_ID = 0x4A
BOOK_OF_IMMORTALITY_III_ITEM_ID = 0x4B
PLASMA_GENERATOR_ITEM_ID = 0x4C
WARRIORS_CODE_LOYALTY_ITEM_ID = 0x4D
WARRIORS_CODE_VALOR_ITEM_ID = 0x4E
WARRIORS_CODE_HONOR_ITEM_ID = 0x4F

ItemNameLookup = 
{
    SPARTAN_BRACE_ITEM_ID: "Spartan Brace",
    ARMOR_ITEM_ID: "Armor",
    ENERGY_BEAD_ITEM_ID: "Energy Bead",
    HEALTH_RING_ITEM_ID: "Health Ring",
    FIRE_CHARM_ITEM_ID: "Fire Charm",
    LIGHTNING_CHARM_ITEM_ID: "Lightning Charm",
    ICE_CHARM_ITEM_ID: "Ice Charm",
    DARK_CHARM_ITEM_ID: "Dark Charm",
    FURY_QUEENCHER_ITEM_ID: "Fury Quencher",
    SHIELD_CRUSHER_ITEM_ID: "Shield Crusher",
    AWAKENING_VIAL_ITEM_ID: "Awakening Vial",
    SAGE_HAIRPIN_ITEM_ID: "Sage Hairpin",
    RALLY_PIPE_ITEM_ID: "Rally Pipe",
    FURY_SOUL_ITEM_ID: "Fury Soul",
    SADDLE_WHIRLWIND_ITEM_ID: "Saddle of the Whirlwind",
    HOURGLASS_OF_FATE_ITEM_ID: "Hourglass of Fate",
    GROUND_KILLER_GAUNTLET_ITEM_ID: "Ground Killer Gauntlets",
    AIR_KILLER_GAUNTLET_ITEM_ID: "Air Killer Gauntlets",
    FLAME_KILLER_GAUNTLET_ITEM_ID: "Flame Killer Gauntlets",
    SHADOW_KILLER_GAUNTLET_ITEM_ID: "Shadow Killer Gauntlets",
    MACHINE_KILLER_GAUNTLET_ITEM_ID: "Machine Killer Gauntlets",
    IRON_KILLER_GAUNTLET_ITEM_ID: "Iron Killer Gauntlets",
    WOOD_KILLER_GAUNTLET_ITEM_ID: "Wood Killer Gauntlets",
    PARCHMENT_OF_INFAMY_ITEM_ID: "Parchment of Infamy",
    DISCIPLINARIAN_PADDLE_ITEM_ID: "Disciplinarian Paddle",
    BRONZE_AWARD_ITEM_ID: "Bronze Award",
    SILVER_AWARD_ITEM_ID: "Silver Award",
    GOLD_AWARD_ITEM_ID: "Gold Award",
    HEADDRESS_OF_THE_MINOTAUR_ITEM_ID: "Headdress of the Minotaur",
    WHEEL_OF_GALE_I_ITEM_ID: "Wheel of Gale - I",
    WHEEL_OF_GALE_II_ITEM_ID: "Wheel of Gale - II",
    WHEEL_OF_GALE_III_ITEM_ID: "Wheel of Gale - III",
    HILT_OF_REFLECTION_ITEM_ID: "Hilt of Reflection",
    FACE_OF_THE_BERSERKER_ITEM_ID: "Face of the Berserker",
    SKULL_OF_THE_BERSERKER_ITEM_ID: "Skull of the Berserker",
    EYES_OF_THE_BERSERKER_ITEM_ID: "Eyes of the Berserker",
    POWER_SHOT_ITEM_ID: "Power Shot",
    BOUNTY_CHEST_I_ITEM_ID: "Bounty Chest - I",
    BOUNTY_CHEST_II_ITEM_ID: "Bounty Chest - II",
    BOUNTY_CHEST_III_ITEM_ID: "Bounty Chest - III",
    BACK_SCRATCHER_ITEM_ID: "Back Scratcher",
    RED_MASK_OF_DEMONESS_ITEM_ID: "Red Mask of Demoness",
    WHITE_MASK_OF_DEMONESS_ITEM_ID: "White Mask of Demoness",
    BLUE_MASK_OF_DEMONESS_ITEM_ID: "Blue Mask of Demoness",
    HAMMER_DISPLACER_ITEM_ID: "Hammer Displacer",
    CURSED_MASK_ITEM_ID: "Cursed Mask",
    CURSED_JACKET_ITEM_ID: "Cursed Jacket",
    CURSED_CLOAK_ITEM_ID: "Cursed Cloak",
    CHAIN_OF_NECROSIS_ITEM_ID: "Chain of Necrosis",
    BREAKTHROUGH_SECRET_ITEM_ID: "Breakthrough Secret",
    COUP_DETAT_SCALE_ITEM_ID: "Coup D'etat Scale",
    JEWEL_OF_RAGE_ITEM_ID: "Jewel of Rage",
    CHARM_OF_GOOD_FORTUNE_ITEM_ID: "Charm of Good Fortune",
    TOP_LOTTERY_TICKET_FRAGMENT_ITEM_ID: "Top Lottery Ticket Fragment",
    MIDDLE_LOTTERY_TICKET_FRAGMENT_ITEM_ID: "Middle Lottery Ticket Fragment",
    BOTTOM_LOTTERY_TICKET_FRAGMENT_ITEM_ID: "Bottom Lottery Ticket Fragment",
    MEDAL_OF_VALOR_ITEM_ID: "Medal of Valor",
    CURSED_KING_DOLL_ITEM_ID: "Cursed King Doll",
    CURSED_PRINCESS_DOLL_ITEM_ID: "Cursed Princess Doll",
    CURSED_MINSTREL_DOLL_ITEM_ID: "Cursed Minstrel Doll",
    SOOTHING_HARP_ITEM_ID: "Soothing Harp",
    TAINTED_FIGURINE_HEAD_ITEM_ID: "Tainted Figurine Head",
    TAINTED_FIGURINE_TORSO_ITEM_ID: "Tainted Figurine Torso",
    TAINTED_FIGURINE_LEGS_ITEM_ID: "Tainted Figurine Legs",
    HELMET_OF_THE_BETRAYER_ITEM_ID: "Helmet of the Betrayer",
    BEADS_OF_MERCY_ITEM_ID: "Beads of Mercy",
    GRAVE_POWER_ITEM_ID: "Grave Power",
    GIFT_BOX_OF_REWARDS_ITEM_ID: "Gift Box of Rewards",
    SASH_OF_ATONEMENT_ITEM_ID: "Sash of Atonement",
    DIE_OF_FORTUNE_I_ITEM_ID: "Die of Fortune - I",
    DIE_OF_FORTUNE_II_ITEM_ID: "Die of Fortune - II",
    DIE_OF_FORTUNE_III_ITEM_ID: "Die of Fortune - III",
    FOUL_INSCENSE_ITEM_ID: "Foul Incense",
    BOOK_OF_IMMORTALITY_I_ITEM_ID: "Book of Immortality - I",
    BOOK_OF_IMMORTALITY_II_ITEM_ID: "Book of Immortality - II",
    BOOK_OF_IMMORTALITY_III_ITEM_ID: "Book of Immortality - III",
    PLASMA_GENERATOR_ITEM_ID: "Plasma Generator",
    WARRIORS_CODE_LOYALTY_ITEM_ID: "Warrior's Code - Loyalty",
    WARRIORS_CODE_VALOR_ITEM_ID: "Warrior's Code - Valor",
    WARRIORS_CODE_HONOR_ITEM_ID: "Warrior's Code - Honor"
}

function unlockedSpecificNumberOfItems(target_value) => measured(sum_of(range(SPARTAN_BRACE_ITEM_ID,WARRIORS_CODE_HONOR_ITEM_ID), 
                                                    index => byte(FIRST_ITEM_LOCATION + index) / byte(FIRST_ITEM_LOCATION + index)) >= target_value) &&
                                                 sum_of(range(SPARTAN_BRACE_ITEM_ID,WARRIORS_CODE_HONOR_ITEM_ID), 
                                                    index => prev(byte(FIRST_ITEM_LOCATION + index)) / prev(byte(FIRST_ITEM_LOCATION + index))) < target_value &&
                                                 sum_of(range(SPARTAN_BRACE_ITEM_ID,WARRIORS_CODE_HONOR_ITEM_ID), 
                                                    index => prev(byte(FIRST_ITEM_LOCATION + index)) / prev(byte(FIRST_ITEM_LOCATION + index))) >= target_value - 10


// $55EB21: (8-bit) Item Unlock: Armor
//          
//          0x00 = Unowned
//          All others Level. (0x11 = 17)
function armorItemLevel() => byte(0x55EB21)

// $55EB22: (8-bit) Item Unlock: Energy Bead
//          
//          0x00 = Unowned
//          All others Level. (0x11 = 17)
function energyBeadItemLevel() => byte(0x55EB22)

// $55EB23: (8-bit) Item Unlock: Health Ring
//          
//          0x00 = Unowned
//          All others Level. (0x11 = 17)
function healthRingItemLevel() => byte(0x55EB23)

// $55EB24: (8-bit) Item Unlock: Fire Charm
//          
//          0x00 = Unowned
//          0x01 = Owned
function fireCharmItemOwned() => byte(0x55EB24)

// $55EB25: (8-bit) Item Unlock: Lightning Charm
//          
//          0x00 = Unowned
//          0x01 = Owned
function lightningCharmItemOwned() => byte(0x55EB25)

// $55EB26: (8-bit) Item Unlock: Ice Charm
//          
//          0x00 = Unowned
//          0x01 = Owned
function iceCharmItemOwned() => byte(0x55EB26)

// $55EB27: (8-bit) Item Unlock: Dark Charm
//          
//          0x00 = Unowned
//          0x01 = Owned
function darkCharmItemOwned() => byte(0x55EB27)

// $55EB28: (8-bit) Item Unlock: Fury Quencher
//          0x00 = Unowned
//          0x01 = Owned
function furyQuencherItemOwned() => byte(0x55EB28)

// $55EB29: (8-bit) Item Unlock: Shield Crusher
//          
//          0x00 = Unowned
//          0x01 = Owned
function shieldCrusherItemOwned() => byte(0x55EB29)

// $55EB2A: (8-bit) Item Unlock: Awakening Vial
//          
//          0x00 = Unowned
//          0x01 = Owned
function awakeningVialItemOwned() => byte(0x55EB2A)

// $55EB2B: (8-bit) Item Unlock: Sage Hairpin
//          
//          0x00 = Unowned
//          0x01 = Owned
function sageHairpinItemOwned() => byte(0x55EB2B)

// $55EB2C: (8-bit) Item Unlock: Rally Pipe
//          
//          0x00 = Unowned
//          0x01 = Owned
function rallyPipeItemOwned() => byte(0x55EB2C)

// $55EB2D: (8-bit) Item Unlock: Fury Soul
//          
//          0x00 = Unowned
//          0x01 = Owned
function furySoulItemOwned() => byte(0x55EB2D)

// $55EB2E: (8-bit) Item Unlock: Saddle of the Whirlwind
//          
//          0x00 = Unowned
//          0x01 = Owned
function saddleWhirlwindItemOwned() => byte(0x55EB2E)

// $55EB2F: (8-bit) Item Unlock: Hourglass of Fate
//          
//          0x00 = Unowned
//          0x01 = Owned
function hourglassofFateItemOwned() => byte(0x55EB2F)

// $55EB30: (8-bit) Item Unlock: Ground Killer Gauntlets
//          
//          0x00 = Unowned
//          0x01 = Owned
function groundKillerGauntletItemOwned() => byte(0x55EB30)

// $55EB31: (8-bit) Item Unlock: Air Killer Gauntlets
//          
//          0x00 = Unowned
//          0x01 = Owned
function airKillerGauntletItemOwned() => byte(0x55EB31)

// $55EB32: (8-bit) Item Unlock: Flame Killer Gauntlets
//          
//          0x00 = Unowned
//          0x01 = Owned
function flakeKillerGauntlerItemOwned() => byte(0x55EB32)

// $55EB33: (8-bit) Item Unlock: Shadow Killer Gauntlets
//          
//          0x00 = Unowned
//          0x01 = Owned
function shadowKillerGauntletItemOwned() => byte(0x55EB33)

// $55EB34: (8-bit) Item Unlock: Machine Killer Gauntlets
//          
//          0x00 = Unowned
//          0x01 = Owned
function machineKillerGauntletItemOwned() => byte(0x55EB34)

// $55EB35: (8-bit) Item Unlock: Iron Killer Gauntlets
//          
//          0x00 = Unowned
//          0x01 = Owned
function ironKillerGauntletItemOwned() => byte(0x55EB35)

// $55EB36: (8-bit) Item Unlock: Wood Killer Gauntlets
//          
//          0x00 = Unowned
//          0x01 = Owned
function woodKillerGauntletItemOwned() => byte(0x55EB36)

// $55EB37: (8-bit) Item Unlock: Parchment of Infamy
//          
//          0x00 = Unowned
//          0x01 = Owned
function parchmentInfamyItemOwned() => byte(0x55EB37)

// $55EB38: (8-bit) Item Unlock: Disciplinarian Paddle
//          
//          0x00 = Unowned
//          0x01 = Owned
function disciplinarianPaddleItemOwned() => byte(0x55EB38)

// $55EB39: (8-bit) Item Unlock: Bronze Award
//          
//          0x00 = Unowned
//          0x01 = Owned
function bronzeAwardItemOwned() => byte(0x55EB39)

// $55EB3A: (8-bit) Item Unlock: Silver Award
//          
//          0x00 = Unowned
//          0x01 = Owned
function silverAwardItemOwned() => byte(0x55EB3A)

// $55EB3B: (8-bit) Item Unlock: Gold Award
//          
//          0x00 = Unowned
//          0x01 = Owned
function goldAwardItemOwned() => byte(0x55EB3B)

// $55EB3C: (8-bit) Item Unlock: Headdress of the Minotaur
//          
//          0x00 = Unowned
//          0x01 = Owned
function headdressofTheMinotaurItemOwned() => byte(0x55EB3C)

// $55EB3D: (8-bit) Item Unlock: Wheel of Gale - I
//          
//          0x00 = Unowned
//          0x01 = Owned
function wheelofGaleIItemOwned() => byte(0x55EB3D)

// $55EB3E: (8-bit) Item Unlock: Wheel of Gale - II
//          
//          0x00 = Unowned
//          0x01 = Owned
function wheelofGaleIIItemOwned() => byte(0x55EB3E)

// $55EB3F: (8-bit) Item Unlock: Wheel of Gale - III
//          
//          0x00 = Unowned
//          0x01 = Owned
function wheelofGaleIIIItemOwned() => byte(0x55EB3F)

// $55EB40: (8-bit) Item Unlock: Hilt of Reflection
//          
//          0x00 = Unowned
//          0x01 = Owned
function hitlReflectionItemOwned() => byte(0x55EB40)

// $55EB41: (8-bit) Item Unlock: Face of the Berserker
//          
//          0x00 = Unowned
//          0x01 = Owned
function faceBerserkerItemOwned() => byte(0x55EB41)

// $55EB42: (8-bit) Item Unlock: Skull of the Berserker
//          
//          0x00 = Unowned
//          0x01 = Owned
function skullBerserkerItemOwned() => byte(0x55EB42)

// $55EB43: (8-bit) Item Unlock: Eyes of the Berserker
//          
//          0x00 = Unowned
//          0x01 = Owned
function eyeofBerserkerItemOwned() => byte(0x55EB43)

// $55EB44: (8-bit) Item Unlock:  Power Shot
//          
//          0x00 = Unowned
//          0x01 = Owned
function powerShotItemOwned() => byte(0x55EB44)

// $55EB45: (8-bit) Item Unlock: Bounty Chest - I
//          
//          0x00 = Unowned
//          0x01 = Owned
function bountyChestIItemOwned() => byte(0x55EB45)

// $55EB46: (8-bit) Item Unlock: Bounty Chest - II
//          
//          0x00 = Unowned
//          0x01 = Owned
function bountyChestIIItemOwned() => byte(0x55EB46)

// $55EB6F: (8-bit) Item Unlock: Warrior's Code - Honor
//          
//          0x00 = Unowned
//          0x01 = Owned
function warriorsCodeHonorItemOwned() => byte(0x55EB6F)

// $55EB70: (16-bit Bitfield)Character Unlocks
//          
//          bit 0 = Devil King
//          bit 1 = Azure Dragon
//          bit 2 = Scorpio
//          bit 3 = Venus
//          bit 4 = Lady Butterfly
//          bit 5 = Red Minotaur
//          bit 6 = Frost
//          bit 7 = Talon
//          bit 8 = Hornet
//          bit 9 = Puff
//          bit 10= Q-Ball
//          bit 11 = Iron Ox
function characterUnlocksFirst() => word(0x005610e4)

CHARACTER_UNLOCK_FIRST_LOCATION = 0x005610e4
CHARACTER_UNLOCK_SECOND_LOCATION = 0x005610e5

function justUnlockedAllCharacters() => measured(bitcount(CHARACTER_UNLOCK_FIRST_LOCATION) +
                                       bitcount(CHARACTER_UNLOCK_SECOND_LOCATION) == 12) && 
                                       prev(bitcount(CHARACTER_UNLOCK_FIRST_LOCATION)) +
                                       prev(bitcount(CHARACTER_UNLOCK_SECOND_LOCATION)) == 11

// $55EB74: (8-bit) Stage Unlock
//          
//          Bit 0 = Ruse at River Glen (Red Minotaur
//          Bit 1 = Arctica Rebellion (Puff)
//          Bit 2 = Siege of Dark Spire (Orwik)
//          Bit 3 = Assault on Bloomdale (Frost)
//          Bit 4 = Flooding Giuthas Nam (Kahz)
//          Bit 5 = Leveling Kush(Zaan)
//          Bit 6 = Storm of the Great Plains (Irdene)
//          Bit 7 = Landing at Nanvia (Arslan)
function stageUnlockfirst() => byte(0x005610e8)

// $55EB75: (8-bit) Stage Unlock
//          
//          Bit 0 = Fall of the High Temple (Devil King)
//          Bit 1 = Chase at the Tablelands (Azure Dragon)
//          Bit 2 = Twisted High Temple (Reaper)
//          Bit 3 = Dead Wood Offensive (Red Minotaur)
//          Bit 4 = Ambush at Shadow Gorge (Muri)
//          Bit 5 = Divide & Conquer Faylinn (Lark)
//          Bit 6 = Pilgrimage to Cathedral City (Q-Ball)
//          Bit 7 = Crossing the River Styx (Reaper)
function stageUnlockSecond() => byte(0x005610e9)

// $55EB76: (8-bit) Stage Unlock
//          
//          Bit 0 = Border Control
//          Bit 1 = Battle at Riverglen(Frost)
function stageUnlockThird() => byte(0x005610ea)

STAGE_UNLOCK_FIRST_LOCATION = 0x005610e8
STAGE_UNLOCK_SECOND_LOCATION = 0x005610e9
STAGE_UNLOCK_THIRD_LOCATION = 0x005610ea
function justUnlockedAllStages() => measured(bitcount(STAGE_UNLOCK_FIRST_LOCATION) +
                                    bitcount(STAGE_UNLOCK_SECOND_LOCATION) +
                                    bitcount(STAGE_UNLOCK_THIRD_LOCATION) == 18) && 
                                    prev(bitcount(STAGE_UNLOCK_FIRST_LOCATION)) +
                                    prev(bitcount(STAGE_UNLOCK_SECOND_LOCATION)) +
                                    prev(bitcount(STAGE_UNLOCK_THIRD_LOCATION)) == 17

// $55EBDC: (35-bit bitfield) Music Unlocks
function musicUnlocks() => byte(0x55EBDC)

// $55EBE4: (28-bit bitfield) Movie Unlocks
//          
//          Not listing them all 0x01 = unlocked 0x00 = locked.
//          
//          Starts with Game Opening (always unlocked) and ends with Credits (Always unlocked?)
function movieUnlocks() => byte(0x00561158)

MOVIE_UNLOCK_FIRST_LOCATION = 0x00561158
MOVIE_UNLOCK_SECOND_LOCATION = 0x00561159
MOVIE_UNLOCK_THIRD_LOCATION = 0x0056115a
MOVIE_UNLOCK_FOURTH_LOCATION = 0x0056115b
function justUnlockedAllMovies() => measured(bitcount(MOVIE_UNLOCK_FIRST_LOCATION) +
                                    bitcount(MOVIE_UNLOCK_SECOND_LOCATION) +
                                    bitcount(MOVIE_UNLOCK_THIRD_LOCATION) +
                                    bitcount(MOVIE_UNLOCK_FOURTH_LOCATION) == 29) && 
                                    prev(bitcount(MOVIE_UNLOCK_FIRST_LOCATION)) +
                                    prev(bitcount(MOVIE_UNLOCK_SECOND_LOCATION)) +
                                    prev(bitcount(MOVIE_UNLOCK_THIRD_LOCATION)) +
                                    prev(bitcount(MOVIE_UNLOCK_FOURTH_LOCATION)) >= 27 && 
                                    prev(bitcount(MOVIE_UNLOCK_FIRST_LOCATION)) +
                                    prev(bitcount(MOVIE_UNLOCK_SECOND_LOCATION)) +
                                    prev(bitcount(MOVIE_UNLOCK_THIRD_LOCATION)) +
                                    prev(bitcount(MOVIE_UNLOCK_FOURTH_LOCATION)) < 29

// $55EFE4: (8-bit) Expected Lark In Game Level
function ingameFirstSaveFileLark() => byte(0x55EFE4)

FIRST_IN_GAME_SAVE_FILE_LOCATION = 0x55EFE4
function findInGameSaveLocation(index) => FIRST_IN_GAME_SAVE_FILE_LOCATION + index * CHARACTER_SAVE_SIZE

function findCharacterLevel(characterIndex) => byte(findInGameSaveLocation(characterIndex)) + 1

// $55F3FC: (8-bit) In game/Between levels  Scorpio level.  
function ingameThirdSaveFileScorpio() => byte(0x55F3FC)

// $55F41E: (8-bit) Scorpio's First Equipped Item
function inGameScorpioEquippedItem() => byte(0x55F41E)

// $55F608: (8-bit) Devil King's In-Game Level.
//          
//          Note this doesn't change when you change your character.  Choosing Azure Dragon leaves this value as the Devil King's
function inGamedevilKingInGameLevel() => byte(0x55F608)
DEVIL_KING_SAVE_LOCATION = 0x55F608


// $55F613: (Array of 6 8-bit) Weapon Level for each of the six weapons.
//          
//          0x00 = Not owend
//          0x01 = Level 1 and every level matches that.
function inGameWeaponlevelDevilKing() => byte(0x55F613)

DEVIL_KING_WEAPON_LEVEL_LOCATION = 0x55F613
WEAPON_LEVEL_OFFSET = DEVIL_KING_WEAPON_LEVEL_LOCATION - DEVIL_KING_SAVE_LOCATION
function justUnlockedAllWeapons(char_index) => measured(sum_of(range(0,5), 
                                                    index => byte(findInGameSaveLocation(char_index) + WEAPON_LEVEL_OFFSET + index) / byte(findInGameSaveLocation(char_index) + WEAPON_LEVEL_OFFSET + index)) == 6) &&
                                               any_of(range(0,5), 
                                                    index => prev(byte(findInGameSaveLocation(char_index) + WEAPON_LEVEL_OFFSET + index)) == 0)

function justReachedLevel90(char_index) => any_of(range(0,5), 
                                                    index => byte(findInGameSaveLocation(char_index) + WEAPON_LEVEL_OFFSET + index) >= 90 &&
                                                             prev(byte(findInGameSaveLocation(char_index) + WEAPON_LEVEL_OFFSET + index) <= 90)) 

// $55F626: (8-bit) In Game Devil King's First (Square) Special skill
//          
//          0xff = None
//          0x00 = Devil King's first  (Whiplash)
//          0x01 = Devil King's Second Skill (Thornbush)
function inGameDevilKingFirstSpecial() => byte(0x55F626)

DEVIL_KING_SPECIAL_FIRST_LOCATION = 0x55F626
SPECIAL_FIRST_OFFSET = DEVIL_KING_SPECIAL_FIRST_LOCATION - DEVIL_KING_SAVE_LOCATION


// $55F627: (8-bit) In Game Devil King's Second (Triangle) Special skill
//          
//          0xff = None
//          0x00 = Devil King's first  (Whiplash)
//          0x01 = Devil King's Second Skill (Thornbush)
function inGameDevilKingSecondSpecialSkill() => byte(0x55F627)

// $55F628: (8-bit) In Game, Devil King's Current Equipped Weapon Index
function inGameDevilKingWeaponIndex() => byte(0x55F628)

// $55F629: (8-bit) In Game, Devil King's Current Equipped Weapon Level.
function inGameDevilKingCurrentWeaponLevel() => byte(0x55F629)

// $55F62A: (8-bit) Devil King's First Equipped Item
//          
//          0xff = None
//          0x00 = Health Ring and then increments from there.
function inGameDevilKingFirstEquippedItem() => byte(0x55F62A)

DEVIL_KING_FIRST_ITEM_LOCATION = 0x55F62A
ITEM_FIRST_OFFSET = DEVIL_KING_FIRST_ITEM_LOCATION - DEVIL_KING_SAVE_LOCATION

function itemEquipped(char_index, item_index) => byte(findInGameSaveLocation(char_index) + ITEM_FIRST_OFFSET) == item_index ||
                                                 byte(findInGameSaveLocation(char_index) + ITEM_FIRST_OFFSET + 1) == item_index ||
                                                 byte(findInGameSaveLocation(char_index) + ITEM_FIRST_OFFSET + 2) == item_index            

// $55F62B: (8-bit) Devil King's Second Equipped Item
//          
//          0xff = None
//          0x00 = Health Ring and then increments from there.
function inGameDevilKingSecondEquippedItem() => byte(0x55F62B)

// $55F62C: (8-bit) Devil King's Third Equipped Item
//          
//          0xff = None
//          0x00 = Health Ring and then increments from there.
function inGameDevilKingThirdEquippedItem() => byte(0x55F62C)

// $563B3A: (8-bit) Level ID for current stage
//          
//          0x00 = Ruse at Riverglen
//          0x01 = Arctic Rebellion
//          0x02 = Siege of Dark Spire
//          0x03 = Assault on Bloomdale
//          0x04 = Flooding Giuthas Nam
//          0x05 = Leveling Kush
//          0x06 = Storm of the Great Plain
//          0x07 = Landing at Nanvia
//          0x08 = Fall of the High Temple
//          0x09 = Chase at the Tablelands
//          0x0a = Twisted High Temple
//          0x0b = Deadwood Counteroffensive
//          0x0c = Ambush at Shadow Gorge
//          0x0d = Divide and Conquer Faylinn\
//          0x0e = Pilgrimage to Cathedral City
//          0x0f = Crossing the River Styx
//          0x10 = Border Patrol
//          0x11 = Battle at Riverglen
function levelID() => byte(0x563B3A)

RUSE_AT_RIVERGLEN_ID = 0x00
ARCTIC_REBELLION_ID = 0x01
SIEGE_OF_DARK_SPIRE_ID = 0x02
ASSAULT_ON_BLOOMDALE_ID = 0x03
FLOODING_GIUTHAS_NAM_ID = 0x04
LEVELING_KUSH_ID = 0x05
STORM_OF_THE_GREAT_PLAIN_ID = 0x06
LANDING_AT_NANVIA_ID = 0x07
FALL_OF_THE_HIGH_TEMPLE_ID = 0x08
CHASE_AT_THE_TABLELANDS_ID = 0x09
TWISTED_HIGH_TEMPLE_ID = 0x0A
DEADWOOD_COUNTEROFFENSIVE_ID = 0x0B
AMBUSH_AT_SHADOW_GORGE_ID = 0x0C
DIVIDE_AND_CONQUER_FAYLINN_ID = 0x0D
PILGRIMAGE_TO_CATHEDRAL_CITY_ID = 0x0E
CROSSING_THE_RIVER_STYX_ID = 0x0F
BORDER_PATROL_ID = 0x10
BATTLE_AT_RIVERGLEN_ID = 0x11

StageNameLookup = {
    RUSE_AT_RIVERGLEN_ID: "Ruse at Riverglen",
    ARCTIC_REBELLION_ID: "Arctic Rebellion",
    SIEGE_OF_DARK_SPIRE_ID: "Siege of Dark Spire",
    ASSAULT_ON_BLOOMDALE_ID: "Assault on Bloomdale",
    FLOODING_GIUTHAS_NAM_ID: "Flooding Giuthas Nam",
    LEVELING_KUSH_ID: "Leveling Kush",
    STORM_OF_THE_GREAT_PLAIN_ID: "Storm of the Great Plain",
    LANDING_AT_NANVIA_ID: "Landing at Nanvia",
    FALL_OF_THE_HIGH_TEMPLE_ID: "Fall of the High Temple",
    CHASE_AT_THE_TABLELANDS_ID: "Chase at the Tablelands",
    TWISTED_HIGH_TEMPLE_ID: "Twisted High Temple",
    DEADWOOD_COUNTEROFFENSIVE_ID: "Deadwood Counteroffensive",
    AMBUSH_AT_SHADOW_GORGE_ID: "Ambush at Shadow Gorge",
    DIVIDE_AND_CONQUER_FAYLINN_ID: "Divide and Conquer Faylinn",
    PILGRIMAGE_TO_CATHEDRAL_CITY_ID: "Pilgrimage to Cathedral City",
    CROSSING_THE_RIVER_STYX_ID: "Crossing the River Styx",
    BORDER_PATROL_ID: "Border Patrol",
    BATTLE_AT_RIVERGLEN_ID: "Battle at Riverglen"
}


// $563C54: (8-bit) Screen states.
//          
//          Appears to be progression.
//          
//          0x00 = System start up
//          0x03 = Capcom logo
//          0x04 = Press start screen and main menu, demo mode.
//          0x05 = Character select Screen
//          0x06 = Road to Conquest (map screen)
//          0x07 = Prepare Screen
//          0x08 = In Game
//          0x09 = Spoils of War  and Battle Results
//          0x0a = Total Conquest screen Total Conquest Results)  Post Conquest Mode movie  Credits
//          0x0c = Load/save screen on boot up or post game/ Post Conquest.
function screenState() => byte(0x563C54)

CAPCOM_LOGO_SCREEN_STATE = 0x03
PRESS_START_SCREEN_STATE = 0x04
CHARACTER_SELECT_SCREEN_STATE = 0x05
MAP_SCREEN_STATE = 0x06
PREPARE_SCREEN_STATE = 0x07
IN_GAME_STATE = 0x08
SPOIL_OF_WAR_STATE = 0x09
TOTAL_CONQUEST_SCREEN_STATE = 0x0A
LOAD_SAVE_SCREEN_STATE = 0x0C

function isInGame() => screenState() == IN_GAME_STATE || screenState() == SPOIL_OF_WAR_STATE
function justReachedTotalConquestScreen() => screenState() == TOTAL_CONQUEST_SCREEN_STATE && prev(screenState()) == SPOIL_OF_WAR_STATE

function beforePressStartScreen() => screenState() <= PRESS_START_SCREEN_STATE
function inDemoScreenState() => screenState() == PRESS_START_SCREEN_STATE
function inCharacterSelectScreen() => screenState() == CHARACTER_SELECT_SCREEN_STATE
function inMapScreen() => screenState() == MAP_SCREEN_STATE
function isInGameScreen() => screenState() == IN_GAME_STATE
function inPrepareScreen() => screenState() == PREPARE_SCREEN_STATE
function inSpoilsOfWarScreen() => screenState() == SPOIL_OF_WAR_STATE
function inTotalConquestScreen() => screenState() == TOTAL_CONQUEST_SCREEN_STATE
function inLoadSaveScreen() => screenState() == LOAD_SAVE_SCREEN_STATE

function startedMission() => isInGameScreen() && prev(screenState()) == PREPARE_SCREEN_STATE

function saveProtection() => screenState() < LOAD_SAVE_SCREEN_STATE && 
                             screenState() >= IN_GAME_STATE

function saveProtectionWithPrepare() => screenState() >= PREPARE_SCREEN_STATE

                             
// The win bit is sticky.  Don't use that, instead use this. 
function didPlayerJustWin() => inSpoilsOfWarScreen() && prev(isInGameScreen())

// $563C74: (8-bit) Current player.
//          
//          0x00 = Lark
//          0x01 = Azure Dragon
//          0x02 = Scorpio
//          0x03 = Devil King
//          0x04 = Lady Butterfly
//          0x05 = Red Minotaur
//          0x06 = Frost
//          0x07 = Horne
//          0x08 = Puff
//          0x09 = Talon
//          0x0b = Q-Ball
//          0x0d = Iron OX
//          
//          
//          Note some more characters exist but they aren't real characters.  ZAAN works but turns the menus Japanese?
//          0x0a = Reaper
//          0x0c = Zaan
//          0x0e = Bramblet
//          0x0f = Venus
//          0x10 Reports Orwik, but crashes.
function currentPlayerId() => byte(0x563C74)

LARK_ID = 0x00
AZURE_DRAGON_ID = 0x01
SCORPIO_ID = 0x02
DEVIL_KING_ID = 0x03
LADY_BUTTERFLY_ID = 0x04
RED_MINOTAUR_ID = 0x05
FROST_ID = 0x06
HORNET_ID = 0x07
PUFF_ID = 0x08
TALON_ID = 0x09
Q_BALL_ID = 0x0B
IRON_OX_ID = 0x0D
REAPER_ID = 0x0A // Unused
ZAAN_ID = 0x0C // Unused
BRAMBLE_ID = 0x0E // Unused
VENUS_ID = 0x0F  // Actually used! 

PlayerNameLookup = {
    LARK_ID: "Lark",
    AZURE_DRAGON_ID: "Azure Dragon",
    SCORPIO_ID: "Scorpio",
    DEVIL_KING_ID: "Devil King",
    LADY_BUTTERFLY_ID: "Lady Butterfly",
    RED_MINOTAUR_ID: "Red Minotaur",
    FROST_ID: "Frost",
    HORNET_ID: "Hornet",
    PUFF_ID: "Puff",
    TALON_ID: "Talon",
    Q_BALL_ID: "Q-Ball",
    IRON_OX_ID: "Iron Ox",
    REAPER_ID: "Reaper",
    ZAAN_ID: "Zaan",
    BRAMBLE_ID: "Bramble",
    VENUS_ID: "Venus"
}


// $563CDC: (8-bit) Mode ID
//
//          0x00 = Conquest
//          0x01 = Free Mode
//          0x02 = Demo
//          0x03 = Gallery
//          0x04 = Options
function modeId() => byte(0x563CDC)
CONQUEST_MODE_ID = 0x00
FREE_MODE_ID = 0x01
DEMO_MODE_ID = 0x02
GALLERY_MODE_ID = 0x03
OPTIONS_MODE_ID = 0x04

function ConquestOrFreeMode() => (modeId() == CONQUEST_MODE_ID || 
                                  modeId() == FREE_MODE_ID) && 
                                 saveProtection()  // adding SaveProtection here because everything uses this, and rather than have to check it everywhere, just do it here.
function ConquestOrFreeModeAllowPrepare() => (modeId() == CONQUEST_MODE_ID ||   // The Cineophile can occur on the prepare Screen state? 
                                  modeId() == FREE_MODE_ID) && 
                                 (saveProtectionWithPrepare()) // adding SaveProtection here because everything uses this, and rather than have to check it everywhere, just do it here.
function ConquestMode() => modeId() == CONQUEST_MODE_ID  && 
                           saveProtection() // same.
function ConquestModeForCharacterUnlock() => modeId() == CONQUEST_MODE_ID &&  // Need to change the save protection on this one achievement.  Don't use this function. 
                            screenState() == LOAD_SAVE_SCREEN_STATE && 
                            prior(screenState()) == TOTAL_CONQUEST_SCREEN_STATE
function DemoMode() => modeId() == DEMO_MODE_ID
function GalleryMode() => modeId() == GALLERY_MODE_ID
function OptionsMode() => modeId() == OPTIONS_MODE_ID

// $17C844C: (32-bit) Player's Health
//           
//           Can't be larger than 0x017c8454
//           
//           0x00000000 = Dead
function playerHealth() => dword(0x17C844C)

function PlayerGainedHealth() => playerHealth() > prev(playerHealth())

// $17C93A4: (32-bit) Total Hit Counter  (Combo)
//           
//           This is the true value.
function totalHitCounter() => dword(0x17C93A4)

// $17C93B8: (32-bit) Total Kill Counter  (Combo) 
//
//           This is the true value.
function totalKillCounter() => dword(0x17C93B8)
function totalKillPostGame() => dword(0x00601d48)

// $17C93E4: (32-bit)  Fury Drive Level (Musou Level)
//           
//           Likely when you reach 0x017c93ec you can trigger your musou.
function furyDriveLevel() => dword(0x17C93E4)

// $17C93F4 (8-bit) Fury Levels
// 
//          These are additional fury levels that will store a Fury Drive in addition to the Fury Drive Gauge.
function furyDriveStoredLevel() => byte(0x17C93F4)

// If the stored level goes up, it's ok if the Fury drive drops. 
function usedMusou() => prev(furyDriveStoredLevel()) < furyDriveStoredLevel()  ||
                        (   prev(furyDriveStoredLevel()) >= furyDriveStoredLevel()  &&
                            furyDriveLevel() < prev(furyDriveLevel()))

// $17C9444: (32-bit) Frames spent in the current level
//           
//           60 fps
function framesInLevel() => dword(0x017C9444)

function framesPostLevel() => dword(0x563bfc)

// $1D94678: (8-bit) Guard Durability in Border control
//           
//           0x00 = Death.
//           0x64 (100) = Max
function guardDurabilityBorderControl() => byte(0x1D94678)

function perfectGuardDurability() => guardDurabilityBorderControl() == 0x64

// $1DA8C95: (8-bit) Red Minotaur's Cavalry Ally Strength
//           
//           This is for the mini game for the Red Minotaur's Cavalry in the charge.
function calvalryStrengthRedMinotaur() => byte(0x1DA8C95)

function perfectCalvaryStrength() => calvalryStrengthRedMinotaur() == 0x64

// $1DCC094: (8-bit) Special Bonus for each level.
//           
//           After certain levels if this is 0x01  It means you get a bonus (5k)   If it's 0 it means you missed it.
//           Use 32-bit because it's better to look at all four vaaues.
//           
//           0X00 = Not earned.
//           0x01 = Earned.
//           
//           NOTE: NOT ALL LEVELS HAVE A SPECIAL
//           
//           
//           
//           Ruse at Riverglen = Killed all of the Messengers
//           Arctic Rebellion = N/A
//           Siege of Dark Spire = Blew the Gate Up
//           Assault on Bloomdale = N/A
//           Flooding Giuthas Nam = N/A
//           Leveling Kush = Lured out Zaan (killed 16 guards?)
//           Storm of the Great Plain = Defeated Iron Ox
//           Landing at Nanvia = Kill Gun Captain
//           Fall of the High Temple = Defeated All of the Guard Captains
//           Chase at the Tablelands = Defeated Azure Dragon before he Reached His stronghold
//           Twisted High Temple = Defeated all of the Guard Captains
//           Deadwood Counteroffensive = Defeated Scorpio and Talon
//           Ambush at Shadow Gorge = N/A
//           Divide and Conquer Faylinn = Prevented Lark and Bramble from Joining Forces
//           Pilgrimage to Cathedral City = N/A
//           Crossing the River Styx = Prevented Reaper from forming his line at Devil's Point
//           Border Patrol = Defeated All of the Guard Captains
//           Battle at Riverglen = Defeated Venus
//           
//           
//           Not all levels have special bonuses.  Ambush ant Shadow Gorge doesn't
function specialBonusforLevel() => byte(0x1DCC094)
SPECIAL_BONUS_TRIGGERED = 0x01
SPECIAL_BONUS_NOT_TRIGGERED = 0x00

function JustEarnedSpecialBonus() => specialBonusforLevel() == SPECIAL_BONUS_TRIGGERED && prev(specialBonusforLevel()) != SPECIAL_BONUS_NOT_TRIGGERED


CHARACTER_SPECIFIC_ITEMS = 
[
    {
        ACHIEVEMENT_NAME: "Better than a Gun",
        ACHIEVEMENT_DESCRIPTION: "Beat a stage with Devil King using the Grenade Launcher",
        ITEM_ID: POWER_SHOT_ITEM_ID,
        CHARACTER_ID: DEVIL_KING_ID
    },
    {
        ACHIEVEMENT_NAME: "Better with Friends",
        ACHIEVEMENT_DESCRIPTION: "Beat a stage with Scorpio wearing the Headdress of the Minotaur",
        ITEM_ID: HEADDRESS_OF_THE_MINOTAUR_ITEM_ID,
        CHARACTER_ID: SCORPIO_ID
    },
    {
        ACHIEVEMENT_NAME: "Stop! No Hammer Time",
        ACHIEVEMENT_DESCRIPTION: "Beat a stage with Puff using the Hammer Displacer",
        ITEM_ID: HAMMER_DISPLACER_ITEM_ID,
        CHARACTER_ID: PUFF_ID
    },
    {
        ACHIEVEMENT_NAME: "Scientific Ox",
        ACHIEVEMENT_DESCRIPTION: "Beat a stage with Iron Ox using the Plasma Generator",
        ITEM_ID: PLASMA_GENERATOR_ITEM_ID,
        CHARACTER_ID: IRON_OX_ID
    }
]



TRIO_ITEM_ACHIEVEMENTS = 
[
    { 
        ACHIEVEMENT_NAME: "Knowledge",
        ACHIEVEMENT_DESCRIPTION: "Beat a level with Bronze, Silver, and Gold Award equipped",
        FIRST_ITEM:BRONZE_AWARD_ITEM_ID,
        SECOND_ITEM: SILVER_AWARD_ITEM_ID,
        THIRD_ITEM: GOLD_AWARD_ITEM_ID
    },
    {
        ACHIEVEMENT_NAME: "Like the Wind",
        ACHIEVEMENT_DESCRIPTION: "Beat a level with Wheel of Gale I, II, and III equipped",
        FIRST_ITEM: WHEEL_OF_GALE_I_ITEM_ID,
        SECOND_ITEM: WHEEL_OF_GALE_II_ITEM_ID,
        THIRD_ITEM: WHEEL_OF_GALE_III_ITEM_ID,
    },
    {
        ACHIEVEMENT_NAME: "The Berserker",
        ACHIEVEMENT_DESCRIPTION: "Beat a level with Face of the Berserker, Skull of the Berserker, and Eyes of the Berserker equipped",
        FIRST_ITEM: FACE_OF_THE_BERSERKER_ITEM_ID,
        SECOND_ITEM: SKULL_OF_THE_BERSERKER_ITEM_ID,
        THIRD_ITEM: EYES_OF_THE_BERSERKER_ITEM_ID,
    },
    {
        ACHIEVEMENT_NAME: "Dangerous Chests",
        ACHIEVEMENT_DESCRIPTION: "Beat a level with Bounty Chest I, II, and III equipped",
        FIRST_ITEM: BOUNTY_CHEST_I_ITEM_ID,
        SECOND_ITEM: BOUNTY_CHEST_II_ITEM_ID,
        THIRD_ITEM: BOUNTY_CHEST_III_ITEM_ID,
    },
    {
        ACHIEVEMENT_NAME: "Doth Thou Desire the Power?",
        ACHIEVEMENT_DESCRIPTION: "Beat a level with Red Mask of Demoness, Blue Mask of Demoness, and White Mask of Demoness equipped",
        FIRST_ITEM: RED_MASK_OF_DEMONESS_ITEM_ID,
        SECOND_ITEM: BLUE_MASK_OF_DEMONESS_ITEM_ID,
        THIRD_ITEM: WHITE_MASK_OF_DEMONESS_ITEM_ID,
    },
    {
        ACHIEVEMENT_NAME: "The Cursed Ones",
        ACHIEVEMENT_DESCRIPTION: "Beat a level with Cursed Mask, Cursed Jacket, and Cursed Cloak equipped",
        FIRST_ITEM: CURSED_MASK_ITEM_ID,
        SECOND_ITEM: CURSED_JACKET_ITEM_ID,
        THIRD_ITEM: CURSED_CLOAK_ITEM_ID,
    },
    {
        ACHIEVEMENT_NAME: "I Learned Not to Play the Lotto",
        ACHIEVEMENT_DESCRIPTION: "Beat a level with Top Lottery Ticket, Middle Lottery Ticket, and Bottom Lottery Ticket equipped",
        FIRST_ITEM: TOP_LOTTERY_TICKET_FRAGMENT_ITEM_ID,
        SECOND_ITEM: MIDDLE_LOTTERY_TICKET_FRAGMENT_ITEM_ID,
        THIRD_ITEM: BOTTOM_LOTTERY_TICKET_FRAGMENT_ITEM_ID,
    },
    {
        ACHIEVEMENT_NAME: "The Cursed Dolls",
        ACHIEVEMENT_DESCRIPTION: "Beat a level with Cursed King Doll, Cursed Princess Doll, and Cursed Minstrel Doll equipped",
        FIRST_ITEM: CURSED_KING_DOLL_ITEM_ID,
        SECOND_ITEM: CURSED_PRINCESS_DOLL_ITEM_ID,
        THIRD_ITEM: CURSED_MINSTREL_DOLL_ITEM_ID,
    },
    {
        ACHIEVEMENT_NAME: "The Tainted Figure",
        ACHIEVEMENT_DESCRIPTION: "Beat a level with Tainted Figurine Head, Tainted Figurine Torso, and Tainted Figurine Legs equipped",
        FIRST_ITEM: TAINTED_FIGURINE_HEAD_ITEM_ID,
        SECOND_ITEM: TAINTED_FIGURINE_TORSO_ITEM_ID,
        THIRD_ITEM: TAINTED_FIGURINE_LEGS_ITEM_ID,
    },
    {
        ACHIEVEMENT_NAME: "The Gambler",
        ACHIEVEMENT_DESCRIPTION: "Beat a level with Die of Fortune I, II, and III equipped",
        FIRST_ITEM: DIE_OF_FORTUNE_I_ITEM_ID,
        SECOND_ITEM: DIE_OF_FORTUNE_II_ITEM_ID,
        THIRD_ITEM: DIE_OF_FORTUNE_III_ITEM_ID,
    },
    {
        ACHIEVEMENT_NAME: "Safety Net",
        ACHIEVEMENT_DESCRIPTION: "Beat a level with Book of Immortality I, II, and III equipped",
        FIRST_ITEM: BOOK_OF_IMMORTALITY_I_ITEM_ID,
        SECOND_ITEM: BOOK_OF_IMMORTALITY_II_ITEM_ID,
        THIRD_ITEM: BOOK_OF_IMMORTALITY_III_ITEM_ID,
    },
    {
        ACHIEVEMENT_NAME: "Bushido",
        ACHIEVEMENT_DESCRIPTION: "Beat a level with Warrior's Code - Honor, Valor, and Loyalty equipped",
        FIRST_ITEM: WARRIORS_CODE_HONOR_ITEM_ID,
        SECOND_ITEM: WARRIORS_CODE_VALOR_ITEM_ID,
        THIRD_ITEM: WARRIORS_CODE_LOYALTY_ITEM_ID,
    }
]

function justWonABattle() => prev(isInGameScreen()) &&
                             didPlayerJustWin() &&
                             ConquestOrFreeMode()  // shouldn't be needed, as screen state should be enough.

function justWonABattle_trigger() => prev(isInGameScreen()) &&
                             trigger_when(didPlayerJustWin()) &&
                             ConquestOrFreeMode()  // shouldn't be needed, as screen state should be enough.

function justWonASpecificBattle(stageIndex) => levelID() == stageIndex &&
                                     justWonABattle()


function justWonASpecificBattle_trigger(stageIndex) => justWonABattle_trigger() &&
                                     levelID() == stageIndex

function justWonASpecificBattleAndDifficulty(stageIndex, difficultyIndex) => difficultySetting() == difficultyIndex &&
                                                                             justWonASpecificBattle(stageIndex)

function justWonASpecificBattleAndDifficulty_trigger(stageIndex, difficultyIndex) => difficultySetting() == difficultyIndex &&
                                                                                     justWonASpecificBattle_trigger(stageIndex)

achievement( title = "The First Victory",
             description = "Win a stage, any stage.",
             points = 2,
             type = "Progression",
             trigger = justWonABattle()
)

function achievementForConquestMode(name, characterId, isHardMode)
{
    ExtraTrigger = always_true()
    if( isHardMode )
    {
        ExtraTrigger = difficultySetting() == HARD_DIFFICULTY_ID
    }
    
    description = format("Complete Conquest Mode with {0}", PlayerNameLookup[characterId])
    if( isHardMode )
    {
        description = format("Complete Conquest Mode with {0} on Hard difficulty", PlayerNameLookup[characterId])
    }

    points = 10
    if( isHardMode) 
    {
        points = 25 
    }

    type_string = "Win_condition"
    if ( isHardMode )
    {
        type_string = ""
    }

    achievement( title = name,
                 description = description,
                 type = type_string,
                 points = points,
                 trigger = justReachedTotalConquestScreen() && 
                           ConquestMode() &&
                           ExtraTrigger &&
                           currentPlayerId() == characterId
                           
    )
}

correctOrderOfCharacter = 
[
    DEVIL_KING_ID,
    AZURE_DRAGON_ID,
    SCORPIO_ID,
    VENUS_ID,
    LADY_BUTTERFLY_ID,
    RED_MINOTAUR_ID,
    FROST_ID,
    TALON_ID,
    HORNET_ID,
    PUFF_ID,
    Q_BALL_ID,
    IRON_OX_ID

]

CharacterAchievementData =
{
    AZURE_DRAGON_ID: {
        CONQUEST_TITLE: "Care for a Date?",
        HARD_CONQUEST_TITLE: "A Date with a King",
        LEVEL_FIVE_TITLE: "One-Eyed Dragon of Oshu",
        LEVEL_TEN_TITLE: "Masamune Date",
        WEAPON_ACHIEVEMENT_TITLE: "Six Dragon Blades",
    },
    SCORPIO_ID: {
        CONQUEST_TITLE: "Where's Sub-Zero?",
        HARD_CONQUEST_TITLE: "Scorpio King",
        LEVEL_FIVE_TITLE: "Crimson Demon of War",
        LEVEL_TEN_TITLE: "Yukimura Sanada",
        WEAPON_ACHIEVEMENT_TITLE: "Six Legendary Spears",
    },
    DEVIL_KING_ID: {
        CONQUEST_TITLE: "The Devil You Know",
        HARD_CONQUEST_TITLE: "The Great Unifier",
        LEVEL_FIVE_TITLE: "Demon Daimyo",
        LEVEL_TEN_TITLE: "Nobunaga Oda",
        WEAPON_ACHIEVEMENT_TITLE: "Six Dark Blades",
    },
    LADY_BUTTERFLY_ID: {
        CONQUEST_TITLE: "For the Love of the Lord",
        HARD_CONQUEST_TITLE: "Madame Butterfly",
        LEVEL_FIVE_TITLE: "Lady No",
        LEVEL_TEN_TITLE: "Nohime",
        WEAPON_ACHIEVEMENT_TITLE: "Twelve Pistols"
    },
    RED_MINOTAUR_ID: {
        CONQUEST_TITLE: "The Great Strategist",
        HARD_CONQUEST_TITLE: "Come to the Labyrinth",
        LEVEL_FIVE_TITLE: "Tiger of Kai",
        LEVEL_TEN_TITLE: "Shingen Takeda",
        WEAPON_ACHIEVEMENT_TITLE: "Six Giant Axes"
    },
    FROST_ID: {
        CONQUEST_TITLE: "The Frozen Heart",
        HARD_CONQUEST_TITLE: "Master of the Wheel",
        LEVEL_FIVE_TITLE: "Dragon of Echigo",
        LEVEL_TEN_TITLE: "Kenshin Uesugi",
        WEAPON_ACHIEVEMENT_TITLE: "Six Frozen Blades",
    },
    HORNET_ID: {
        CONQUEST_TITLE: "The Hornet's Sting",
        HARD_CONQUEST_TITLE: "The Boy King",
        LEVEL_FIVE_TITLE: "Ranboushi",
        LEVEL_TEN_TITLE: "Ranmaru Mori",
        WEAPON_ACHIEVEMENT_TITLE: "Six Longbows",
    },
    PUFF_ID: {
        CONQUEST_TITLE: "Would you like a Puff-Puff?",
        HARD_CONQUEST_TITLE: "Puff Puff Pass",
        LEVEL_FIVE_TITLE: "Hammer of the East",
        LEVEL_TEN_TITLE: "Itsuki",
        WEAPON_ACHIEVEMENT_TITLE: "Six Giant Hammers",
    },
    TALON_ID: {
        CONQUEST_TITLE: "I am the Wind",
        HARD_CONQUEST_TITLE: "Master Ninja",
        LEVEL_FIVE_TITLE: "Monkey Jump",
        LEVEL_TEN_TITLE: "Sasuke Sarutobi",
        WEAPON_ACHIEVEMENT_TITLE: "Six Windy Shurikens",
    },
    Q_BALL_ID: {
        CONQUEST_TITLE: "Mech Warrior",
        HARD_CONQUEST_TITLE: "Bazooka Joe",
        LEVEL_FIVE_TITLE: "The Monk Missionary",
        LEVEL_TEN_TITLE: "Xavi",
        WEAPON_ACHIEVEMENT_TITLE: "Twelve Bazookas",
    },
    IRON_OX_ID: {
        CONQUEST_TITLE: "Hondam",
        HARD_CONQUEST_TITLE: "The Iron King",
        LEVEL_FIVE_TITLE: "Honda Heihachiro",
        LEVEL_TEN_TITLE: "Tadakatsu Honda",
        WEAPON_ACHIEVEMENT_TITLE: "Six Great Spears",
    },
    VENUS_ID: {
        CONQUEST_TITLE: "The Lady of the Rafters",
        HARD_CONQUEST_TITLE: "The Deadly Beauty",
        LEVEL_FIVE_TITLE: "Kunoichi",
        LEVEL_TEN_TITLE: "Kasuga",
        WEAPON_ACHIEVEMENT_TITLE: "Six Ring Shurikens",
    }
}

for key in correctOrderOfCharacter
{
    achievementForConquestMode(CharacterAchievementData[key][CONQUEST_TITLE], key, false)
}

for key in correctOrderOfCharacter
{
    achievementForConquestMode(CharacterAchievementData[key][HARD_CONQUEST_TITLE], key, true)
}

for key in correctOrderOfCharacter
{
   achievement( title = CharacterAchievementData[key][LEVEL_FIVE_TITLE],
                 description = format("Level {0} to level 5", PlayerNameLookup[key]),
                 points = 5,
                 trigger = ConquestOrFreeMode() &&
                           prev(findCharacterLevel(key)) < 5 &&
                           findCharacterLevel(key) >= 5 &&
                           inSpoilsOfWarScreen()

    )
   achievement( title = CharacterAchievementData[key][LEVEL_TEN_TITLE],
                 description = format("Level {0} to level 10", PlayerNameLookup[key]),
                 points = 10,
                 trigger = ConquestOrFreeMode() &&
                           prev(findCharacterLevel(key)) < 10 &&
                           findCharacterLevel(key) >= 10 &&
                           inSpoilsOfWarScreen()

    )
}  

achievement( title = "The Highest of the High",
                description = format("Level any character to level 20"),
                points = 25,
                trigger = ConquestOrFreeMode() &&
                        prev(findCharacterLevel(currentPlayerId())) < 20 &&
                        findCharacterLevel(currentPlayerId()) == 20
)


for key in correctOrderOfCharacter
{
   achievement( title = CharacterAchievementData[key][WEAPON_ACHIEVEMENT_TITLE],
                 description = format("Earn all six weapons for {0}", PlayerNameLookup[key]),
                 points = 25,
                 trigger = ConquestOrFreeMode() &&
                           justUnlockedAllWeapons(key)
    )
}

achievement( title = "A Legendary Weapon",
             description = "Get a weapon to level 90 or higher",
             points = 10,
             trigger = ConquestOrFreeMode() &&
                       justReachedLevel90(currentPlayerId())
)


achievement( title = "The Real Treasure is the Friends We Made Along the Way",
             description = "Unlock all of the characters",
             points = 10,
             trigger = justUnlockedAllCharacters() && 
                       ConquestModeForCharacterUnlock()
)

achievement( title = "The Beginning of a Collection",
             description = "Loot 20 of the equippable items",
             points = 5,
             trigger = unlockedSpecificNumberOfItems(20) && 
                       ConquestOrFreeMode()
)

achievement( title = "A Major Collection",
             description = "Loot 40 of the equippable items",
             points = 10,
             trigger = unlockedSpecificNumberOfItems(40) && 
                       ConquestOrFreeMode()
)

achievement( title = "A World-Class Collection",
             description = "Loot 60 of the equippable items",
             points = 10,
             trigger = unlockedSpecificNumberOfItems(60) && 
                       ConquestOrFreeMode()
)


achievement( title = "Look At All My Treasures",
             description = "Loot all of the equippable items",
             points = 25,
             trigger = unlockedSpecificNumberOfItems(80) && 
                       ConquestOrFreeMode()
)

achievement( title = "Improved Gear",
             description = "Get the Spartan Brace, Armor, Energy Bead, and Health Ring to level 90",
             points = 10,
             trigger = ConquestOrFreeMode() &&
                       measured(sum_of(range(SPARTAN_BRACE_ITEM_ID,HEALTH_RING_ITEM_ID), 
                                        index => byte(FIRST_ITEM_LOCATION + index) / 90) == 4) &&
                                sum_of(range(SPARTAN_BRACE_ITEM_ID,HEALTH_RING_ITEM_ID), 
                                        index => prev(byte(FIRST_ITEM_LOCATION + index) / 90) ) < 4
)

achievement( title = "World Traveler", 
             description = "Unlock all of the stages for Free Mode",
             type = "Progression",
             points = 5,
             trigger = ConquestOrFreeMode() &&
                       justUnlockedAllStages()
)   

achievement( title = "The True Devil King",
             description = "Defeat the Devil King as the Devil King",
             points = 10,
             trigger = ConquestOrFreeMode() &&
                       justWonASpecificBattle_trigger(FALL_OF_THE_HIGH_TEMPLE_ID) &&
                       currentPlayerId() == DEVIL_KING_ID
)

for dict in TRIO_ITEM_ACHIEVEMENTS
{
    achievement( title = dict[ACHIEVEMENT_NAME],
                 description = dict[ACHIEVEMENT_DESCRIPTION],
                 points = 10,
                 trigger = ConquestOrFreeMode() &&
                           justWonABattle_trigger() &&
                           itemEquipped(currentPlayerId(), dict[FIRST_ITEM]) &&
                           itemEquipped(currentPlayerId(), dict[SECOND_ITEM]) &&
                           itemEquipped(currentPlayerId(), dict[THIRD_ITEM])
    )
}

STAGE_ACHIEVEMENTS =
// Border Patrol can't be time attacked. 
{
    RUSE_AT_RIVERGLEN_ID : {
                TIME_RUN_ACHIEVEMENT_NAME: "Ruse Speed Run",
                HARD_TIME_RUN_ACHIEVEMENT_NAME: "Ruse Ultra Speed Run",
    },
    ARCTIC_REBELLION_ID : {
                TIME_RUN_ACHIEVEMENT_NAME: "Freezing Speed Run",
                HARD_TIME_RUN_ACHIEVEMENT_NAME: "Freezing Ultra Speed Run",
    },
    SIEGE_OF_DARK_SPIRE_ID : {
                TIME_RUN_ACHIEVEMENT_NAME: "Sieging Speed Run",
                HARD_TIME_RUN_ACHIEVEMENT_NAME: "Sieging Ultra Speed Run",
    },
    ASSAULT_ON_BLOOMDALE_ID : {
                TIME_RUN_ACHIEVEMENT_NAME: "Blooming Speed Run",
                HARD_TIME_RUN_ACHIEVEMENT_NAME: "Blooming Ultra Speed Run",
    },
    FLOODING_GIUTHAS_NAM_ID : {
                TIME_RUN_ACHIEVEMENT_NAME: "Flooding Speed Run",
                HARD_TIME_RUN_ACHIEVEMENT_NAME: "Flooding Ultra Speed Run",
    },
    LEVELING_KUSH_ID : {
                TIME_RUN_ACHIEVEMENT_NAME: "Leveling Speed Run",
                HARD_TIME_RUN_ACHIEVEMENT_NAME: "Leveling Ultra Speed Run",
    },
    STORM_OF_THE_GREAT_PLAIN_ID : {
                TIME_RUN_ACHIEVEMENT_NAME: "Storming Speed Run",
                HARD_TIME_RUN_ACHIEVEMENT_NAME: "Storming Ultra Speed Run",
    },
    LANDING_AT_NANVIA_ID : {
                TIME_RUN_ACHIEVEMENT_NAME: "Landing Speed Run",
                HARD_TIME_RUN_ACHIEVEMENT_NAME: "Landing Ultra Speed Run",
    },
    FALL_OF_THE_HIGH_TEMPLE_ID : {
                TIME_RUN_ACHIEVEMENT_NAME: "Falling Speed Run",
                HARD_TIME_RUN_ACHIEVEMENT_NAME: "Falling Ultra Speed Run",
    },
    CHASE_AT_THE_TABLELANDS_ID : {
                TIME_RUN_ACHIEVEMENT_NAME: "Chasing Speed Run",
                HARD_TIME_RUN_ACHIEVEMENT_NAME: "Chasing Ultra Speed Run",
    },
    TWISTED_HIGH_TEMPLE_ID : {
                TIME_RUN_ACHIEVEMENT_NAME: "Twisted Speed Run",
                HARD_TIME_RUN_ACHIEVEMENT_NAME: "Twisted Ultra Speed Run",
    },
    DEADWOOD_COUNTEROFFENSIVE_ID : {
                TIME_RUN_ACHIEVEMENT_NAME: "Deadwood Speed Run",
                HARD_TIME_RUN_ACHIEVEMENT_NAME: "Deadwood Ultra Speed Run",
    },
    AMBUSH_AT_SHADOW_GORGE_ID : {
                TIME_RUN_ACHIEVEMENT_NAME: "Ambushing Speed Run",
                HARD_TIME_RUN_ACHIEVEMENT_NAME: "Ambushing Ultra Speed Run",
    },
    DIVIDE_AND_CONQUER_FAYLINN_ID : {
                TIME_RUN_ACHIEVEMENT_NAME: "Dividing Speed Run",
                HARD_TIME_RUN_ACHIEVEMENT_NAME: "Dividing Ultra Speed Run",
    },
    PILGRIMAGE_TO_CATHEDRAL_CITY_ID : {
                TIME_RUN_ACHIEVEMENT_NAME: "Pilgrimage Speed Run",
                HARD_TIME_RUN_ACHIEVEMENT_NAME: "Pilgrimage Ultra Speed Run",
    },
    CROSSING_THE_RIVER_STYX_ID : {
                TIME_RUN_ACHIEVEMENT_NAME: "Crossing Speed Run",
                HARD_TIME_RUN_ACHIEVEMENT_NAME: "Crossing Ultra Speed Run",
    },
    BATTLE_AT_RIVERGLEN_ID : {
                TIME_RUN_ACHIEVEMENT_NAME: "Battling Speed Run",
                HARD_TIME_RUN_ACHIEVEMENT_NAME: "Battleling Ultra Speed Run",
    }
}

for stageId in STAGE_ACHIEVEMENTS
{
    achievement( title = STAGE_ACHIEVEMENTS[stageId][TIME_RUN_ACHIEVEMENT_NAME],
                 description = format("Beat {0} with a Hourglass of Fate equipped", StageNameLookup[stageId]),
                 points = 5,
                 trigger = ConquestOrFreeMode() &&
                           justWonASpecificBattle_trigger(stageId) &&
                           itemEquipped(currentPlayerId(), HOURGLASS_OF_FATE_ITEM_ID)
    )
    achievement( title = STAGE_ACHIEVEMENTS[stageId][HARD_TIME_RUN_ACHIEVEMENT_NAME],
                 description = format("Beat {0} with a Hourglass of Fate equipped on Hard difficulty", StageNameLookup[stageId]),
                 points = 25,
                 trigger = ConquestOrFreeMode() &&
                           justWonASpecificBattleAndDifficulty_trigger(stageId, HARD_DIFFICULTY_ID) &&
                           itemEquipped(currentPlayerId(), HOURGLASS_OF_FATE_ITEM_ID) 
    )
}

for dictionary in CHARACTER_SPECIFIC_ITEMS
{
    characterID = dictionary[CHARACTER_ID]
    achievement( title = dictionary[ACHIEVEMENT_NAME],
                 description = format("Beat a stage as {0} using the {1}", PlayerNameLookup[characterID], ItemNameLookup[dictionary[ITEM_ID]]),
                 points = 3,
                 trigger = ConquestOrFreeMode() &&
                           justWonABattle_trigger() &&
                           currentPlayerId() == characterID &&
                           itemEquipped(characterID, dictionary[ITEM_ID])
    )
}   

achievement( title = "What was the point of that?",
             description = "Beat a level with three character specific weapons (Power Shot, Headdress of the Minotaur, Hammer Displacer or Plasma Generator) on the wrong character.",
             points = 2,
             trigger = ConquestOrFreeMode() &&
                       justWonABattle_trigger() &&
                       tally_of(CHARACTER_SPECIFIC_ITEMS, 3, characterDict => once(itemEquipped(currentPlayerId(), characterDict[ITEM_ID]) && characterDict[CHARACTER_ID] != currentPlayerId())) &&
                       never(!isInGameScreen() && !inSpoilsOfWarScreen())
)   

achievement( title = "Playing A Different Tune",
            description = "Beat a level with the Rally Pipe equipped",
            points = 2,
            trigger = ConquestOrFreeMode() &&
                      justWonABattle_trigger() &&
                      itemEquipped(currentPlayerId(), RALLY_PIPE_ITEM_ID)
)

achievement( title = "Cineophile",
             description = "Unlock all of the movies in the Gallery",
             points = 10,
             trigger = ConquestOrFreeModeAllowPrepare() &&
                       justUnlockedAllMovies()
)

achievement( title = "A Learned Slayer",
             description = "Earn 3000 EXP when using the Medal of Valor",
             points = 5,
             trigger = ConquestOrFreeMode() &&
                       justWonABattle_trigger() &&
                       itemEquipped(currentPlayerId(), MEDAL_OF_VALOR_ITEM_ID) &&
                       numberOfNamedEnemiesKilled() >= 10
)

achievement( title = "Combo Master", 
             description = "Earn a combo of 500 hits",
             points = 10,
             trigger = ConquestOrFreeMode() &&
                       prev(totalHitCounter()) < 500 &&
                       totalHitCounter() >= 500
)

achievement( title = "A True Warrior of the Sengoku Era",
             description = "Earn 1000 kills in a single stage",
             points = 10,
             trigger = ConquestOrFreeMode() &&
                       justWonABattle_trigger() &&
                       ( totalKillCounter() >= 1000 || 
                         (totalKillPostGame() >= 1000 && 
                          totalKillCounter() == 0))   // the location of the kill counter is in a different place.  That place doesn't change until after the next level. 
)

achievement( title = "What's Fury Drive?",
             description = "Beat a stage without using Fury Drive",
             points = 5,
             trigger = ConquestOrFreeMode() &&
                       justWonABattle_trigger() &&
                       once(startedMission()) &&
                       never(usedMusou() && framesInLevel() > 0  ) && 
                       never(!isInGameScreen() && !inSpoilsOfWarScreen())
)



achievement( title = "Winners Don't Use Drugs",
             description = "Beat a stage without healing (or gaining health in any way)",
             points = 10,
             trigger = ConquestOrFreeMode() &&
                       justWonABattle_trigger() &&
                       once(startedMission()) &&
                       never(PlayerGainedHealth() && framesInLevel() > 0 ) && 
                       never(!isInGameScreen() && !inSpoilsOfWarScreen())
)


// this didn't work once.  Not worth investigating, We have the secrets
// There might be a way to do this with number of allies left alive, but ... ehhh I don't really care too much, it's a one-off


// achievement( title = "Defend the Wall",
//              description = "Beat Deadwood Counteroffensive with out losing any Ally Strength from Enemy Calvary",
//              points = 10,
//              trigger = ConquestOrFreeMode() &&
//                        justWonASpecificBattle_trigger(DEADWOOD_COUNTEROFFENSIVE_ID) &&
//                        perfectGuardDurability()
// )

SpecialBonusLookup = 
{
    RUSE_AT_RIVERGLEN_ID: "Kill all of the Messengers",
    SIEGE_OF_DARK_SPIRE_ID: "Blow up the Gate",
    LEVELING_KUSH_ID: "Lure out Zaan (16 guards)",
    STORM_OF_THE_GREAT_PLAIN_ID: "Defeat Iron Ox",
    LANDING_AT_NANVIA_ID: "Kill Gun Captain",
    FALL_OF_THE_HIGH_TEMPLE_ID: "Defeat all of the Guard Captains",
    CHASE_AT_THE_TABLELANDS_ID: "Defeat Azure Dragon before he reaches his stronghold",
    TWISTED_HIGH_TEMPLE_ID: "Defeat all of the Guard Captains",
    DEADWOOD_COUNTEROFFENSIVE_ID: "Defeat Scorpio and Talon",
    DIVIDE_AND_CONQUER_FAYLINN_ID: "Prevent Lark and Bramble from Joining Forces",
    CROSSING_THE_RIVER_STYX_ID: "Prevent Reaper from forming his line at Devil's Point",
    BORDER_PATROL_ID: "Defeat all of the Guard Captains",
    BATTLE_AT_RIVERGLEN_ID: "Defeat Venus"
}

SpecialBonusAchievement = 
{
    RUSE_AT_RIVERGLEN_ID:  { ACHIEVEMENT_NAME: "Shhh... It's a Surprise",
                             ACHIEVEMENT_DESCRIPTION: "Kill all the messengers in Ruse at Riverglen",
                             ACHIEVEMENT_POINTS: 10},
    SIEGE_OF_DARK_SPIRE_ID: { ACHIEVEMENT_NAME: "That Was a Long Fuse",
                              ACHIEVEMENT_DESCRIPTION: "Blow up the gate in Siege of Dark Spire",
                              ACHIEVEMENT_POINTS: 3},
    LEVELING_KUSH_ID: { ACHIEVEMENT_NAME: "Come Out, Come Out, Wherever You Are",
                        ACHIEVEMENT_DESCRIPTION: "Lure out Zaan in Leveling Kush",
                        ACHIEVEMENT_POINTS: 4},
    STORM_OF_THE_GREAT_PLAIN_ID: { ACHIEVEMENT_NAME: "The Greatest Warrior Falls",
                                    ACHIEVEMENT_DESCRIPTION: "Defeat Iron Ox in Storm of the Great Plain",
                                    ACHIEVEMENT_POINTS: 10},
    LANDING_AT_NANVIA_ID: { ACHIEVEMENT_NAME: "Gun Down",
                            ACHIEVEMENT_DESCRIPTION: "Kill Gun Captain in Landing at Nanvia",
                            ACHIEVEMENT_POINTS: 3},
    FALL_OF_THE_HIGH_TEMPLE_ID: { ACHIEVEMENT_NAME: "No One Escapes",
                                  ACHIEVEMENT_DESCRIPTION: "Defeat all of the Guard Captains in Fall of the High Temple",
                                  ACHIEVEMENT_POINTS: 3},
    CHASE_AT_THE_TABLELANDS_ID: { ACHIEVEMENT_NAME: "Chasing the Dragon",
                                   ACHIEVEMENT_DESCRIPTION: "Defeat Azure Dragon before he reaches his stronghold in Chase at the Tablelands",
                                   ACHIEVEMENT_POINTS: 4},
    TWISTED_HIGH_TEMPLE_ID: { ACHIEVEMENT_NAME: "Closing the Temple",
                              ACHIEVEMENT_DESCRIPTION: "Defeat all of the Guard Captains in Twisted High Temple",
                              ACHIEVEMENT_POINTS: 3},
    DEADWOOD_COUNTEROFFENSIVE_ID: { ACHIEVEMENT_NAME: "The Deadwood Trio",
                                    ACHIEVEMENT_DESCRIPTION: "Defeat Scorpio and Talon in Deadwood Counteroffensive",
                                    ACHIEVEMENT_POINTS: 4},
    DIVIDE_AND_CONQUER_FAYLINN_ID: { ACHIEVEMENT_NAME: "Divorce on a Battlefield",
                                      ACHIEVEMENT_DESCRIPTION: "Prevent Lark and Bramble from Joining Forces in Divide and Conquer Faylinn",
                                      ACHIEVEMENT_POINTS: 5},
    CROSSING_THE_RIVER_STYX_ID: { ACHIEVEMENT_NAME: "Don't Fear the Reaper",
                                  ACHIEVEMENT_DESCRIPTION: "Prevent Reaper from forming his line at Devil's Point in Crossing the River Styx",
                                  ACHIEVEMENT_POINTS: 5},
    BORDER_PATROL_ID: { ACHIEVEMENT_NAME: "Rampant Violence",
                        ACHIEVEMENT_DESCRIPTION: "Defeat all of the Guard Captains in Border Patrol",
                        ACHIEVEMENT_POINTS: 5},
    BATTLE_AT_RIVERGLEN_ID: { ACHIEVEMENT_NAME: "Venus Fly Trap",
                              ACHIEVEMENT_DESCRIPTION: "Defeat Venus in Battle at Riverglen",
                              ACHIEVEMENT_POINTS: 3},                            
}

for stageId in SpecialBonusLookup
{
    achievement( title = SpecialBonusAchievement[stageId][ACHIEVEMENT_NAME],
                 description = SpecialBonusAchievement[stageId][ACHIEVEMENT_DESCRIPTION],
                 points = SpecialBonusAchievement[stageId][ACHIEVEMENT_POINTS],
                 trigger = ConquestOrFreeMode() &&
                           inSpoilsOfWarScreen() &&
                           JustEarnedSpecialBonus() &&
                           levelID() == stageId
                           )   
}



function killsLeaderboard(stageIndex, difficultyIndex)
{
      leaderboard(
        title = format("Most Kills on {1} {0}",  StageNameLookup[stageIndex], DifficultyNameLookup[difficultyIndex]),
        description = format("Get the most kills on {0} and win the stage on {1} difficulty",  StageNameLookup[stageIndex], DifficultyNameLookup[difficultyIndex]) ,
        start = 
        (
            justWonASpecificBattleAndDifficulty(stageIndex, difficultyIndex)
            
        ),
        cancel = always_false(),
        submit = always_true(),
        value = totalKillPostGame(),
        format = "VALUE"
    )
}

function speedLeaderboard(stageIndex, difficultyIndex)
{
    leaderboard(
        title = format("Fastest Clear on {1} {0}",  StageNameLookup[stageIndex], DifficultyNameLookup[difficultyIndex]),
        description = format("Finish {0} as quick as possible on {1} difficulty",  StageNameLookup[stageIndex], DifficultyNameLookup[difficultyIndex]) ,
        start = 
        (
            justWonASpecificBattleAndDifficulty(stageIndex, difficultyIndex)
        ),
        cancel = always_false(),
        submit = always_true(),
        value = framesPostLevel(),
        format = "FRAMES", 
        lower_is_better = true 
    )
}

for index in StageNameLookup
{
    for difficultyIndex in DifficultyNameLookup
    {
        killsLeaderboard(index, difficultyIndex)
        
    }
    for difficultyIndex in DifficultyNameLookup
    {
        if (index != BORDER_PATROL_ID) // Timed level.
        {
            speedLeaderboard(index, difficultyIndex)
        }
        
        
    }
}

rich_presence_conditional_display(beforePressStartScreen(), "Just Starting Up")
rich_presence_conditional_display(inDemoScreenState() || DemoMode(), "Watching the Demos")
rich_presence_conditional_display(GalleryMode(), "In The Gallery")
rich_presence_conditional_display(OptionsMode(), "In The Options")


rich_presence_conditional_display(inCharacterSelectScreen(), "Choosing who to play as")
rich_presence_conditional_display(inMapScreen(), "Deciding Who to Conquer as {0}",
                                  rich_presence_lookup("CharacterNameLookup", currentPlayerId(), PlayerNameLookup),
                                  rich_presence_lookup("DifficultyLookup", difficultySetting(), DifficultyNameLookup))
rich_presence_conditional_display(inPrepareScreen(), "Gearing up to Conquer {0} as {1}",
                                  rich_presence_lookup("StageNameLookup", levelID(), StageNameLookup),
                                  rich_presence_lookup("CharacterNameLookup", currentPlayerId(), PlayerNameLookup))
rich_presence_conditional_display(isInGameScreen() && framesInLevel() > 0, "Waging war in {0} as {1}. Difficulty: {2}.", // need to wait for 1 frame before talking about difficulty. 
                                  rich_presence_lookup("StageNameLookup", levelID(), StageNameLookup),
                                  rich_presence_lookup("CharacterNameLookup", currentPlayerId(), PlayerNameLookup),
                                  rich_presence_lookup("DifficultyLookup", difficultySetting(), DifficultyNameLookup))
rich_presence_conditional_display(isInGameScreen(), "Waging war in {0} as {1}.",
                                  rich_presence_lookup("StageNameLookup", levelID(), StageNameLookup),
                                  rich_presence_lookup("CharacterNameLookup", currentPlayerId(), PlayerNameLookup))
rich_presence_conditional_display(inSpoilsOfWarScreen(), "Conquered {0} as {1}. Difficulty: {2}",
                                  rich_presence_lookup("StageNameLookup", levelID(), StageNameLookup),
                                  rich_presence_lookup("CharacterNameLookup", currentPlayerId(), PlayerNameLookup),
                                  rich_presence_lookup("DifficultyLookup", difficultySetting(), DifficultyNameLookup))
rich_presence_conditional_display(inTotalConquestScreen(), "Conquered all of Not-Japan as {0}",
                                  rich_presence_lookup("CharacterNameLookup", currentPlayerId(), PlayerNameLookup))
rich_presence_conditional_display(inLoadSaveScreen(), "Saving or Loading")
// Unknown 
rich_presence_display("In Menus.") //Intentionally different to say "issue with RP, with out saying issue with RP"



// Got this from someone Waging war in Storm of the Great Plain as . Difficulty: Normal. 

// Missing a name? 