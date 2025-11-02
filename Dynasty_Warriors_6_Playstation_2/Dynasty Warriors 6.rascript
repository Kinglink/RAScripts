// Dynasty Warriors 6
// #ID = 20788


WIN_TARGET = "WinTarget"
SCORE_TARGET = "ScoreTarget"
LESS_IS_MORE = "LessIsMore"
TYPE = "Type"
COMPLETE_CHECK = "CompleteCheck"
UNLOCK_FUNCTION = "UnlockFunction"
NEED_UNLOCK = "NeedUnlock"
BEAT_LEVEL_ID = "BeatLevelId"
BEAT_LEVEL_NAME = "BeatLevelName"
NAME = "Name"
DESCRIPTION = "Description"
WIN_ACHIEVEMENT_NAME = "WinAchievementName"
WIN_ACHIEVEMENT_DESCRIPTION = "WinAchievementDescription"
NUMBER_OF_MUSOU_STAGES = 6
ACHIEVEMENT_NAME = "AchievementName"
UNLOCK_ACHIEVEMENT_NAME = "UnlockAchievementName"
BASE_ACHIEVEMENT_TITLE = "BaseAchievementTitle"
MASTER_ACHIEVEMENT_TITLE = "MasterAchievementTitle"
CHAOS_ACHIEVEMENT_TITLE = "ChaosAchievementTitle"

// $3CD89C: (8-bit) Current Map
//          
//          Not a control value (or if it is, not sure what it controls. )
//          
//          Also changes on the Preparation page.
//          
//          
//          0x00 = The Yellow Turban Rebellion
//          0x01 = Battle of Hu Lao Gate
//          0x02 = Battle of Xia Pi
//          0x03 = Conquest of Wu
//          0x05 = Battle of Guan Du
//          0x06 = Invasion of Xu Chang
//          0x07 = Battle of Chang Ban
//          0x08 = Battle of Chi Bi
//          0X17 = Gauntlet Map
//          0x1a  = Battle of Tong Gate
// Probably not needed. 
// function CurrentMap() => byte(0x3CD89C)  // probably not needed. 

// $3CD8B4: (32-bit) Mode selected.
//          
//          0x00 = Musou Mode
//          0x01 = Free mode
//          0x02 = Challenge Mode
//          0x03 = Camp
//          0x04 = Encyclopedia
//          0x05 = Option
function ModeSelected() => dword(0x3CD8B4)

MUSOU_MODE_VALUE = 0x00
FREE_MODE_VALUE = 0x01
CHALLENGE_MODE_VALUE = 0x02
CAMP_MODE_VALUE = 0x03
ENCYCLOPEDIA_MODE_VALUE = 0x04
OPTION_MODE_VALUE = 0x05

function IsInMusouMode() => ModeSelected() == MUSOU_MODE_VALUE
function IsInFreeMode() => ModeSelected() == FREE_MODE_VALUE
function IsInChallengeMode() => ModeSelected() == CHALLENGE_MODE_VALUE
function IsInCampMode() => ModeSelected() == CAMP_MODE_VALUE
function IsInEncyclopediaMode() => ModeSelected() == ENCYCLOPEDIA_MODE_VALUE
function IsInOptionMode() => ModeSelected() == OPTION_MODE_VALUE
function IsInMusouModeFreeModeOrChallengeMode() => IsInMusouMode() || IsInFreeMode() || IsInChallengeMode()
function IsInMusouModeOrFreeMode() => IsInMusouMode() || IsInFreeMode()

// $3CDC38: (32-bit) Time left in a stage.
//          
//          This is a bit of a hack. If this is 0x00000000 then that means we're in the demo.
//          Any other value means we're in a level.
function TimeLeftInStage() => dword(0x3CDC38)

function IsInDemo() => TimeLeftInStage() == 0x00000000

// $3CDC70: (8-bit possibly 32-bit) Two Player Check.
//          
//          0x01 = One Player
//          0x02 = Two Players.
//          
//          Missetting this causes MASSIVE slow down in two player mode.  (And disables the second player camera)
function TwoPlayerCheck() => dword(0x3CDC70)

SINGLE_PLAYER_VALUE = 0x01
function isSinglePlayer() => (TwoPlayerCheck() == SINGLE_PLAYER_VALUE)


// $3CDC98: (32-bit Pointer) Combo Pointer
// 
//          Pointer for Combo. Likely has a lot more information but not sure what is contained here.
// 
//          +0x0A58: (32-bit) Actual Combo Number
//          +0x0A5C: (32-bit) Displayed Combo Number
function ComboPointer() => dword(0x3CDC98)
OFFSET_FOR_ACTUAL_COMBO = 0xA58

function ActualComboNumber() => dword( ComboPointer() + OFFSET_FOR_ACTUAL_COMBO )
function JustHitComboNumber(comboNumber) => (ActualComboNumber() == comboNumber) && (prev(ActualComboNumber()) != comboNumber)

// $4D50B8: (32-bit) Game State
// 
// This value changes as you progress through menus and gameplay.
// 0x19 = Main Menu (including when pressing select+start)
// 0x1a = First screen (Character select in Musou, Stage select in Free, Challenge selection in Challenge mode)
// 0x1b = Loading/saving screen
// 0x1c = Preparation screen (likely)
// 0x1e = Post Game
// Values below 0x10 seem to indicate being in a level, but exact mapping is unclear.
function GameState() => dword(0x4D50B8)

MAIN_MENU_STATE_VALUE = 0x19
LOAD_SAVE_STATE_VALUE = 0x1b
POST_GAME_SCREEN = 0x1e

function IsInMainMenu() => (GameState() == MAIN_MENU_STATE_VALUE)
function IsInLoadSaveScreen() => (GameState() == LOAD_SAVE_STATE_VALUE)
function IsInPostGameScreen() => (GameState() == POST_GAME_SCREEN)

// $4D6110: (32-bit Pointer) Main Character Pointer
//          
//          +0xe8: (Float) Max value of "Special"  (0 when not active, 900 when active might not always be 900) 
//          +0xec: (Float) Current "Special"  Left Starts at Max Value (-4) and counts down. 
//          +0x108: (Float) Max Health
//          +0x10c: (Float) Health
//          
//          0x000 = Death!!!! 
//          +0x114: (Float) Max Musou Power
//          +0x118: (Float) Musou Power.
//          +0x155: (8-bit) Number of Special charges
//          
//          When this reaches the Max Musou Power (Previous value -4)
function MainCharacterPointer() => dword(0x4D6110)

OFFSET_FOR_MAX_SPECIAL = 0xe8
function MaxSpecialValue() => float( MainCharacterPointer() + OFFSET_FOR_MAX_SPECIAL )

function JustUsedSpecial() => (MaxSpecialValue() != 0) && prev(MaxSpecialValue() == 0)

// $6F5770: (32-bit) First Player Kills in the battle.
//          
//          This remains after going the post game.
function FirstPlayerKills() => dword(0x6F5770)

// $6F9A70: (49-bits bitfield) Xiahou Den's Skill list.
//          
//          Each bit is a Skill.  Note, the order is all over the place, but when this is 0x01ffffffffffff it's maxed.
//          
//          49 bits = number of levels.
//          
//          In addition 176 bytes between characters.
//          
//          Note these value cahnges will change the stats of the character immediately (On the front end)
function XiahouDenSkillList() => byte(0x6F9A70)
XIAHOU_DUN_SKILL_LIST_MEMORY_LOCATION = 0x6F9A70

// $6F9B04: (32-bit) Xiahou Dun's Level
//          
//          0x00 = Level 1
//          0x18 = Outfit unlock (level 25)
//          0x31 = Level 50 (highest possible I believe)
//          Note changing this changes your stats! (going above 50 means you get extra stats! WOOOO)
function XiahouDunLevel() => dword(0x6F9B04)

OUTFIT_UNLOCK_LEVEL = 0x18
MAXIMUM_LEVEL = 0x31

// $6F9B14: (32-bit) Xiahou Dun Character Selectable
//          
//          0x00 = Unselectable
//          0x01 = Selectable in Free Mode
//

// $6F9B20: (49-bits bitfield) Dian Wei's Skill list.
//          
//          Each bit is a Skill.  Note, the order is all over the place, but when this is 0x01ffffffffffff it's maxed.
function SecondSkillList() => byte(0x6F9B20)

XIAHOU_DUN_SKILL_LIST_MEMORY_LOCATION = 0x6F9A70
XIAHOU_DUN_LEVEL_MEMORY_LOCATION = 0x6F9B04
DIAN_WEI_SKILL_LIST_MEMORY_LOCATION = 0x6F9B20
CHARACTER_MEMORY_OFSET = DIAN_WEI_SKILL_LIST_MEMORY_LOCATION - XIAHOU_DUN_SKILL_LIST_MEMORY_LOCATION  // 0xB0
XIAHOU_DUN_CHARACTER_SELECTABLE_MEMORY_LOCATION = 0x6F9B14

function GetCharacterLevel(characterId) => dword( CHARACTER_MEMORY_OFSET * characterId + XIAHOU_DUN_LEVEL_MEMORY_LOCATION )
function GetCharacterSelectable(characterId) => dword( CHARACTER_MEMORY_OFSET * characterId + XIAHOU_DUN_CHARACTER_SELECTABLE_MEMORY_LOCATION )
function justUnlockedCharacter(characterId) => (GetCharacterSelectable(characterId) == 1) && (prev(GetCharacterSelectable(characterId)) == 0)

// $6FB6AC: (32-bit) Target Display for The Yellow Turban Rebellion (Allied Forces)
//          
//          Order of levels are based on 0x00722250.  0x1c (28) bytes between the entries.
function YellowTurbanTargetDisplay() => dword(0x6FB6AC)

// $6FB6B0: (bitfield) Target completed for Yellow Turban Rebellion (Allied Forces)
//          
//          bit0 = Target 1
//          bit1 =Target 2
//          bit2 =Target 3
function YellowTurbanTargetComplete() => byte(0x6FB6B0)

// $6FB6C8: (32-bit) Target Show for Hu Lao Gate(Han Forces)
//          
//          Decides if we should show the Hu Lao Gate Icons on the Free Mode.
function HuLaoHanForcesTargetDisplay() => dword(0x6FB6C8)

YELLOW_TURBAN_MEMORY_LOCATION_TARGET_DISPLAY = 0x6FB6AC
YELLOW_TURBAN_MEMORY_LOCATION_TARGETS_COMPLETE = 0x6FB6B0
HU_LAO_HAN_FORCES_MEMORY_LOCATION_TARGET_DISPLAY = 0x6FB6C8
TARGET_LOCATIONS_OFFSET = HU_LAO_HAN_FORCES_MEMORY_LOCATION_TARGET_DISPLAY - YELLOW_TURBAN_MEMORY_LOCATION_TARGET_DISPLAY  // 0x1c?

function GetTargetComplete(stageFactionId) => byte( (TARGET_LOCATIONS_OFFSET * stageFactionId) + YELLOW_TURBAN_MEMORY_LOCATION_TARGETS_COMPLETE )
function JustCompletedAllTargets(stageFactionId) => (GetTargetComplete(stageFactionId) == 0x07) && (prev(GetTargetComplete(stageFactionId)) < 0x07)

// $6FBD84: (32-bit) Xiahou Dun Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function XiahouDunUnlock() => dword(0x6FBD84)

// $6FBD90: (32-bit) Dian Wei Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function DianWeiUnlock() => dword(0x6FBD90)

// $6FBD9C: (32-bit) Sima Yi Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function SimaYiUnlocked() => dword(0x6FBD9C)

// $6FBDA8: (32-bit) Zhange Liao Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function ZhangLiaoUnlocked() => dword(0x6FBDA8)

