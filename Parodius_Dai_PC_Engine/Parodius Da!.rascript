// Parodius Da!
// #ID = 2189

function ContainsKey(dictionary, key_name)
{
    for key in dictionary 
        if(key == key_name) return true
    return false
}


// $0027: (8-bit) Demo check
//        
//        0x00 = Demo or Main Menu
//        0x01 = In Game
function demoCheck1() => byte(0x000027)
DEMO_CHECK1_VALUE = 0x01

// $0030: (8-bit) Demo check
//        
//        0x01 = Main Menu
//        0x02 = Demo
//        0x04 = Legit Gameplay
//        0x05 = Konami Logo
//        0x06 = Intro
function demoCheck2() => byte(0x000030)
PREV_DEMO_CHECK2_VALUE = 0x03
DEMO_CHECK2_VALUE = 0x04

// $004E: (8-bit) Credit Remaining
function creditRemaining() => byte(0x00004E)

function justLostCredit() => creditRemaining() < prev(creditRemaining())

// $0087: (8-bit) Lives remaining
//        
//        0xff = Game Over (continue screen)
//        
//        Note it becomes 0, and maybe even 1 after Special.
//        0x00 on the main menu.  Look for 0xff for "game over"
function livesRemaining() => byte(0x000087)

function justLostLife() => (livesRemaining() < prev(livesRemaining())) || 
                           (livesRemaining() == 0xff && prev(livesRemaining()) == 0x00) 

function gameOver() => livesRemaining() == 0xff

// $00A3: (8-bit) Character select
//        
//        0x00 = Vic Viper
//        0x01 = Octopus
//        0x02 = Twin Bee
//        0x03 = Pentarou
// Only used on character select screen. 

// $1d00: (8-bit) True Character select 
//        This is the ingame value.  This doesn't change on continuing but changes after selecting difficulty. 
//
//        0x00 = Vic Viper 
//        0x01 = Octopus
//        0x02 = Twin Bee
//        0x03 = Pentarou
function characterSelect() => byte(0x001d00)


VIC_VIPER_CHARACTER_SELECT_VALUE = 0x00
OCTOPUS_CHARACTER_SELECT_VALUE = 0x01
TWIN_BEE_CHARACTER_SELECT_VALUE = 0x02
PENTAROU_CHARACTER_SELECT_VALUE = 0x03

characterNameLookup = {
    VIC_VIPER_CHARACTER_SELECT_VALUE: "Vic Viper",
    OCTOPUS_CHARACTER_SELECT_VALUE: "Octopus",
    TWIN_BEE_CHARACTER_SELECT_VALUE: "Twin Bee",
    PENTAROU_CHARACTER_SELECT_VALUE: "Pentarou"
}

function isVicViper() => characterSelect() == VIC_VIPER_CHARACTER_SELECT_VALUE
function isOctopus() => characterSelect() == OCTOPUS_CHARACTER_SELECT_VALUE
function isTwinBee() => characterSelect() == TWIN_BEE_CHARACTER_SELECT_VALUE
function isPentarou() => characterSelect() == PENTAROU_CHARACTER_SELECT_VALUE

// $00A5: (8-bit) Shot type
//        
//        0x01 = Vic Viper Normal Shot
//        0x02 = Vic Viper Double
//        0x03 = TwinBee Rear Shot
//        0x04 = TwinBee 3-way Shot
//        0x05 = Octopus Ripple
//        0x06 = Vic Viper Laser 
//        0x0a = TwinBee Normal Shot
//        0x0b = Octopus Normal shot
//        0x0c = Octopus Tail Gun
//        0x0d = Penguin Normal shot
//        0x0f = Penguin Double Shot
//        0x10 = Penguin Spread(8-bit) Shot type
function shotType() => byte(0x0000A5)

VIC_VIPER_NORMAL_SHOT_VALUE = 0x01
TWIN_BEE_NORMAL_SHOT_VALUE = 0x0a
OCTOPUS_NORMAL_SHOT_VALUE = 0x0b
PENTAROU_NORMAL_SHOT_VALUE = 0x0d

function wasUpgradedShot() => prev(shotType()) != VIC_VIPER_NORMAL_SHOT_VALUE && 
                              prev(shotType()) != TWIN_BEE_NORMAL_SHOT_VALUE && 
                              prev(shotType()) != OCTOPUS_NORMAL_SHOT_VALUE && 
                              prev(shotType()) != PENTAROU_NORMAL_SHOT_VALUE
function isUpgradedShot() => shotType() != VIC_VIPER_NORMAL_SHOT_VALUE && 
                             shotType() != TWIN_BEE_NORMAL_SHOT_VALUE && 
                             shotType() != OCTOPUS_NORMAL_SHOT_VALUE && 
                             shotType() != PENTAROU_NORMAL_SHOT_VALUE

// $00A6: (8-bit) Special shot
//        
//        Note: If you have the wrong value the shot is correct, the graphics look wrong.
//        
//        0x00 = Normal shot
//        0x07 = Vic Viper Missile
//        0x08 = 2-way Octopus
//        0x09 = TwinBee Rocket
//        0x0e = Penguin Potion
function specialShot() => byte(0x0000A6)

NORMAL_SPECIAL_SHOT_VALUE = 0x00
function wasUpgradedSpecialShot() => prev(specialShot()) != NORMAL_SPECIAL_SHOT_VALUE
function isUpgradedSpecialShot() => specialShot() != NORMAL_SPECIAL_SHOT_VALUE

// $00A7: (8-bit) Power level
//        
//        0x00 = Out of power.
//        0x01 = Speed up
//        0x02 = 2-way
//        and so on up to 0x07 and then back to 0x01
function powerLevel() => byte(0x0000A7)

// $00A8: (8-bit) Speed up
//        
//        0x00 = Starting speed
//        0x01 = Level 1 speed
//        up to 0x05 = Level 5 speed
//        If you use speed up again it goes back to 0x00
function speedUp() => byte(0x0000A8)
ZERO_SPEED_UP_VALUE = 0x00
MAX_SPEED_UP_VALUE = 0x05

function anySpeedUp() => speedUp() != ZERO_SPEED_UP_VALUE

function wasMaxSpeedUp() => prev(speedUp()) == MAX_SPEED_UP_VALUE
function isMaxSpeedUp() => speedUp() == MAX_SPEED_UP_VALUE

// $00B4: (8-bit) Equipped weapon
//        
//        0x07= Vic Viper  Wall special  (orange bell)  (Same for TwinBee)
//        0x09 = Blue Bell Blast (different ability per character)
function equippedWeapon() => byte(0x0000B4)

// $00B7: (8-bit) Shoot special
//        
//        0x03 = No shooting (Enlargen/green bell)
//        0x01 = Horn attack (Grey bell, not used)
function shootSpecial() => byte(0x0000B7)

// $00B8: (8-bit) Invincibility + damage
//        
//        0x00 = Normal Collision
//        0x01 = Reverse Collision
function invincibilityField() => byte(0x0000B8)

// $00c0: (8-bit) Difficulty
//
//        0x00 = Easy
//        0x01 = Normal
//        0x02 = Hard
// This changes on death. 

// $1d1e: (8-bit) True Difficulty
//        
//        0x00 = Easy
//        0x01 = Normal
//        0x02 = Hard
function difficulty() => byte(0x001d1e)

EASY_MODE_VALUE = 0x00
NORMAL_MODE_VALUE = 0x01
HARD_MODE_VALUE = 0x02
difficultyLookup = {
    EASY_MODE_VALUE: "Easy",
    NORMAL_MODE_VALUE: "Normal",
    HARD_MODE_VALUE: "Hard"
}

function isNormalDifficultyOrHarder() => difficulty() >= NORMAL_MODE_VALUE
function isHardDifficulty() => difficulty() == HARD_MODE_VALUE


// $0965: (8-bit) Option 1
//        
//        0x00 = Active
//        0x02 = Octopus Option (mini Octopus)
//        0x04 = Penguin Option
function optionType1() => byte(0x000965)

