// Kyuukyoku Tiger
// #ID = 18743

BOSS_INDEX = "BOSS_INDEX"
BOSS_LIFE = "BOSS_LIFE"
ID = "ID"
TITLE = "TITLE"
DESCRIPTION = "DESCRIPTION"
POINTS = "POINTS"
TRIGGER = "TRIGGER"
SCORE = "SCORE"

FIRST_LEVEL_INDEX = 0
LAST_LEVEL_INDEX = 9
LEVEL_ONE_TEXT = "Airport"  // war torn land, city, airport
LEVEL_TWO_TEXT = "Aircraft Carrier"   // boats, aircraft carrier
LEVEL_THREE_TEXT = "Harbor" // Harbor
LEVEL_FOUR_TEXT = "Flotilla"  // boats
LEVEL_FIVE_TEXT = "Forward Base" // Forward Base
LEVEL_SIX_TEXT = "Airport II"
LEVEL_SEVEN_TEXT = "Aircraft Carrier II"
LEVEL_EIGHT_TEXT = "Harbor II"
LEVEL_NINE_TEXT = "Flotilla II"
LEVEL_TEN_TEXT = "Main Base"

// $008C: (8-bit) Demo/Gameplay
//        
//        0x01 = Gameplay
//        0x08 = Trigger's Demo value
//        0x80 = Actual Demo
//        0x03 = Beat Boss
//        0x05 = Death
//        If you set it to 0x08 the demo takes over.
function demoGameplay() => low4(0x00008C)
GAMEPLAY_VALUE = 0x1 
GAMEPLAY_BEAT_BOSS_VALUE = 0x3
GAMEPLAY_DEATH_VALUE = 0x5

function isGameplay() => demoGameplay() == GAMEPLAY_VALUE || 
                         demoGameplay() == GAMEPLAY_BEAT_BOSS_VALUE || 
                         demoGameplay() == GAMEPLAY_DEATH_VALUE
function playerDied() => demoGameplay() == GAMEPLAY_DEATH_VALUE            

// $01ce: (4-bit High)Pause Indicator 
// 
//        0xd = Paused
//        Any other value is not paused. 
//
//        This is a control, changing it will make the gameplay continue.  (However just changing this doesn't resume the music) 
PAUSED_VALUE = 0xd
function isPaused() => high4(0x0001CE) == PAUSED_VALUE

// $020e: (8-bit) Front end detector
//
//        0x01 = In Game
//        0x06 = Demo/Transitioning from demo to main menu.  Main Menu. 
function frontEndDetector() => byte(0x00020E)
IN_GAME_VALUE = 0x01

function inGame() => frontEndDetector() == IN_GAME_VALUE

// $0208: (8-bit) Credits detector.
//
//        0x31 normally 
//        0x21 on the secret credit scene.  Never changes otherwise. 
function creditsDetector() => byte(0x000208)
SECRET_CREDIT_DETECTOR = 0x31

function isSecretCreditScene() => creditsDetector() == SECRET_CREDIT_DETECTOR


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

// $0D2B: (8-bit) Bomb State 
// 
//        0x00 = No Bomb used. 
//        0x01 = Bomb dropped (Bomb on screen)
//        0x03 = Bomb exploded. (Small size, maybe shield)
//        0x05 = Bomb Full Size (Shield also) 
function bombState() => byte(0x000D2B)
BOMB_NOT_IN_USE_VALUE = 0x00

