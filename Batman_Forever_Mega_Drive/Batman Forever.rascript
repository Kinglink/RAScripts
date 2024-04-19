// Batman Forever
// #ID = 28

// $C564: (8-bit) Current level
//        
//        If this is higher than 0x00c568 you auto advance to the next level, but report that you also beat that level *shrug*
//        
//        Updates after you choose your weapons for the next level.
function currentLevel() => byte(0x00C564)

// $C566: (8-bit) "Current Scene"
//        
//        Which scene is loaded and playing, similar to Next Scene most of the time.
//        0x00 = Scene 1
//        
//        Final Scene Level 1 0x0b
//        Final Scene Level 2 0x0e
//        Final Scene Level 3 0x07
//        Final Scene Level 4 0x0d
//        Final Scene Level 5 0x04
//        Final Scene Level 6 0x0a (Higher values were seen)
//        Final Scene Level 7 0x04 (Note 0x05 is greetings 0x06 = ending credits I believe)
//        Final Scene Level 8 0x06
//        0xff = Intro or ending
//        
//        NOTE: Not all scenes are sequencial, many are alternate paths.
function currentScene() => byte(0x00C566)

// $C568: (8-bit) Next Level
//        
//        0x00 = Level 1
//        0x07 = Final Level
//        0x08 = Won game.
//        0x00 =  End Game.
//        
//        Changes at the end of the level (Before score accruing)
function nextLevel() => byte(0x00C568)

function beatLevel(level) => nextLevel() == level && prev(nextLevel()) == level - 1

// $C56A: (8-bit) "Next Scene"
//        
//        Which scene is going to get loaded and play.
function nextScene() => byte(0x00C56A)

// 0x00c56c: (8-bit) State Machine
//
//          0x00-0x01 = Loading into a new stage. 
//          0x04 = Gameplay
//          0x05 = Paused  or post stage screen
//          0x06 = Main Menu
//          0x09 = Game Over
//          0x0b = Demo mode
//          0x0c = Credits
//          0x0d = Loading post stage screen
function stateMachine() => byte(0x00C56C)
GAMEPLAY_VALUE = 0x04
PAUSED_VALUE = 0x05
GAME_OVER_VALUE = 0x09
POST_STAGE_SCREEN_VALUE = 0x0d

function isGameplayRunning() => stateMachine() == GAMEPLAY_VALUE
function RPisGameplayActive() => stateMachine() == GAMEPLAY_VALUE || stateMachine() == PAUSED_VALUE
function RPisPostStageScreen() => stateMachine() == POST_STAGE_SCREEN_VALUE || prior(stateMachine()) == POST_STAGE_SCREEN_VALUE

// $C580: (256-bit bitfield) Health boxes picked up in the level
//        Will look at 192-bit for level 1.  More on level 2.
//        
//        Total Level 1 = 23
//        Total Level 2 = 39
//        Total Level 3 = 34
//        Total Level 4 = 43
//        Total Level 5 = 16
//        Total Level 6 = 50
//        Total Level 7 = 22
//        Total Level 8 = 31
PICKUP_BIT_FIELD_MEMORY_LOCATION = 0x00C580
function pickupBitField() => byte(PICKUP_BIT_FIELD_MEMORY_LOCATION)

function countPickups(bits) => sum_of(range(0,bits - 1), index => bit(index%8,PICKUP_BIT_FIELD_MEMORY_LOCATION + index/8))
// $C5E0: (256-bit bitfield) Enemies killed in the level.
//        
//        Total Level 1 = 34
//        Total Level 2 = 64
//        Total Level 3 = 37
//        Total Level 4 = 65
//        Total Level 5 = 42
//        Total Level 6 = 61
//        Total Level 7 = 33
//        Total Level 8 = 31
ENEMY_BIT_FIELD_MEMORY_LOCATION = 0x00C5E0
function enemiesBitField() => byte(ENEMY_BIT_FIELD_MEMORY_LOCATION)

function countEnemyBeaten(bits) => sum_of(range(0,bits - 1), index => bit(index%8,ENEMY_BIT_FIELD_MEMORY_LOCATION + index/8))
function countEnemyJustBeaten() => tally_of(range(0,256), 0,  index => bit(index%8,ENEMY_BIT_FIELD_MEMORY_LOCATION + index/8) == 1 && prev(bit(index%8,ENEMY_BIT_FIELD_MEMORY_LOCATION + index/8)) == 0)
// $C600: (256-bit bitfield) Secret Areas found in the level.
//        
//        Tested the length.
//        
//        Total Level 1 Secret Areas = 9
//        Total Level 2 Secret Areas = 2
//        Total Level 3 Secret Areas = 6
//        Total Level 4 Secret Areas = 12
//        Total Level 5 Secret Areas = 0 (Not shown)
//        Total Level 6 Secret Areas  = 10
//        Total Level 7 Secret Areas = 4
//        Total Level 8 Secret Areas = 2
SECRET_AREA_BIT_FIELD_MEMORY_LOCATION = 0x00C600
function secretAreasBitfield() => byte(SECRET_AREA_BIT_FIELD_MEMORY_LOCATION)

function countSecretAreas(bits) => sum_of(range(0,bits - 1), index => bit(index%8,SECRET_AREA_BIT_FIELD_MEMORY_LOCATION + index/8))


// $D9D4: (8-bit) Lives
//        
//        0x00 = (final life)
//        0x06= Starting lives left.
//        
//        Control value.
function totalLives() => byte(0x00D9D4)

// $E6FC: (8-bit) Display Health
//        
//        See 0x00e916 for real value.  This is only what is displayed it will Lerp down)
function displayHealth() => byte(0x00E6FC)