// $0966: (8-bit) Option 2
//        
//        0x00 = Active
//        0x02 = Octopus Option (mini Octopus)
function optionType2() => byte(0x000966)

// $0967: (8-bit) Option 3
//        
//        0x00 = Active
//        0x02 = Octopus Option (mini Octopus)
function optionType3() => byte(0x000967)

// $0968: (8-bit) Option 4
//        
//        0x00 = Active
//        0x02 = Octopus Option (mini Octopus)
function optionType4() => byte(0x000968)

function wasMaxOption() => prev(optionType1()) == (characterSelect() + 1) && 
                           prev(optionType2()) == (characterSelect() + 1) && 
                           prev(optionType3()) == (characterSelect() + 1) && 
                           prev(optionType4()) == (characterSelect() + 1)
function isMaxOption() => optionType1() == (characterSelect() + 1) &&
                          optionType2() == (characterSelect() + 1) &&
                          optionType3() == (characterSelect() + 1) &&
                          optionType4() == (characterSelect() + 1)

function isNoOption() => optionType1() == 0x00 && 
                         optionType2() == 0x00 && 
                         optionType3() == 0x00 && 
                         optionType4() == 0x00

// $0969: (8-bit) Shield
//        
//        0x00 = Not active
//        0x01 = Vic Viper Shield
//        0x02 = Octopus Shield
//        0x03 = TwinBee Forcefield
//        0x04 = Penguin Bubble
//        0x05 = Horn Special (Grey Bell)
//        0x0a = Enlargen (control)
//        
//        If this sets to Enlargen it grows and then stays big and shrinks
function shieldType() => byte(0x000969)
NOT_ACTIVE_SHIELD_VALUE = 0x00
function wasShieldActive() => prev(shieldType()) == (characterSelect() + 1)
function isShieldActive() => shieldType() == (characterSelect() + 1)
function isNoShieldActive() => shieldType() == NOT_ACTIVE_SHIELD_VALUE

// $096A: (8-bit)  Special Attack
//        
//        0x06 = Horn Attack
function specialType() => byte(0x00096A)

// $1860: (8-bit) Major How far you've scrolled through the stage.
//        
//        Next 8-bit is counts up and triggers this.
//        
//        0x10 / 0xc0 Stage 1 Boss 1.
function majorStageLocation() => byte(0x001860)

// $1861: (8-bit) Minor How far you've scrolled through the stage.
//        
//        Next 8-bit is counts up and triggers this.
function minorStageLocation() => byte(0x001861)

// This will give it in a sorted order. 
function majorMinor() => word_be(0x001860) // Major How far you've scrolled through the stage.
function convertToMajorMinor(major, minor) => (major * 0x100) + minor

// $1D02: p(8-bit) Level Number (True Number)
//        
//        0x00 = Stage 1
//        0x01 = Stage 2
//        0x07 = Stage 8 (final) resets to 0
function stageNumber() => byte(0x001D02)

function enteringLocation(majorMinor, stage) => majorMinor == majorMinor() && 
                                                majorMinor - 1 == prev(majorMinor()) &&
                                                stageNumber() == stage - 1

function exitingLocation(majorMinor, stage) => majorMinor == prev(majorMinor()) && 
                                                majorMinor + 1 == majorMinor() &&
                                                stageNumber() == stage - 1

// $0D27: (8-bit) Boss Health
//        
//        0x0f = Starting health
//        0x0e = Lost one life.
//        0x80 = Death
//        Bit7 = Invincible (coming out)
//        
//        At Level 0 Major 0x10 Minor 0xC0
//        Become 0x80 Level 0x80 Then 0x00 at 010 minor 0xc1
//        
//        Appears to also be used for the dancer .But she's invincible
//        
//        Also used for Uncle Sam 
//        Stage 2 Major 10  Minor a0
//        
//        Stage 3. This becomes 0x80. then next 8 bytes is swapping between 0x08 and 0x06.  Starts at 0x84, then swaps to this, then Level 0x02 = Major 0x14 Minor 0x20
//        switches on invicibility (0x80) when attacking.
//        
//        Become 0x00 when leaving.
//        Level 0x02 = Major 0x14 Minor 0x21
//        
//        Level 0x04  = Major 0x17 Minor 0xd8
//        Don't gain more than 100 points at a time.
//        
//        Level 0x05 = Major 0x11 Minor 0x81
//        This is 0x86  Becomes minor 0x82  Stays 86
//        
//        Final boss is weird.  The gate closes around level 0x07 Major 0x0f Minor 0x99
//        
//        Wait until it becomes Major 0x0 and Minor 0x00
//        
//        
//        Boss for special is score dependant.
//        
//        For special stage.   Level 0b Majoir 0c Minor 3a
//        0x1381
BOSS_ONE_HEALTH_MEMORY_LOCATION = 0x000D27
function bossHealth() => byte(BOSS_ONE_HEALTH_MEMORY_LOCATION)

BOSS_STARTING_HEALTH = 0x0f

// $0D31: (8-bit) Cat Ship Boss Health
//        
//        0x08= Starting life.
//        0x07 = Damaged and abvle to be damaged again
//        bit 7  = "No damage"
//        0x89 = Dead
//        
//        Starts from level 0 Major 0x0c/Minor 0x58
//        Until  Becomes 0x00  at Level 0x0f / Minor 0xa8
CAT_MINI_BOSS_HEALTH_MEMORY_LOCATION = 0x000D31
function catShipBossHealth() => byte(CAT_MINI_BOSS_HEALTH_MEMORY_LOCATION)

// $0d32: (8 * 8-bit) Final Boss Legs Health
//        
//        0x01 = Starting life
//        Test if they all die at the same time for spared. 
//        Probably needs to check score for "Death" versus "partial spare" 
FINAL_BOSS_LEGS_HEALTH_MEMORY_LOCATION = 0x000D32

// $0D3D: (8-bit) Boss 5 Health  
//
//        Starts at 0x5. However you have to do other damage  to make this appear. 
LEVEL_5_BOSS_HEALTH_MEMORY_LOCATION = 0x000D3D

// $0D3F: (8-bit) Level 4 Boss  Health (Sumo)
//        
//        Seems to be 0x17 life Level 0x03 Major 0x10 Minor 0x49
LEVEL_4_BOSS_HEALTH_MEMORY_LOCATION = 0x000D3F
function altBossHealth() => byte(LEVEL_4_BOSS_HEALTH_MEMORY_LOCATION)

// $0D4D: (8-bit) 7th Boss Health
//        
//        Level 0x06 Major 0x0a Minor 0x28
//        Becomes 0x00 and then 0x29-p
LEVEL_7_BOSS_HEALTH_MEMORY_LOCATION = 0x000D4D
function thirdBossHealth() => byte(LEVEL_7_BOSS_HEALTH_MEMORY_LOCATION)

// $0D4E: (8-bit)  Boss for Special
//        
//        (900k Boss Special)
//        
//        0x0f
//        
//        (30k or less boss ) 0x8f
SPECIAL_BOSS_HEALTH_MEMORY_LOCATION = 0x000D4E
function specialBossHealth() => byte(SPECIAL_BOSS_HEALTH_MEMORY_LOCATION)

// $1381: (8-bit) Boss Of Special Mode
//        
//        0x00 = "Less than 30k"
//        0x01 = "General" Boss (level 1)
//        0x05 = 900Thousand Boss for Special mode
//        0x09 = 1 Million+ Boss for Special mode
function bossTypeForSpecial() => byte(0x001381)

LOW_SCORE_SPECIAL_BOSS_VAUE = 0x00
NINE_HUNDRED_THOUSAND_SPECIAL_BOSS_VALUE = 0x05
ONE_MILLION_SPECIAL_BOSS_VALUE = 0x09