// $6FBDB4: (32-bit) Cao Cao Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function CaoCaoUnlocked() => dword(0x6FBDB4)

// $6FBDC0: (32-bit) Zhou Yu Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function ZhouYuUnlocked() => dword(0x6FBDC0)

// $6FBDCC: (32-bit) Lu Xun Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function LuXunUnlocked() => dword(0x6FBDCC)

// $6FBDD8: (32-bit) Sun Shang Xiang  Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function SunShangXiangUnlocked() => dword(0x6FBDD8)

// $6FBDE4: (32-bit) Gan Ning Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function GangNingUnlocked() => dword(0x6FBDE4)

// $6FBDF0: (32-bit) Sun Jian Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function SunJianUnlocked() => dword(0x6FBDF0)

// $6FBDFC: (32-bit) Zhao Yun Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function ZhaoYunUnlocked() => dword(0x6FBDFC)

// $6FBE08: (32-bit) Guan Yu Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function GuanYuUnlocked() => dword(0x6FBE08)

// $6FBE14: (32-bit) Zhang Fei Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function ZhangFeiUnlocked() => dword(0x6FBE14)

// $6FBE20: (32-bit) Zhuge Liang Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function ZhugeLiangUnlocked() => dword(0x6FBE20)

// $6FBE2C: (32-bit) Liu Bei Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function LiuBeiUnlocked() => dword(0x6FBE2C)

// $6FBE38: (32-bit) Diao Chan Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function DiaoChanUnlocked() => dword(0x6FBE38)

// $6FBE44: (32-bit) Lu Bu Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function LuBuUnlocked() => dword(0x6FBE44)

// $6FBE50: (32-bit) Cao Pi Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function CaoPiUnlocked() => dword(0x6FBE50)

// $6FBE5C: (32-bit) Zhang He Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function ZhangHeUnlocked() => dword(0x6FBE5C)

// $6FBE68: (32-bit) Ling Tong Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function LingTongUnlocked() => dword(0x6FBE68)

// $6FBE74: (32-bit) Taishi Ci Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function TaishiCiUnlocked() => dword(0x6FBE74)

// $6FBE80: (32-bit) Ma Chao Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function MaChaoUnlocked() => dword(0x6FBE80)

// $6FBE8C: (32-bit) Yue Ying Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function YueYingUnlocked() => dword(0x6FBE8C)

// $6FBE98: (32-bit) First Warhorse Display.
//          
//          0x00 = Brown horse
//          0x01 = Light Black Horse
//          0x02 = Redish Horse
//          0x03 = White Horse
//          0x04 = Dark Black Horse
//          0x05 = Red Horse
//          Set to 0x06 when it's disabled
function FirstWarhorseDisplay() => dword(0x6FBE98)


// $6FBE9C: (32-bit) First Warhorse Last Name
//          
//          0x00 = Star
//          0x01 = Cloud
//          0x02 = Mist
//          0x03 = Dream
//          0x04 = Shadow
//          0x05 = Fang
//          0x06 = Song
//          0x07 = Fox
//          0x08 = Leopard
//          0x09 = Cat
//          0x0a = Rat
//          0x0b = Tiger
//          0x0c = Bull
//          0x0d = Stone
//          0x0e = Boulder
//          0x0f = Beauty
//          0x10 = Warlord
//          0x11 = Sun
//          0x12 = Moon
//          0x13 = Comet
//          0x14 = Dasher
//          0x15 = Eagle
//          0x16 = Devil
//          0x17 = Sprinter
//          0x18 = Striker
//          0x19 = Emperor
//          0x1a = King
//          0x1b = Phoenix
//          0x1c = Titan
//          0x1d = Wave
//          0x1e = Zephyr
//          0x1f = Warrior
//          
//          Special Horse names
//          Ultimate Dream
//          Southern Striker
//          Blue Striker
//          Quiet Dream
//          Eastern  Comet
//          Evening Mist
//          Ginger Shadow
function FirstWarhorseLastName() => dword(0x6FBE9C)

// $6FBEA0: (32-bit) First Warhorse Last Name
//          
//          0x00 = Bay
//          0x01 = Black
//          0x02 = Chestnut
//          0x03 = Grey
//          0x04 = Blue
//          0x05 = Red
//          0x06 = Dapple
//          0x07 = Savage
//          0x08 = Roan
//          0x09 = Chrome
//          0x0a = Dun
//          0x0b = Pinto
//          0x0c = Dawn
//          0x0d = Dusk
//          0x0e = Evening
//          0x0f = Harvest
//          0x10 = Quiet
//          0x11 = Quiet
//          0x12 = Eastern
//          0x13 = Western
//          0x14 = Southern
//          0x15 = Northern
//          0x16 = Phantom
//          0x17 = Ginger
//          0x18 = Royal
//          0x19 = Cinnamon
//          0x1a = Saffron
//          0x1b = Sparkling
//          0x1c = Vailiant
//          0x1d = Brave
//          0x1e = Ultimate
//          0x1f = Cosmic
//          
//          Special Horse names
//          Ultimate Dream
//          Southern Striker
//          Blue Striker
//          Quiet Dream
//          Eastern  Comet
//          Evening Mist
//          Ginger Shadow
function FirstWarhorseFirstName() => dword(0x6FBEA0)

// $6FBEA4: (32-bit) First Horse Physique
//          
//          0x00 = Harbors Untold Power
//          0x01 = Well-Balanced
//          0x02 = Superior
//          0x03 = Heavenly
//          
//          Any other =- None shown.
function FirstHorsePhysique() => dword(0x6FBEA4)

// $6FBEA8: (32-bit)
//          
//          Not sure the exact values, multiple map to the same thing.
//          
//          0x00 - 0x02 =  Gaze into the distance
//          0x03 = Miss nothing
//          0x04 - 0x06
//          0x07 = View the world in clarity
//          0x0f = Consider the world
//          
//          
//          These get repeasted.
function FirstHorseGaze() => dword(0x6FBEA8)

// $6FBEAC: (32-bit) First horse Title
//          
//          These might be for the kings.
//          
//          0x1f = Shadow Runner King
//          0x23 = Red Hare King
//          0x0b = Grey King
//          0x17 = Auburn King
//          0x13 = Ebon King
//          0x0f = Dapple King
//          0x0b = Kingly Warhorse
function FirstHorseTitle() => dword(0x6FBEAC)

// $6FBEB0: (32-bit) First Horse Experience
//          
//          0x1388 = 5000 Experience (This also controls the Level)
function FirstHorseExperience() => dword(0x6FBEB0)

// $6FBED4: (32-bit) Second Warhorse Start (The name control)
function SecondWarhorseDisplay() => dword(0x6FBED4)

FIRST_WARHORSE_DISPLAY_MEMORY_LOCATION = 0x6FBE98
FIRST_HORSE_TITLE_MEMORY_LOCATION = 0x6FBEAC
FIRST_HORSE_EXPERIENCE_MEMORY_LOCATION = 0x6FBEB0
SECOND_WARHORSE_DISPLAY_MEMORY_LOCATION = 0x6FBED4
HORSE_MEMORY_OFFSET = SECOND_WARHORSE_DISPLAY_MEMORY_LOCATION - FIRST_WARHORSE_DISPLAY_MEMORY_LOCATION  // 0x3C
NUMBER_OF_HORSES = 8
function GetHorseExperience(horseId) => dword( HORSE_MEMORY_OFFSET * horseId + FIRST_HORSE_EXPERIENCE_MEMORY_LOCATION )
function GetHorseTitle(horseId) => dword( HORSE_MEMORY_OFFSET * horseId + FIRST_HORSE_TITLE_MEMORY_LOCATION )

SHADOW_KING_TITLE = 0x1f
RED_HARE_KING_TITLE = 0x23
GREY_KING_TITLE = 0x0b
AUBURN_KING_TITLE = 0x17
EBON_KING_TITLE = 0x13
DAPPLE_KING_TITLE = 0x0f

KingTitleLookup = 
{
    AUBURN_KING_TITLE : "Auburn King",
    DAPPLE_KING_TITLE : "Dapple King",
    EBON_KING_TITLE : "Ebon King",
    GREY_KING_TITLE : "Grey King",
    SHADOW_KING_TITLE : "Shadow Runner King",
    RED_HARE_KING_TITLE : "Red Hare King"
}

KingAchievementTitleLookup =
{
    AUBURN_KING_TITLE : "Nobody Can Stop Him",
    DAPPLE_KING_TITLE : "Shockwave",
    EBON_KING_TITLE : "Spikey Armor",
    GREY_KING_TITLE : "Luck of the Gods",
    SHADOW_KING_TITLE : "The Iron Horse",
    RED_HARE_KING_TITLE : "Like the Wind"
}

// $721D64: (8-bit) Stage Index for Musou Mode.
//          
//          Which Stage you're currently on in the musou   This is a control for when you beat a level. Setting it to 0x06 seems Play the final video.
function StageIndexForMusouMode() => byte(0x721D64)

function JustBeatStageIndexForMusouMode(stageIndex) => (StageIndexForMusouMode() == stageIndex) && (prev(StageIndexForMusouMode()) != stageIndex)
function JustBeatMusuoMode() => JustBeatStageIndexForMusouMode(0x06)  // Final Stage


// $72223C: (8-bit) Name of the first player's character on the Preparation screen. Also appears to control who is saved.
// 
// Seems usable as a main character id.
// 
// 0x00 = Xiahou Dun
// 0x01 = Dian Wei
// 0x02 = Sima Yi 
// 0x03 = Zhang Liao
// 0x04 = Cao Cao
// 0x05 = Zhou Yu
// 0x06 = Lu Xun
// 0x07 = Sun Shang Xiang
// 0x08 = Gan Ning
// 0x09 = Sun Jian
// 0x0a = Zhao Yun
// 0x0b = Guan Yu
// 0x0c = Zhang Fei
// 0x0d = Zhuge Liang
// 0x0e = Liu Bei 
// 0x0f = Diao Chan
// 0x10 = Lu Bu
// 0x11 = Xu Zhu
// 0x12 = Xiahou Yuan
// 0x13 = Xu Huang
// 0x14 = Zhang He
// 0x15 = Cao Ren
// 0x16 = Cao Pi
// 0x17 = Taishi Ci
// 0x18 = Lu Meng
// 0x19 = Huang Gai
// 0x1a = Zhou Tai
// 0x1b = Ling Tong
// 0x1c = Sun Ce
// 0x1d = Sun Quan
// 0x1e = Ma Chao
// 0x1f = Huang Zhong
// 0x20 = Wei Yan
// 0x21 = Guan Ping
// 0x22 = Pang Tong
// 0x23 = Dong Zhuo
// 0x24 = Yuan Shao
// 0x25 = Zhang Jiao
// 0x26 = Zhen Ji 
// 0x27 = Xiao Qiao
// 0x28 = Yue Ying

function FirstPlayerCharacterId() => byte(0x72223C)