function bombinUse() => bombState() != BOMB_NOT_IN_USE_VALUE

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
START_ENEMY_ALIVE_MEMORY_LOCATION = 0x0d03
START_ENEMY_INDEX_MEMORY_LOCATION = 0x000EE3
START_ENEMY_LOW_HEALTH_VALUE_MEMORY_LOCATION = 0x000F33
START_ENEMY_HIGH_HEALTH_VALUE_MEMORY_LOCATION = 0x000F83
ENEMY_ALIVE_OFFSET = START_ENEMY_ALIVE_MEMORY_LOCATION - START_ENEMY_INDEX_MEMORY_LOCATION 
ENEMY_LOW_HEALTH_OFFSET = START_ENEMY_LOW_HEALTH_VALUE_MEMORY_LOCATION - START_ENEMY_INDEX_MEMORY_LOCATION 
ENEMY_HIGH_HEALTH_OFFSET = START_ENEMY_HIGH_HEALTH_VALUE_MEMORY_LOCATION - START_ENEMY_INDEX_MEMORY_LOCATION
function enemyIndex() => word(START_ENEMY_INDEX_MEMORY_LOCATION)
NUMBER_OF_ENEMY_INDEXES = 12
ENEMY_ALIVE_VALUE = 0x02
ENEMY_ALIVE_VALUE_ALT = 0x04
ENEMY_DEAD_VALUE = 0x00
ENEMY_DEAD_VALUE_ALT_1 = 0x01
ENEMY_DEAD_VALUE_ALT_2 = 0x03
function calculateEnemyLife(index) => byte(START_ENEMY_LOW_HEALTH_VALUE_MEMORY_LOCATION + index) + 
                                      byte(START_ENEMY_HIGH_HEALTH_VALUE_MEMORY_LOCATION + index) * 0x100

function findDeadEnemy(enemyIndex, enemyLife) {
    return any_of( range(0, NUMBER_OF_ENEMY_INDEXES), i => (
           byte(START_ENEMY_INDEX_MEMORY_LOCATION + i) == enemyIndex &&  
           ( byte(START_ENEMY_ALIVE_MEMORY_LOCATION + i) == ENEMY_DEAD_VALUE ||
             byte(START_ENEMY_ALIVE_MEMORY_LOCATION + i) == ENEMY_DEAD_VALUE_ALT_1 ||
             byte(START_ENEMY_ALIVE_MEMORY_LOCATION + i) == ENEMY_DEAD_VALUE_ALT_2
           )))
}

bossInfo = 
{
    0x00: [ {BOSS_INDEX: 0x0a, BOSS_LIFE: 0x180}],
    0x01: [ {BOSS_INDEX: 0x0b, BOSS_LIFE: 0x210}],
    0x02: [ {BOSS_INDEX: 0x0c, BOSS_LIFE: 0x210},
            {BOSS_INDEX: 0x0d, BOSS_LIFE: 0x150}],
    0x03: [ {BOSS_INDEX: 0x0e, BOSS_LIFE: 0x210},
            {BOSS_INDEX: 0x0f, BOSS_LIFE: 0x180}],
    0x04: [ {BOSS_INDEX: 0x10, BOSS_LIFE: 0x210}],
    0x05: [ {BOSS_INDEX: 0x11, BOSS_LIFE: 0x1e0},
            {BOSS_INDEX: 0x12, BOSS_LIFE: 0x1e0}],
    0x06: [ {BOSS_INDEX: 0x13, BOSS_LIFE: 0x1b0}],
    0x07: [ {BOSS_INDEX: 0x15, BOSS_LIFE: 0xb0},
            {BOSS_INDEX: 0x16, BOSS_LIFE: 0x180}],
    0x08: [ {BOSS_INDEX: 0x17, BOSS_LIFE: 0x210},
            {BOSS_INDEX: 0x18, BOSS_LIFE: 0x210}],
    0x09: [ {BOSS_INDEX: 0x19, BOSS_LIFE: 0x1e0},
            {BOSS_INDEX: 0x1a, BOSS_LIFE: 0x1e0}]
}

function bossDead(level_index)
{
    return any_of(bossInfo[level_index], bossData => findDeadEnemy(bossData[BOSS_INDEX], bossData[BOSS_LIFE]))
}

// $166E: (8-bit) Level Number
//        
//        0x00 = Level 1
//        0x09 = Level 10 Last Level
//        0x0a = End game (and looping)
function levelNumber() => byte(0x00166E)