function isLowScoreSpecialBoss() => bossTypeForSpecial() == LOW_SCORE_SPECIAL_BOSS_VAUE
function isNineHundredThousandSpecialBoss() => bossTypeForSpecial() == NINE_HUNDRED_THOUSAND_SPECIAL_BOSS_VALUE
function isOneMillionSpecialBoss() => bossTypeForSpecial() == ONE_MILLION_SPECIAL_BOSS_VALUE

// $1D04: (8-bit) Loop Number
//        
//        0x00 = First loop
//        0x01 = Second Loop
function loopNumber() => byte(0x001D04)

function reachedNewLoop() => loopNumber() > prev(loopNumber())

// $1F8C: (32-bit) BCD of Players Score in Normal Mode
//        
//        (Control Value)
function playerScoreArcade() => bcd(dword(0x001F8C))

// $1f84: (32-bit) BCD of Players Score in Special Mode
//
//        (Control Value)
function playerScoreSpecial() => bcd(dword(0x001F8C))

// $1F95: (8-bit) Gameplay Mode
//        
//        0x00 = 1 Player
//        0x01 = 2 Player
//        0x02 = Special
function gameMode() => byte(0x001F95)

ONE_PLAYER_MODE_VALUE = 0x00
TWO_PLAYER_MODE_VALUE = 0x01
SPECIAL_MODE_VALUE = 0x02

function isOnePlayerMode() => gameMode() == ONE_PLAYER_MODE_VALUE
function isTwoPlayerMode() => gameMode() == TWO_PLAYER_MODE_VALUE
function isSpecialMode() => gameMode() == SPECIAL_MODE_VALUE

// $139F: (8-bit) Final Boss Count Down timer for "Escape"
//        
//        (8-bit) 3rd Stage Boss Major value.
function finalBossMinorTimer() => byte(0x00139F)
function boss3MajorTimer() => byte(0x00139F)

// $13E7: (8-bit) Boss Major Countdown value
//        
//        Works with 0x139f for the Final Boss, also 0x142f for stage 5
//        
//        (8-bit) Minor Countdown for Stage 3
//        
//        
//        
//        Counts down to 0x00.  When this and 0x139f 0x00
//        Finall boss "Dies"
function finalBossMajorTimer() => byte(0x0013E7)
function boss5MajorTimer() => byte(0x0013E7)
function boss3MinorTimer() => byte(0x0013E7)

// $140E: (8-bit) 900K Special Boss Attacks  Becomes 0xff when it "flees"
//
//        (8-bit) 30k Special Boss  Flees at 0x00
function nineThousandBossAttacks() => byte(0x00140E)
function thirtyThousandBossAttacks() => byte(0x00140E)

// $142F: (8-bit) Minor timer for Boss Stage 5
//        
//        (8-bit) Attack Cycles for Boss 2
function boss5MinorTimer() => byte(0x00142F)
function boss2Attacks() => byte(0x00142F)

// $1458: (8-bit) Attack count for Boss 4
//        
//        when this hits 0x00 You're safe.
function boss4Attacks() => byte(0x001458)

// $1477: (8-bit) Boss 1 Minor Timer.
//        
//        (8-bit) 1 Million Special Boss Minor Timer
function boss1MinorTimer() => byte(0x001477)
function oneMillionBossMinorTimer() => byte(0x001477)

// $14BF: (8-bit) Boss1 Major Timer.
//        
//        (8-bit) 1 Million Special Boss Major Timer
function boss1MajorTimer() => byte(0x0014BF)
function oneMillionBossMajorTimer() => byte(0x0014BF)

// $154F: (8-bit) Attack Countdown for Boss 6
function boss6Attacks() => byte(0x00154F)

// $164D: (8-bit) Boss 7 Flee Minor Countdown
function boss7MinorTimer() => byte(0x00164D)

// $1695: (8-bit) Boss 7 Flee Major Countdown
function boss7MajorTimer() => byte(0x001695)

// $1802: (8-bit) Ship Choice Screen.
//
//        0x00 = Main Gameplay (Main Menu) 
//        0x01 = Choosing ship 
function shipChoiceScreen() => byte(0x001802)

function inGame() => shipChoiceScreen() == 0x00

function achievementIsValid() => demoCheck1() == DEMO_CHECK1_VALUE && demoCheck2() == DEMO_CHECK2_VALUE && inGame()

function justStartedGame() 
{
    return demoCheck1() == DEMO_CHECK1_VALUE &&
           demoCheck2() == DEMO_CHECK2_VALUE &&
           prev(shipChoiceScreen()) == 0x01 &&
           shipChoiceScreen() == 0x00 &&  // ship choice is done last.
           stageNumber() == 0x00 &&
           loopNumber() == 0x00
}

function notInGame() => demoCheck1() != DEMO_CHECK1_VALUE || demoCheck2() != DEMO_CHECK2_VALUE

function enteringStage(stage) => enteringLocation(convertToMajorMinor(0x00, 0x41), stage) 

// Pass in the stage so 1 will detect the first stage. 
function beatStageNumber(stage) 
{
    if (stage == 8)
    {
        return prev(stageNumber()) == 0x07 && stageNumber() == 0x00 && loopNumber() > prev(loopNumber())
    }
    else
    {
        return stageNumber() == stage && prev(stageNumber()) == stage - 1
    }
}

BOSS_NAME = "BOSS_NAME"
BOSS_HEALTH_LOCATION = "BOSS_MEMORY_LOCATION"
STAGE_INDEX = "STAGE_INDEX"
BOSS_STARTING_HEALTH = "BOSS_STARTING_HEALTH"
BOSS_LOCATION_IN_STAGE = "BOSS_LOCATION_IN_STAGE"
BOSS_EXIT_IN_STAGE = "BOSS_EXIT_IN_STAGE"
BOSS_SPARED_POINTS = "BOSS_SPARED_POINTS"
BOSS_KILLED_POINTS = "BOSS_KILLED_POINTS"
MODE_CHECK = "MODE_CHECK"
BOSS_FLEE_CHECK = "BOSS_FLEE_CHECK"
SPECIAL_BOSS_VALUE = "SPECIAL_BOSS_VALUE"
TITLE = "TITLE"
DESCRIPTION = "DESCRIPTION"
POINTS = "POINTS"
CHARACTER_SELECT_VALUE = "CHARACTER_SELECT_VALUE"
SCORE = "SCORE"

function bossSpared(bossHealth, memoryLocation) => byte(memoryLocation) == 0x80 && (prev(byte(memoryLocation)) & 0x7f) == bossHealth
function bossKilled(memoryLocation) => byte(memoryLocation) == 0x00 && prev(byte(memoryLocation)) & 0x7f == 0x01
function bossDamaged(memoryLocation) => (prev(byte(memoryLocation) & 0x7f) - (byte(memoryLocation) & 0x7f) == 1)

function levelAchievement(levelData)
{
    achievement( title = levelData[TITLE],
                 description = levelData[DESCRIPTION],
                 points = levelData[POINTS],
                 trigger = beatStageNumber(levelData[STAGE_INDEX]) &&
                           achievementIsValid()
    )
}

levelDataList = 
[
    {
        TITLE: "Stage 1 Cleared",
        DESCRIPTION: "Beat Stage 1",
        POINTS: 1,
        STAGE_INDEX: 1
    },
    {
        TITLE: "Stage 2 Cleared",
        DESCRIPTION: "Beat Stage 2",
        POINTS: 1,
        STAGE_INDEX: 2
    },
    {
        TITLE: "Stage 3 Cleared",
        DESCRIPTION: "Beat Stage 3",
        POINTS: 1,
        STAGE_INDEX: 3
    },
    {
        TITLE: "Stage 4 Cleared",
        DESCRIPTION: "Beat Stage 4",
        POINTS: 1,
        STAGE_INDEX: 4
    },
    {
        TITLE: "Stage 5 Cleared",
        DESCRIPTION: "Beat Stage 5",
        POINTS: 1,
        STAGE_INDEX: 5
    },
    {
        TITLE: "Stage 6 Cleared",
        DESCRIPTION: "Beat Stage 6",
        POINTS: 1,
        STAGE_INDEX: 6
    },
    {
        TITLE: "Stage 7 Cleared",
        DESCRIPTION: "Beat Stage 7",
        POINTS: 1,
        STAGE_INDEX: 7
    },
    {
        TITLE: "First Loop Cleared",
        DESCRIPTION: "Beat Stage 8 on any Difficuly",
        POINTS: 1,
        STAGE_INDEX: 0x8            
    },
    {
        TITLE: "Special Stage Half Cleared",
        DESCRIPTION: "Beat half of the Special Stage",
        POINTS: 1,
        STAGE_INDEX: 0xa
    }
]