XIAHOU_DUN_ID =0x00
DIAN_WEI_ID = 0x01
SIMA_YI_ID = 0x02
ZHANG_LIAO_ID = 0x03
CAO_CAO_ID = 0x04
ZHOU_YU_ID = 0x05
LU_XUN_ID = 0x06
SUN_SHANG_XIANG_ID = 0x07
GAN_NING_ID = 0x08  
SUN_JIAN_ID = 0x09
ZHAO_YUN_ID = 0x0a
GUAN_YU_ID = 0x0b
ZHANG_FEI_ID = 0x0c
ZHUGE_LIANG_ID = 0x0d
LIU_BEI_ID = 0x0e
DIAO_CHAN_ID = 0x0f
LU_BU_ID = 0x10
XU_ZHU_ID = 0x11
XIAHOU_YUAN_ID = 0x12
XU_HUANG_ID = 0x13
ZHANG_HE_ID = 0x14
CAO_REN_ID = 0x15
CAO_PI_ID = 0x16
TAISHI_CI_ID = 0x17
LU_MENG_ID = 0x18
HUANG_GAI_ID = 0x19
ZHOU_TAI_ID = 0x1a
LING_TONG_ID = 0x1b
SUN_CE_ID = 0x1c
SUN_QUAN_ID = 0x1d
MA_CHAO_ID = 0x1e
HUANG_ZHONG_ID = 0x1f
WEI_YAN_ID = 0x20
GUAN_PING_ID = 0x21
PANG_TONG_ID = 0x22
DONG_ZHUO_ID = 0x23
YUAN_SHAO_ID = 0x24
ZHANG_JIAO_ID = 0x25
ZHEN_JI_ID = 0x26
XIAO_QIAO_ID = 0x27
YUE_YING_ID = 0x28

CharacterNameLookup =
{
    XIAHOU_DUN_ID : "Xiahou Dun",
    DIAN_WEI_ID : "Dian Wei",
    SIMA_YI_ID : "Sima Yi",
    ZHANG_LIAO_ID : "Zhang Liao",
    CAO_CAO_ID : "Cao Cao",
    ZHOU_YU_ID : "Zhou Yu",
    LU_XUN_ID : "Lu Xun",
    SUN_SHANG_XIANG_ID : "Sun Shang Xiang",
    GAN_NING_ID : "Gan Ning",
    SUN_JIAN_ID : "Sun Jian",
    ZHAO_YUN_ID : "Zhao Yun",
    GUAN_YU_ID : "Guan Yu",
    ZHANG_FEI_ID : "Zhang Fei",
    ZHUGE_LIANG_ID : "Zhuge Liang",
    LIU_BEI_ID : "Liu Bei",
    DIAO_CHAN_ID : "Diao Chan",
    LU_BU_ID : "Lu Bu",
    XU_ZHU_ID : "Xu Zhu",
    XIAHOU_YUAN_ID : "Xiahou Yuan",
    XU_HUANG_ID : "Xu Huang",
    ZHANG_HE_ID : "Zhang He",
    CAO_REN_ID : "Cao Ren",
    CAO_PI_ID : "Cao Pi",
    TAISHI_CI_ID : "Taishi Ci",
    LU_MENG_ID : "Lu Meng",
    HUANG_GAI_ID : "Huang Gai",
    ZHOU_TAI_ID : "Zhou Tai",
    LING_TONG_ID : "Ling Tong",
    SUN_CE_ID : "Sun Ce",
    SUN_QUAN_ID : "Sun Quan",
    MA_CHAO_ID : "Ma Chao",
    HUANG_ZHONG_ID : "Huang Zhong",
    WEI_YAN_ID : "Wei Yan",
    GUAN_PING_ID : "Guan Ping",
    PANG_TONG_ID : "Pang Tong",
    DONG_ZHUO_ID : "Dong Zhuo",
    YUAN_SHAO_ID : "Yuan Shao",
    ZHANG_JIAO_ID : "Zhang Jiao",
    ZHEN_JI_ID : "Zhen Ji",
    XIAO_QIAO_ID : "Xiao Qiao",
    YUE_YING_ID : "Yue Ying"
}

// $72224C: (8-bit) Map Terrain Id for loading.
//          
//          Note this controls WHICH map loads.  However this doesn't choose which map is played.  Just the terrain.
//          
//          There is a danger if this doesn't match the rest of the map.  It will crash the game in some rare cases.
//          
//          0x01 = Battle of Hu Lao Gate
//          0x02 = Battle of Xia Pi
//          0x03 = conquest of Wu
//          0x04 = Battle of Guan Du
//          0x05Invasion of Xu Chang
//          0x6 = Battle of Chang Ban
//          0x07 Chibi
//          0x16  = Gauntlet
//          0x19 = Tong Gate
//          
//          This needs to match 0x00722250 for proper loading.  NOTE they are different values.
function MapTerrainId() => byte(0x72224C)

// $722250: (32-bit) Map Name Id for loading.
//          
//          Only for the name of the map. Counts up to 0x3e
//          
//          0x00 = The Yellow Turban Rebellion (Han Forces)
//          0x01 = Battle of Hu Lao Gate (Allied Forces)
//          0x02 = Battle of Hu Lao Gate (Lu Bu's Forces)
//          0x03 = Battle of Xia Pi (Cao Cao's Forces)
//          0x04 = Battle of Xia Pi (Sun Jian's Forces)
//          0x05 = Battle of Xia Pi (Lu Bu's Forces)
//          0x06 = Conquest of Wu (Sun Ce's Forces)
//          0x07 = Campaign Against Yuan Shu (Liu Bei's Forces)
//          0x08 = Battle of Guan Du (Cao Cao's Forces)
//          0x09 = Battle of Guan Du (Lu Bu's Forces)
//          0x0a = Invasion of Xu Chang (Sun Ce's Forces)
//          0x0b = Invasion of Xu Chang (Lu Bu's Forces)
//          0x0c = Invasion of Xu Chang (Sima Yi's Forces)
//          0x0d = Battle of Chang Ban (Cao Cao's Forces)
//          0x0e = Battle of Chang Ban (Liu Bei's Forces)
//          0x0f = Battle of Chi Bi (Cao Cao's Forces)
//          0x10 = Battle of Chi Bi (Allied Forces)
//          0x11 = Battle of Chi Bi (Lu Bu's Forces)
//          0x12 = Pacification of Cheng Du (Liu Bei's Forces)
//          0x13 = Battle of Jing Provice (Wu Forces)
//          0x14 = Battle of Jing Province (Sun Jian's Forces)
//          0x15 = Battle of Jing Province (Lu Bu's Forces
//          0x16 = Battle of He Fei (Wei Forces)
//          0x17 = Battle of He Fei (Wu Forces)
//          0x18 = Battle of He Fei (Sun Jian's Forces)
//          0x19 = Battle of He Fei (Lu Bu's Forces)
//          0x1a = Battle of Mt. Ding Jun (Wei Forces)
//          0x1b = Battle of Mt. Ding Jun (Shu Forces)
//          0x1c = Battle of Mt. Ding Jun (Lu Bu's Forces)
//          0x1d = Battle of Fan Castle (Allied Forces)
//          0x1e = Battle of Fan Castle (Sun Jian's Forces)
//          0x1f = Battle of Fan Castle (Shu Forces)
//          0x20 = Battle of Fan Castle (Lu Bu's Forces)
//          0x21 = Battle of Yi Ling (Wu Forces)
//          0x22 = Battle of Yi Ling (Shu Forces)
//          0x23 = Battle of Han Zhong (Wei Forces)
//          0x24 = Battle of Han Zhong (Shu Forces)
//          0x25 = Battle of Han Zhong (Lu Bu's Forces)
//          0x26 = Battle of Shi Ting (Wei Forces)
//          0x27 = Battle of Shi Ting (Wu Forces)
//          0x28 = Battle of Shi Ting (Lu Bu's Forces)
//          0x29 = Battle of He Fei Castle (Wei Forces)
//          0x2a = Battle of He Fei Castle (Wu Forces)
//          0x2b = Battle of Wu Zhang Plains (Wei Forces)
//          0x2c = Battle of Wu Zhang Plains (Shu Forces)
//          0x2d = Rampage
//          0x2e = Sudden Death
//          0x2f = Speed Run
//          0x30 = Havoc
//          0x31 = Gauntlet
//          0x32 = Battle of Jiang Dong (Liu Yong's Forces)
//          0x33  = Battle of Guan Du (Yuan Shao's Forces)
//          0x34 = Struggle at He Bei (Cao Cao's Forces)
//          0x35 = Battle of Tong Gate (Allied Forces)
//          0x36 = Pacification of Cheng Du (Liu Zhang's Forces)
//          0x37 = Battle of Jing Province (Shu Forces)
//          0x38 = Battle of Ru Xu Kou (Wu Forces)
//          0x39 = Battle of Jie Ting (Wei Forces)
//          0x3a = Battle of Jie Ting (Shu Forces)
//          0x3b = Invasion of Xu Chang (Wei Forces)
//          0x3c = Battle of Shi Ting (Cao Pi's Forces)
//          0x3d = Battle of Wu Zhang Plains (Cao Pi's Forces)
//          0x3e = Battle of Xia Pi (Sun Ce's Forces)
//          
//          Any others will likely crash your game hard.
//          
//          This needs to match 0x0072224c for proper loading.  NOTE they are different values.
//          
//          It appears this can be different depending on Team
//          
//          Not all levels are the same. 0x03, 0x4 0x5 are Xiapi varients.. as is 0x3e.  Probably order of being created (or patched in for Special)
function MapNameId() => dword(0x722250)