// $E85A: (16-bit BE ) Attack Used
//        
//        0x00f0 = Batman Throw bomb
//        0x0ef2 = Batman High Kick
//        0x1a02 = Batman Slippery Goo
//        0x1cf6 = Batman Ducking Back Punch
//        0x20ef = Batman Batarang Thrown
//        0x3802 = Batman Sticky Goo
//        0x3ef1 = Batman Bat Cuffs
//        0x46f0 = Batman Bola thrown
//        0x48f6 = Batman Ducking High Kick
//        0x4aef = Batman Cape Morph
//        0x50f2 = Batman Back kick
//        0x50f7 = Batman Rolling attack
//        0x5afb = Batman Standing Guard
//        0x66f0 = Batman Electric shot
//        0x6af1 = Batman Rocket Boots
//        0x74ee = Batman High Punch
//        0x7cf2 = Batman Roundkick
//        0x86f9 = Batman Grappling hook up
//        0x88fe = Batman Ducking Back Kick
//        0x90f0 = Batman Flash Pellet
//        0x96f9 = Batman Grappling Hook
//        0xa0f1 = Batman Kick
//        0xa6f6 = Batman Sweep kick
//        0xb0f0 = Batman Force Wall
//        0xb6ef = Batman Homing Batarang
//        0xccf0 = Batman Gas Attack
//        0xd2f5 = Batman Ducking Guard
//        0xe0ef = Batman Bat Smoke
//        0xe2f6 = Batman Upper Cut
//        0xf4ee = Batman Back Punch
//        0x2af9 = Batman Head cracker (2 enemies grab)
//        0x2cf8 = Batman Grab and Headbutt
//        
//        0x3844 = Robin Low Punch
//        0x7e4d = Robin Upper Cut
//        0xb844 = Robin High Punch
//        0x0452 = Robin Block
//        0x3448 = Robin Kick
//        0x424d = Robin Sweep Attack
//        0x6445 = Robin Batarang
//        0x3846 = Robin Bat Bola
//        0x3845 = Robin Back Punch
//        0x0c47 = Robin Staff Charge
//        0x8a45 = Robin Electro Shield
//        0xc245 = Robin Homing Batarang
//        0x9e47 = Robing Traquilizer Dart
//        0xe845 = Robin Smoke Pellet
//        0xec47 = Robin Sonic Blast Weapon
//        0xee58 = Robin Sticky Goo
//        0x1048 = Robin Heat Gun
//        0x5c47 = Robin Electro Staff Prod
//        0xc247 = Robin Wrist Rivets
//        0xb046 = Robin Bat Cuffs
//        0xd646 = Robin Rocket Boots
//        0xc84f = Robin Head cracker
//        
//        0xfc99 = Inmate Pepper Spray
//        0x3c99 = Inmate Knife Hurl (really stick)
//        0x4698 = Inmate Sparky
//        0x449a = Inmate Stampede
//        0xea97 = Inmate Grab n Throw
//        
//        0xf8de = Clown Pedal Power
//        0xa6e0 = Clown Cartwheel
//        0xbae1 = Clown Sticky Spit
//        0x9aee = Clown Circus Spin
//        0xfae1 = Clown Horn
//        0x1adf = Clown Skip Rock Bomb
//        0x90e5 = Clown Smash Jump
//        
//        0x522c = Thug 1 Chainsaw Blast
//        0xb42e = Thug 1 Chainsaw Rip
//        0x3a27 = Thug 1 Homestyle Bomb
//        0xde27 = Thug 1 Here 'n There
//        0xea2d = Thug 1 Motosaw
//        0x0e2f = Thug 1 Pin
//        
//        
//        
//        0x82b2 = Riddler Thug Electroshield
//        0xe4ab = Riddler Thug Balloon Bomb
//        0x56ab = Riddler Thug Portable Hole
//        0x80b0 = Riddler Thug Stick 'n Reel
//        0xfaa0 = Riddler Thug Acid Rain
//        0x8eae = Riddler Thug No-See-Um
//        
//        0xc6f0 = Sugar/Spice Jump Warp
//        0x28ed = Sugar/Spice Pipe Bomb
//        0xb2ed = Sugar/Spice Handcuffs
//        0xbcef = Sugar/Spice Slash 'n Whirl
//        0x20f1 = Sugar/Spice Warp Kick
//        
//        
//        0xea62 = Two Face Kickflip
//        0x529f = Two Face Cut-Cut
//        0x305f = Two Face Skidtrap
//        0x029f = Two Face Buzzsaw
//        
//        0x085e = Thug 2 Puff 'o Fire
//        0xba5e = Thug 2 Ground Roaster
//        0xe865 = Thug 2 Slash
//        0xe86d = Thug 2 Shuriken Blast
//        0xa65d = Thug 2 Hot Air
//        0xf460 = Thug 2 Shuriken Rain
function playerOneAttack() => word_be(0x00E85A)

BATMAN_BATARANG = 0x20ef
BATMAN_SONIC_PULSE_GLOBE = 0x1a02
BATMAN_SMOKE_PELLET = 0xe0ef
BATMAN_CAPE_MORPH = 0x4aef
BATMAN_FLASH_PELLET = 0x90f0
BATMAN_GAS = 0xccf0
BATMAN_SLIPPERY_GOO = 0x1a02
BATMAN_BAT_BOLA = 0x46f0
BATMAN_ELECTRIC_PELLET = 0x66f0
BATMAN_FORCE_WALL = 0xb0f0
BATMAN_STICKY_GOO = 0x3802
BATMAN_THROW_BOMB = 0x00f0

BATMAN_BAT_CUFFS = 0x3ef1
BATMAN_HOMING_BATARANG = 0xb6ef
BATMAN_ROCKET_BOOTS = 0x6af1
BATMAN_HOLOGRAPH_DECOY = 0x16f1

BATMAN_HEAD_CRACKER = 0x2af9