function anyStageTransition() => levelNumber() == prev(levelNumber()) + 1 
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
function totalScore() => byte(0x001672) * 10000000 +
                         byte(0x001673) * 1000000 +
                         byte(0x001674) * 100000 +
                         byte(0x001675) * 10000 +
                         byte(0x001676) * 1000 +
                         byte(0x001677) * 100 +
                         byte(0x001678) * 10 +
                         byte(0x001679)

function prevTotalScore() => prev(byte(0x001672)) * 10000000 +
                             prev(byte(0x001673)) * 1000000 +
                             prev(byte(0x001674)) * 100000 +
                             prev(byte(0x001675)) * 10000 +
                             prev(byte(0x001676)) * 1000 +
                             prev(byte(0x001677)) * 100 +
                             prev(byte(0x001678)) * 10 +
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
    0x04: 30,
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

START_LOCATION = 0x0011
function startedLevel() => mapLocation() == START_LOCATION

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

// $198f: (8-bit) Game Over CheatCode
//
//        On last credit on a game over.  This needs to be set to 2, 1,2,2,1,1,2,1,2,1,4.  And then the secret is open.
CHEAT_CODE_MEMORY_LOCATION = 0x00198F
function cheatCodeEntry() => byte(CHEAT_CODE_MEMORY_LOCATION)

function cheatCodeEntered() => byte(CHEAT_CODE_MEMORY_LOCATION) == 0x02 &&
                               byte(CHEAT_CODE_MEMORY_LOCATION + 1) == 0x01 &&
                               byte(CHEAT_CODE_MEMORY_LOCATION + 2) == 0x02 &&
                               byte(CHEAT_CODE_MEMORY_LOCATION + 3) == 0x02 &&
                               byte(CHEAT_CODE_MEMORY_LOCATION + 4) == 0x01 &&
                               byte(CHEAT_CODE_MEMORY_LOCATION + 5) == 0x01 &&
                               byte(CHEAT_CODE_MEMORY_LOCATION + 6) == 0x02 &&
                               byte(CHEAT_CODE_MEMORY_LOCATION + 7) == 0x01 &&
                               byte(CHEAT_CODE_MEMORY_LOCATION + 8) == 0x02 &&
                               byte(CHEAT_CODE_MEMORY_LOCATION + 9) == 0x01 &&
                               byte(CHEAT_CODE_MEMORY_LOCATION + 10) == 0x04

function achievementLockoutWithoutGameplay() => disable_when(creditsRemaining() > 0x03, until=!isGameplay())
function achievementLockout() => isGameplay() && inGame() && achievementLockoutWithoutGameplay()


levelAchievements =
[
    {
        ID: 0,
        TITLE: LEVEL_ONE_TEXT,
        DESCRIPTION: "Beat Level 1",
        POINTS: 3
    },
    {
        ID: 1,
        TITLE: LEVEL_TWO_TEXT,
        DESCRIPTION: "Beat Level 2",
        POINTS: 3
    },
    {
        ID: 2,
        TITLE: LEVEL_THREE_TEXT,
        DESCRIPTION: "Beat Level 3",
        POINTS: 4
    },
    {
        ID: 3,
        TITLE: LEVEL_FOUR_TEXT,
        DESCRIPTION: "Beat Level 4",
        POINTS: 4
    },
    {
        ID: 4,
        TITLE: LEVEL_FIVE_TEXT,
        DESCRIPTION: "Beat Level 5",
        POINTS: 4
    },
    {
        ID: 5,
        TITLE: LEVEL_SIX_TEXT,
        DESCRIPTION: "Beat Level 6",
        POINTS: 5
    },
    {
        ID: 6,
        TITLE: LEVEL_SEVEN_TEXT,
        DESCRIPTION: "Beat Level 7",
        POINTS: 5
    },
    {
        ID: 7,
        TITLE: LEVEL_EIGHT_TEXT,
        DESCRIPTION: "Beat Level 8",
        POINTS: 5
    },
    {
        ID: 8,
        TITLE: LEVEL_NINE_TEXT,
        DESCRIPTION: "Beat Level 9",
        POINTS: 10
    },
    {
        ID: 9,
        TITLE: LEVEL_TEN_TEXT,
        DESCRIPTION: "Beat Level 10",
        POINTS: 10
    }
]