YELLOW_TURBAN_HAN_FACTIONS_STAGE_FACTION_ID = 0x00
BATTLE_OF_HU_LAO_GATE_ALLIED_FORCES_STAGE_FACTION_ID = 0x01
BATTLE_OF_HU_LAO_GATE_LU_BU_FORCES_STAGE_FACTION_ID = 0x02
BATTLE_OF_XIA_PI_CAO_CAO_FORCES_STAGE_FACTION_ID = 0x03
BATTLE_OF_XIA_PI_SUN_JIAN_FORCES_STAGE_FACTION_ID = 0x04
BATTLE_OF_XIA_PI_LU_BU_FORCES_STAGE_FACTION_ID = 0x05
CONQUEST_OF_WU_SUN_CE_FORCES_STAGE_FACTION_ID = 0x06
CAMPAIGN_AGAINST_YUAN_SHU_LIU_BEI_FORCES_STAGE_FACTION_ID = 0x07
BATTLE_OF_GUAN_DU_CAO_CAO_FORCES_STAGE_FACTION_ID = 0x08
BATTLE_OF_GUAN_DU_LU_BU_FORCES_STAGE_FACTION_ID = 0x09
INVASION_OF_XU_CHANG_SUN_CE_FORCES_STAGE_FACTION_ID = 0x0a
INVASION_OF_XU_CHANG_LU_BU_FORCES_STAGE_FACTION_ID = 0x0b
INVASION_OF_XU_CHANG_SIMA_YI_FORCES_STAGE_FACTION_ID = 0x0c
BATTLE_OF_CHANG_BAN_CAO_CAO_FORCES_STAGE_FACTION_ID = 0x0d
BATTLE_OF_CHANG_BAN_LIU_BEI_FORCES_STAGE_FACTION_ID = 0x0e
BATTLE_OF_CHI_BI_CAO_CAO_FORCES_STAGE_FACTION_ID = 0x0f
BATTLE_OF_CHI_BI_ALLIED_FORCES_STAGE_FACTION_ID = 0x10
BATTLE_OF_CHI_BI_LU_BU_FORCES_STAGE_FACTION_ID = 0x11
PACIFICATION_OF_CHENG_DU_LIU_BEI_FORCES_STAGE_FACTION_ID = 0x12
BATTLE_OF_JING_PROVINCE_WU_FORCES_STAGE_FACTION_ID = 0x13
BATTLE_OF_JING_PROVINCE_SUN_JIAN_FORCES_STAGE_FACTION_ID = 0x14
BATTLE_OF_JING_PROVINCE_LU_BU_FORCES_STAGE_FACTION_ID = 0x15
BATTLE_OF_HE_FEI_WEI_FORCES_STAGE_FACTION_ID = 0x16
BATTLE_OF_HE_FEI_WU_FORCES_STAGE_FACTION_ID = 0x17
BATTLE_OF_HE_FEI_SUN_JIAN_FORCES_STAGE_FACTION_ID = 0x18
BATTLE_OF_HE_FEI_LU_BU_FORCES_STAGE_FACTION_ID = 0x19
BATTLE_OF_MT_DING_JUN_WEI_FORCES_STAGE_FACTION_ID = 0x1a
BATTLE_OF_MT_DING_JUN_SHU_FORCES_STAGE_FACTION_ID = 0x1b
BATTLE_OF_MT_DING_JUN_LU_BU_FORCES_STAGE_FACTION_ID = 0x1c
BATTLE_OF_FAN_CASTLE_ALLIED_FORCES_STAGE_FACTION_ID = 0x1d
BATTLE_OF_FAN_CASTLE_SUN_JIAN_FORCES_STAGE_FACTION_ID = 0x1e
BATTLE_OF_FAN_CASTLE_SHU_FORCES_STAGE_FACTION_ID = 0x1f
BATTLE_OF_FAN_CASTLE_LU_BU_FORCES_STAGE_FACTION_ID = 0x20
BATTLE_OF_YI_LING_WU_FORCES_STAGE_FACTION_ID = 0x21
BATTLE_OF_YI_LING_SHU_FORCES_STAGE_FACTION_ID = 0x22
BATTLE_OF_HAN_ZHONG_WEI_FORCES_STAGE_FACTION_ID = 0x23
BATTLE_OF_HAN_ZHONG_SHU_FORCES_STAGE_FACTION_ID = 0x24
BATTLE_OF_HAN_ZHONG_LU_BU_FORCES_STAGE_FACTION_ID = 0x25
BATTLE_OF_SHI_TING_WEI_FORCES_STAGE_FACTION_ID = 0x26
BATTLE_OF_SHI_TING_WU_FORCES_STAGE_FACTION_ID = 0x27
BATTLE_OF_SHI_TING_LU_BU_FORCES_STAGE_FACTION_ID = 0x28
BATTLE_OF_HE_FEI_CASTLE_WEI_FORCES_STAGE_FACTION_ID = 0x29
BATTLE_OF_HE_FEI_CASTLE_WU_FORCES_STAGE_FACTION_ID = 0x2a
BATTLE_OF_WU_ZHANG_PLAINS_WEI_FORCES_STAGE_FACTION_ID = 0x2b
BATTLE_OF_WU_ZHANG_PLAINS_SHU_FORCES_STAGE_FACTION_ID = 0x2c
RAMPAGE_STAGE_CHALLENGE_ID = 0x2d
SUDDEN_DEATH_STAGE_CHALLENGE_ID = 0x2e
SPEED_RUN_STAGE_CHALLENGE_ID = 0x2f
HAVOC_STAGE_CHALLENGE_ID = 0x30
GAUNTLET_STAGE_CHALLENGE_ID = 0x31
BATTLE_OF_JIANG_DONG_LIU_YONG_FORCES_STAGE_FACTION_ID = 0x32
BATTLE_OF_GUAN_DU_YUAN_SHAO_FORCES_STAGE_FACTION_ID = 0x33
STRUGGLE_AT_HE_BEI_CAO_CAO_FORCES_STAGE_FACTION_ID = 0x34
BATTLE_OF_TONG_GATE_ALLIED_FORCES_STAGE_FACTION_ID = 0x35
PACIFICATION_OF_CHENG_DU_LIU_ZHANG_FORCES_STAGE_FACTION_ID = 0x36
BATTLE_OF_JING_PROVINCE_SHU_FORCES_STAGE_FACTION_ID = 0x37
BATTLE_OF_RU_XU_KOU_WU_FORCES_STAGE_FACTION_ID = 0x38
BATTLE_OF_JIE_TING_WEI_FORCES_STAGE_FACTION_ID = 0x39
BATTLE_OF_JIE_TING_SHU_FORCES_STAGE_FACTION_ID = 0x3a
INVASION_OF_XU_CHANG_WEI_FORCES_STAGE_FACTION_ID = 0x3b
BATTLE_OF_SHI_TING_WEI_FORCES_STAGE_FACTION_ID2 = 0x3c
BATTLE_OF_WU_ZHANG_PLAINS_WEI_FORCES_STAGE_FACTION_ID2 = 0x3d
BATTLE_OF_XIA_PI_XIA_PI_STAGE_FACTION_ID = 0x3e


StageNameLookup = 
{
    YELLOW_TURBAN_HAN_FACTIONS_STAGE_FACTION_ID: "The Yellow Turban Rebellion",
    BATTLE_OF_HU_LAO_GATE_ALLIED_FORCES_STAGE_FACTION_ID: "Battle of Hu Lao Gate",
    BATTLE_OF_HU_LAO_GATE_LU_BU_FORCES_STAGE_FACTION_ID: "Battle of Hu Lao Gate",
    BATTLE_OF_XIA_PI_CAO_CAO_FORCES_STAGE_FACTION_ID: "Battle of Xia Pi",
    BATTLE_OF_XIA_PI_SUN_JIAN_FORCES_STAGE_FACTION_ID: "Battle of Xia Pi",
    BATTLE_OF_XIA_PI_LU_BU_FORCES_STAGE_FACTION_ID: "Battle of Xia Pi",
    CONQUEST_OF_WU_SUN_CE_FORCES_STAGE_FACTION_ID: "Conquest of Wu",
    CAMPAIGN_AGAINST_YUAN_SHU_LIU_BEI_FORCES_STAGE_FACTION_ID: "Campaign Against Yuan Shu",
    BATTLE_OF_GUAN_DU_CAO_CAO_FORCES_STAGE_FACTION_ID: "Battle of Guan Du",
    BATTLE_OF_GUAN_DU_LU_BU_FORCES_STAGE_FACTION_ID: "Battle of Guan Du",
    INVASION_OF_XU_CHANG_SUN_CE_FORCES_STAGE_FACTION_ID: "Invasion of Xu Chang",
    INVASION_OF_XU_CHANG_LU_BU_FORCES_STAGE_FACTION_ID: "Invasion of Xu Chang",
    INVASION_OF_XU_CHANG_SIMA_YI_FORCES_STAGE_FACTION_ID: "Invasion of Xu Chang",
    BATTLE_OF_CHANG_BAN_CAO_CAO_FORCES_STAGE_FACTION_ID: "Battle of Chang Ban",
    BATTLE_OF_CHANG_BAN_LIU_BEI_FORCES_STAGE_FACTION_ID: "Battle of Chang Ban",
    BATTLE_OF_CHI_BI_CAO_CAO_FORCES_STAGE_FACTION_ID: "Battle of Chi Bi",
    BATTLE_OF_CHI_BI_ALLIED_FORCES_STAGE_FACTION_ID: "Battle of Chi Bi",
    BATTLE_OF_CHI_BI_LU_BU_FORCES_STAGE_FACTION_ID: "Battle of Chi Bi",
    PACIFICATION_OF_CHENG_DU_LIU_BEI_FORCES_STAGE_FACTION_ID: "Pacification of Cheng Du",
    BATTLE_OF_JING_PROVINCE_WU_FORCES_STAGE_FACTION_ID: "Battle of Jing Province",
    BATTLE_OF_JING_PROVINCE_SUN_JIAN_FORCES_STAGE_FACTION_ID: "Battle of Jing Province",
    BATTLE_OF_JING_PROVINCE_LU_BU_FORCES_STAGE_FACTION_ID: "Battle of Jing Province",
    BATTLE_OF_HE_FEI_WEI_FORCES_STAGE_FACTION_ID: "Battle of He Fei",
    BATTLE_OF_HE_FEI_WU_FORCES_STAGE_FACTION_ID: "Battle of He Fei",
    BATTLE_OF_HE_FEI_SUN_JIAN_FORCES_STAGE_FACTION_ID: "Battle of He Fei",
    BATTLE_OF_HE_FEI_LU_BU_FORCES_STAGE_FACTION_ID: "Battle of He Fei",
    BATTLE_OF_MT_DING_JUN_WEI_FORCES_STAGE_FACTION_ID: "Battle of Mt. Ding Jun",
    BATTLE_OF_MT_DING_JUN_SHU_FORCES_STAGE_FACTION_ID: "Battle of Mt. Ding Jun",
    BATTLE_OF_MT_DING_JUN_LU_BU_FORCES_STAGE_FACTION_ID: "Battle of Mt. Ding Jun",
    BATTLE_OF_FAN_CASTLE_ALLIED_FORCES_STAGE_FACTION_ID: "Battle of Fan Castle",
    BATTLE_OF_FAN_CASTLE_SUN_JIAN_FORCES_STAGE_FACTION_ID: "Battle of Fan Castle",
    BATTLE_OF_FAN_CASTLE_SHU_FORCES_STAGE_FACTION_ID: "Battle of Fan Castle",
    BATTLE_OF_FAN_CASTLE_LU_BU_FORCES_STAGE_FACTION_ID: "Battle of Fan Castle",
    BATTLE_OF_YI_LING_WU_FORCES_STAGE_FACTION_ID: "Battle of Yi Ling",
    BATTLE_OF_YI_LING_SHU_FORCES_STAGE_FACTION_ID: "Battle of Yi Ling",
    BATTLE_OF_HAN_ZHONG_WEI_FORCES_STAGE_FACTION_ID: "Battle of Han Zhong",
    BATTLE_OF_HAN_ZHONG_SHU_FORCES_STAGE_FACTION_ID: "Battle of Han Zhong",
    BATTLE_OF_HAN_ZHONG_LU_BU_FORCES_STAGE_FACTION_ID: "Battle of Han Zhong",
    BATTLE_OF_SHI_TING_WEI_FORCES_STAGE_FACTION_ID: "Battle of Shi Ting",
    BATTLE_OF_SHI_TING_WU_FORCES_STAGE_FACTION_ID: "Battle of Shi Ting",
    BATTLE_OF_SHI_TING_LU_BU_FORCES_STAGE_FACTION_ID: "Battle of Shi Ting",
    BATTLE_OF_HE_FEI_CASTLE_WEI_FORCES_STAGE_FACTION_ID: "Battle of He Fei Castle",
    BATTLE_OF_HE_FEI_CASTLE_WU_FORCES_STAGE_FACTION_ID: "Battle of He Fei Castle",
    BATTLE_OF_WU_ZHANG_PLAINS_WEI_FORCES_STAGE_FACTION_ID: "Battle of Wu Zhang Plains",
    BATTLE_OF_WU_ZHANG_PLAINS_SHU_FORCES_STAGE_FACTION_ID: "Battle of Wu Zhang Plains",
    RAMPAGE_STAGE_CHALLENGE_ID: "Rampage",
    SUDDEN_DEATH_STAGE_CHALLENGE_ID: "Sudden Death",
    SPEED_RUN_STAGE_CHALLENGE_ID: "Speed Run",
    HAVOC_STAGE_CHALLENGE_ID: "Havoc",
    GAUNTLET_STAGE_CHALLENGE_ID: "Gauntlet",
    BATTLE_OF_JIANG_DONG_LIU_YONG_FORCES_STAGE_FACTION_ID: "Battle of Jiang Dong",
    BATTLE_OF_GUAN_DU_YUAN_SHAO_FORCES_STAGE_FACTION_ID: "Battle of Guan Du",
    STRUGGLE_AT_HE_BEI_CAO_CAO_FORCES_STAGE_FACTION_ID: "Struggle at He Bei",
    BATTLE_OF_TONG_GATE_ALLIED_FORCES_STAGE_FACTION_ID: "Battle of Tong Gate",
    PACIFICATION_OF_CHENG_DU_LIU_ZHANG_FORCES_STAGE_FACTION_ID: "Pacification of Cheng Du",
    BATTLE_OF_JING_PROVINCE_SHU_FORCES_STAGE_FACTION_ID: "Battle of Jing Province",
    BATTLE_OF_RU_XU_KOU_WU_FORCES_STAGE_FACTION_ID: "Battle of Ru Xu Kou",
    BATTLE_OF_JIE_TING_WEI_FORCES_STAGE_FACTION_ID: "Battle of Jie Ting",
    BATTLE_OF_JIE_TING_SHU_FORCES_STAGE_FACTION_ID: "Battle of Jie Ting",
    INVASION_OF_XU_CHANG_WEI_FORCES_STAGE_FACTION_ID: "Invasion of Xu Chang",
    BATTLE_OF_SHI_TING_WEI_FORCES_STAGE_FACTION_ID2: "Battle of Shi Ting",
    BATTLE_OF_WU_ZHANG_PLAINS_WEI_FORCES_STAGE_FACTION_ID2: "Battle of Wu Zhang Plains",
    BATTLE_OF_XIA_PI_XIA_PI_STAGE_FACTION_ID: "Battle of Xia Pi"
}