ROBIN_BATARANG = 0x6445
ROBIN_STAFF_CHARGE = 0x0c47
ROBIN_SMOKE_PELLET = 0xe845
ROBIN_ELECTRO_SHIELD = 0x8a45
ROBIN_TRANQUILIZER_DART = 0x9e47
ROBIN_SONIC_BLAST_WEAPON = 0xec47
ROBIN_SLIPPERY_GOO = 0xee58
ROBIN_BAT_BOLA = 0x3846
ROBIN_ELECTRO_STAFF_PROD = 0x5c47
ROBIN_WRIST_RIVETS = 0xc247
ROBIN_HEAT_GUN = 0x1048

ROBIN_BAT_CUFFS = 0xb046
ROBIN_HOMING_BATARANG = 0xc245
ROBIN_ROCKET_BOOTS = 0xd646
ROBIN_HOLOGRAPH_DECOY = 0x8846

ROBIN_HEAD_CRACKER = 0xc84f

INMATE_PEPPER_SPRAY = 0xfc99
INMATE_KNIFE_HURL = 0x3c99 // Technically a night stick
INMATE_SPARKY = 0x4698
INMATE_STAMPEDE = 0x449a
INMATE_GRAB_THROW = 0xea97

CLOWN_PEDAL_POWER = 0xf8de
CLOWN_CARTWHEEL = 0xa6e0
CLOWN_STICKY_SPIT = 0xbae1
CLOWN_CIRCUS_SPIN = 0x9aee
CLOWN_HORN = 0xfae1
CLOWN_SKIP_ROCK_BOMB = 0x1adf
CLOWN_SMASH_JUMP = 0x90e5

THUG1_CHAINSAW_BLAST = 0x522c
THUG1_CHAINSAW_RIP = 0xb42e
THUG1_HOMESTYLE_BOMB = 0x3a27
THUG1_HERE_N_THERE = 0xde27
THUG1_MOTOSAW = 0xea2d
THUG1_PIN = 0x0e2f

RIDDLER_THUG_ELECTROSHIELD = 0x82b2
RIDDLER_THUG_BALLOON_BOMB = 0xe4ab
RIDDLER_THUG_PORTABLE_HOLE = 0x56ab
RIDDLER_THUG_STICK_N_REEL = 0x80b0
RIDDLER_THUG_ACID_RAIN = 0xfaa0
RIDDLER_THUG_NO_SEE_UM = 0x8eae

SUGAR_SPICE_JUMP_WARP = 0xc6f0
SUGAR_SPICE_PIPE_BOMB = 0x28ed
SUGAR_SPICE_HANDCUFFS = 0xb2ed
SUGAR_SPICE_SLASH_N_WHIRL = 0xbcef
SUGAR_SPICE_WARP_KICK = 0x20f1

TWO_FACE_KICKFLIP = 0xea62
TWO_FACE_CUT_CUT = 0x529f
TWO_FACE_SKIDTRAP = 0x305f
TWO_FACE_BUZZSAW = 0x029f

THUG2_PUFF_O_FIRE = 0x085e
THUG2_GROUND_ROASTER = 0xba5e
THUG2_SLASH = 0xe865
THUG2_SHURIKEN_BLAST = 0xe86d
THUG2_HOT_AIR = 0xa65d
THUG2_SHURIKEN_RAIN = 0xf460


batmanGadgets =
[
    BATMAN_BATARANG,
    BATMAN_SONIC_PULSE_GLOBE,
    BATMAN_SMOKE_PELLET,
    BATMAN_CAPE_MORPH,
    BATMAN_FLASH_PELLET,
    BATMAN_GAS,
    BATMAN_SLIPPERY_GOO,
    BATMAN_BAT_BOLA,
    BATMAN_ELECTRIC_PELLET,
    BATMAN_FORCE_WALL,
    BATMAN_STICKY_GOO,
    BATMAN_THROW_BOMB
]

robinGadgets =
[
    ROBIN_BATARANG,
    ROBIN_STAFF_CHARGE,
    ROBIN_SMOKE_PELLET,
    ROBIN_ELECTRO_SHIELD,
    ROBIN_TRANQUILIZER_DART,
    ROBIN_SONIC_BLAST_WEAPON,
    ROBIN_SLIPPERY_GOO,
    ROBIN_BAT_BOLA,
    ROBIN_ELECTRO_STAFF_PROD,
    ROBIN_WRIST_RIVETS,
    ROBIN_HEAT_GUN
 ]

headClunker = [BATMAN_HEAD_CRACKER, ROBIN_HEAD_CRACKER]

inmateAttacks =
[
    INMATE_PEPPER_SPRAY,
    INMATE_KNIFE_HURL,
    INMATE_SPARKY,
    INMATE_STAMPEDE,
    INMATE_GRAB_THROW
]

clownAttacks =
[
    CLOWN_PEDAL_POWER,
    CLOWN_CARTWHEEL,
    CLOWN_STICKY_SPIT,
    CLOWN_CIRCUS_SPIN,
    CLOWN_HORN,
    CLOWN_SKIP_ROCK_BOMB,
    CLOWN_SMASH_JUMP
]

thug1Attacks =
[
    THUG1_CHAINSAW_BLAST,
    THUG1_CHAINSAW_RIP,
    THUG1_HOMESTYLE_BOMB,
    THUG1_HERE_N_THERE,
    THUG1_MOTOSAW,
    THUG1_PIN
]

riddlerThugAttacks =
[
    RIDDLER_THUG_ELECTROSHIELD,
    RIDDLER_THUG_BALLOON_BOMB,
    RIDDLER_THUG_PORTABLE_HOLE,
    RIDDLER_THUG_STICK_N_REEL,
    RIDDLER_THUG_ACID_RAIN,
    RIDDLER_THUG_NO_SEE_UM
]