for data in levelAchievements {
    type = "Progression"
    if(data[ID] == LAST_LEVEL_INDEX)
    {
        type = "Win_Condition"
    }
    achievement(title = data[TITLE],
                type = type,
                description = data[DESCRIPTION],
                points = data[POINTS],
                trigger = achievementLockout() &&
                          isGameplay() &&
                          stageTransition(data[ID])
    )
}

DEATHLESS_FORMAT = "Deathless {0}"
noDeathLevelAchievements =
[
    {
        ID: 0,
        TITLE: format(DEATHLESS_FORMAT, LEVEL_ONE_TEXT),
        DESCRIPTION: "Beat Level 1 with out dying",
        POINTS: 5
    },
    {
        ID: 1,
        TITLE: format(DEATHLESS_FORMAT,  LEVEL_TWO_TEXT),
        DESCRIPTION: "Beat Level 2 with out dying",
        POINTS: 5
    },
    {
        ID: 2,
        TITLE: format(DEATHLESS_FORMAT,  LEVEL_THREE_TEXT),
        DESCRIPTION: "Beat Level 3 with out dying",
        POINTS: 5
    },
    {
        ID: 3,
        TITLE: format(DEATHLESS_FORMAT,  LEVEL_FOUR_TEXT),
        DESCRIPTION: "Beat Level 4 with out dying",
        POINTS: 5
    },
    {
        ID: 4,
        TITLE: format(DEATHLESS_FORMAT,  LEVEL_FIVE_TEXT),
        DESCRIPTION: "Beat Level 5 with out dying",
        POINTS: 5
    },
    {
        ID: 5,
        TITLE: format(DEATHLESS_FORMAT,  LEVEL_SIX_TEXT),
        DESCRIPTION: "Beat Level 6 with out dying",
        POINTS: 5
    },
    {
        ID: 6,
        TITLE: format(DEATHLESS_FORMAT,  LEVEL_SEVEN_TEXT),
        DESCRIPTION: "Beat Level 7 with out dying",
        POINTS: 5
    },
    {
        ID: 7,
        TITLE: format(DEATHLESS_FORMAT,  LEVEL_EIGHT_TEXT),
        DESCRIPTION: "Beat Level 8 with out dying",
        POINTS: 5
    },
    {
        ID: 8,
        TITLE: format(DEATHLESS_FORMAT,  LEVEL_NINE_TEXT),
        DESCRIPTION: "Beat Level 9 with out dying",
        POINTS: 10
    },
    {
        ID: 9,
        TITLE: format(DEATHLESS_FORMAT,  LEVEL_TEN_TEXT),
        DESCRIPTION: "Beat Level 10 with out dying",
        POINTS: 10
    }
]

for data in noDeathLevelAchievements {
    achievement(title = data[TITLE],
                description = data[DESCRIPTION],
                points = data[POINTS],
                trigger = achievementLockout() &&
                          trigger_when(stageTransition(data[ID])) &&
                          once(startedLevel() && 
                               levelNumber() == data[ID] &&
                               never(didDie()) &&
                               never(!isGameplay())) 
    )
}

weaponAchievement = 
[
    {
        TITLE:"Pew Pew",
        DESCRIPTION: "Use Laser for the first time.",
        POINTS: 1,
        TRIGGER: isLaser()
    },
    {
        TITLE: "Spread The Love",
        DESCRIPTION: "Use Spread for the first time.",
        POINTS: 1,
        TRIGGER: isSpread()
    },
    {
        TITLE: "Every Which Way",
        DESCRIPTION: "Use Four Way for the first time.",
        POINTS: 1,
        TRIGGER: isFourWay()
    }
]

for data in weaponAchievement {
    achievement(title = data[TITLE],
                description = data[DESCRIPTION],
                points = data[POINTS],
                trigger = achievementLockout() &&
                          data[TRIGGER]
    )
}