FactionNameLookup =
{
    YELLOW_TURBAN_HAN_FACTIONS_STAGE_FACTION_ID : "Han Forces",
    BATTLE_OF_HU_LAO_GATE_ALLIED_FORCES_STAGE_FACTION_ID : "Allied Forces",
    BATTLE_OF_HU_LAO_GATE_LU_BU_FORCES_STAGE_FACTION_ID : "Lu Bu's Forces",
    BATTLE_OF_XIA_PI_CAO_CAO_FORCES_STAGE_FACTION_ID : "Cao Cao's Forces",
    BATTLE_OF_XIA_PI_SUN_JIAN_FORCES_STAGE_FACTION_ID : "Sun Jian's Forces",
    BATTLE_OF_XIA_PI_LU_BU_FORCES_STAGE_FACTION_ID : "Lu Bu's Forces",
    CONQUEST_OF_WU_SUN_CE_FORCES_STAGE_FACTION_ID : "Sun Ce's Forces",
    CAMPAIGN_AGAINST_YUAN_SHU_LIU_BEI_FORCES_STAGE_FACTION_ID : "Liu Bei's Forces",
    BATTLE_OF_GUAN_DU_CAO_CAO_FORCES_STAGE_FACTION_ID : "Cao Cao's Forces",
    BATTLE_OF_GUAN_DU_LU_BU_FORCES_STAGE_FACTION_ID : "Lu Bu's Forces",
    INVASION_OF_XU_CHANG_SUN_CE_FORCES_STAGE_FACTION_ID : "Sun Ce's Forces",
    INVASION_OF_XU_CHANG_LU_BU_FORCES_STAGE_FACTION_ID : "Lu Bu's Forces",
    INVASION_OF_XU_CHANG_SIMA_YI_FORCES_STAGE_FACTION_ID : "Sima Yi's Forces",
    BATTLE_OF_CHANG_BAN_CAO_CAO_FORCES_STAGE_FACTION_ID : "Cao Cao's Forces",
    BATTLE_OF_CHANG_BAN_LIU_BEI_FORCES_STAGE_FACTION_ID : "Liu Bei's Forces",
    BATTLE_OF_CHI_BI_CAO_CAO_FORCES_STAGE_FACTION_ID : "Cao Cao's Forces",
    BATTLE_OF_CHI_BI_ALLIED_FORCES_STAGE_FACTION_ID : "Allied Forces",
    BATTLE_OF_CHI_BI_LU_BU_FORCES_STAGE_FACTION_ID : "Lu Bu's Forces",
    PACIFICATION_OF_CHENG_DU_LIU_BEI_FORCES_STAGE_FACTION_ID : "Liu Bei's Forces",
    BATTLE_OF_JING_PROVINCE_WU_FORCES_STAGE_FACTION_ID : "Wu Forces",
    BATTLE_OF_JING_PROVINCE_SUN_JIAN_FORCES_STAGE_FACTION_ID : "Sun Jian's Forces",
    BATTLE_OF_JING_PROVINCE_LU_BU_FORCES_STAGE_FACTION_ID : "Lu Bu's Forces",
    BATTLE_OF_HE_FEI_WEI_FORCES_STAGE_FACTION_ID : "Wei Forces",
    BATTLE_OF_HE_FEI_WU_FORCES_STAGE_FACTION_ID : "Wu Forces",
    BATTLE_OF_HE_FEI_SUN_JIAN_FORCES_STAGE_FACTION_ID : "Sun Jian's Forces",
    BATTLE_OF_HE_FEI_LU_BU_FORCES_STAGE_FACTION_ID : "Lu Bu's Forces",
    BATTLE_OF_MT_DING_JUN_WEI_FORCES_STAGE_FACTION_ID : "Wei Forces",
    BATTLE_OF_MT_DING_JUN_SHU_FORCES_STAGE_FACTION_ID : "Shu Forces",
    BATTLE_OF_MT_DING_JUN_LU_BU_FORCES_STAGE_FACTION_ID : "Lu Bu's Forces",
    BATTLE_OF_FAN_CASTLE_ALLIED_FORCES_STAGE_FACTION_ID : "Allied Forces",
    BATTLE_OF_FAN_CASTLE_SUN_JIAN_FORCES_STAGE_FACTION_ID : "Sun Jian's Forces",
    BATTLE_OF_FAN_CASTLE_SHU_FORCES_STAGE_FACTION_ID : "Shu Forces",
    BATTLE_OF_FAN_CASTLE_LU_BU_FORCES_STAGE_FACTION_ID : "Lu Bu's Forces",
    BATTLE_OF_YI_LING_WU_FORCES_STAGE_FACTION_ID : "Wu Forces",
    BATTLE_OF_YI_LING_SHU_FORCES_STAGE_FACTION_ID : "Shu Forces",
    BATTLE_OF_HAN_ZHONG_WEI_FORCES_STAGE_FACTION_ID : "Wei Forces",
    BATTLE_OF_HAN_ZHONG_SHU_FORCES_STAGE_FACTION_ID : "Shu Forces",
    BATTLE_OF_HAN_ZHONG_LU_BU_FORCES_STAGE_FACTION_ID : "Lu Bu's Forces",
    BATTLE_OF_SHI_TING_WEI_FORCES_STAGE_FACTION_ID : "Wei Forces",
    BATTLE_OF_SHI_TING_WU_FORCES_STAGE_FACTION_ID : "Wu Forces",
    BATTLE_OF_SHI_TING_LU_BU_FORCES_STAGE_FACTION_ID : "Lu Bu's Forces",
    BATTLE_OF_HE_FEI_CASTLE_WEI_FORCES_STAGE_FACTION_ID : "Wei Forces",
    BATTLE_OF_HE_FEI_CASTLE_WU_FORCES_STAGE_FACTION_ID : "Wu Forces",
    BATTLE_OF_WU_ZHANG_PLAINS_WEI_FORCES_STAGE_FACTION_ID : "Wei Forces",
    BATTLE_OF_WU_ZHANG_PLAINS_SHU_FORCES_STAGE_FACTION_ID : "Shu Forces",
    RAMPAGE_STAGE_CHALLENGE_ID : "N/A",
    SUDDEN_DEATH_STAGE_CHALLENGE_ID : "N/A",
    SPEED_RUN_STAGE_CHALLENGE_ID : "N/A",
    HAVOC_STAGE_CHALLENGE_ID : "N/A",
    GAUNTLET_STAGE_CHALLENGE_ID : "N/A",
    BATTLE_OF_JIANG_DONG_LIU_YONG_FORCES_STAGE_FACTION_ID : "Liu Yong's Forces",
    BATTLE_OF_GUAN_DU_YUAN_SHAO_FORCES_STAGE_FACTION_ID : "Yuan Shao's Forces",
    STRUGGLE_AT_HE_BEI_CAO_CAO_FORCES_STAGE_FACTION_ID : "Cao Cao's Forces",
    BATTLE_OF_TONG_GATE_ALLIED_FORCES_STAGE_FACTION_ID : "Allied Forces",
    PACIFICATION_OF_CHENG_DU_LIU_ZHANG_FORCES_STAGE_FACTION_ID : "Liu Zhang's Forces",
    BATTLE_OF_JING_PROVINCE_SHU_FORCES_STAGE_FACTION_ID : "Shu Forces",
    BATTLE_OF_RU_XU_KOU_WU_FORCES_STAGE_FACTION_ID : "Wu Forces",
    BATTLE_OF_JIE_TING_WEI_FORCES_STAGE_FACTION_ID : "Wei Forces",
    BATTLE_OF_JIE_TING_SHU_FORCES_STAGE_FACTION_ID : "Shu Forces",
    INVASION_OF_XU_CHANG_WEI_FORCES_STAGE_FACTION_ID : "Wei Forces",
    BATTLE_OF_SHI_TING_WEI_FORCES_STAGE_FACTION_ID2 : "Cao Pi's Forces",
    BATTLE_OF_WU_ZHANG_PLAINS_WEI_FORCES_STAGE_FACTION_ID2 : "Cao Pi's Forces",
    BATTLE_OF_XIA_PI_XIA_PI_STAGE_FACTION_ID : "Sun Ce's Forces"
}

// $722254: (32-bit) Difficulty Setting.
//          
//          This appears to be the setting from the Start.  Then 0x722288 adopts this.
//          
//          0x00 = Easy
//          0x01 = Normal
//          0x02 = Hard
//          0x03 = Master
//          0x04 = Chaos
function DifficultySetting() => dword(0x722254)

EASY_DIFFICULTY_VALUE = 0x00
NORMAL_DIFFICULTY_VALUE = 0x01
HARD_DIFFICULTY_VALUE = 0x02
MASTER_DIFFICULTY_VALUE = 0x03
CHAOS_DIFFICULTY_VALUE = 0x04

DifficultyNameLookup =
{
    EASY_DIFFICULTY_VALUE : "Easy",
    NORMAL_DIFFICULTY_VALUE : "Normal",
    HARD_DIFFICULTY_VALUE : "Hard",
    MASTER_DIFFICULTY_VALUE : "Master",
    CHAOS_DIFFICULTY_VALUE : "Chaos"
}

// $722280: (8-bit) Second Map Id for loading.
//          
//          Note this controls WHICH map loads.  However this doesn't choose which map is played.  Just the terrain.
//          
//          There is a danger if this doesn't match the rest of the map.  It will crash the game in some rare cases.
//          
//          0x01 = Battle of Hu Lao Gate
//          0x02 = Battle of Xia Pi
//          0x03 = Conquest of Wu
//          0x04 = Battle of Guan Du
//          0x05 = Invasion of Xu Chang
//          0x06 = Battle of Chang Ban
//          0x07 = Chibi
//          0x16  = Gauntlet
//          0x19 = Tong Gate
function SecondMapIdForLoading() => byte(0x722280)

// $722288: (32-bit) Display Difficulty Setting.
//          
//          Changing this changes the difficulty on the pause screen.
//          
//          This appears to be the setting from the Start.  Then 0x722288 adopts this.
//          
//          0x00 = Easy
//          0x01 = Normal
//          0x02 = Hard
//          0x03 = Master
//          0x04 = Chaos
function DisplayDifficultSetting() => dword(0x722288)

// $722290: (32-bit) Time in Battle by frames.  (60 fps)
//          
//          This is still valid after the battle.
function FramesInBattle() => dword(0x722290)

// $722298: (8-bit) Mission results
//          
//          Starts at 0x05. Changes on death/failure.  This is a control, so if this is set to "victory" even if you die, you win the level.
//          
//          Similarly, setting it to 0, your character will "die" when you beat a level.
//          
//          0x00 = Character Death
//          0x01 = (Appears to be no result)
//          0x02 = Victory
//          0x03 = Failure (Defeated)
//          0x04 = Defeated (maybe Boss killed)   Liu Bei getting to the boat causes this)
//          0x04 = Timed out in Challenge mode.
//          0x05 = Normal Gameplay (skips "ending" results in game over.
//          
//          Other values appear to also do the same as 5.
function MissionResult() => byte(0x722298)