for data in levelDataList
{
    levelAchievement(data)
}

achievement( title = "First Loop Cleared Normal",
             description = "Beat level 8 on normal or hard difficulty",
             points = 1,
             trigger = once(justStartedGame()) &&
                       never(notInGame()) &&
                       never(!isNormalDifficultyOrHarder()) && // You can mouse over Easy accidentally.
                       trigger_when(reachedNewLoop()) &&
                       achievementIsValid()
                       
)

achievement( title = "First Loop Cleared Hard",
             description = "Beat level 8 on Hard difficulty",
             points = 1,
             trigger = once(justStartedGame()) &&
                       never(notInGame()) &&
                       never(!isHardDifficulty()) && // You can mouse over other difficulties accidentally.
                       trigger_when(reachedNewLoop()) &&
                       isHardDifficulty() &&
                       achievementIsValid()
)

achievement( title = "Finished Special",
             description = "Beat Special mode on any difficulty",
             points = 1,
             trigger = isSpecialMode() &&
                       exitingLocation(convertToMajorMinor(0x0c, 0x3a), 0xb) &&
                       achievementIsValid()
)

achievement( title = "Finished Special Normal",
             description = "Beat Special mode on normal or hard difficulty",
             points = 1,
             trigger = isSpecialMode() &&
                       isNormalDifficultyOrHarder() &&
                       exitingLocation(convertToMajorMinor(0x0c, 0x3a), 0xb) &&
                       achievementIsValid()
)

achievement( title = "Finished Special Hard",
             description = "Beat Special mode on hard difficulty",
             points = 1,
             trigger = isSpecialMode() &&
                       isHardDifficulty() &&
                       exitingLocation(convertToMajorMinor(0x0c, 0x3a), 0xb) &&
                       achievementIsValid()
)

function beatGameAchievement(characterData)
{
    achievement( title = characterData[TITLE],
                 description = characterData[DESCRIPTION],
                 points = characterData[POINTS],
                 trigger = once(justStartedGame()) &&
                           never(notInGame()) &&
                           never(characterSelect() != characterData[CHARACTER_SELECT_VALUE]) && 
                           characterSelect() == characterData[CHARACTER_SELECT_VALUE] &&
                           trigger_when(beatStageNumber(0x8)) &&
                           achievementIsValid()
    )
}

beatGameCharacterData =
[
    {
        TITLE: "Staring Vic Viper",
        DESCRIPTION: "Beat the game as Vic Viper",
        POINTS: 1,
        CHARACTER_SELECT_VALUE: VIC_VIPER_CHARACTER_SELECT_VALUE
    },
    {
        TITLE: "Staring Octopus",
        DESCRIPTION: "Beat the game as Octopus",
        POINTS: 1,
        CHARACTER_SELECT_VALUE: OCTOPUS_CHARACTER_SELECT_VALUE
    },
    {
        TITLE: "Staring TwinBee",
        DESCRIPTION: "Beat the game as TwinBee",
        POINTS: 1,
        CHARACTER_SELECT_VALUE: TWIN_BEE_CHARACTER_SELECT_VALUE
    },
    {
        TITLE: "Staring Pentarou",
        DESCRIPTION: "Beat the game as Pentarou",
        POINTS: 1,
        CHARACTER_SELECT_VALUE: PENTAROU_CHARACTER_SELECT_VALUE
    }
]

for data in beatGameCharacterData
{
    beatGameAchievement(data)
}

function beatSpecialAchievement(characterData)
{
    achievement( title = characterData[TITLE],
                 description = characterData[DESCRIPTION],
                 points = characterData[POINTS],
                 trigger = characterSelect() == characterData[CHARACTER_SELECT_VALUE] &&
                           isSpecialMode() &&
                           exitingLocation(convertToMajorMinor(0x0c, 0x3a), 0xb) &&
                           achievementIsValid()
    )
}

beatSpecialCharacterData =
[
    {
        TITLE: "Special Guest Vic Viper",
        DESCRIPTION: "Beat Special mode as Vic Viper",
        POINTS: 1,
        CHARACTER_SELECT_VALUE: VIC_VIPER_CHARACTER_SELECT_VALUE
    },
    {
        TITLE: "Special Guest Octopus",
        DESCRIPTION: "Beat Special mode as Octopus",
        POINTS: 1,
        CHARACTER_SELECT_VALUE: OCTOPUS_CHARACTER_SELECT_VALUE
    },
    {
        TITLE: "Special Guest TwinBee",
        DESCRIPTION: "Beat Special mode as TwinBee",
        POINTS: 1,
        CHARACTER_SELECT_VALUE: TWIN_BEE_CHARACTER_SELECT_VALUE
    },
    {
        TITLE: "Special Guest Pentarou",
        DESCRIPTION: "Beat Special mode as Pentarou",
        POINTS: 1,
        CHARACTER_SELECT_VALUE: PENTAROU_CHARACTER_SELECT_VALUE
    }

]


function noHitLevelAchievement(levelData)
{
    startingCheck = enteringStage(levelData[STAGE_INDEX])
    achievement( title = levelData[TITLE],
                 description = levelData[DESCRIPTION],
                 points = levelData[POINTS],
                 trigger = once(startingCheck) &&
                           trigger_when(beatStageNumber(levelData[STAGE_INDEX])) &&
                           never(justLostLife()) &&
                           never(!achievementIsValid()) && // You can mouse over other difficulties accidentally.
                           never(stageNumber() != levelData[STAGE_INDEX] - 1 && stageNumber() != levelData[STAGE_INDEX]) && // You can mouse over other difficulties accidentally.
                           achievementIsValid()
    )
}


noHitLevelDataList = 
[
    {
        TITLE: "Slick Stage 1",
        DESCRIPTION: "Beat Stage 1 without losing a life on hard difficulty",
        POINTS: 1,
        STAGE_INDEX: 1
    },
    {
        TITLE: "Slick Stage 2",
        DESCRIPTION: "Beat Stage 2 without losing a life on hard difficulty",
        POINTS: 1,
        STAGE_INDEX: 2
    },
    {
        TITLE: "Slick Stage 3",
        DESCRIPTION: "Beat Stage 3 without losing a life on hard difficulty",
        POINTS: 1,
        STAGE_INDEX: 3
    },
    {
        TITLE: "Slick Stage 4",
        DESCRIPTION: "Beat Stage 4 without losing a life on hard difficulty",
        POINTS: 1,
        STAGE_INDEX: 4
    },
    {
        TITLE: "Slick Stage 5",
        DESCRIPTION: "Beat Stage 5 without losing a life on hard difficulty",
        POINTS: 1,
        STAGE_INDEX: 5
    },
    {
        TITLE: "Slick Stage 6",
        DESCRIPTION: "Beat Stage 6 without losing a life on hard difficulty",
        POINTS: 1,
        STAGE_INDEX: 6
    },
    {
        TITLE: "Slick Stage 7",
        DESCRIPTION: "Beat Stage 7 without losing a life on hard difficulty",
        POINTS: 1,
        STAGE_INDEX: 7
    },
    {
        TITLE: "Slick Stage 8",
        DESCRIPTION: "Beat Stage 8 without losing a life on hard difficulty",
        POINTS: 1,
        STAGE_INDEX: 0x8            
    }
]