sugarAttacks =
[
    SUGAR_SPICE_JUMP_WARP,
    SUGAR_SPICE_PIPE_BOMB,
    SUGAR_SPICE_HANDCUFFS,
    SUGAR_SPICE_SLASH_N_WHIRL,
    SUGAR_SPICE_WARP_KICK
]

twoFaceAttacks =
[
    TWO_FACE_KICKFLIP,
    TWO_FACE_CUT_CUT,
    TWO_FACE_SKIDTRAP,
    TWO_FACE_BUZZSAW
]

thug2Attacks =
[
    THUG2_PUFF_O_FIRE,
    THUG2_GROUND_ROASTER,
    THUG2_SLASH,
    THUG2_SHURIKEN_BLAST,
    THUG2_HOT_AIR,
    THUG2_SHURIKEN_RAIN
] 

// doesn't count Batarang or the staff charge/bomb throw
storyModeGadgets =
[
    BATMAN_SONIC_PULSE_GLOBE,
    BATMAN_SMOKE_PELLET,
    BATMAN_CAPE_MORPH,
    BATMAN_FLASH_PELLET,
    BATMAN_GAS,
    BATMAN_SLIPPERY_GOO,
    BATMAN_BAT_BOLA,
    BATMAN_ELECTRIC_PELLET,
    BATMAN_FORCE_WALL,
    BATMAN_STICKY_GOO,
    ROBIN_SMOKE_PELLET,
    ROBIN_ELECTRO_SHIELD,
    ROBIN_TRANQUILIZER_DART,
    ROBIN_SONIC_BLAST_WEAPON,
    ROBIN_SLIPPERY_GOO,
    ROBIN_BAT_BOLA,
    ROBIN_ELECTRO_STAFF_PROD,
    ROBIN_WRIST_RIVETS,
    ROBIN_HEAT_GUN,
    BATMAN_BAT_CUFFS, 
    ROBIN_BAT_CUFFS,
    BATMAN_HOMING_BATARANG, 
    ROBIN_HOMING_BATARANG,
    BATMAN_ROCKET_BOOTS, 
    ROBIN_ROCKET_BOOTS,
    BATMAN_HOLOGRAPH_DECOY,
    ROBIN_HOLOGRAPH_DECOY
    
]

function usedGadget()
{
    return any_of(storyModeGadgets, gadget => playerOneAttack() == gadget)
}

// $E90D: (8-bit) Menu Screen
// 
//          0x19 = Possibly entering Loadout. 
//          0x1a = Loadout
//          0x1b = Weapon Choice (Which Weapon)
//          0x21 = Choose your player
//          0x22 = Choose your opponent
//          0x2d = Continue in Training/opening of Main Menu
//          0x2e = Main Menu
//          0x2f = Cheat Main Menu 

function menuScreen() => byte(0x00E90D)

CHOSE_YOUR_PLAYER_VALUE = 0x21
MAIN_MENU_VALUE = 0x2e

function startChoseYourPlayer() => menuScreen() == CHOSE_YOUR_PLAYER_VALUE && prev(menuScreen()) != CHOSE_YOUR_PLAYER_VALUE
function gameOverTraining() => menuScreen() == MAIN_MENU_VALUE

// $E916: (8-bit) Player's Health
//        
//        Health for player.
//        
//        0x50 max health.
//        0x00 Death
function playerHealth() => byte(0x00E916)

// $EA2A: (8-bit) Enemy 2's Health
//        
//        Right side enemy.
//        
//        0x00 = Death.
//        Starting value will change
function enemyTwoHealth() => byte(0x00EA2A)

// $EAB2: (8-bit) Chosen Character
//        
//        0x00 = Batman
//        0x02 = Robin
//        0x04 = Inmate
//        0x06 = Clown
//        0x08 = Thug 1
//        0x0a = Thug 2
//        0x0c = Riddler Thug
//        0x0e = Sugar
//        0x12 = Two-Face
//        
//        Note: also at 0x00eab4
function chosenCharacter() => byte(0x00EAB2)

BATMAN_CHARACTER_VALUE = 0x00
ROBIN_CHARACTER_VALUE = 0x02
INMATE_CHARACTER_VALUE = 0x04
CLOWN_CHARACTER_VALUE = 0x06
THUG1_CHARACTER_VALUE = 0x08
THUG2_CHARACTER_VALUE = 0x0a
RIDDLER_THUG_CHARACTER_VALUE = 0x0c
SUGAR_CHARACTER_VALUE = 0x0e
TWO_FACE_CHARACTER_VALUE = 0x12

function playerIsBatman() => chosenCharacter() == BATMAN_CHARACTER_VALUE
function playerIsRobin() => chosenCharacter() == ROBIN_CHARACTER_VALUE
function playerIsInmate() => chosenCharacter() == INMATE_CHARACTER_VALUE
function playerIsClown() => chosenCharacter() == CLOWN_CHARACTER_VALUE
function playerIsThug1() => chosenCharacter() == THUG1_CHARACTER_VALUE
function playerIsThug2() => chosenCharacter() == THUG2_CHARACTER_VALUE
function playerIsRiddlerThug() => chosenCharacter() == RIDDLER_THUG_CHARACTER_VALUE
function playerIsSugar() => chosenCharacter() == SUGAR_CHARACTER_VALUE
function playerIsTwoFace() => chosenCharacter() == TWO_FACE_CHARACTER_VALUE


// $EAB6: (8-bit) Character selection on Character selection screen.
//        
//        Training has you choose twice.
//        
//        0x00 = Batman
//        0x02 = Robin
//        0x04 = Inmate
//        0x06 = Clown
//        0x08 = Thug 1
//        0x0a = Thug 2
//        0x0c = Riddler Thug
//        0x0e = Sugar
//        0x12 = Two-Face
//function characterSelection() => byte(0x00EAB6)