MISSION_RESULT_VICTORY_VALUE = 0x02
MISSION_RESULT_NORMAL_GAMEPLAYVALUE = 0x05

function JustWonBattle() => MissionResult() == MISSION_RESULT_VICTORY_VALUE && prev(MissionResult()) == MISSION_RESULT_NORMAL_GAMEPLAYVALUE
function JustFinishBattle() => MissionResult() != MISSION_RESULT_NORMAL_GAMEPLAYVALUE && prev(MissionResult()) == MISSION_RESULT_NORMAL_GAMEPLAYVALUE
function WonStageCheck() => MissionResult() == MISSION_RESULT_VICTORY_VALUE && IsInPostGameScreen()

// $7E06EC: (32-bit) Victory Camera.
//          
//          0x00000000 = Won Level   (includes Gauntlet)
//          0x00000001 = Lost Level (Failure)
//          0x00000002 = Character died (zoom in)
//          0xffffffff = Normal Gameplay
//          
//          Others appear to do the same as 0xffffffff (no camera).  Note, this only controls trhe camera.  0x00722298 is the control for the results
function VictoryCamera() => dword(0x7E06EC)

// $9A4F14: (32-bit) Player Faction
//          
//          0x00 = Han Forces
//          0x01 = Allied Forces
//          0x02 = Wei Forces
//          0x03 = Wu Forces
//          0x04 = Shu Forces
//          0x05 = Cao Cao's Forces
//          0x06 = Sun Jian's Forces
//          0x07 = Sun Ce's Forces
//          0x08 = Sun Quan's Forces
//          0x09 = Liu Bei's Forces
//          0x0a = Dong Zhuo's Forces
//          0x0b = Lu Bu's Forces
//          0x0c = Yuan Shao's Forces
//          0x0d = Yellow Turbans
//          0x0e = Liu Zhang's Forces
//          0x0f = Yuan Shu's Forces
//          0x10 = Sima Yi's Forces
//          0x11 = Cao Pi's Forces
//          0x12 = Yuan Tan's Forces
//          0x13 = Liu Yong's Forces
function PlayerFaction() => dword(0x9A4F14)

// $9A4FF0: (32-bit) Opponet Faction
//          
//          0x00 = Han Forces
//          0x01 = Allied Forces
//          0x02 = Wei Forces
//          0x03 = Wu Forces
//          0x04 = Shu Forces
//          0x05 = Cao Cao's Forces
//          0x06 = Sun Jian's Forces
//          0x07 = Sun Ce's Forces
//          0x08 = Sun Quan's Forces
//          0x09 = Liu Bei's Forces
//          0x0a = Dong Zhuo's Forces
//          0x0b = Lu Bu's Forces
//          0x0c = Yuan Shao's Forces
//          0x0d = Yellow Turbans
//          0x0e = Liu Zhang's Forces
//          0x0f = Yuan Shu's Forces
//          0x10 = Sima Yi's Forces
//          0x11 = Cao Pi's Forces
//          0x12 = Yuan Tan's Forces
//          0x13 = Liu Yong's Forces
function OpponentFaction() => dword(0x9A4FF0)

// $9A50CC: (32-bit) Second Opponet's Faction
function SecondOpponetFaction() => dword(0x9A50CC)

// $A11068: (32-bit Array of 3) Targets
function InMissionTargets() => dword(0xA11068)
function InMissionsTargets1() => dword(0xA11068)
function InMissionsTargets2() => dword(0xA1106C)
function InMissionsTargets3() => dword(0xA11070)

function CountMissionTargets() =>  InMissionsTargets1() + InMissionsTargets2() + InMissionsTargets3()


MusouModeAchievementNames = 
{   
    XIAHOU_DUN_ID: {BASE_ACHIEVEMENT_TITLE: "One-Eye Fury", MASTER_ACHIEVEMENT_TITLE: "Cao Cao's Right Hand", CHAOS_ACHIEVEMENT_TITLE: "Eye for an Eye"},
    DIAN_WEI_ID: {BASE_ACHIEVEMENT_TITLE: "Bodyguard Supreme", MASTER_ACHIEVEMENT_TITLE: "Shield Of Wei", CHAOS_ACHIEVEMENT_TITLE: "Blood and Iron"},
    SIMA_YI_ID: {BASE_ACHIEVEMENT_TITLE: "The Cunning Strategist", MASTER_ACHIEVEMENT_TITLE: "Jin in the Shadows", CHAOS_ACHIEVEMENT_TITLE: "Architect of Ambition"},
    ZHANG_LIAO_ID: {BASE_ACHIEVEMENT_TITLE: "Hero of Hefei", MASTER_ACHIEVEMENT_TITLE: "Wei's Spearhead", CHAOS_ACHIEVEMENT_TITLE: "Rides of Glory"},
    CAO_CAO_ID: {BASE_ACHIEVEMENT_TITLE: "Hero of Chaos", MASTER_ACHIEVEMENT_TITLE: "Wei Emperor", CHAOS_ACHIEVEMENT_TITLE: "Master of Men"},
    ZHOU_YU_ID: {BASE_ACHIEVEMENT_TITLE: "Flame of Chibi", MASTER_ACHIEVEMENT_TITLE: "Wu's Orchestrator", CHAOS_ACHIEVEMENT_TITLE: "Flaming Ambition"},
    LU_XUN_ID: {BASE_ACHIEVEMENT_TITLE: "Dragon of the East", MASTER_ACHIEVEMENT_TITLE: "Young Tiger of Jiangdong", CHAOS_ACHIEVEMENT_TITLE: "Unyielding Loyalty"},
    SUN_SHANG_XIANG_ID: {BASE_ACHIEVEMENT_TITLE: "Eastern Gale", MASTER_ACHIEVEMENT_TITLE: "Flower of Wu", CHAOS_ACHIEVEMENT_TITLE: "Swift and Deadly"},
    GAN_NING_ID: {BASE_ACHIEVEMENT_TITLE: "Pirate of the Yangtze", MASTER_ACHIEVEMENT_TITLE: "Wu's Wild Card", CHAOS_ACHIEVEMENT_TITLE: "Daredevil Raider"},
    SUN_JIAN_ID: {BASE_ACHIEVEMENT_TITLE: "Conqueror of the South", MASTER_ACHIEVEMENT_TITLE: "Wu's Setting Sun", CHAOS_ACHIEVEMENT_TITLE: "Eastern Thunder"},
    ZHAO_YUN_ID: {BASE_ACHIEVEMENT_TITLE: "The Lone Rider", MASTER_ACHIEVEMENT_TITLE: "Protector of Liu Shan", CHAOS_ACHIEVEMENT_TITLE: "The Tiger of Changshan"},
    GUAN_YU_ID: {BASE_ACHIEVEMENT_TITLE: "Green Dragon Rising", MASTER_ACHIEVEMENT_TITLE: "Tiger of Shu", CHAOS_ACHIEVEMENT_TITLE: "Silent Sentinel"},
    ZHANG_FEI_ID: {BASE_ACHIEVEMENT_TITLE: "Voice of Thunder", MASTER_ACHIEVEMENT_TITLE: "Shu's Shield", CHAOS_ACHIEVEMENT_TITLE: "Chaos Incarnate"},
    ZHUGE_LIANG_ID: {BASE_ACHIEVEMENT_TITLE: "Southern Star", MASTER_ACHIEVEMENT_TITLE: "Mastermind of Shu", CHAOS_ACHIEVEMENT_TITLE: "Celestial Tactician"},
    LIU_BEI_ID: {BASE_ACHIEVEMENT_TITLE: "Tiger and Dragon", MASTER_ACHIEVEMENT_TITLE: "Heart of Shu", CHAOS_ACHIEVEMENT_TITLE: "Righteous Leader"},
    DIAO_CHAN_ID: {BASE_ACHIEVEMENT_TITLE: "Heart of the Phoenix", MASTER_ACHIEVEMENT_TITLE: "Dong Zhuo's Temptation", CHAOS_ACHIEVEMENT_TITLE: "Fateful Beauty"},
    LU_BU_ID: {BASE_ACHIEVEMENT_TITLE: "Doom of the Dynasty", MASTER_ACHIEVEMENT_TITLE: "The Lone Warrior", CHAOS_ACHIEVEMENT_TITLE: "Unstoppable Fury"},
    CAO_PI_ID: {BASE_ACHIEVEMENT_TITLE: "Son of the Dragon", MASTER_ACHIEVEMENT_TITLE: "Wei's Legacy", CHAOS_ACHIEVEMENT_TITLE: "Imperial Authority"},
    ZHANG_HE_ID: {BASE_ACHIEVEMENT_TITLE: "Twirl of Steel", MASTER_ACHIEVEMENT_TITLE: "Wei's Peacock", CHAOS_ACHIEVEMENT_TITLE: "Tactical Serpent"},
    LING_TONG_ID: {BASE_ACHIEVEMENT_TITLE: "Grace of the River", MASTER_ACHIEVEMENT_TITLE: "Shadow of Yangtze", CHAOS_ACHIEVEMENT_TITLE: "Flowing Spear"},
    TAISHI_CI_ID: {BASE_ACHIEVEMENT_TITLE: "Raging Tiger of Wu", MASTER_ACHIEVEMENT_TITLE: "Wu's Sentinel", CHAOS_ACHIEVEMENT_TITLE: "Loyal Guardian"},
    MA_CHAO_ID: {BASE_ACHIEVEMENT_TITLE: "Storm of the North", MASTER_ACHIEVEMENT_TITLE: "Shu's Protector", CHAOS_ACHIEVEMENT_TITLE: "Loyal Charger"},
    YUE_YING_ID: {BASE_ACHIEVEMENT_TITLE: "Heir of Wisdom", MASTER_ACHIEVEMENT_TITLE: "Zhuge's Legacy", CHAOS_ACHIEVEMENT_TITLE: "Secret Strategist"}
}