for data in noHitLevelDataList
{
    noHitLevelAchievement(data)
}

SPECIAL_STAGE_FIRST_INDEX = 0x0b  // plus 1 
SPECIAL_STAGE_END_INDEX = 0x0c  // plus 1
achievement( title = "Slick Special",
             description = "Beat Special mode without losing a life",
             points = 1,
             trigger = once(enteringStage(SPECIAL_STAGE_FIRST_INDEX)) &&
                       trigger_when(exitingLocation(convertToMajorMinor(0x0c, 0x3a), SPECIAL_STAGE_END_INDEX)) &&
                       never(justLostLife()) &&
                       never(!achievementIsValid()) &&
                       never(!isSpecialMode()) &&
                       achievementIsValid()
)

achievement( title = "Super Slick Special",
             description = "Beat Special mode without losing a life on hard difficulty",
             points = 1,
             trigger = once(enteringStage(SPECIAL_STAGE_FIRST_INDEX)) &&
                       trigger_when(exitingLocation(convertToMajorMinor(0x0c, 0x3a), SPECIAL_STAGE_END_INDEX)) &&
                       never(justLostLife()) &&
                       never(!achievementIsValid()) &&
                       never(!isSpecialMode()) &&
                       achievementIsValid() &&
                       isHardDifficulty()

)

function bossSparedAchievement(bossData)
{
    exitingLocationCondition = exitingLocation(bossData[BOSS_LOCATION_IN_STAGE], bossData[STAGE_INDEX])
    if (ContainsKey(bossData, BOSS_EXIT_IN_STAGE))
    {
        exitingLocationCondition = exitingLocation(bossData[BOSS_EXIT_IN_STAGE], bossData[STAGE_INDEX])
    }
    boss_flee_check = always_true()
    if (ContainsKey(bossData, BOSS_FLEE_CHECK))
    {
        boss_flee_check = bossData[BOSS_FLEE_CHECK]
    }
    special_Boss_Check = always_true() // not a special boss. 
    if (ContainsKey(bossData, SPECIAL_BOSS_VALUE))
    {
        special_Boss_Check = bossData[SPECIAL_BOSS_VALUE]
        achievement( title = format("Junior {0} Spared", bossData[BOSS_NAME]),
                 description = "Spare " + bossData[BOSS_NAME] + " on stage " + (bossData[STAGE_INDEX]) + " without damaging them at all",
                 points = bossData[BOSS_SPARED_POINTS],
                 trigger = once(enteringLocation(bossData[BOSS_LOCATION_IN_STAGE], bossData[STAGE_INDEX])) && 
                           never(bossDamaged(bossData[BOSS_HEALTH_LOCATION])) &&
                           never(stageNumber() != bossData[STAGE_INDEX] - 1) &&
                           never(justLostLife()) &&
                           bossData[MODE_CHECK] &&
                           trigger_when( once(bossSpared(bossData[BOSS_STARTING_HEALTH], bossData[BOSS_HEALTH_LOCATION])) && // shouldn't need this
                                         once(boss_flee_check) &&
                                         exitingLocationCondition ) &&
                           special_Boss_Check &&
                           achievementIsValid()
        )
    }
    
    achievement( title = format("{0} Spared", bossData[BOSS_NAME]),
                 description = "Spare " + bossData[BOSS_NAME] + " on stage " + (bossData[STAGE_INDEX] + 1) + " on hard difficulty without damaging them at all",
                 points = bossData[BOSS_SPARED_POINTS],
                 trigger = once(enteringLocation(bossData[BOSS_LOCATION_IN_STAGE], bossData[STAGE_INDEX])) && 
                           never(bossDamaged(bossData[BOSS_HEALTH_LOCATION])) &&
                           never(stageNumber() != bossData[STAGE_INDEX] - 1) &&
                           never(justLostLife()) &&
                           bossData[MODE_CHECK] &&
                           trigger_when( once(bossSpared(bossData[BOSS_STARTING_HEALTH], bossData[BOSS_HEALTH_LOCATION])) && // shouldn't need this
                                         once(boss_flee_check) &&
                                         exitingLocationCondition ) &&
                           special_Boss_Check &&
                           isHardDifficulty() &&
                           achievementIsValid()
    )
} 

function bossKilledAchievement(bossData)
{
    exitingLocationCondition = exitingLocation(bossData[BOSS_LOCATION_IN_STAGE], bossData[STAGE_INDEX])
    if (ContainsKey(bossData, BOSS_EXIT_IN_STAGE))
    {
        exitingLocationCondition = exitingLocation(bossData[BOSS_EXIT_IN_STAGE], bossData[STAGE_INDEX])
    }
 
    boss_flee_check = always_false()
    if (ContainsKey(bossData, BOSS_FLEE_CHECK))
    {
        boss_flee_check = bossData[BOSS_FLEE_CHECK]
    }
    
    special_Boss_Check = always_true() // not a special boss. 
    if (ContainsKey(bossData, SPECIAL_BOSS_VALUE))
    {
        special_Boss_Check = bossData[SPECIAL_BOSS_VALUE]
        // Just run a second achievement for the special bosses.  No difficulty check.     
        achievement( title = format("Junior {0} Killed", bossData[BOSS_NAME]),
                 description = "Beat " + bossData[BOSS_NAME] + " in stage " + bossData[STAGE_INDEX] + "on hard difficulty",
                 points = bossData[BOSS_KILLED_POINTS],
                 trigger = once(enteringLocation(bossData[BOSS_LOCATION_IN_STAGE], bossData[STAGE_INDEX])) && 
                           bossData[MODE_CHECK] &&
                           never(stageNumber() != bossData[STAGE_INDEX] - 1) &&
                           never(justLostLife()) &&
                           trigger_when( once(bossKilled(bossData[BOSS_HEALTH_LOCATION])) && 
                                         exitingLocationCondition) &&
                           special_Boss_Check &&
                           never(boss_flee_check) &&
                           achievementIsValid()

        )
    }

    achievement( title = format("{0} Killed", bossData[BOSS_NAME]),
                 description = "Beat " + bossData[BOSS_NAME] + " in stage " + (bossData[STAGE_INDEX] + 1) + " on hard difficulty",
                 points = bossData[BOSS_KILLED_POINTS],
                 trigger = once(enteringLocation(bossData[BOSS_LOCATION_IN_STAGE], bossData[STAGE_INDEX])) && 
                           bossData[MODE_CHECK] &&
                           never(stageNumber() != bossData[STAGE_INDEX] - 1) &&
                           never(justLostLife()) &&
                           trigger_when( once(bossKilled(bossData[BOSS_HEALTH_LOCATION])) && 
                                         exitingLocationCondition) &&
                           special_Boss_Check &&
                           isHardDifficulty() &&
                           never(boss_flee_check) &&
                           achievementIsValid()

    )
}