maxWeaponAchievement =
[
    {
        TITLE: "Where Do They Keep All Those Missiles?",
        DESCRIPTION: "Max out Missile",
        POINTS: 3,
        TRIGGER: isMissiles()
    },
    {
        TITLE: "Glowing Beams",
        DESCRIPTION: "Max out Laser",
        POINTS: 3,
        TRIGGER: isLaser()
    },
    {
        TITLE: "Fan Dance",
        DESCRIPTION: "Max out Spread",
        POINTS: 3,
        TRIGGER: isSpread()
    },
    {
        TITLE: "No Look Gunplay",
        DESCRIPTION: "Max out Four Way",
        POINTS: 3,
        TRIGGER: isFourWay()
    }
]

for data in maxWeaponAchievement {
    achievement(title = data[TITLE],
                description = data[DESCRIPTION],
                points = data[POINTS],
                trigger = achievementLockout() &&
                          maxPower() &&
                          data[TRIGGER]
    )
}


exclusiveWeaponAchievement =
[
    {
        TITLE: "There Are Other Weapons?",
        DESCRIPTION: "Beat a level only using Missiles and without dying",
        POINTS: 3,
        TRIGGER: isMissiles()
    },
    {
        TITLE: "Sharp Shooter",
        DESCRIPTION: "Beat a level only using Laser and without dying",
        POINTS: 10,
        TRIGGER: isLaser()
    },
    {
        TITLE: "Wide Reach",
        DESCRIPTION: "Beat a level only using Spread and without dying",
        POINTS: 10,
        TRIGGER: isSpread()
    },
    {
        TITLE: "Line Them Up",
        DESCRIPTION: "Beat a level only using Four Way and without dying",
        POINTS: 10,
        TRIGGER: isFourWay()
    }
]

for data in exclusiveWeaponAchievement {
    achievement(title = data[TITLE],
                description = data[DESCRIPTION],
                points = data[POINTS],
                trigger = achievementLockout() &&
                          trigger_when(anyStageTransition()) &&
                          once(startedLevel() && 
                               data[TRIGGER]) &&
                          never(didDie()) &&
                          never(!data[TRIGGER]) &&
                          never(!isGameplay())
    )
}


achievement(title = "Fully Loaded",
            description = "Get 9 Bombs",
            points = 4,
            trigger = achievementLockout() &&
                      nineBombs()
)

achievement(title = "Cat Pilot",
            description = "Get 9 Lives",
            points = 5,
            trigger = achievementLockout() &&
                      nineLives()
)

achievement(title = "Nothing Gonna Stop Me",
            description = "Beat the game with out continuing",
            points = 25,
            trigger = achievementLockout() &&
                      trigger_when(stageTransition(LAST_LEVEL_INDEX)) &&
                      once(startedLevel() && 
                           levelNumber() == FIRST_LEVEL_INDEX && 
                           never(didContinue()) &&
                           never(!isGameplay())) 
                      
)

achievement(title = "That's Whose Responsible",
            description = "Find the secret Credits",
            points = 2,
            trigger = achievementLockoutWithoutGameplay() &&
                      cheatCodeEntered() &&
                      isSecretCreditScene() &&
                      lives() == 0x00 &&
                      creditsRemaining() == 0x00
)

