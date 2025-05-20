// Devil Kings
// #ID = 20696


// For Dictionaries. 
ACHIEVEMENT_NAME = "Achievement Name"
ACHIEVEMENT_DESCRIPTION = "Achievement Description"
ITEM_ID = "Item ID"
CHARACTER_ID = "Character ID"
FIRST_ITEM = "First Item"
SECOND_ITEM = "Second Item"
THIRD_ITEM = "Third Item"


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

function didPlayerJustWin() => winCheck() == 0x01 && prev(winCheck()) == 0x00

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

FIRST_ITEM_LOCATION = 0x55EB20
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
function characterUnlocksFirst() => word(0x55EB70)

CHARACTER_UNLOCK_FIRST_LOCATION = 0x55EB70
CHARACTER_UNLOCK_SECOND_LOCATION = 0x55EB71

function justUnlockedAllCharacter() => bitcount(CHARACTER_UNLOCK_FIRST_LOCATION) +
                                       bitcount(CHARACTER_UNLOCK_SECOND_LOCATION) == 12 && 
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
function stageUnlockfirst() => byte(0x55EB74)

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
function stageUnlockSecond() => byte(0x55EB75)

// $55EB76: (8-bit) Stage Unlock
//          
//          Bit 0 = Border Control
//          Bit 1 = Battle at Riverglen(Frost)
function stageUnlockThird() => byte(0x55EB76)

STAGE_UNLOCK_FIRST_LOCATION = 0x55EB74
STAGE_UNLOCK_SECOND_LOCATION = 0x55EB75
STAGE_UNLOCK_THIRD_LOCATION = 0x55EB76
function justUnlockedAllStages() => bitcount(STAGE_UNLOCK_FIRST_LOCATION) +
                                    bitcount(STAGE_UNLOCK_SECOND_LOCATION) +
                                    bitcount(STAGE_UNLOCK_THIRD_LOCATION) == 12 && 
                                    prev(bitcount(STAGE_UNLOCK_FIRST_LOCATION)) +
                                    prev(bitcount(STAGE_UNLOCK_SECOND_LOCATION)) +
                                    prev(bitcount(STAGE_UNLOCK_THIRD_LOCATION)) == 11

// $55EBDC: (35-bit bitfield) Music Unlocks
function musicUnlocks() => byte(0x55EBDC)

// $55EBE4: (28-bit bitfield) Movie Unlocks
//          
//          Not listing them all 0x01 = unlocked 0x00 = locked.
//          
//          Starts with Game Opening (always unlocked) and ends with Credits (Always unlocked?)
function movieUnlocks() => byte(0x55EBE4)

MOVIE_UNLOCK_FIRST_LOCATION = 0x55EBE4
MOVIE_UNLOCK_SECOND_LOCATION = 0x55EBE5
MOVIE_UNLOCK_THIRD_LOCATION = 0x55EBE6
MOVIE_UNLOCK_FOURTH_LOCATION = 0x55EBE7
function justUnlockedAllMovies() => bitcount(MOVIE_UNLOCK_FIRST_LOCATION) +
                                    bitcount(MOVIE_UNLOCK_SECOND_LOCATION) +
                                    bitcount(MOVIE_UNLOCK_THIRD_LOCATION) +
                                    bitcount(MOVIE_UNLOCK_FOURTH_LOCATION) == 28 && 
                                    prev(bitcount(MOVIE_UNLOCK_FIRST_LOCATION)) +
                                    prev(bitcount(MOVIE_UNLOCK_SECOND_LOCATION)) +
                                    prev(bitcount(MOVIE_UNLOCK_THIRD_LOCATION)) +
                                    prev(bitcount(MOVIE_UNLOCK_FOURTH_LOCATION)) >= 25 && 
                                    prev(bitcount(MOVIE_UNLOCK_FIRST_LOCATION)) +
                                    prev(bitcount(MOVIE_UNLOCK_SECOND_LOCATION)) +
                                    prev(bitcount(MOVIE_UNLOCK_THIRD_LOCATION)) +
                                    prev(bitcount(MOVIE_UNLOCK_FOURTH_LOCATION)) < 28