// List every campaign.  Note this is NOT the character ID exactly but it is in the order. 
Campaign_Data = 
{   
    XIAHOU_DUN_ID: {UNLOCK_FUNCTION: XiahouDunUnlock(), NEED_UNLOCK: false},
    DIAN_WEI_ID: {UNLOCK_FUNCTION: DianWeiUnlock(), NEED_UNLOCK: false},
    SIMA_YI_ID: {UNLOCK_FUNCTION: SimaYiUnlocked(), NEED_UNLOCK: false},
    ZHANG_LIAO_ID: {UNLOCK_FUNCTION: ZhangLiaoUnlocked(), NEED_UNLOCK: true, UNLOCK_ACHIEVEMENT_NAME: "Thunder General"},
    CAO_CAO_ID: {UNLOCK_FUNCTION: CaoCaoUnlocked(), NEED_UNLOCK: true, UNLOCK_ACHIEVEMENT_NAME: "Poet of War"},
    ZHOU_YU_ID: {UNLOCK_FUNCTION: ZhouYuUnlocked(), NEED_UNLOCK: false},
    LU_XUN_ID: {UNLOCK_FUNCTION: LuXunUnlocked(), NEED_UNLOCK: false},
    SUN_SHANG_XIANG_ID: {UNLOCK_FUNCTION: SunShangXiangUnlocked(), NEED_UNLOCK: false},
    GAN_NING_ID: {UNLOCK_FUNCTION: GangNingUnlocked(), NEED_UNLOCK: true, UNLOCK_ACHIEVEMENT_NAME: "Chaos on the Water"},
    SUN_JIAN_ID: {UNLOCK_FUNCTION: SunJianUnlocked(), NEED_UNLOCK: true, UNLOCK_ACHIEVEMENT_NAME: "Founder's Flame"},
    ZHAO_YUN_ID: {UNLOCK_FUNCTION: ZhaoYunUnlocked(), NEED_UNLOCK: false},
    GUAN_YU_ID: {UNLOCK_FUNCTION: GuanYuUnlocked(), NEED_UNLOCK: false},
    ZHANG_FEI_ID: {UNLOCK_FUNCTION: ZhangFeiUnlocked(), NEED_UNLOCK: false},
    ZHUGE_LIANG_ID: {UNLOCK_FUNCTION: ZhugeLiangUnlocked(), NEED_UNLOCK: true, UNLOCK_ACHIEVEMENT_NAME: "The Sleeping Dragon"},
    LIU_BEI_ID: {UNLOCK_FUNCTION: LiuBeiUnlocked(), NEED_UNLOCK: true, UNLOCK_ACHIEVEMENT_NAME: "Oath of the Peach Garden"},
    DIAO_CHAN_ID: {UNLOCK_FUNCTION: DiaoChanUnlocked(), NEED_UNLOCK: true, UNLOCK_ACHIEVEMENT_NAME: "Dance of Deception"},
    LU_BU_ID: {UNLOCK_FUNCTION: LuBuUnlocked(), NEED_UNLOCK: true, UNLOCK_ACHIEVEMENT_NAME: "Rage of Hulao"},
    CAO_PI_ID: {UNLOCK_FUNCTION: CaoPiUnlocked(), NEED_UNLOCK: false},
    ZHANG_HE_ID: {UNLOCK_FUNCTION: ZhangHeUnlocked(), NEED_UNLOCK: false},
    LING_TONG_ID: {UNLOCK_FUNCTION: LingTongUnlocked(), NEED_UNLOCK: false},
    TAISHI_CI_ID: {UNLOCK_FUNCTION: TaishiCiUnlocked(), NEED_UNLOCK: false},
    MA_CHAO_ID: {UNLOCK_FUNCTION: MaChaoUnlocked(), NEED_UNLOCK: false},
    YUE_YING_ID: {UNLOCK_FUNCTION: YueYingUnlocked(), NEED_UNLOCK: false}
}

AdditionalCharacter =
{
    XU_ZHU_ID: {BEAT_LEVEL_ID: BATTLE_OF_HE_FEI_WEI_FORCES_STAGE_FACTION_ID, BEAT_LEVEL_NAME:"Iron Fist of Wei" , UNLOCK_ACHIEVEMENT_NAME: "Fist of Justice"},
    XIAHOU_YUAN_ID: {BEAT_LEVEL_ID: BATTLE_OF_MT_DING_JUN_SHU_FORCES_STAGE_FACTION_ID, BEAT_LEVEL_NAME:"DingJun Assault" , UNLOCK_ACHIEVEMENT_NAME: "Mountain Breaker"},
    XU_HUANG_ID: {BEAT_LEVEL_ID: BATTLE_OF_JIE_TING_WEI_FORCES_STAGE_FACTION_ID, BEAT_LEVEL_NAME:"Jie Ting Siege" , UNLOCK_ACHIEVEMENT_NAME: "Iron Resolute"},
    CAO_REN_ID: {BEAT_LEVEL_ID: BATTLE_OF_HE_FEI_WEI_FORCES_STAGE_FACTION_ID, BEAT_LEVEL_NAME:"Iron Wall of Hefei" , UNLOCK_ACHIEVEMENT_NAME: "Castle Sentinel"},
    LU_MENG_ID: {BEAT_LEVEL_ID: BATTLE_OF_HE_FEI_SUN_JIAN_FORCES_STAGE_FACTION_ID, BEAT_LEVEL_NAME:"River Phantom" , UNLOCK_ACHIEVEMENT_NAME: "Hidden Tiger"},
    HUANG_GAI_ID: {BEAT_LEVEL_ID: BATTLE_OF_CHI_BI_ALLIED_FORCES_STAGE_FACTION_ID, BEAT_LEVEL_NAME:"Flame of Chi Bi" , UNLOCK_ACHIEVEMENT_NAME: "Inferno General"},
    ZHOU_TAI_ID: {BEAT_LEVEL_ID: CONQUEST_OF_WU_SUN_CE_FORCES_STAGE_FACTION_ID, BEAT_LEVEL_NAME:"Sun Ce's Vanguard" , UNLOCK_ACHIEVEMENT_NAME: "Master Defender"},
    SUN_CE_ID: {BEAT_LEVEL_ID: CONQUEST_OF_WU_SUN_CE_FORCES_STAGE_FACTION_ID, BEAT_LEVEL_NAME:"Conquerer's Glory" , UNLOCK_ACHIEVEMENT_NAME: "Jiangdong Conqueror"},
    SUN_QUAN_ID: {BEAT_LEVEL_ID: BATTLE_OF_HE_FEI_CASTLE_WU_FORCES_STAGE_FACTION_ID, BEAT_LEVEL_NAME:"Wu's Brightest Sun" , UNLOCK_ACHIEVEMENT_NAME: "Lion of Jiang Dong"},
    HUANG_ZHONG_ID: {BEAT_LEVEL_ID: BATTLE_OF_MT_DING_JUN_SHU_FORCES_STAGE_FACTION_ID, BEAT_LEVEL_NAME:"Iron Archer of Shu" , UNLOCK_ACHIEVEMENT_NAME: "Veteran's Resolve"},
    WEI_YAN_ID: {BEAT_LEVEL_ID: BATTLE_OF_WU_ZHANG_PLAINS_SHU_FORCES_STAGE_FACTION_ID, BEAT_LEVEL_NAME:"Candle in the Wind" , UNLOCK_ACHIEVEMENT_NAME: "Burning Spirit"},
    GUAN_PING_ID: {BEAT_LEVEL_ID: BATTLE_OF_FAN_CASTLE_SHU_FORCES_STAGE_FACTION_ID, BEAT_LEVEL_NAME:"Shadow of the Castle" , UNLOCK_ACHIEVEMENT_NAME: "Dutiful Son"},
    PANG_TONG_ID: {BEAT_LEVEL_ID: PACIFICATION_OF_CHENG_DU_LIU_BEI_FORCES_STAGE_FACTION_ID, BEAT_LEVEL_NAME:"Cunning Strike" , UNLOCK_ACHIEVEMENT_NAME: "Phoenix Rising"},
    DONG_ZHUO_ID: {BEAT_LEVEL_ID: BATTLE_OF_HU_LAO_GATE_LU_BU_FORCES_STAGE_FACTION_ID, BEAT_LEVEL_NAME:"Hulao Horror" , UNLOCK_ACHIEVEMENT_NAME: "Crimson Overlord"},
    YUAN_SHAO_ID: {BEAT_LEVEL_ID: BATTLE_OF_GUAN_DU_YUAN_SHAO_FORCES_STAGE_FACTION_ID, BEAT_LEVEL_NAME:"The Northern Lion" , UNLOCK_ACHIEVEMENT_NAME: "Northern Wrath"},
    ZHANG_JIAO_ID: {BEAT_LEVEL_ID: BATTLE_OF_WU_ZHANG_PLAINS_SHU_FORCES_STAGE_FACTION_ID, BEAT_LEVEL_NAME:"Heaven's Fury" , UNLOCK_ACHIEVEMENT_NAME: "Yellow Banner"},
    ZHEN_JI_ID: {BEAT_LEVEL_ID: INVASION_OF_XU_CHANG_WEI_FORCES_STAGE_FACTION_ID, BEAT_LEVEL_NAME:"Wu's Nightingale" , UNLOCK_ACHIEVEMENT_NAME: "Silent Beauty"},
    XIAO_QIAO_ID: {BEAT_LEVEL_ID: BATTLE_OF_SHI_TING_WEI_FORCES_STAGE_FACTION_ID, BEAT_LEVEL_NAME:"Veil of Grace" , UNLOCK_ACHIEVEMENT_NAME: "Gentle Fury"},
}

ChallengeModeData = 
{
    RAMPAGE_STAGE_CHALLENGE_ID: {WIN_TARGET: FirstPlayerKills() > 1500, WIN_ACHIEVEMENT_NAME: "Be Like the Hulk", WIN_ACHIEVEMENT_DESCRIPTION: "Earn more than 1500 kills in Rampage Challenge"},
    SUDDEN_DEATH_STAGE_CHALLENGE_ID: {WIN_TARGET: FirstPlayerKills() > 200, WIN_ACHIEVEMENT_NAME: "Glass Cannon", WIN_ACHIEVEMENT_DESCRIPTION: "Earn more than 200 kills in Sudden Death Challenge"},
    SPEED_RUN_STAGE_CHALLENGE_ID: {WIN_TARGET: FramesInBattle() > ((3)*60+30)*60, WIN_ACHIEVEMENT_NAME: "Be Like the Flash", WIN_ACHIEVEMENT_DESCRIPTION: "Complete the Speed Run Challenge in under 3 minutes"},
    HAVOC_STAGE_CHALLENGE_ID: {WIN_TARGET: FirstPlayerKills() > 200, WIN_ACHIEVEMENT_NAME: "Be Like Havoc", WIN_ACHIEVEMENT_DESCRIPTION: "Earn more than 200 kills in Havoc Challenge"},
    GAUNTLET_STAGE_CHALLENGE_ID: {WIN_TARGET: FirstPlayerKills() > 1500, WIN_ACHIEVEMENT_NAME: "Be Like Lu Bu", WIN_ACHIEVEMENT_DESCRIPTION: "Earn more than 1500 kills in Gauntlet Challenge"}
}



function IsChallengeMode(stageId) 
{
    for challengeId in ChallengeModeData
    {
        if stageId == challengeId
        {
            return true
        }
    }
    return false
}


function IsChallengeModeWithKills() => MapNameId() == RAMPAGE_STAGE_CHALLENGE_ID || MapNameId() == SUDDEN_DEATH_STAGE_CHALLENGE_ID || MapNameId() == HAVOC_STAGE_CHALLENGE_ID || MapNameId() == GAUNTLET_STAGE_CHALLENGE_ID
function IsChallengeModeWithTime() => MapNameId() == SPEED_RUN_STAGE_CHALLENGE_ID

function GeneralProtection()
{
    return isSinglePlayer() &&
           !IsInDemo() &&
           !IsInMainMenu() &&
           !IsInLoadSaveScreen()
}

function GeneralProtectionForChallenge() 
{
    return isSinglePlayer() &&
           !IsInMainMenu() &&
           !IsInLoadSaveScreen()
}


function easyleaderboard( title, description, start, value, format, lower_is_better)
{

    leaderboard(
        title = title,
        description = description,
        start = start,
        cancel = always_false(),
        submit = always_true(),
        value = value,
        format = format,
        lower_is_better = lower_is_better
    )
}

function leaderboardGenerator( StageFactionID)
{

    start_condition = 
    (
        GeneralProtection() &&
        IsInMusouModeOrFreeMode() &&
        MapNameId() == StageFactionID &&
        JustWonBattle()
    )
    
    start_condition_chaos =
    (
        start_condition &&
        DisplayDifficultSetting() == CHAOS_DIFFICULTY_VALUE
    )

    
    kill_count = FirstPlayerKills()

    time_elapsed = FramesInBattle()

    stage_name = format("{0}({1})", StageNameLookup[StageFactionID], FactionNameLookup[StageFactionID])
    
    easyleaderboard(
        title = format("Most Kills on {0}",stage_name),
        description = format("Get the most kills on {0} and win the stage", stage_name),
        start = start_condition,
        value = kill_count,
        format = "VALUE",
        lower_is_better = false
    )

    easyleaderboard(
        title = format("Most Kills on {0} - Chaos", stage_name),
        description = format("Get the most kills on {0} on Chaos and win the stage", stage_name),
        start = start_condition_chaos,
        value = kill_count,
        format = "VALUE",
        lower_is_better = false
    )

    easyleaderboard(
        title = format("Fastest Run on {0}", stage_name),
        description = format("Get through the stage {0} the fastest", stage_name),
        start = start_condition,
        value = time_elapsed,
        format = "FRAMES",
        lower_is_better = true
    )

    easyleaderboard(
        title = format("Fastest Run on {0} - Chaos", stage_name),
        description = format("Get through the stage {0} the fastest on Chaos", stage_name),
        start = start_condition_chaos,
        value = time_elapsed,
        format = "FRAMES",
        lower_is_better = true
    )
}