MAX_STAR_TITLE_TEXT = "Max Star {0}"
MAX_STAR_DESCRIPTION_TEXT = "Get all the bonus stars in {0} and finish the level. Dying resets the count, but does not lock out the achievement"
maxStarAchievements =
[
    {
        TITLE: format(MAX_STAR_TITLE_TEXT, LEVEL_ONE_TEXT),
        POINTS: 5,
        ID: 0
    },
    {
        TITLE: format(MAX_STAR_TITLE_TEXT, LEVEL_TWO_TEXT),
        POINTS: 5,
        ID: 1
    },
    {
        TITLE: format(MAX_STAR_TITLE_TEXT, LEVEL_THREE_TEXT),
        POINTS: 5,
        ID: 2
    },
    {
        TITLE: format(MAX_STAR_TITLE_TEXT, LEVEL_FOUR_TEXT),
        POINTS: 5,
        ID: 3
    },
    {
        TITLE: format(MAX_STAR_TITLE_TEXT, LEVEL_FIVE_TEXT),
        POINTS: 5,
        ID: 4
    },
    {
        TITLE: format(MAX_STAR_TITLE_TEXT, LEVEL_SIX_TEXT),
        POINTS: 10,
        ID: 5
    },
    {
        TITLE: format(MAX_STAR_TITLE_TEXT, LEVEL_SEVEN_TEXT),
        POINTS: 10,
        ID: 6
    },
    {
        TITLE: format(MAX_STAR_TITLE_TEXT, LEVEL_EIGHT_TEXT),
        POINTS: 25,
        ID: 7
    },
    {
        TITLE: format(MAX_STAR_TITLE_TEXT, LEVEL_NINE_TEXT),
        POINTS: 10,
        ID: 8
    },
    {
        TITLE: format(MAX_STAR_TITLE_TEXT, LEVEL_TEN_TEXT),
        POINTS: 10,
        ID: 9
    }
]

for data in maxStarAchievements {
    achievement(title = data[TITLE],
                description = format(MAX_STAR_DESCRIPTION_TEXT, data[ID] + 1),
                points = data[POINTS],
                trigger = achievementLockout() &&
                          trigger_when(levelNumber() == data[ID] + 1) &&
                          measured(prev(bonusStarsLevel()) == totalStars[data[ID]], when = prev(levelNumber()) == data[ID] &&
                                                                                           isGameplay())
    )
}

DODGE_TITLE_TEXT = "Slick Moves {0}"
EXTRA_DODGE_INFO = ". Dying, using a bomb, or pausing the game resets the count, but does not lock out the achievement"
DODGE_DESCRIPTION_TEXT = "Dodge for 60 seconds with out killing the boss on {0}" + EXTRA_DODGE_INFO
DODGE_DESCRIPTION_TWO_BOSSES_TEXT = "Dodge for 60 seconds with out killing the bosses on {0}" + EXTRA_DODGE_INFO
DODGE_DESCRIPTION_TWO_LARGE_BOSSES_TEXT = "Dodge for 60 seconds with out killing each of the large bosses on {0}" + EXTRA_DODGE_INFO
DODGE_DESCRIPTION_TWO_MAIN_BOSSES_TEXT = "Dodge for 60 seconds with out killing the two main bosses on {0}" + EXTRA_DODGE_INFO
bossDodgeAchievementList =
[
    {
        ID: 0,
        TITLE: format(DODGE_TITLE_TEXT, LEVEL_ONE_TEXT),
        DESCRIPTION: DODGE_DESCRIPTION_TEXT,
        POINTS: 4
    },
    {
        ID: 1,
        TITLE: format(DODGE_TITLE_TEXT, LEVEL_TWO_TEXT),
        DESCRIPTION: DODGE_DESCRIPTION_TEXT,
        POINTS: 3
    },
    {
        ID: 2,
        TITLE: format(DODGE_TITLE_TEXT, LEVEL_THREE_TEXT),
        DESCRIPTION: DODGE_DESCRIPTION_TWO_BOSSES_TEXT,
        POINTS: 4
    },
    {
        ID: 3,
        TITLE: format(DODGE_TITLE_TEXT, LEVEL_FOUR_TEXT),
        DESCRIPTION: DODGE_DESCRIPTION_TEXT,
        POINTS: 5
    },
    {
        ID: 4,
        TITLE: format(DODGE_TITLE_TEXT, LEVEL_FIVE_TEXT),
        DESCRIPTION: DODGE_DESCRIPTION_TWO_BOSSES_TEXT,
        POINTS: 5
    },
    {
        ID: 5,
        TITLE: format(DODGE_TITLE_TEXT, LEVEL_SIX_TEXT),
        DESCRIPTION: DODGE_DESCRIPTION_TWO_LARGE_BOSSES_TEXT,
        POINTS: 10
    },
    {
        ID: 6,
        TITLE: format(DODGE_TITLE_TEXT, LEVEL_SEVEN_TEXT),
        DESCRIPTION: DODGE_DESCRIPTION_TWO_BOSSES_TEXT,
        POINTS: 5
    },
    {
        ID: 7,
        TITLE: format(DODGE_TITLE_TEXT, LEVEL_EIGHT_TEXT),
        DESCRIPTION: DODGE_DESCRIPTION_TWO_BOSSES_TEXT,
        POINTS: 10
    },
    {
        ID: 8,
        TITLE: format(DODGE_TITLE_TEXT, LEVEL_NINE_TEXT),
        DESCRIPTION: DODGE_DESCRIPTION_TWO_BOSSES_TEXT,
        POINTS: 10
    },
    {
        ID: 9,
        TITLE: format(DODGE_TITLE_TEXT, LEVEL_TEN_TEXT),
        DESCRIPTION: DODGE_DESCRIPTION_TWO_MAIN_BOSSES_TEXT,
        POINTS: 10
    }
]

