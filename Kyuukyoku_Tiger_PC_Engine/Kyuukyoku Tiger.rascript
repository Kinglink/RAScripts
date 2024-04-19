// Kyuukyoku Tiger
// #ID = 18743

BOSS_INDEX = "BOSS_INDEX"
BOSS_LIFE = "BOSS_LIFE"

// $008C: (8-bit) Demo/Gameplay
//        
//        0x01 = Gameplay
//        0x08 = Trigger's Demo value
//        0x80 = Actual Demo
//        0x03 = Beat Boss
//        0x05 = Death
//        If you set it to 0x08 the demo takes over.
function demoGameplay() => byte(0x00008C)
GAMEPLAY_VALUE = 0x01 
GAMEPLAY_BEAT_BOSS_VALUE = 0x03
GAMEPLAY_DEATH_VALUE = 0x05

function isGameplay() => demoGameplay() == GAMEPLAY_VALUE || 
                         demoGameplay() == GAMEPLAY_BEAT_BOSS_VALUE || 
                         demoGameplay() == GAMEPLAY_DEATH_VALUE

// $065A: (8-bit) Screen X Position
//        
//        0x28-0xfd = Range
//        0x28 = Left side of the screen
//        0xfd = Right side of the screen
//        
//        There's also a scrolling value.  Starts at 0x88
function xPosition() => byte(0x00065A)

// $06FA: (8-bit) Screen Y Position
//        
//        0x05e = Top of the screen
//        0xf7 = Bottom of Screen
//        0xe0 = STarting location
function yPosition() => byte(0x0006FA)

// $0CEA: (8-bit) Gameplay control
//        
//        0x00 = Player control
//        0x02 = Fade out  On death
//        0x09 = Landing (I think)
function gameplaycontrol() => byte(0x000CEA)

// $0EE3: (8-bit Array of 44) Enemy Index
//        
//        0xa Boss 1
//        Max Life is 0x180
//        0xb Boss 2
//        Max Life 0x210
//        0x0c Boss 3 Front
//        Max Life 0x210
//        0x0d Boss 3 Back
//        Max Life 0x150
//        0x0e Boss 4 Blue
//        Max Life 0x210
//        0x0f Boss 4 Yello
//        Max Life 0x180
//        0x10 Boss 5 Base
//        Max Life 0x210
//        0x11 Boss 6 Blue
//        Max Life 0x1e0
//        0x12 Boss 6 Green
//        Max Life 0x1e0
//        0x13 Boss 7 Side
//        Max life is 0x1b0
//        0x14 Boss 7 Connector
//        Max Life is 0x10
//        0x13 Boss 7 Side
//        Max life is 0x1b0
//        0x15 Boss 8 Front Tank
//        Max Life is 0x0210
//        0x16 Boss 8 BackTank
//        Max Life is 0x0180
//        0x17 Boss Level 9
//        Max Life is 0x210
//        0x18 Boss 9
//        Max life is 0x210
//        0x19 Boss 10 Left
//        Max Life 0x1e0
//        0x1a Boss 10 Right
//        Max Life 0x1e0
//        
//        
//        Life is at 0x0f33 and at 0x0f83 (0xf83 *0x100 for the high bits of a 16 bit number.)
START_ENEMY_INDEX_MEMORY_LOCATION = 0x000EE3
START_ENEMY_LOW_HEALTH_VALUE_MEMORY_LOCATION = 0x000F33
START_ENEMY_HIGH_HEALTH_VALUE_MEMORY_LOCATION = 0x000F83
ENEMY_LOW_HEALTH_OFFSET = START_ENEMY_LOW_HEALTH_VALUE_MEMORY_LOCATION - START_ENEMY_INDEX_MEMORY_LOCATION 
ENEMY_HIGH_HEALTH_OFFSET = START_ENEMY_HIGH_HEALTH_VALUE_MEMORY_LOCATION - START_ENEMY_INDEX_MEMORY_LOCATION
function enemyIndex() => word(START_ENEMY_INDEX_MEMORY_LOCATION)
NUMBER_OF_ENEMY_INDEXES = 12

function calculateEnemyLife(index) => word(START_ENEMY_LOW_HEALTH_VALUE_MEMORY_LOCATION + index) + 
                                      word(START_ENEMY_HIGH_HEALTH_VALUE_MEMORY_LOCATION + index) * 0x100