for stageId in StageNameLookup
{
    if IsChallengeMode(stageId) == false
    {
        leaderboardGenerator(stageId)
    }
}

ChallengeKillList = 
[
    RAMPAGE_STAGE_CHALLENGE_ID,
    SUDDEN_DEATH_STAGE_CHALLENGE_ID,
    HAVOC_STAGE_CHALLENGE_ID,
    GAUNTLET_STAGE_CHALLENGE_ID
]


for challengeId in ChallengeKillList
{
    challenge = ChallengeModeData[challengeId]
    
    start_condition = 
    (
        GeneralProtectionForChallenge() &&
        IsInChallengeMode() &&
        MapNameId() == challengeId &&
        JustFinishBattle()
    )

    
    leaderboard(
        title = format("Challenge: {0}", StageNameLookup[challengeId]),
        description = format("Kill the most enemies in {0}", StageNameLookup[challengeId]),
        start = start_condition,
        cancel = always_false(),
        submit = always_true(),
        value = FirstPlayerKills(),
        format = "VALUE",
        lower_is_better = false
    )
}

leaderboard(
    title = "Challenge: Speed Run",
    description = "Complete Speed Run as fast as possible",
    start = 
    (
        isSinglePlayer() &&
        !IsInDemo() &&
        !IsInMainMenu() &&
        IsInChallengeMode() &&
        MapNameId() == SPEED_RUN_STAGE_CHALLENGE_ID &&
        JustWonBattle()
    ),
    cancel = always_false(),
    submit = always_true(),
    value = FramesInBattle(),
    format = "FRAMES",
    lower_is_better = true
)



achievement(title = "Let's Get Xtreme!",
                description = "Beat a level, any level!",
                points = 2,
                trigger =  GeneralProtection() &&
                           IsInMusouModeOrFreeMode() &&
                           JustWonBattle(),
                type = "progression"
)

function createMusouModeAchievement(title, description, characterIndex, progression, additionalStartCondition, points)
{
    type_text = ""
    if (progression == true)
    {
        type_text = "progression"
    }
    achievement(title = title,
                description = description,
                points = points,
                trigger = IsInMusouMode() &&
                          GeneralProtection() &&
                          JustBeatMusuoMode() &&
                          FirstPlayerCharacterId() == characterIndex &&
                          WonStageCheck() && 
                          additionalStartCondition,
                type = type_text
                )
}

function BaseMusouModeAchievement(characterIndex)
{
    createMusouModeAchievement(MusouModeAchievementNames[characterIndex][BASE_ACHIEVEMENT_TITLE], 
                               format("Beat {0}'s musou mode on any difficulty", CharacterNameLookup[characterIndex]),
                               characterIndex, true, always_true(), 10)
}

function MasterMusouModeAchievement(characterIndex)
{
    createMusouModeAchievement(MusouModeAchievementNames[characterIndex][MASTER_ACHIEVEMENT_TITLE], 
                               format("Beat {0}'s musou mode on Master difficulty", CharacterNameLookup[characterIndex]),
                               characterIndex, false, DifficultySetting() >= MASTER_DIFFICULTY_VALUE, 25)
}

function ChaosMusouModeAchievement(characterIndex)
{
    title = MusouModeAchievementNames[characterIndex][CHAOS_ACHIEVEMENT_TITLE]
    for stageIndex in range(1, NUMBER_OF_MUSOU_STAGES)
    {
        romanNumerals = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X"]
        numeral = romanNumerals[stageIndex - 1]
        achievement(
            title = format("{0} {1}", title, numeral),
            description = format("Beat stage {1} of {0}'s Musou Mode on Chaos difficulty", title, stageIndex),
            points = 25,
            trigger = IsInMusouMode() &&
                      GeneralProtection() &&
                      JustBeatStageIndexForMusouMode(stageIndex) &&
                      FirstPlayerCharacterId() == characterIndex &&
                      DifficultySetting() == CHAOS_DIFFICULTY_VALUE
                      
        )
    }
}

for index in Campaign_Data
{
    BaseMusouModeAchievement(index)
}

for index in Campaign_Data
{
    MasterMusouModeAchievement(index)
}

for index in Campaign_Data
{
    ChaosMusouModeAchievement(index)
}

for stageId in StageNameLookup
{
    if IsChallengeMode(stageId) == false
    {
        achievement ( title = format("{0} - {1} complete", StageNameLookup[stageId], FactionNameLookup[stageId]),
                      description = format("Earn the three targets for {0} as the {1}", StageNameLookup[stageId], FactionNameLookup[stageId]),
                      points = 5,
                      trigger = GeneralProtection() &&
                                IsInMusouModeOrFreeMode() &&
                                WonStageCheck() &&
                                JustCompletedAllTargets(stageId)
        )
    }
}

for CharacterId in Campaign_Data
{
    if Campaign_Data[CharacterId][NEED_UNLOCK]
    {
        achievement ( title = Campaign_Data[CharacterId][UNLOCK_ACHIEVEMENT_NAME],
                      description = format("Unlock {0}", CharacterNameLookup[CharacterId]),
                      points = 3,
                      trigger = GeneralProtection() &&
                                IsInMusouModeOrFreeMode() &&
                                WonStageCheck() &&
                                justUnlockedCharacter(CharacterId)
        )
    }
}


for CharacterId in AdditionalCharacter
{
    achievement ( title = AdditionalCharacter[CharacterId][UNLOCK_ACHIEVEMENT_NAME],
                      description = format("Unlock {0}", CharacterNameLookup[CharacterId]),
                      points = 3,
                      trigger = GeneralProtection() &&
                                IsInMusouModeOrFreeMode() &&
                                WonStageCheck() &&
                                justUnlockedCharacter(CharacterId)
        )
}

for CharacterId in AdditionalCharacter
{
    achievement ( title = AdditionalCharacter[CharacterId][BEAT_LEVEL_NAME],
                      description = format("Beat {0}({1}) on Master difficulty as {2} while beating all three targets", 
                                           StageNameLookup[AdditionalCharacter[CharacterId][BEAT_LEVEL_ID]],
                                           FactionNameLookup[AdditionalCharacter[CharacterId][BEAT_LEVEL_ID]],
                                           CharacterNameLookup[CharacterId]),
                      points = 10,
                      trigger = GeneralProtection() &&
                                IsInMusouModeOrFreeMode() &&
                                trigger_when(JustWonBattle()) &&
                                DisplayDifficultSetting() >= MASTER_DIFFICULTY_VALUE &&
                                MapNameId() == AdditionalCharacter[CharacterId][BEAT_LEVEL_ID] &&
                                FirstPlayerCharacterId() == CharacterId &&
                                CountMissionTargets() == 3
        )
}

for characterId in CharacterNameLookup
{
    achievement( title = format("Fully Dressed: {0}", CharacterNameLookup[characterId]),
                 description = format("Reach level 25 with {0}", CharacterNameLookup[characterId]),
                 points = 5,
                 trigger = GeneralProtection() &&
                           IsInMusouModeOrFreeMode() &&
                           WonStageCheck() &&
                           FirstPlayerCharacterId() == characterId &&
                           GetCharacterLevel(characterId) >= OUTFIT_UNLOCK_LEVEL && prev(GetCharacterLevel(characterId)) < OUTFIT_UNLOCK_LEVEL
    )
}

achievement(title = "Combo Master",
            description = "Hit a 3000 hit combo",
            points = 10,
            trigger = GeneralProtection() &&
                      IsInMusouModeFreeModeOrChallengeMode() &&
                      JustHitComboNumber(3000)
)

function horseChecker(kingId)
{
    returnValue = always_false()
    for index in range(0, NUMBER_OF_HORSES - 1)
    {
        returnValue = returnValue || (GetHorseTitle(index) == kingId && 
                                       prev(GetHorseTitle(index)) != kingId)
    }
    return returnValue
}

for kingId in KingTitleLookup
{
    achievement( title = KingAchievementTitleLookup[kingId],
                 description = format("Raise a horse worthy of the {0} title", KingTitleLookup[kingId]),
                 points = 25,
                 trigger = GeneralProtection() &&
                           IsInMusouModeFreeModeOrChallengeMode() &&
                           horseChecker(kingId)
    )
}

for challengeId in ChallengeModeData
{
    target = always_true()
    if challengeId == SPEED_RUN_STAGE_CHALLENGE_ID
    {
        target = target && ChallengeModeData[challengeId][WIN_TARGET] && FramesInBattle() < ((3)*60+30)*60
    }
    else
    {
        target = target && ChallengeModeData[challengeId][WIN_TARGET] && JustFinishBattle() 
    }


    achievement( title = ChallengeModeData[challengeId][WIN_ACHIEVEMENT_NAME],
                 description = ChallengeModeData[challengeId][WIN_ACHIEVEMENT_DESCRIPTION],
                 points = 5,
                 trigger = GeneralProtectionForChallenge() &&
                           IsInChallengeMode() &&
                           MapNameId() == challengeId &&
                           target
    )
}

rich_presence_conditional_display(IsInMainMenu(), "Main Menu")
rich_presence_conditional_display(IsInDemo(), "Watching the Demos")
rich_presence_conditional_display(IsChallengeModeWithKills(), "Challenge Mode: {0} Score: {1} Character: {2}",
                                  rich_presence_lookup("Stage", MapNameId(), StageNameLookup),
                                  rich_presence_value("Number", FirstPlayerKills() ),
                                  rich_presence_lookup("Character", FirstPlayerCharacterId(), CharacterNameLookup))

rich_presence_conditional_display(IsChallengeModeWithTime(), "Challenge Mode: {0} Time: {1} Character: {2}",
                                  rich_presence_lookup("Stage", MapNameId(), StageNameLookup),
                                  rich_presence_value("Frames", FramesInBattle()),
                                  rich_presence_lookup("Character", FirstPlayerCharacterId(), CharacterNameLookup))

rich_presence_conditional_display(IsInFreeMode(), "Free Mode: Character: {0} Stage: {1}({2}) Difficulty: {3}",
                                  rich_presence_lookup("Character", FirstPlayerCharacterId(), CharacterNameLookup),
                                  rich_presence_lookup("Stage", MapNameId(), StageNameLookup),
                                  rich_presence_lookup("Faction", MapNameId(), FactionNameLookup),
                                  rich_presence_lookup("Difficulty", DisplayDifficultSetting(), DifficultyNameLookup))

rich_presence_conditional_display(IsInMusouMode(), "Musou Mode: Character: {0} Stage: {1}({2}) Difficulty: {3}",
                                  rich_presence_lookup("Character", FirstPlayerCharacterId(), CharacterNameLookup),
                                  rich_presence_lookup("Stage", MapNameId(), StageNameLookup),
                                  rich_presence_lookup("Faction", MapNameId(), FactionNameLookup),
                                  rich_presence_lookup("Difficulty", DisplayDifficultSetting(), DifficultyNameLookup))

rich_presence_display("Is In Menus")



// Horses 