TOTAL_DODGE_TIME = 60*30
function shouldCountGameTime() => isGameplay() && !playerDied() && !isPaused()
for data in bossDodgeAchievementList {
    achievement(title = data[TITLE],
                description = format(data[DESCRIPTION], data[ID] + 1),
                points = data[POINTS],
                trigger = achievementLockout() &&
                           mapLocation() == bossLocation[data[ID]] &&
                           levelNumber() == data[ID] &&
                           trigger_when(mapLocation() == bossLocation[data[ID]] &&
                                       levelNumber() == data[ID] &&
                                       measured(tally(TOTAL_DODGE_TIME, shouldCountGameTime() && 
                                                  mapLocation() == bossLocation[data[ID]] &&
                                                  levelNumber() == data[ID]) )) &&
                          never(bossDead(data[ID])) && 
                          never(didDie()) &&
                          never(bombinUse())&&
                          never(isPaused())

    )
}

scoreAchievementList =
[
    {
        TITLE: "Free Guy",
        DESCRIPTION: "Get a score of 50,000",
        POINTS: 2,
        SCORE: (50 * 1000)
    },
    {
        TITLE: "Half a Mil",
        DESCRIPTION: "Get a score of 500,000",
        POINTS: 5,
        SCORE: (500 * 1000)
    },
    {
        TITLE: "Seven Figures",
        DESCRIPTION: "Get a score of 1,000,000",
        POINTS: 10,
        SCORE: (1000 * 1000)
    },
    {
        TITLE: "A Mil Five",
        DESCRIPTION: "Get a score of 1,500,000",
        POINTS: 25,
        SCORE: (1.5 * 1000 * 1000)
    }
]   

for data in scoreAchievementList {
    achievement(title = data[TITLE],
                description = data[DESCRIPTION],
                points = data[POINTS],
                trigger = achievementLockout() &&
                          totalScore() >= data[SCORE] &&
                          prevTotalScore() < data[SCORE]
    )
}

leaderboard(
    title = format("High Score"),
    description = format("Get the highest score possible. Scores submit when you run out of lives or beat a level"),
    start = 
    (
        achievementLockout() &&
        (( lives() == 0x00 && 
           prev(lives()) != 0x00)  ||
          anyStageTransition() ) && 
        totalScore() > 0
    ),
    cancel = always_false(),
    submit = always_true(),
    value = totalScore(),
    format = "VALUE"
)


rich_presence_conditional_display(!inGame(), "Watching Demos")

rich_presence_display("Level {0} Score {1} Lives {2} Bombs {3}", 
                      rich_presence_value("Number", levelNumber() + 1),
                      rich_presence_value("Number", totalScore()),
                      rich_presence_value("Number", lives()),
                      rich_presence_value("Number", bombsHeld())
                      )