// $F838: (8-bit) Training Level
//        
//        0x00 = Level 1
//        0x0f = Level 16
//        0x10 = Won
function trainingLevel() => byte(0x00F838)
FINAL_TRAINING_LEVEL = 0x0f
WON_TRAINING_LEVEL = 0x10

function wonTrainingLevel() => trainingLevel() == WON_TRAINING_LEVEL && prev(trainingLevel()) == FINAL_TRAINING_LEVEL

// $FA24: (8-bit)  In Game Check
//        
//        0x00 = In Front end/character select
//        0x08 = In Game
function inGameCheck() => byte(0x00FA24)
IN_GAME_VALUE = 0x08
NOT_IN_GAME_VALUE = 0x00

// Just in case the game changes that value.
function isInGame() => inGameCheck() != NOT_IN_GAME_VALUE
function wasInGame() => prev(inGameCheck()) == IN_GAME_VALUE



// $FB90: (8-bit) Cheat code on main menu progress.
//        
//        0xfe = Normal
//        0x00 = Left
//        0x02 = Up
//        Increments by 2 up to
//        0x0a = Cheat menu open
//        
//        Note:  returns to 0x0fe after leaving that menu.
function cheatCode() => byte(0x00FB90)
CHEAT_CODE_USED = 0x0a

function isCheatCodeUsed() => cheatCode() == CHEAT_CODE_USED

// $FBAA: (8-bit) Game Mode
//        
//        0x00 = Game mode
//        0x01 = Training Mode
function gameMode() => byte(0x00FBAA)
STORY_MODE_VALUE = 0x00
TRAINING_MODE_VALUE = 0x01

function isStoryMode() => gameMode() == STORY_MODE_VALUE
function isTrainingMode() => gameMode() == TRAINING_MODE_VALUE

// $FBAC: (8-bit) Players
//        
//        0x00 = 1 Player (only acceptable value)
//        0x01 = Cooperative Duo
//        0x02 = Competitive Duo
function numberOfPlayers() => byte(0x00FBAC)

ONE_PLAYER_VALUE = 0x00

function isOnePlayer() => numberOfPlayers() == ONE_PLAYER_VALUE

// $FBB0: (8-bit) Control Method 1/2 from main menu.
//        
//        0x00 = Control Method 1
//        0x01 = Control Method 2
//        
//        Honestly I don't know what that means, nor do I care.
function controlMethod() => byte(0x00FBB0)

// $FBB2: (8-bit) Music On/Off from main menu
//        
//        0x00 = Music On
//        0x01 = Music Off
function music() => byte(0x00FBB2)

// $FBB4: (8-bit) Game Difficulty)
//        
//        0x00 = Easy
//        0x01 = Medium (default)
//        0x02 = Hard
function gameDifficulty() => byte(0x00FBB4)

EASY_DIFFICULTY_VALUE = 0x00
MEDIUM_DIFFICULTY_VALUE = 0x01
HARD_DIFFICULTY_VALUE = 0x02

// technically >= MEDIUM_DIFFICULTY_VALUE but mathmatically that's != 0
function isNormalDifficultyOrHarder() => gameDifficulty() != EASY_DIFFICULTY_VALUE
function isHardDifficulty() => gameDifficulty() == HARD_DIFFICULTY_VALUE

// $FBB6: (8-bit) Level Selection from Cheat Menu.
//        
//        0x00 = Only valid number.
//        
//        Goes up to 0x07 (Level 8)
function cheatLevelSelection() => byte(0x00FBB6)

VALID_CHEAT_VALUE = 0x00
function isUsingCheatLevelSelection() => cheatLevelSelection() != VALID_CHEAT_VALUE

// $FBB8: (8-bit) Scene Selection from Cheat Menu.
//        
//        0x00 = Only valid number.
//        
//        Goes up to 0x0f Scene 16)  Note if the scene doesn't exist it appears to go back to the main menu (at least on level 8 it does)
function cheatSceneSelection() => byte(0x00FBB8)

function isUsingCheatSceneSelection() => cheatSceneSelection() != VALID_CHEAT_VALUE

// $FBBA: (8-bit) Pres Text from Cheat Menu.
//        
//        0x00 = Only valid number.
//        
//        Technically it's just the opening cutscene.
function cheatPresText() => byte(0x00FBBA)

function isUsingCheatPresText() => cheatPresText() != VALID_CHEAT_VALUE

// $FBBC: (8-bit) Normal or Easy Kill on Cheat Menu.
//        
//        0x00 = Normal Kill, only acceptable value.
//        
//        Easy kill makes everything spawn with 0 life.
function cheatEasyKill() => byte(0x00FBBC)

function isUsingCheatEasyKill() => cheatEasyKill() != VALID_CHEAT_VALUE

// $FBBE: (8-bit) Number of weapons from Cheat Menu
//        
//        0x00 = Two Weapons, only acceptable option.
//        0x01 = All Weapons
//        
//        (Can Batman/Robin use more than the two weapons they can equip?)
function cheatWeapons() => byte(0x00FBBE)

function isUsingCheatWeapons() => cheatWeapons() != VALID_CHEAT_VALUE

// $FBC0: (8-bit) Pause Cheat option in Cheat Menu
//        
//        0x00 = Off (only acceptable option)
//        0x01 = On
//        
//        If you pause the game and hit B you kill all the enemies.
//        If you pause the game and hit C  you go back to the Title Screen.
function cheatPauseCheat() => byte(0x00FBC0)

function isUsingCheatPauseCheat() => cheatPauseCheat() != VALID_CHEAT_VALUE

function isUsingAnyCheat() => isUsingCheatLevelSelection() || 
                              isUsingCheatSceneSelection() || 
                              isUsingCheatPresText() || 
                              isUsingCheatEasyKill() || 
                              isUsingCheatWeapons() || 
                              isUsingCheatPauseCheat()

function achievementsAllowed() => !isUsingAnyCheat() && isInGame() && isOnePlayer()