// $55EFE4: (8-bit) Expected Lark In Game Level
function ingameFirstSaveFileLark() => byte(0x55EFE4)

FIRST_IN_GAME_SAVE_FILE_LOCATION = 0x55EFE4
function findInGameSaveLocation(index) => FIRST_IN_GAME_SAVE_FILE_LOCATION + index * CHARACTER_SAVE_SIZE

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
function justUnlockedAllWeapons(char_index) => measure(all_of(range(0,5), 
                                                    count => findInGameSaveLocation(char_index) + WEAPON_LEVEL_OFFSET + count != 0)) &&
                                               any_of(range(0,5), 
                                                    index => findInGameSaveLocation(char_index) + WEAPON_LEVEL_OFFSET + count == 0)

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

function itemEquipped(char_index, item_index) => findInGameSaveLocation(char_index) + ITEM_FIRST_OFFSET == item_index ||
                                                 findInGameSaveLocation(char_index) + ITEM_FIRST_OFFSET + 1 == item_index ||
                                                 findInGameSaveLocation(char_index) + ITEM_FIRST_OFFSET + 2 == item_index            

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
Q_BALL_ID = 0x0A
IRON_OX_ID = 0x0B

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
    IRON_OX_ID: "Iron Ox"
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

function ConquestOrFreeMode() => modeId() == CONQUEST_MODE_ID || modeId() == FREE_MODE_ID
function ConquestMode() => modeId() == CONQUEST_MODE_ID
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

// $17C93E4: (32-bit)  Fury Drive Level (Musou Level)
//           
//           Likely when you reach 0x017c93ec you can trigger your musou.
function furyDriveLevel() => dword(0x17C93E4)

function usedMusou() => furyDriveLevel() < prev(furyDriveLevel())

// $17C9444: (32-bit) Frames spent in the current level
//           
//           60 fps
function framesInLevel() => dword(0x017C9444)

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
function specialBonusforLevel() => dword_be(0x1DCC094)
SPECIAL_BONUS_TRIGGERED = 0x01
SPECIAL_BONUS_NOT_TRIGGERED = 0x00

function JustEarnedSpecialBonus() => specialBonusforLevel() == SPECIAL_BONUS_TRIGGERED && prev(specialBonusforLevel()) == SPECIAL_BONUS_NOT_TRIGGERED

SpecialBonusLookup = 
{
    RUSE_AT_RIVERGLEN_ID: "Kill all of the Messengers",
    SIEGE_OF_DARK_SPIRE_ID: "Blow up the Gate",
    LEVELING_KUSH_ID: "Lure out Zaan (16 guards)",
    STORM_OF_THE_GREAT_PLAIN_ID: "Defeat Iron Ox",
    LANDING_AT_NANVIA_ID: "Kill Gun Captain",
    FALL_OF_THE_HIGH_TEMPLE_ID: "Defeat All of the Guard Captains",
    CHASE_AT_THE_TABLELANDS_ID: "Defeat Azure Dragon before he reaches his stronghold",
    TWISTED_HIGH_TEMPLE_ID: "Defeat All of the Guard Captains",
    DEADWOOD_COUNTEROFFENSIVE_ID: "Defeat Scorpio and Talon",
    DIVIDE_AND_CONQUER_FAYLINN_ID: "Prevent Lark and Bramble from Joining Forces",
    CROSSING_THE_RIVER_STYX_ID: "Prevent Reaper from forming his line at Devil's Point",
    BORDER_PATROL_ID: "Defeat All of the Guard Captains",
    BATTLE_AT_RIVERGLEN_ID: "Defeat Venus"
}