function findEnemyIndex(enemyIndex, enemyLife) {
    return any_of( range(0, NUMBER_OF_ENEMY_INDEXES), i => {
        byte(START_ENEMY_INDEX_MEMORY_LOCATION + i) == enemyIndex && enemyLife(i) < enemyLife
    }
}

bossInfo = 
{
    0x00: [ {BOSS_INDEX: 0x0a, LIFE: 0x180}],
    0x01: [ {BOSS_INDEX: 0x0b, LIFE: 0x210}],
    0x02: [ {BOSS_INDEX: 0x0c, LIFE: 0x210},
            {BOSS_INDEX: 0x0d, LIFE: 0x150}],
    0x03: [ {BOSS_INDEX: 0x0e, LIFE: 0x210},
            {BOSS_INDEX: 0x0f, LIFE: 0x180}],
    0x04: [ {BOSS_INDEX: 0x10, LIFE: 0x210}],
    0x05: [ {BOSS_INDEX: 0x11, LIFE: 0x1e0},
            {BOSS_INDEX: 0x12, LIFE: 0x1e0}],
    0x06: [ {BOSS_INDEX: 0x13, LIFE: 0x1b0},
            {BOSS_INDEX: 0x14, LIFE: 0x10},
            {BOSS_INDEX: 0x13, LIFE: 0x1b0}],
    0x07: [ {BOSS_INDEX: 0x15, LIFE: 0x210},
            {BOSS_INDEX: 0x16, LIFE: 0x180}],
    0x08: [ {BOSS_INDEX: 0x17, LIFE: 0x210},
            {BOSS_INDEX: 0x18, LIFE: 0x210}],
    0x09: [ {BOSS_INDEX: 0x19, LIFE: 0x1e0},
            {BOSS_INDEX: 0x1a, LIFE: 0x1e0}]
}

// $166E: (8-bit) Level Number
//        
//        0x00 = Level 1
//        0x09 = Level 10 Last Level
//        0x0a = End game (and looping)
function levelNumber() => byte(0x00166E)

function stageTransition(stageIndex) => levelNumber() == stageIndex + 1 && prev(levelNumber()) == stageIndex
function beatLoop() => levelNumber() == 0x0a && prev(levelNumber()) == 0x09

// $1671: (8-bit) Bombs Held
//        
//        0x00 = No bombs held
//        0x09 = Max displayed amount.
//        
//        Can grow higher
function bombsHeld() => byte(0x001671)

function nineBombs() => bombsHeld() == 0x09 && prev(bombsHeld()) == 0x08

// $1672: (64-bit) 8 digit BCD
//        
//        1 digit each byte
//        
//        Control for score, but updates display only on new score.
function scoreBCD() => byte(0x001672)
function totalScore() => byte(0x001672) * 1x10000000 +
                         byte(0x001673) * 1x1000000 +
                         byte(0x001674) * 1x100000 +
                         byte(0x001675) * 1x10000 +
                         byte(0x001676) * 1x1000 +
                         byte(0x001677) * 1x100 +
                         byte(0x001678) * 1x10 +
                         byte(0x001679)

function prevTotalScore() => prev(byte(0x001672)) * 1x10000000 +
                             prev(byte(0x001673)) * 1x1000000 +
                             prev(byte(0x001674)) * 1x100000 +
                             prev(byte(0x001675)) * 1x10000 +
                             prev(byte(0x001676)) * 1x1000 +
                             prev(byte(0x001677)) * 1x100 +
                             prev(byte(0x001678)) * 1x10 +
                             prev(byte(0x001679))

// $167A: (8-bit) Number of Bonus Stars
//        
//        Stage 1 has 0x0a (10)
//        Stage 2 has 0x10 (16)
//        Stage 3 has 0x13 (19)-
//        Stage 4 has 0x18 (24)
//        Stage 5 has 0x1a (26)
//        Stage 6 has 0x1e (30)
//        Stage 7 has 0x1e (30)
//        Stage 8 has 0x1e (30)
//        Stage 9 has 0x1d (29) (But I'm guessing I missed one)
//        Stage 10 has 0x1e(30)
function bonusStarsLevel() => byte(0x00167A)

totalStars = 
{
    0x00: 10,
    0x01: 16,
    0x02: 19,
    0x03: 24,
    0x04: 26,
    0x05: 30,
    0x06: 30,
    0x07: 30,
    0x08: 30,
    0x09: 30
}

// $167B: (8-bit) Lives
//        
//        0x03= Start
//        0x00 = Game Over
function lives() => byte(0x00167B)

function didDie() => lives() < prev(lives())

function nineLives() => lives() == 0x09 && prev(lives()) == 0x08

// $167F: (8-bit) Current Weapon
//        
//        0x00 = Red (Missiles)
//        0x01 = Green (Laser)
//        0x02 = Blue (Spread)
//        0x03 = Yellow (4-way)  (see 0x1688)
function weapon() => byte(0x00167F)
MISSILES_VALUE = 0x00
LASER_VALUE = 0x01
SPREAD_VALUE = 0x02
FOUR_WAY_VALUE = 0x03

function isMissiles() => weapon() == MISSILES_VALUE
function isLaser() => weapon() == LASER_VALUE
function isSpread() => weapon() == SPREAD_VALUE
function isFourWay() => weapon() == FOUR_WAY_VALUE

// $1680: (8-bit) Weapon Power
//        
//        0x00 = Normal
//        0x0a = Max Power
function weaponPower() => byte(0x001680)
MAX_POWER_VALUE = 0x0a
function maxPower() => weaponPower() == MAX_POWER_VALUE

// $1684: (8-bit) Credits Remaining
//        
//        0x03 = Start
//        0x00 = No Credits remaining
function creditsRemaining() => byte(0x001684)

function didContinue() => creditsRemaining() < prev(creditsRemaining())

// $1688: (8-bit) Yellow Weapon Seeker
function yellowWeaponSeeker() => byte(0x001688)
// I'm not going to use this. 

// $1699: (16-bit) Map Location
//        Ship Start = 0x0010
//        Level 1 = 0x0176
//        Level 2 = 0x0176
//        Level 3 = 0x017a
//        Level 4 = 0x0170
//        Level 5 = 0x017a
//        Level 6 = 0x175
//        Level 7 = 0x17b
//        Level 8 = 0x17a
//        Level 9 = 0x170
//        Level 10 =0x17c
//        0x017f rolls over to 0x000 on Level 1 (To get back to the main base)
function mapLocation() => word(0x001699)

bossLocation =
{
    0x00: 0x0176,
    0x01: 0x0176,
    0x02: 0x017a,
    0x03: 0x0170,
    0x04: 0x017a,
    0x05: 0x0175,
    0x06: 0x017b,
    0x07: 0x017a,
    0x08: 0x0170,
    0x09: 0x017c
}

// $19A8: (8-bit) Possible loop value.
//        
//        0x00 First loop
//        0x01 Second loop
//        
//        However if this is set to 0x01 After beating the game, the game ends.  However This might be testing error, but in general I don't think this game is designed to be more than 2 loops.
function loopValue() => byte(0x0019A8)