function achievementsAllowedMaybeInGame() => !isUsingAnyCheat() && isOnePlayer()

// we'll go 1-index because of a function I use, and display. 
FIRST_LEVEL = 0x01
LAST_LEVEL = 0x08

function startStoryGame() => startChoseYourPlayer() && isStoryMode()
function beatGame() => beatLevel(LAST_LEVEL)
function gameOverStory() => stateMachine() == GAME_OVER_VALUE


TITLE = "TITLE"
STAGE = "STAGE"
ITEMS = "ITEMS"
ENEMIES = "ENEMIES"
SECRET_AREAS = "SECRET AREAS"
FINISHED_LEVEL_VALUE = "FINISHED_LEVEL_VALUE"
NAME = "NAME"
CHARACTER = "CHARACTER"
GADGETS = "GADGETS"
CHECKER = "CHECKER"
GLITCHED_PICKUPS = "GLITCHED_PICKUPS"
BITS = "BITS"

// The "BITS" are math, I could calculate them, but this is more representative of what the values are.  Such as The circus is a full row (128) + 2 more bytes (16)
levelAchievementData =
[
    {
        TITLE: "Arkham Asylum", 
        STAGE: 0x01, 
        ITEMS: 23,
        ENEMIES: 34,
        SECRET_AREAS: 9,
        FINISHED_LEVEL_VALUE: 3,
        GLITCHED_PICKUPS: false,
        BITS: 196
    },
    {
        TITLE: "Second Bank of Gotham City",
        STAGE: 0x02,
        ITEMS: 38, // one is bugged
        ENEMIES: 65,
        SECRET_AREAS: 2,
        FINISHED_LEVEL_VALUE: 3,
        GLITCHED_PICKUPS: false,
        BITS: 240
    },
    {
        TITLE: "The Circus",
        STAGE: 0x03,
        ITEMS: 33, // one is bugged
        ENEMIES: 37,
        SECRET_AREAS: 6,
        FINISHED_LEVEL_VALUE: 4,
        GLITCHED_PICKUPS: true,
        BITS: (128 + 16)
    },
    {
        TITLE: "Two-Face's Hideout: Warehouse",
        STAGE: 0x04,
        ITEMS: 42, // 1 Is Bugged
        ENEMIES: 61,
        SECRET_AREAS: 12,
        FINISHED_LEVEL_VALUE: 4,
        GLITCHED_PICKUPS: false,
        BITS: (256 - 32)
    },
    {
        TITLE: "Ritz Gotham",
        STAGE: 0x05,
        ITEMS: 13, // 3 are bugged (Damn!)
        ENEMIES: 42,
        SECRET_AREAS: 0,
        FINISHED_LEVEL_VALUE: 5,
        GLITCHED_PICKUPS: false,
        BITS: (10 * 8)
    },
    {
        TITLE: "Abandoned Subway Station",
        STAGE: 0x06,
        ITEMS: 50,
        ENEMIES: 61,
        SECRET_AREAS: 10,
        FINISHED_LEVEL_VALUE: 5,
        GLITCHED_PICKUPS: false,
        BITS: (256 - 32)
    },
    {
        TITLE: "Wayne Manor/Destroyed Batcave",
        STAGE: 0x07,
        ITEMS: 20, // 2 are bugged
        ENEMIES: 33,
        SECRET_AREAS: 4,
        FINISHED_LEVEL_VALUE: 10,
        GLITCHED_PICKUPS: false,
        BITS: (128 - 16)
    },
    {
        TITLE: "Claw Island",
        STAGE: 0x08,
        ITEMS: 20, // 11 Are bugged! WOW!
        ENEMIES: 31,
        SECRET_AREAS: 2,
        FINISHED_LEVEL_VALUE: 25,
        GLITCHED_PICKUPS: false,
        BITS: (128 - 16)
    }
]


for data in levelAchievementData
{
    type = "Progression"
    achievement(title = data[TITLE],
                type = type,
                description = format("Beat level {0} in the story", data[STAGE]),
                points = data[FINISHED_LEVEL_VALUE],
                trigger = achievementsAllowed() &&
                          isStoryMode() &&
                          beatLevel(data[STAGE])
    )
                          
}

for data in levelAchievementData
{
    if(data[SECRET_AREAS] != 0 )
    {
        achievement(title = format("{0} Searcher", data[TITLE]),
                    type = "Missable",
                    description = format("Beat level {0} with 100% secret areas found", data[STAGE]),
                    points = 5,
                    trigger = beatLevel(data[STAGE]) &&
                              measured(countSecretAreas(data[BITS]) == data[SECRET_AREAS], format = "percent", when = ( achievementsAllowed() && isStoryMode() && (currentLevel() == data[STAGE] - 1)))
        )
    }

    description = "Beat level {0} with 100% pickups found"
    if data[GLITCHED_PICKUPS] == true
    {
        description = "Beat level {0} with 100% pickups found, Note end of level total will not be 100 perecent."
    }
    achievement(title = format("{0} Scavenger", data[TITLE]),
                type = "Missable",
                description = format(description, data[STAGE]),
                points = 5,
                trigger = beatLevel(data[STAGE]) &&
                          measured(countPickups(data[BITS]) >= data[ITEMS], format = "percent", when = ( achievementsAllowed() && isStoryMode() && (currentLevel() == data[STAGE] - 1 ))) 
    )
    achievement(title = format("{0} Warrior", data[TITLE]),
                type = "Missable",
                description = format("Beat level {0} with 100% enemies beaten", data[STAGE]),
                points = 5,
                trigger = beatLevel(data[STAGE]) &&
                          measured(countEnemyBeaten(data[BITS]) == data[ENEMIES], format = "percent", when = ( achievementsAllowed() && isStoryMode() && (currentLevel() == data[STAGE] - 1)))
    )
}