bossData = 
[
    { 
        BOSS_NAME: "Cat Ship",
        BOSS_HEALTH_LOCATION: CAT_MINI_BOSS_HEALTH_MEMORY_LOCATION,
        STAGE_INDEX: 1,
        BOSS_STARTING_HEALTH: 0x08,
        BOSS_LOCATION_IN_STAGE: convertToMajorMinor(0x0c, 0x58),
        BOSS_EXIT_IN_STAGE: convertToMajorMinor(0x0f, 0xa8),
        BOSS_SPARED_POINTS: 2,
        BOSS_KILLED_POINTS: 1,
        MODE_CHECK: isOnePlayerMode()
    },
    { 
        BOSS_NAME: "Big Bird",
        BOSS_HEALTH_LOCATION: BOSS_ONE_HEALTH_MEMORY_LOCATION,
        STAGE_INDEX: 1,
        BOSS_STARTING_HEALTH: 0x0f,
        BOSS_LOCATION_IN_STAGE: convertToMajorMinor(0x10, 0xc0),
        BOSS_SPARED_POINTS: 2,
        BOSS_KILLED_POINTS: 1,
        MODE_CHECK: isOnePlayerMode(),
        BOSS_FLEE_CHECK: (boss1MajorTimer() == 0x00 && boss1MinorTimer() == 0x00)
    },
    {
        BOSS_NAME: "Uncle Sam",
        BOSS_HEALTH_LOCATION: BOSS_ONE_HEALTH_MEMORY_LOCATION,
        STAGE_INDEX: 2,
        BOSS_STARTING_HEALTH: 0x0f,
        BOSS_LOCATION_IN_STAGE: convertToMajorMinor(0x10, 0xa0),
        BOSS_SPARED_POINTS: 2,
        BOSS_KILLED_POINTS: 1,
        MODE_CHECK: isOnePlayerMode(),
        BOSS_FLEE_CHECK: (boss2Attacks() == 0x00)

    },
    // Boss 3 needs to be special code because it's 8 characters. 
    { 
        BOSS_NAME: "Sumo",
        BOSS_HEALTH_LOCATION: LEVEL_4_BOSS_HEALTH_MEMORY_LOCATION,
        STAGE_INDEX: 4,
        BOSS_STARTING_HEALTH: 0x17,
        BOSS_LOCATION_IN_STAGE: convertToMajorMinor(0x10, 0x49),
        BOSS_SPARED_POINTS: 2,
        BOSS_KILLED_POINTS: 1,
        MODE_CHECK: isOnePlayerMode(),
        BOSS_FLEE_CHECK: (boss4Attacks() == 0x00)
    },
    // Boss 5 needs to be special because it's multi-stage because it's score calculation. 
    {   
        // Boss 6 doesn't appear to have countdown (probably an attack countdown.)
        BOSS_NAME: "6th Boss", // Lady killer, White Knight
        BOSS_HEALTH_LOCATION: BOSS_ONE_HEALTH_MEMORY_LOCATION,
        STAGE_INDEX: 6,
        BOSS_STARTING_HEALTH: 0x06,
        BOSS_LOCATION_IN_STAGE: convertToMajorMinor(0x11, 0x81),
        BOSS_SPARED_POINTS: 2,
        BOSS_KILLED_POINTS: 1,
        MODE_CHECK: isOnePlayerMode(),
        BOSS_FLEE_CHECK: (boss6Attacks() == 0x00)
    },
    { 
        BOSS_NAME: "7th Boss",
        BOSS_HEALTH_LOCATION: LEVEL_7_BOSS_HEALTH_MEMORY_LOCATION,
        STAGE_INDEX: 7,
        BOSS_STARTING_HEALTH: 0xf,
        BOSS_LOCATION_IN_STAGE: convertToMajorMinor(0x0a, 0x28),
        BOSS_SPARED_POINTS: 2,
        BOSS_KILLED_POINTS: 1,
        MODE_CHECK: isOnePlayerMode(),
        BOSS_FLEE_CHECK: ( boss7MajorTimer() == 0x00 && boss7MinorTimer() == 0x00)
    },
    // Boss 8 is special for the exit. 
    {
        BOSS_NAME: "30k Boss",
        BOSS_HEALTH_LOCATION: SPECIAL_BOSS_HEALTH_MEMORY_LOCATION,
        STAGE_INDEX: 0xc,
        BOSS_STARTING_HEALTH: 0x0f,
        BOSS_LOCATION_IN_STAGE: convertToMajorMinor(0x0c, 0x3a),
        SPECIAL_BOSS_VALUE: isLowScoreSpecialBoss(),
        BOSS_SPARED_POINTS: 2,
        BOSS_KILLED_POINTS: 1,
        MODE_CHECK: isSpecialMode(),
        BOSS_FLEE_CHECK: (thirtyThousandBossAttacks() == 0x00)
    },
    {
        BOSS_NAME: "900k Boss",
        BOSS_HEALTH_LOCATION: SPECIAL_BOSS_HEALTH_MEMORY_LOCATION,
        STAGE_INDEX: 0xc,
        BOSS_STARTING_HEALTH: 0x0f,
        BOSS_LOCATION_IN_STAGE: convertToMajorMinor(0x0c, 0x3a),
        SPECIAL_BOSS_VALUE: isNineHundredThousandSpecialBoss(),
        BOSS_SPARED_POINTS: 2,
        BOSS_KILLED_POINTS: 1,
        MODE_CHECK: isSpecialMode(),
        BOSS_FLEE_CHECK: (nineThousandBossAttacks() == 0xff)
    },
    {
        BOSS_NAME: "1 Million Boss",
        BOSS_HEALTH_LOCATION: BOSS_ONE_HEALTH_MEMORY_LOCATION,
        STAGE_INDEX: 0xc,
        BOSS_STARTING_HEALTH: 0x0f,
        BOSS_LOCATION_IN_STAGE: convertToMajorMinor(0x0c, 0x3a),
        SPECIAL_BOSS_VALUE: isOneMillionSpecialBoss(),
        BOSS_SPARED_POINTS: 2,
        BOSS_KILLED_POINTS: 1,
        MODE_CHECK: isSpecialMode(),
        BOSS_FLEE_CHECK: (oneMillionBossMajorTimer() == 0x00 && oneMillionBossMinorTimer() == 0x00)
    }
]

for data in bossData 
{
    bossSparedAchievement(data)
}
for data in bossData 
{
    bossKilledAchievement(data)
}

OCTO_LIPS_MAJOR_MINOR = convertToMajorMinor(0x14, 0x20)
OCTO_LIPS_STAGE_INDEX = 3
OCTO_LIPS_HEALTH_AMOUNT = 0x08
OCTO_LIPS_HEALTH_AMOUNT_ALTERNATE = 0x06
achievement(title = "No PDAs Here",
            description = "Spare the Octo Lips on Stage 3 on hard difficulty without damaging any of them",
            points = 1,
            trigger = once(enteringLocation(OCTO_LIPS_MAJOR_MINOR, OCTO_LIPS_STAGE_INDEX)) &&
                      never(any_of(range(0,8, step= 0x1), index => bossDamaged(BOSS_ONE_HEALTH_MEMORY_LOCATION + index))) &&
                      never(stageNumber() != OCTO_LIPS_STAGE_INDEX - 1) && 
                      never(justLostLife()) &&
                      isOnePlayerMode() &&
                      trigger_when( all_of(range(1,7, step= 0x2), index => once(bossSpared(OCTO_LIPS_HEALTH_AMOUNT, BOSS_ONE_HEALTH_MEMORY_LOCATION + index))) && // shouldn't need this
                                    all_of(range(2,8, step= 0x2), index => once(bossSpared(OCTO_LIPS_HEALTH_AMOUNT_ALTERNATE,BOSS_ONE_HEALTH_MEMORY_LOCATION + index))) && // shouldn't need this
                                    exitingLocation(OCTO_LIPS_MAJOR_MINOR, OCTO_LIPS_STAGE_INDEX) &&
                                    once(boss3MajorTimer() == 0x00 && 
                                         boss3MinorTimer() == 0x00)) &&
                      isHardDifficulty() &&
                      achievementIsValid()
                      
)

achievement(title = "So many Kisses",
            description = "Beat all the Octo Lips on Stage 3 on hard difficulty",
            points = 1,
            trigger = once(enteringLocation(OCTO_LIPS_MAJOR_MINOR, OCTO_LIPS_STAGE_INDEX)) &&
                      never(stageNumber() != OCTO_LIPS_STAGE_INDEX - 1) && 
                      never(justLostLife()) &&
                      isOnePlayerMode() &&
                      trigger_when( all_of(range(1,7, step= 0x2), index => once(bossKilled(BOSS_ONE_HEALTH_MEMORY_LOCATION + index))) && 
                                    all_of(range(2,8, step= 0x2), index => once(bossKilled(BOSS_ONE_HEALTH_MEMORY_LOCATION + index))) && 
                                    exitingLocation(OCTO_LIPS_MAJOR_MINOR, OCTO_LIPS_STAGE_INDEX)) &&
                      isHardDifficulty() &&
                      never(boss3MajorTimer() == 0x00 && 
                            boss3MinorTimer() == 0x00) &&
                      achievementIsValid()
)