CHARACTER_SPECIFIC_ITEMS = 
[
    {
        ACHIEVEMENT_NAME: "Better than a gun",
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
        ACHIEVEMENT_NAME: "Doth thou desire the power?",
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
        ACHIEVEMENT_NAME: "I Learned a Lot",
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

function justWonABattle() => screenState() == IN_GAME_STATE &&
                             didPlayerJustWin() &&
                             ConquestOrFreeMode()  // shouldn't be needed, as screen state should be enough.

achievement( title = "The First Victory",
             description = "Win a stage.",
             points = 2,
             trigger = justWonABattle()
)


// Beat any Level
// 
// Beat the game as each character
// Beat the game as each character on hard
// 
// Unlock all characters
// Earn all items
// Level the level items up to 90. 
// Unlock Each Stage
// 
// Devil King beats himself on a level. 
// 
// Each character reaches 20 (Name these aqfter the real character names)
// 
// Beat a level with each trio items. 
// 
// Beat each level with time item. 
// Beat each level with time item on hard.
// 
// headress of the minotaur?  Maybe not even used? 
// 
// Powershot owned by Devil King? 
// 
// Hammer displacer (Puff?). 
// 
// Rally Pipe changes the music.   Achievement for that? 
// RALLY_PIPE_ITEM_ID = 0x0C
// 
// Medal of Valor Bonus? 
// 
// Book of Immortality no death?  On Hard.
// 
// Plasma Generator Ox
// 
// All Movie Unlock 
// 
// combo 500 hits
// Like I said above, not bad. 
// 
// -hit 1000 ko in a mission
// Sure
// 
// -complete 1 mission without to use fury drive
// good idea, but probably easy. 
// 
// -complete 1 mission without break box with cure  On hard? 
// Hard to track, maybe no healing? 
// 
// -complete conquest mode
// Well yeah. 
// 
// -completing 1 mission with each set of 3 items
// yeah. 
// 
// -unlock all weapons
// Per Hero. 
// 
// 
// -complete deadwood mission, without letting the cavalry enter the stronghold
// Have to see if I can track this. 
// 
// 
// 
// -As Iron Ox, complete a level using the plasma generator.
// 
// Yup
// 
// -As Devil King, complete a level using the grenade launcher.
// yup
// 
// 
// -Have at least one weapon with level 90 or higher.
// Interesting. 
// 
// -Face Devil King as Devil King.(Name of the achievement. The True Devil King!)
// Absolutely.   MAybe each character versus himself? 
// 
// Time attack mode for every level. 
// 
// secret goals
// 
// 100 percent on Calvary (only one to special code) 
// 
// All items 
// 
// 
// Leaderboard each level for Kos, and Time.  Per Difficulty. 
// 
// Life saver but no death? 
// 
// 
// Real Presence


function killsLeaderboard(stageIndex, difficultyIndex)
{
      leaderboard(
        title = format("Most Kills on {1} {0}",  StageNameLookup[stageIndex], DifficultyNameLookup[difficultyIndex]),
        description = format("Get the most kills on {0} and win the stage on {1} difficulty",  StageNameLookup[stageIndex], DifficultyNameLookup[difficultyIndex]) ,
        start = 
        (
            ConquestOrFreeMode() &&
            levelID() == stageIndex &&
            didPlayerJustWin() &&
            isInGameScreen() &&
            framesInLevel() != 0 &&
            difficultySetting()  == difficultyIndex 

        ),
        cancel = always_false(),
        submit = always_true(),
        value = totalKillCounter(),
        format = "VALUE"
    )
}

function KoLeaderboard(stageIndex, difficultyIndex)
{
    leaderboard(
        title = format("Fastest Clear on {1} {0}",  StageNameLookup[stageIndex], DifficultyNameLookup[difficultyIndex]),
        description = format("Finish {0} as quick as possible on {1} difficulty",  StageNameLookup[stageIndex], DifficultyNameLookup[difficultyIndex]) ,
        start = 
        (
            ConquestOrFreeMode() &&
            levelID() == stageIndex &&
            didPlayerJustWin() &&
            isInGameScreen() &&
            framesInLevel() != 0 &&
            difficultySetting()  == difficultyIndex 

        ),
        cancel = always_false(),
        submit = always_true(),
        value = framesInLevel(),
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
        KoLeaderboard(index, difficultyIndex)
        
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