achievement(title = "The Dark Knight",
            description = "Beat the game on Hard",
            points = 25,
            trigger = achievementsAllowed() &&
                      isStoryMode() &&
                      beatGame() &&
                      isHardDifficulty()
)

function enterLevel(level)
{
    if(level == FIRST_LEVEL)
    {
        return startStoryGame()
    }
    else
    {
        return currentLevel() == level - 1 && prev(currentLevel()) == level - 2
    }
}

function noDeathLevelAchievement(data)
{
    achievement(title = format("{0} Survivor", data[TITLE]),
                description = format("Beat level {0} without dying on normal difficulty or higher", data[STAGE]),
                type = "Missable",
                points = 10,
                trigger = achievementsAllowed() &&
                          isStoryMode() &&
                          once(enterLevel(data[STAGE])) &&
                          trigger_when( beatLevel(data[STAGE])) &&
                          never(totalLives() < prev(totalLives())) &&
                          never(gameOverStory()) &&
                          isNormalDifficultyOrHarder()
    )
}

for data in levelAchievementData
{
    noDeathLevelAchievement(data)
}

achievement(title = "Forgot My Bat Belt",
            type = "Missable",
            description = "Beat the game without using any optional or blueprint gadgets normal difficulty or higher (Batarang, Sonic Pulse Globe, Staff Charge, Grappling Hook and Extending Staff are allowed)",
            points = 10,
            trigger = achievementsAllowed() &&
                      isStoryMode() &&
                      once(startStoryGame()) &&
                      trigger_when(beatGame()) &&
                      never(gameOverStory()) && 
                      never(usedGadget()) &&
                      isNormalDifficultyOrHarder()
)

achievement(title = "The Bat",
            description = "Beat the game as Batman",
            points = 10,
            trigger = achievementsAllowed() &&
                      isStoryMode() &&
                      beatGame() &&
                      playerIsBatman()
)

achievement(title = "Boy Wonder",
            description = "Beat the game as Robin",
            points = 10,
            trigger = achievementsAllowed() &&
                      isStoryMode() &&
                      beatGame() &&
                      playerIsRobin()
)

gadgetsAchievementList = 
[
    {
        NAME: "Batman",
        CHARACTER: BATMAN_CHARACTER_VALUE,
        GADGETS: batmanGadgets,
        CHECKER: playerIsBatman()
    },
    {
        NAME: "Robin",
        CHARACTER: ROBIN_CHARACTER_VALUE,
        GADGETS: robinGadgets,
        CHECKER: playerIsRobin()
    }
]

trainingAchievementList =
[
    {
        NAME: "Inmate",
        CHARACTER: INMATE_CHARACTER_VALUE,
        GADGETS: inmateAttacks,
        CHECKER: playerIsInmate()
    },
    {
        NAME: "Clown",
        CHARACTER: CLOWN_CHARACTER_VALUE,
        GADGETS: clownAttacks,
        CHECKER: playerIsClown()
    },
    {
        NAME: "Thug 1",
        CHARACTER: THUG1_CHARACTER_VALUE,
        GADGETS: thug1Attacks,
        CHECKER: playerIsThug1()
    },
    {
        NAME: "Thug 2",
        CHARACTER: THUG2_CHARACTER_VALUE,
        GADGETS: thug2Attacks,
        CHECKER: playerIsThug2()
    },
    {
        NAME: "Riddler Thug",
        CHARACTER: RIDDLER_THUG_CHARACTER_VALUE,
        GADGETS: riddlerThugAttacks,
        CHECKER: playerIsRiddlerThug()
    },
    {
        NAME: "Sugar",
        CHARACTER: SUGAR_CHARACTER_VALUE,
        GADGETS: sugarAttacks,
        CHECKER: playerIsSugar()
    },
    {
        NAME: "Two Face",
        CHARACTER: TWO_FACE_CHARACTER_VALUE,
        GADGETS: twoFaceAttacks,
        CHECKER: playerIsTwoFace()
    }
]

function specialMovesAchievement(data)
{
    achievement(title = format("{0} Specialist", data[NAME]),
                description = format("Use each of {0}'s special moves", data[NAME]),
                points = 1,
                trigger = measured(tally_of(data[GADGETS], length(data[GADGETS]), gadget => once(playerOneAttack() == gadget && achievementsAllowed() && data[CHECKER])))
    )
}

function trainingModeAchievement(data)
{
    achievement(title = format("Labbing with {0}", data[NAME]),
                type = "Win_Condition",
                description = format("Beat all sixteen levels of training mode with {0}", data[NAME]),
                points = 5,
                trigger = achievementsAllowed() &&
                          isTrainingMode() &&
                          wonTrainingLevel() &&
                          data[CHECKER]
    )
}

function gadgetAchievement(data)
{
    achievement(title = format("{0} Specialist", data[NAME]),
                description = format("Use each of {0}'s normal and optional gadgets (Blueprint gadgets are not counted)", data[NAME]),
                points = 3,
                trigger = measured(tally_of(data[GADGETS], length(data[GADGETS]), gadget => once(playerOneAttack() == gadget && achievementsAllowed() && data[CHECKER])))
    )
}

for data in gadgetsAchievementList
{
    gadgetAchievement(data)
    trainingModeAchievement(data)
}


for data in trainingAchievementList
{
    specialMovesAchievement(data)
    trainingModeAchievement(data)
}

blueprintGadgets = 
[
    {
        NAME: "Bat Cuffs", 
        GADGETS: [BATMAN_BAT_CUFFS, ROBIN_BAT_CUFFS]
    },
    {
        NAME: "Homing Batarang",
        GADGETS: [BATMAN_HOMING_BATARANG, ROBIN_HOMING_BATARANG]
    },
    {
        NAME: "Rocket Boots",
        GADGETS: [BATMAN_ROCKET_BOOTS, ROBIN_ROCKET_BOOTS]
    },
    {
        NAME: "Holographic Decoy",
        GADGETS: [BATMAN_HOLOGRAPH_DECOY, ROBIN_HOLOGRAPH_DECOY]
    }
]