BOSS_5_LEVEL_INDEX = 5
BOSS_5_MAJOR_MINOR = convertToMajorMinor(0x17, 0xd8)

achievement(title = "Gambler's Anonymous",
            description = "Spare the Boss of the 5th stage on hard difficulty without damaging her at all",
            points = 1,
            trigger = once(enteringLocation(BOSS_5_MAJOR_MINOR, BOSS_5_LEVEL_INDEX)) && 
                      // never(bossDamaged(BOSS_ONE_HEALTH_MEMORY_LOCATION)) &&  // Multi stage boss, so probably could find a way to do this, but let's just check score calculation
                      never(playerScoreArcade() > 101 + prev(playerScoreArcade())) && // more than 100 points in a single frame.  May have to increase it to 499
                      never(stageNumber() != BOSS_5_LEVEL_INDEX - 1) &&
                      never(justLostLife()) &&
                      isOnePlayerMode() &&
                      trigger_when(exitingLocation(BOSS_5_MAJOR_MINOR, BOSS_5_LEVEL_INDEX) &&
                                   boss5MinorTimer() == 0x00 && 
                                   boss5MajorTimer() == 0x00) &&
                      isHardDifficulty() &&
                      achievementIsValid()
)

achievement(title = "Jackpot!",
            description = "Kill the Boss of the 5th stage on hard difficulty",
            points = 1,
            trigger = once(enteringLocation(BOSS_5_MAJOR_MINOR, BOSS_5_LEVEL_INDEX)) && 
                      never(stageNumber() != BOSS_5_LEVEL_INDEX - 1 ) &&
                      never(justLostLife()) &&
                      isOnePlayerMode() &&
                      trigger_when( once(bossKilled(LEVEL_5_BOSS_HEALTH_MEMORY_LOCATION)) && 
                                    exitingLocation(BOSS_5_MAJOR_MINOR, BOSS_5_LEVEL_INDEX)) &&
                      isHardDifficulty() &&
                      never(boss5MajorTimer() == 0x00 && 
                            boss5MinorTimer() == 0x00) &&
                      achievementIsValid()
)


FINAL_BOSS_ENTERING_MAJOR_MINOR = convertToMajorMinor(0x0f, 0x99)
FINAL_BOSS_LEVEL_INDEX = 0x08
FINAL_BOSS_HEALTH = 0x01
FINAL_BOSS_EXITING_PREVIOUS = convertToMajorMinor(0x10, 0x79)
FINAL_BOSS_EXITING_POST = convertToMajorMinor(0x0,0x0)

function boss8exitingLocation() => FINAL_BOSS_EXITING_PREVIOUS == prev(majorMinor()) && FINAL_BOSS_EXITING_POST == majorMinor()
FINAL_BOSS_FIRST_HEALTH_LOCATION = CAT_MINI_BOSS_HEALTH_MEMORY_LOCATION + 1
FINAL_BOSS_NUMBER_OF_HEALTH = 7

achievement(title = "The Light Ending (Duality of Choice)",
            description = "Spare the final boss without damaging them at all on hard difficulty",
            points = 1,
            trigger = once(enteringLocation(FINAL_BOSS_ENTERING_MAJOR_MINOR, FINAL_BOSS_LEVEL_INDEX)) && 
                      never(any_of(range(0,FINAL_BOSS_NUMBER_OF_HEALTH, step= 0x1), index => bossDamaged(FINAL_BOSS_FIRST_HEALTH_LOCATION + index))) && 
                      never(stageNumber() != FINAL_BOSS_LEVEL_INDEX - 1 && stageNumber() != 0  ) &&
                      never(justLostLife()) &&
                      isOnePlayerMode() &&
                      // All arms damaged at the same time (killed) and time has run out
                      trigger_when( once( all_of( range(0,FINAL_BOSS_NUMBER_OF_HEALTH, step= 0x1), index => bossDamaged(FINAL_BOSS_FIRST_HEALTH_LOCATION + index)) &&
                                          finalBossMajorTimer() == 0x00 && 
                                          finalBossMinorTimer() == 0x00) && 
                                    boss8exitingLocation() &&
                                    finalBossMajorTimer() == 0x00 &&  // This should be duplicate, but let's keep it the same as others. 
                                    finalBossMinorTimer() == 0x00) &&
                      isHardDifficulty() &&
                      achievementIsValid()
)

achievement(title = "The Dark Ending (Duality of Choice)",
            description = "Kill the final boss on hard difficulty",
            points = 1,
            trigger = once(enteringLocation(FINAL_BOSS_ENTERING_MAJOR_MINOR, FINAL_BOSS_LEVEL_INDEX)) && 
                      never(stageNumber() != FINAL_BOSS_LEVEL_INDEX - 1 && stageNumber() != 0) &&
                      never(justLostLife()) &&
                      isOnePlayerMode() &&
                      trigger_when( all_of(range(0,FINAL_BOSS_NUMBER_OF_HEALTH, step= 0x1), index => once(bossKilled(FINAL_BOSS_FIRST_HEALTH_LOCATION + index))) &&
                                    boss8exitingLocation() ) &&
                      isHardDifficulty() &&
                      never(finalBossMajorTimer() == 0x00 &&  
                            finalBossMinorTimer() == 0x00) &&
                      achievementIsValid()
)


achievement( title = "1cc",
             description = "Beat the game without continuing",
             points = 1,
             trigger = once(justStartedGame()) &&
                       trigger_when(beatStageNumber(0x08)) &&
                       never(justLostCredit()) &&
                       never(gameOver()) &&
                       achievementIsValid()
)

achievement( title = "1cc on Normal",
             description = "Beat the game on normal or hard difficulty without continuing",
             points = 1,
             trigger = trigger_when(beatStageNumber(0x08)) &&
                       once(justStartedGame()) &&
                       isNormalDifficultyOrHarder() &&
                       never(justLostCredit()) &&
                       never(gameOver()) &&
                       achievementIsValid()
)

achievement( title = "1cc on Hard",
             description = "Beat the game on Hard difficulty without continuing",
             points = 1,
             trigger = once(justStartedGame()) &&
                       trigger_when(beatStageNumber(0x08)) &&
                       isHardDifficulty() &&
                       never(justLostCredit()) &&
                       never(gameOver()) &&
                       achievementIsValid()
)


function maxPower() => isMaxSpeedUp() && isUpgradedShot() && isUpgradedSpecialShot() && isMaxOption() && isShieldActive()
function wasMaxPower() => wasMaxSpeedUp() && wasUpgradedShot() && wasUpgradedSpecialShot() && wasMaxOption() && wasShieldActive()
function noPower() => !anySpeedUp() && !isUpgradedShot() && !isUpgradedSpecialShot() && isNoOption() && isNoShieldActive()

function maxAbilityAchievement(characterData)
{
    achievement( title = characterData[TITLE],
                 description = characterData[DESCRIPTION],
                 points = characterData[POINTS],
                 trigger = maxPower() &&
                           characterSelect() == characterData[CHARACTER_SELECT_VALUE] &&
                           achievementIsValid()
    )
}

maxAbilityData =
[
    {
        TITLE: "Max Vic Viper",
        DESCRIPTION: "Get five speed ups, the special shot, one of the two upgraded shots, four options, and the shield active all at the same time as Vic Viper",
        POINTS: 1,
        CHARACTER_SELECT_VALUE: VIC_VIPER_CHARACTER_SELECT_VALUE
    },
    {
        TITLE: "Max Octopus",
        DESCRIPTION: "Get five speed ups, the special shot, one of the two upgraded shots, four options, and the shield active all at the same time as Octopus",
        POINTS: 1,
        CHARACTER_SELECT_VALUE: OCTOPUS_CHARACTER_SELECT_VALUE
    },
    {
        TITLE: "Max TwinBee",
        DESCRIPTION: "Get five speed ups, the special shot, one of the two upgraded shots, four options, and the shield active all at the same time as TwinBee",
        POINTS: 1,
        CHARACTER_SELECT_VALUE: TWIN_BEE_CHARACTER_SELECT_VALUE
    },
    {
        TITLE: "Max Pentarou",
        DESCRIPTION: "Get five speed ups, the special shot, one of the two upgraded shots, four options, and the shield active all at the same time as Pentarou",
        POINTS: 1,
        CHARACTER_SELECT_VALUE: PENTAROU_CHARACTER_SELECT_VALUE
    }
]

for characterData in maxAbilityData
{
    maxAbilityAchievement(characterData)
}

function disableAchievement(achievementData)
{
    achievement( title = achievementData[TITLE],
                 description = achievementData[DESCRIPTION],
                 points = achievementData[POINTS],
                 trigger = wasMaxPower() &&
                           noPower() &&
                           !justLostLife() &&
                           characterSelect() == achievementData[CHARACTER_SELECT_VALUE] &&
                           achievementIsValid()
    )
}

maxAbilityData =
[
    {
        TITLE: "What's This button do?",
        DESCRIPTION: "Use the !? upgrade when you're fully powered up (five speedups, special shot, upgraded shot, options, and shield) as Vic Viper",
        POINTS: 1,
        CHARACTER_SELECT_VALUE: VIC_VIPER_CHARACTER_SELECT_VALUE
    },
    {
        TITLE: "Forgetful Octopus",
        DESCRIPTION: "Use the !? upgrade when you're fully powered up (five speedups, special shot, upgraded shot, options, and shield) as Octopus",
        POINTS: 1,
        CHARACTER_SELECT_VALUE: OCTOPUS_CHARACTER_SELECT_VALUE
    },
    {
        TITLE: "Broken TwinBee",
        DESCRIPTION: "Use the !? upgrade when you're fully powered up (five speedups, special shot, upgraded shot, options, and shield) as TwinBee",
        POINTS: 1,
        CHARACTER_SELECT_VALUE: TWIN_BEE_CHARACTER_SELECT_VALUE
    },
    {
        TITLE: "Stupid Penguin",
        DESCRIPTION: "Use the !? button when you're fully powered up (five speedups, special shot, upgraded shot, options, and shield) as Pentarou",
        POINTS: 1,
        CHARACTER_SELECT_VALUE: PENTAROU_CHARACTER_SELECT_VALUE
    }
]

for characterData in maxAbilityData
{
    disableAchievement(characterData)
}

scoreAchievement = 
[
    {
        TITLE: "Quarter of a Million",
        DESCRIPTION: "Score 250,000 points in One Player Mode",
        POINTS: 1,
        SCORE: (250 * 1000),
        MODE_CHECK: isOnePlayerMode()
    },
    {
        TITLE: "Half a Million",
        DESCRIPTION: "Score 500,000 points in One Player Mode",
        POINTS: 1,
        SCORE: (500 * 1000),
        MODE_CHECK: isOnePlayerMode()
    },
    {
        TITLE: "A cool million",
        DESCRIPTION: "Score 1,000,000 points in One Player Mode",
        POINTS: 1,
        SCORE: (1000 * 1000),
        MODE_CHECK: isOnePlayerMode()
    },
    {
        TITLE: "Special Half a Million",
        DESCRIPTION: "Score 500,000 points in Special Mode",
        POINTS: 1,
        SCORE: (500 * 1000),
        MODE_CHECK: isSpecialMode()
    },
    {
        TITLE: "A cool million",
        DESCRIPTION: "Score 1,000,000 points in Special Mode",
        POINTS: 1,
        SCORE: (1000 * 1000),
        MODE_CHECK: isSpecialMode()
    },
    {
        TITLE: "Special Million and a Half",
        DESCRIPTION: "Score 1,500,000 points in Special Mode",
        POINTS: 1,
        SCORE: (1500 * 1000),
        MODE_CHECK: isSpecialMode()
    }

]

leaderboard(
    title = format("High Score"),
    description = format("Get the highest score possible in one player mode"),
    start = 
    (
        isOnePlayerMode() &&
        gameOver() &&
        playerScoreArcade() > 0 &&
        achievementIsValid()

    ),
    cancel = always_false(),
    submit = always_true(),
    value = playerScoreArcade(),
    format = "SCORE"
)

leaderboard(
    title = "Normal High Score",
    description = "Get the highest score possible in one player mode on normal or hard difficulty",
    start = 
    (
        isNormalDifficultyOrHarder() &&
        isOnePlayerMode() &&
        gameOver() &&
        playerScoreArcade() > 0 &&
        achievementIsValid()
    ),
    cancel = always_false(),
    submit = always_true(),
    value = playerScoreArcade(),
    format = "SCORE"
)

leaderboard(
    title = "Hard High Score",
    description = "Get the highest score possible in one player mode on hard difficulty",
    start = 
    (
        isHardDifficulty() &&
        isOnePlayerMode() &&
        gameOver() &&
        playerScoreArcade() > 0 &&
        achievementIsValid()
    ),
    cancel = always_false(),
    submit = always_true(),
    value = playerScoreArcade(),
    format = "SCORE"
)

leaderboard(
    title = "Special High Score",
    description = "Get the highest score possible in special mode",
    start = 
    (
        isSpecialMode() &&
        gameOver() &&
        playerScoreSpecial() > 0 &&
        achievementIsValid()
    ),
    cancel = always_false(),
    submit = always_true(),
    value = playerScoreSpecial(),
    format = "SCORE"
)

leaderboard(
    title = "Special Normal High Score",
    description = "Get the highest score possible in special mode on normal or hard difficulty",
    start = 
    (
        isNormalDifficultyOrHarder() &&
        isSpecialMode() &&
        gameOver() &&
        playerScoreSpecial() > 0 &&
        achievementIsValid()
    ),
    cancel = always_false(),
    submit = always_true(),
    value = playerScoreSpecial(),
    format = "SCORE"
)

leaderboard(
    title = "Special Hard High Score",
    description = "Get the highest score possible in special mode on hard difficulty",
    start = 
    (
        isHardDifficulty() &&
        isSpecialMode() &&
        gameOver() &&
        playerScoreSpecial() > 0 &&
        achievementIsValid()
    ),
    cancel = always_false(),
    submit = always_true(),
    value = playerScoreSpecial(),
    format = "SCORE"
)


rich_presence_conditional_display(isOnePlayerMode() && achievementIsValid(), "1P Mode {3} Score: {0} Stage: {1} Loop: {2} Difficulty: {4}", 
                                  rich_presence_value("Number", playerScoreArcade()),
                                  rich_presence_value("Number", stageNumber() + 1),
                                  rich_presence_value("Number", loopNumber() + 1),
                                  rich_presence_lookup("CharacterName", characterSelect(), characterNameLookup),
                                  rich_presence_lookup("Difficulty", difficulty(), difficultyLookup)
                                  )

rich_presence_conditional_display(isSpecialMode() && achievementIsValid(), "Special Mode {3} Score: {0} Stage: {1} Loop: {2} Difficulty: {4}", 
                                  rich_presence_value("Number", playerScoreArcade()),
                                  rich_presence_value("Number", stageNumber() + 1),
                                  rich_presence_value("Number", loopNumber() + 1),
                                  rich_presence_lookup("CharacterName", characterSelect(), characterNameLookup),
                                  rich_presence_lookup("Difficulty", difficulty(), difficultyLookup)
                                  )
rich_presence_conditional_display(isTwoPlayerMode() && achievementIsValid(), "Playing Two Player Mode")
                      
rich_presence_display("Watching Demos")


//  Bell powers. 