for data in blueprintGadgets
{
    achievement(title = format("{0} Inventor", data[NAME]),
                type = "Missable",
                description = format("Build and use {0} as either Batman or Robin", data[NAME]),
                points = 5,
                trigger = achievementsAllowed() &&
                          isStoryMode() &&
                          any_of(data[GADGETS], gadget => playerOneAttack() == gadget)
    )
}

achievement(title = "Headcracker",
            description = "Use the Headcracker move as either Batman or Robin",
            points = 1,
            trigger = achievementsAllowed() &&
                      any_of(headClunker, gadget => playerOneAttack() == gadget)
)

leaderboard(    
        title = "Fastest Clear",
        description = "Beat the game as fast as possible",
        start = 
        (
            achievementsAllowedMaybeInGame() &&
            isStoryMode() &&
            startStoryGame() 
        ),
        cancel = gameOverStory(),
        submit = beatGame(),
        value = measured(always_true()) && unless(!isGameplayRunning()), // MILLISECONDS is centiseconds. See above
        format = "FRAMES"
    )

leaderboard(
        title = "Fastest Hard Clear",
        description = "Beat the game as fast as possible on hard",
        start = 
        (
            achievementsAllowedMaybeInGame() &&
            isStoryMode() &&
            startStoryGame() &&
            isHardDifficulty()
        ),
        cancel = gameOverStory(),
        submit = beatGame(),
        value = measured(always_true()) && unless(!isGameplayRunning()), // MILLISECONDS is centiseconds. See above
        format = "FRAMES"
)

leaderboard(    
        title = "Most Enemies Beaten",
        description = "Beat the game with the most enemies beaten",
        start = 
        (
            achievementsAllowedMaybeInGame() &&
            isStoryMode() &&
            startStoryGame() 
        ),
        cancel = always_false(),
        submit = beatGame() || gameOverStory(),
        value = measured(countEnemyJustBeaten()), 
        format = "VALUE"
)

leaderboard(
        title = "Most Hard Enemies Beaten",
        description = "Beat the game with the most enemies beaten",
        start = 
        (
            achievementsAllowedMaybeInGame() &&
            isStoryMode() &&
            startStoryGame() &&
            isHardDifficulty()
        ),
        cancel = always_false(),
        submit = beatGame() || gameOverStory(),
        value = measured(countEnemyJustBeaten()), 
        format = "VALUE"
)


leaderboard(    
        title = "Fastest Training Clear",
        description = "Beat the Training Mode as fast as possible. Continues are allowed, but time will continue to accrue",
        start = 
        (
            achievementsAllowedMaybeInGame() &&
            isTrainingMode() &&
            startChoseYourPlayer() 
        ),
        cancel = gameOverTraining(),
        submit = wonTrainingLevel(),
        value = measured(always_true()) && unless(!isGameplayRunning()), // MILLISECONDS is centiseconds. See above
        format = "FRAMES"
    )


characterLookup =
{
    BATMAN_CHARACTER_VALUE: "Batman",
    ROBIN_CHARACTER_VALUE: "Robin",
    INMATE_CHARACTER_VALUE: "Inmate",
    CLOWN_CHARACTER_VALUE: "Clown",
    THUG1_CHARACTER_VALUE: "Thug 1",
    THUG2_CHARACTER_VALUE: "Thug 2",
    RIDDLER_THUG_CHARACTER_VALUE: "Riddler Thug",
    SUGAR_CHARACTER_VALUE: "Sugar",
    TWO_FACE_CHARACTER_VALUE: "Two-Face"
}

stageLookup =
{
    0x00: "Arkham Asylum",
    0x01: "Second Bank of Gotham City",
    0x02: "The Circus",
    0x03: "Two-Face's Hideout: Warehouse",
    0x04: "Ritz Gotham",
    0x05: "Abandoned Subway Station",
    0x06: "Wayne Manor/Destroyed Batcave",
    0x07: "Claw Island"
}

difficultyLookup =
{
    EASY_DIFFICULTY_VALUE: "Easy",
    MEDIUM_DIFFICULTY_VALUE: "Medium",
    HARD_DIFFICULTY_VALUE: "Hard"
}


rich_presence_conditional_display(  (RPisPostStageScreen()) && isStoryMode(),
                                    "{0} has finished fighting through {1} on {2} difficulty",
                                    rich_presence_lookup("CharacterLookup", chosenCharacter(), characterLookup),
                                    rich_presence_lookup("StageLookup", currentLevel(), stageLookup),
                                    rich_presence_lookup("DifficultyLookup", gameDifficulty(), difficultyLookup)
)

rich_presence_conditional_display(  RPisGameplayActive() && isStoryMode(),
                                    "{0} is fighting through {1} on {2} difficulty",
                                    rich_presence_lookup("CharacterLookup", chosenCharacter(), characterLookup),
                                    rich_presence_lookup("StageLookup", currentLevel(), stageLookup),
                                    rich_presence_lookup("DifficultyLookup", gameDifficulty(), difficultyLookup)
)

rich_presence_conditional_display( RPisGameplayActive() && isTrainingMode() && wonTrainingLevel(), 
                                  "{0} has just finished training mode",
                                  rich_presence_lookup("CharacterLookup", chosenCharacter(), characterLookup)
                                  
)
rich_presence_conditional_display( RPisGameplayActive() && isTrainingMode(), 
                                  "{0} is beating up baddies in the lab.  Currently set to level {1}",
                                  rich_presence_lookup("CharacterLookup", chosenCharacter(), characterLookup),
                                  rich_presence_value("Number", trainingLevel() + 1)
)

rich_presence_display("In the menus.")

