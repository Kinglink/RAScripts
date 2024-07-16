// Parasol Stars: The Story of Bubble Bobble III
// #ID = 2318

function ContainsKey(dictionary, key_name)
{
    for key in dictionary 
        if(key == key_name) return true
    return false
}

// $0032: (8-bit) Pause detection
// 
//         0x00 = Game is paused.
//         0x01 = Game is active. 
//
//         This is just a detection.  It controls parts of the processing but doesn't pause the whole game. 
function pauseDetection() => byte(0x000032)

function gameplayPaused() => pauseDetection() == 0x00

// $0040: [16-bit] Player 1 Y Pos
function player1YPos() => word(0x000040)

// $0042: [16-bit] Player 1 X Pos
function player1XPos() => word(0x000042)

// $0166: (24-bit) Game Start Detection.
//        
//        0x000000 When in main menu.
//        Set to 0x03040b When game starts.
//        
//        Does not get reset on continue.
function gameStartDetection() => tbyte(0x000166)

GAME_START_DETECTION_VALUE = 0x03040b

function gameJustStartDetected() => gameStartDetection() == GAME_START_DETECTION_VALUE && prev(gameStartDetection()) == 0x000000
function gameNotStarted() => gameStartDetection() != GAME_START_DETECTION_VALUE
function gameHasStarted() => gameStartDetection() == GAME_START_DETECTION_VALUE

// $0B28: (8-bit) Number of items left in Bonus game (collect the items) 
function bonusGameItemsLeft() => byte(0x000B28)

function perfectBonusGame() => bonusGameItemsLeft() == 0 && prev(bonusGameItemsLeft()) >= 1 && prev(bonusGameItemsLeft()) <= 3

// $0B2A: (8-bit) End credits detector
//        
//        0x00 = Normal Gameplay
//        0x01 = "Bad" Ending
//        0xff = "Good" Ending.
function endCreditsDetector() => byte(0x000B2A)

GOOD_ENDING_VALUES = 0xff
function goodEnding() => endCreditsDetector() == GOOD_ENDING_VALUES && 
                         prev(endCreditsDetector()) != GOOD_ENDING_VALUES

// $0E8A: (8-bit) Second End credit detector
//        
//        0x06 = Set on Bad Ending
function secondEndCreditsDetector() => byte(0x000E8A)

BAD_ENDING_VALUES = 0x01
function badEnding() => endCreditsDetector() == BAD_ENDING_VALUES && 
                        prev(endCreditsDetector()) != BAD_ENDING_VALUES &&
                        secondEndCreditsDetector() == 0x06 // This happens before The end credis detec

// $1846: (8-bit) Current state of Powerup
//        
//        0x02 = Waiting to show
//        0x04 = Shown
//        0x0c = Collected
//        0x00 = Done
function currentStateOfPowerup() => byte(0x001846)

function powerupCollected() => currentStateOfPowerup() == 0x0c && prev(currentStateOfPowerup()) == 0x04

// $1847: (8-bit) Powerup Ability.
//        
//        NOTE: This is ONLY ability.  Not display.
//        
//        0x00 = Miracle item (instant win + Secret + 100 credits in secret room
//        0x01 = Rainbow Star
//        0x07 = Purple Book
//        0x11 = Unknown (Collect items bonus)
//        0x13 = Orange Ring
//        0x14 = Red Ring
//        0x1a = Clock
//        0x1b = Other object (lightning bolts, small);p
//        0x1c = Bomb
//        0x1d = Orange Cross (lightning blasts)
//        0x2f = Red Shoe  (Speed up)
//        0x34 = Yellow Heart
//        0x35 = Orange Potion ? (coin game)
//        0x36 = Red Heart
//        0x39 = Lightning Bottle (Will give what ever the boss gives)
//        0x3c = Water Secret Item (Crystal Ball)
//        0x3d = Fire Secret Item (Magic lamp)
//        0x3e = Lightning Secret Item (Bell)
//        0x3f = (Fireball ring/Unreachable
//        0x40 = Star Secret Item (5 credit Coin)
//        0x41 = Secret Secret Item (99 credit coin (100k))
function powerupAbility() => byte(0x001847)

WATER_SECRET_ITEM = 0x3c
FIRE_SECRET_ITEM = 0x3d
LIGHTNING_SECRET_ITEM = 0x3e
STAR_SECRET_ITEM = 0x40
SECRET_SECRET_ITEM = 0x41

// $19AD: (8-bit) Number of Lives
//        
//        0xff = Game Over
//        0x00 = On main Menu Or 0 lives in game.
//        Any other value in Game. (not will switch to 0xff after last life
function livesCount() => byte(0x0019AD)
function playerLostLife() => livesCount() < prev(livesCount())

// $19B0: (8-bit) Second Player Lives
//        
//        0xff = No Second Player
//        0x00 = On main Menu Or 0 lives in game.
//        All other value second player is active
function secondPlayerLives() => byte(0x0019B0)

function secondPlayerActive() => secondPlayerLives() != 0xff

// $19b6: [8-bit] Stage transitioning to
function transitioningToStage() => byte(0x0019B6)

// $19B7: [8-bit] Current Stage
//        
//        0x01 = Music World Stage 2
//        0x02 = Music World Stage 3
//        0x03 = Music World Stage 4
//        0x04 = Music World Stage 5
//        0x05 = Music World Stage 6
//        0x06 = Music World Boss
//        0x07 = Music World Secret Room
//        0x08 = Woods World Stage 1
//        0x09 = Woods World Stage 2
//        0x0a = Woods World Stage 3
//        0x0b = Woods World Stage 4
//        0x0c = Woods World Stage 5
//        0x0d = Woods World Stage 6
//        0x0e = Woods World Boss
//        0x0f = Woods World Secret Room
//        0x10 = Ocean World Stage 1
//        0x11 = Ocean World Stage 2
//        0x12 = Ocean World Stage 3
//        0x13 = Ocean World Stage 4
//        0x14 = Ocean World Stage 5
//        0x15 = Ocean World Stage 6
//        0x16 = Ocean World Boss
//        0x17 = Ocean World Secret Room
//        0x18 = Machine World Stage 1
//        0x19 = Machine World Stage 2
//        0x1a = Machine World Stage 3
//        0x1b = Machine World Stage 4
//        0x1c = Machine World Stage 5
//        0x1d = Machine World Stage 6
//        0x1e = Machine World Boss
//        0x1f = Machine World Secret Room
//        0x20 = Gamble World Stage 1
//        0x21 = Gamble World Stage 2
//        0x22 = Gamble World Stage 3
//        0x23 = Gamble World Stage 4
//        0x24 = Gamble World Stage 5
//        0x25 = Gamble World Stage 6
//        0x26 = Gamble World Boss
//        0x27 = Gamble World Secret Room
//        0x28 = Clouds World Stage 1
//        0x29 = Clouds World Stage 2
//        0x2a = Clouds World Stage 3
//        0x2b = Clouds World Stage 4
//        0x2c = Clouds World Stage 5
//        0x2d = Clouds World Stage 6
//        0x2e = Clouds World Boss
//        0x2f = Clouds World Secret Room
//        0x30 = Giant World Stage 1
//        0x31 = Giant World Stage 2
//        0x32 = Giant World Stage 3
//        0x33 = Giant World Stage 4
//        0x34 = Giant World Stage 5
//        0x35 = Giant World Stage 6
//        0x36 = Giant World Boss
//        0x37 = Giant World Secret Room
//        0x38 = Rainbow World Stage 1
//        0x39 = Rainbow World Stage 2
//        0x3a = Rainbow World Stage 3
//        0x3b = Rainbow World Stage 4
//        0x3c = Rainbow World Stage 5
//        0x3d = Rainbow World Stage 6
//        0x3e = Rainbow World Boss
//        0x3f = Rainbow World Secret Room (Likely unreachable.)
//        0x40 = Bubble World Stage 1
//        0x41 = Bubble World Stage 2
//        0x42 = Bubble World Stage 3
//        0x43 = Bubble World Stage 4
//        0x44 = Bubble World Stage 5
//        0x45 = Bubble World Stage 6
//        0x46 = Bubble World Boss
//        0x47 = Bubble World Secret Room
//        0x48 = Underworld World Stage 1
//        0x49 = Underworld World Stage 2
//        0x4a = Underworld World Stage 3
//        0x4b = Underworld World Stage 4
//        0x4c = Underworld World Stage 5
//        0x4d = Underworld World Stage 6
//        0x4e = Underworld World Boss
//        0x4f = Underworld World Secret Room (unreachable, but I believe it would exist)
function currentStage() => byte(0x0019B7)
MUSIC_START_STAGE = 0x00
MUSIC_BOSS_ROOM = 0x06
MUSIC_SECRET_ROOM = 0x07
MUSIC_FINISHED_STAGE = 0x08
WOODS_START_STAGE = 0x08
WOODS_BOSS_ROOM = 0x0e
WOODS_SECRET_ROOM = 0x0f
WOODS_FINISHED_STAGE = 0x10
OCEAN_START_STAGE = 0x10
OCEAN_BOSS_ROOM = 0x16
OCEAN_SECRET_ROOM = 0x17
OCEAN_FINISHED_STAGE = 0x18
MACHINE_START_STAGE = 0x18
MACHINE_BOSS_ROOM = 0x1e
MACHINE_SECRET_ROOM = 0x1f
MACHINE_FINISHED_STAGE = 0x20
GAMBLE_START_STAGE = 0x20
GAMBLE_BOSS_ROOM = 0x26
GAMBLE_SECRET_ROOM = 0x27
GAMBLE_FINISHED_STAGE = 0x28
CLOUDS_START_STAGE = 0x28
CLOUDS_BOSS_ROOM = 0x2e
CLOUDS_SECRET_ROOM = 0x2f
CLOUDS_FINISHED_STAGE = 0x30
GIANT_START_STAGE = 0x30
GIANT_BOSS_ROOM = 0x36
GIANT_SECRET_ROOM = 0x37
GIANT_FINISHED_STAGE = 0x38
RAINBOW_START_STAGE = 0x38
RAINBOW_BOSS_ROOM = 0x3e
BAD_ENDING_ROOM = 0x03e
RAINBOW_SECRET_ROOM = 0x3f // Unreachable?
RAINBOW_FINISHED_STAGE = 0x40
BUBBLE_START_STAGE = 0x40
BUBBLE_BOSS_ROOM = 0x46
BUBBLE_SECRET_ROOM = 0x47
BUBBLE_FINISHED_STAGE = 0x48
UNDERWORLD_START_STAGE = 0x48
UNDERWORLD_BOSS_ROOM = 0x4e
GOOD_ENDING_ROOM = 0x04e
UNDERWORLD_SECRET_ROOM = 0x4f

RAINBOW_BOSS_ROOM = 0x3e
UNDERWORLD_BOSS_ROOM = 0x4e

stageLookup = {
    0x00: "Music World Stage 1",
    0x01: "Music World Stage 2",
    0x02: "Music World Stage 3",
    0x03: "Music World Stage 4",
    0x04: "Music World Stage 5",
    0x05: "Music World Stage 6",
    0x06: "Music World Boss",
    0x07: "Music World Secret Room",
    0x08: "Woods World Stage 1",
    0x09: "Woods World Stage 2",
    0x0a: "Woods World Stage 3",
    0x0b: "Woods World Stage 4",
    0x0c: "Woods World Stage 5",
    0x0d: "Woods World Stage 6",
    0x0e: "Woods World Boss",
    0x0f: "Woods World Secret Room",
    0x10: "Ocean World Stage 1",
    0x11: "Ocean World Stage 2",
    0x12: "Ocean World Stage 3",
    0x13: "Ocean World Stage 4",
    0x14: "Ocean World Stage 5",
    0x15: "Ocean World Stage 6",
    0x16: "Ocean World Boss",
    0x17: "Ocean World Secret Room",
    0x18: "Machine World Stage 1",
    0x19: "Machine World Stage 2",
    0x1a: "Machine World Stage 3",
    0x1b: "Machine World Stage 4",
    0x1c: "Machine World Stage 5",
    0x1d: "Machine World Stage 6",
    0x1e: "Machine World Boss",
    0x1f: "Machine World Secret Room",
    0x20: "Gamble World Stage 1",
    0x21: "Gamble World Stage 2",
    0x22: "Gamble World Stage 3",
    0x23: "Gamble World Stage 4",
    0x24: "Gamble World Stage 5",
    0x25: "Gamble World Stage 6",
    0x26: "Gamble World Boss",
    0x27: "Gamble World Secret Room",
    0x28: "Clouds World Stage 1",
    0x29: "Clouds World Stage 2",
    0x2a: "Clouds World Stage 3",
    0x2b: "Clouds World Stage 4",
    0x2c: "Clouds World Stage 5",
    0x2d: "Clouds World Stage 6",
    0x2e: "Clouds World Boss",
    0x2f: "Clouds World Secret Room",
    0x30: "Giant World Stage 1",
    0x31: "Giant World Stage 2",
    0x32: "Giant World Stage 3",
    0x33: "Giant World Stage 4",
    0x34: "Giant World Stage 5",
    0x35: "Giant World Stage 6",
    0x36: "Giant World Boss",
    0x37: "Giant World Secret Room",
    0x38: "Rainbow World Stage 1",
    0x39: "Rainbow World Stage 2",
    0x3a: "Rainbow World Stage 3",
    0x3b: "Rainbow World Stage 4",
    0x3c: "Rainbow World Stage 5",
    0x3d: "Rainbow World Stage 6",
    0x3e: "Rainbow World Boss",
    0x3f: "Rainbow World Secret Room",
    0x40: "Bubble World Stage 1",
    0x41: "Bubble World Stage 2",
    0x42: "Bubble World Stage 3",
    0x43: "Bubble World Stage 4",
    0x44: "Bubble World Stage 5",
    0x45: "Bubble World Stage 6",
    0x46: "Bubble World Boss",
    0x47: "Bubble World Secret Room",
    0x48: "Underworld World Stage 1",
    0x49: "Underworld World Stage 2",
    0x4a: "Underworld World Stage 3",
    0x4b: "Underworld World Stage 4",
    0x4c: "Underworld World Stage 5",
    0x4d: "Underworld World Stage 6",
    0x4e: "Underworld World Boss",
    0x4f: "Underworld World Secret Room"
}

function inRainbowBossRoom() => currentStage() == RAINBOW_BOSS_ROOM
function inUnderworldBossRoom() => currentStage() == UNDERWORLD_BOSS_ROOM

function inSecretRoom() => (currentStage() == MUSIC_BOSS_ROOM && transitioningToStage() == MUSIC_SECRET_ROOM) ||
                           (currentStage() == WOODS_BOSS_ROOM && transitioningToStage() == WOODS_SECRET_ROOM) ||
                           (currentStage() == OCEAN_BOSS_ROOM && transitioningToStage() == OCEAN_SECRET_ROOM) ||
                           (currentStage() == MACHINE_BOSS_ROOM && transitioningToStage() == MACHINE_SECRET_ROOM) ||
                           (currentStage() == GAMBLE_BOSS_ROOM && transitioningToStage() == GAMBLE_SECRET_ROOM) ||
                           (currentStage() == CLOUDS_BOSS_ROOM && transitioningToStage() == CLOUDS_SECRET_ROOM) ||
                           (currentStage() == GIANT_BOSS_ROOM && transitioningToStage() == GIANT_SECRET_ROOM) ||
                           (currentStage() == BUBBLE_BOSS_ROOM && transitioningToStage() == BUBBLE_SECRET_ROOM) 



// $19BA: [8-bit] Score: 000000xx0
function scoreLower() => byte(0x0019BA)

// $19BB: [8-bit] Score: 0000xx000
function scoreMidLower() => byte(0x0019BB)

// $19BC: [8-bit] Score: 00xx00000
function scoreMidUpper() => byte(0x0019BC)

// $19BD: [8-bit] Score: xx0000000
function scoreUpper() => byte(0x0019BD)

function fullScore() => bcd(dword(0x0019BA)) * 10
// just trust me on this. 
function secondPlayerFullScore() => bcd(dword(0x0019BA + 4)) * 10

// $19f8 (32-bit) Musical system
// Likely more bytes as well. 
//
// Setting these to 0x0d0d0d0d plays the bonus song. 
function musicalSystem() => dword(0x0019F8)

BONUS_MUSIC_VALUE = 0x0d0d0d0d

function inBonusRound() => musicalSystem() == BONUS_MUSIC_VALUE


// $1D00: (8-bit) Credits Remaining
//        
//        0-63  (99 is max)
function creditRemaining() => byte(0x001D00)
function playerUsedCredit() => creditRemaining() < prev(creditRemaining())

// $1D4B: [8-bit] Magic Crest 1 type (00=off, 01=Water, 02=Fire, 03=Lightning, 04=Fireball, 05=Star)
function magicCrestType1() => byte(0x001D4B)

// $1D4C: [8-bit] Magic Crest 3 type (00=off, 01=Water, 02=Fire, 03=Lightning, 04=Fireball, 05=Star)
function magicCrestType3() => byte(0x001D4C)

// $1D4D: [8-bit] Magic Crest 2 type (00=off, 01=Water, 02=Fire, 03=Lightning, 04=Fireball, 05=Star)
function magicCrestType2() => byte(0x001D4D)

function twoPlayerProtection() => once( gameJustStartDetected()) && 
                                  never( secondPlayerActive() ) &&
                                  never( gameNotStarted())

TITLE = "TITLE"
DESCRIPTION = "DESCRIPTION"
POINTS = "POINTS"
STAGE = "STAGE"
START_STAGE = "START_STAGE"
END_STAGE = "END_STAGE"
ALTERNATE_TRIGGER = "ALTERNATE_TRIGGER"
ALTERNATE_START = "ALTERNATE_START"
POWERUP = "POWERUP"
SCORE = "SCORE"

WIN_CONDITION_TYPE = "Win_condition"
PROGRESSION_TYPE = "Progression"
NO_TYPE = ""
MISSABLE_TYPE = "Missable"

function levelAchievement(data)
{
    achievement( title = data[TITLE],
                  description = data[DESCRIPTION],
                  points= data[POINTS],
                  type = PROGRESSION_TYPE,
                  trigger = twoPlayerProtection() &&
                             currentStage() == data[STAGE] &&
                             prev(currentStage()) == data[STAGE] - 2
    )
}

levelAchievement({
    TITLE: "Magical Music",
    DESCRIPTION: "Complete Music World",
    POINTS: 1,
    STAGE: MUSIC_FINISHED_STAGE
})
levelAchievement({
    TITLE: "Wild Woods",
    DESCRIPTION: "Complete Woods World",
    POINTS: 2,
    STAGE: WOODS_FINISHED_STAGE
})
levelAchievement({
    TITLE: "Open Oceans",
    DESCRIPTION: "Complete Ocean World",
    POINTS: 3,
    STAGE: OCEAN_FINISHED_STAGE
})
levelAchievement({
    TITLE: "Maniac Machines",
    DESCRIPTION: "Complete Machine World",
    POINTS: 4,
    STAGE: MACHINE_FINISHED_STAGE
})
levelAchievement({
    TITLE: "Good Gambles",
    DESCRIPTION: "Complete Gamble World",
    POINTS: 4,
    STAGE: GAMBLE_FINISHED_STAGE
}) 
levelAchievement({
    TITLE: "Calm Clouds",
    DESCRIPTION: "Complete Clouds World",
    POINTS: 5,
    STAGE: CLOUDS_FINISHED_STAGE
}) 
levelAchievement({
    TITLE: "Jolly Giants",
    DESCRIPTION: "Complete Giant World",
    POINTS: 5,
    STAGE: GIANT_FINISHED_STAGE
})
levelAchievement({
    TITLE: "Rad Rainbows",
    DESCRIPTION: "Unlock the door at the end of Rainbow World",
    POINTS: 10,
    STAGE: RAINBOW_FINISHED_STAGE
})
levelAchievement({
    TITLE: "Wait, I Recognize This Place",
    DESCRIPTION: "Complete Bubble World",
    POINTS: 10,
    STAGE: BUBBLE_FINISHED_STAGE
})

achievement( title = "You missed something",
             description = "Get the bad ending",
             type = MISSABLE_TYPE,
             points = 10,
             trigger = twoPlayerProtection() &&
                        badEnding() &&
                        currentStage() == BAD_ENDING_ROOM                       
)

achievement( title = "Uplifting Underworld",
             description = "Get the good ending",
             type = WIN_CONDITION_TYPE,
             points = 25,
             trigger = twoPlayerProtection() &&
                        goodEnding() &&
                        currentStage() == GOOD_ENDING_ROOM
)

function secretAchievement(data)
{
    achievement( title = data[TITLE],
                  description = data[DESCRIPTION],
                  points= data[POINTS],
                  trigger = twoPlayerProtection() &&
                             inSecretRoom() &&
                             powerupCollected() &&
                             prev(powerupAbility()) == data[POWERUP] // It switches to the next Powerup as you pick it up. 
    )
}

secretAchievement({
    TITLE: "Peering Into Your Crystal Ball",
    DESCRIPTION: "Collect the Water Secret",
    POINTS: 3,
    POWERUP: WATER_SECRET_ITEM
})

secretAchievement({
    TITLE: "Rubbing the Lamp",
    DESCRIPTION: "Collect the Fire Secret",
    POINTS: 5,
    POWERUP: FIRE_SECRET_ITEM
})

secretAchievement({
    TITLE: "Ringing the Bell",
    DESCRIPTION: "Collect the Lightning Secret",
    POINTS: 5,
    POWERUP: LIGHTNING_SECRET_ITEM
})

secretAchievement({
    TITLE: "You're Rich!",
    DESCRIPTION: "Collect the Star Secret",
    POINTS: 10,
    POWERUP: STAR_SECRET_ITEM
})

secretAchievement({
    TITLE: "Now You Can Play Forever",
    DESCRIPTION: "Collect the Extra Secret Star Secret",
    POINTS: 50,
    POWERUP: SECRET_SECRET_ITEM
})

function noDeathAchievement(data)
{
    alternate_trigger = always_false()
    if(ContainsKey(data, "ALTERNATE_TRIGGER"))
    {
        alternate_trigger = data[ALTERNATE_TRIGGER]
    }
    alternate_start = prev(currentStage()) == data[START_STAGE] - 2

    if(ContainsKey(data, ALTERNATE_START))
    {
        alternate_start = data[ALTERNATE_START]
    }
    achievement( title = data[TITLE],
                  description = data[DESCRIPTION],
                  type = MISSABLE_TYPE,
                  points= data[POINTS],
                  trigger = never(secondPlayerActive()) &&
                            never(gameNotStarted()) &&
                            never(playerLostLife()) &&
                            never(playerUsedCredit()) &&
                            once(currentStage() == data[START_STAGE] && alternate_start ) &&
                            trigger_when((currentStage() == data[END_STAGE] && 
                                          prev(currentStage()) == data[END_STAGE] - 2
                                         ) ||
                                         alternate_trigger
                            )
    )
}

noDeathAchievement({
    TITLE: "Music Maestro",
    DESCRIPTION: "Complete Music World without dying",
    POINTS: 1,
    START_STAGE: MUSIC_START_STAGE,
    END_STAGE: MUSIC_FINISHED_STAGE,
    ALTERNATE_START: gameJustStartDetected()
})

noDeathAchievement({
    TITLE: "Woods Warlord",
    DESCRIPTION: "Complete Woods World without dying",
    POINTS: 2,
    START_STAGE: WOODS_START_STAGE,
    END_STAGE: WOODS_FINISHED_STAGE
})

noDeathAchievement({
    TITLE: "Ocean Overlord",
    DESCRIPTION: "Complete Ocean World without dying",
    POINTS: 3,
    START_STAGE: OCEAN_START_STAGE,
    END_STAGE: OCEAN_FINISHED_STAGE
})

noDeathAchievement({
    TITLE: "Machine Master",
    DESCRIPTION: "Complete Machine World without dying",
    POINTS: 4,
    START_STAGE: MACHINE_START_STAGE,
    END_STAGE: MACHINE_FINISHED_STAGE
})

noDeathAchievement({
    TITLE: "Gamble General",
    DESCRIPTION: "Complete Gamble World without dying",
    POINTS: 5,
    START_STAGE: GAMBLE_START_STAGE,
    END_STAGE: GAMBLE_FINISHED_STAGE
})

noDeathAchievement({
    TITLE: "Cloud Captain",
    DESCRIPTION: "Complete Clouds World without dying",
    POINTS: 5,
    START_STAGE: CLOUDS_START_STAGE,
    END_STAGE: CLOUDS_FINISHED_STAGE
})

noDeathAchievement({
    TITLE: "Giant God",
    DESCRIPTION: "Complete Giant World without dying",
    POINTS: 10,
    START_STAGE: GIANT_START_STAGE,
    END_STAGE: GIANT_FINISHED_STAGE
})

noDeathAchievement({
    TITLE: "Rainbow Ruler",
    DESCRIPTION: "Complete Rainbow World without dying",
    POINTS: 10,
    START_STAGE: RAINBOW_START_STAGE,
    END_STAGE: RAINBOW_FINISHED_STAGE,
    ALTERNATE_TRIGGER: (badEnding() && currentStage() == BAD_ENDING_ROOM)
})

noDeathAchievement({
    TITLE: "Bubble Boss",
    DESCRIPTION: "Complete Bubble World without dying",
    POINTS: 25,
    START_STAGE: BUBBLE_START_STAGE,
    END_STAGE: BUBBLE_FINISHED_STAGE
})

noDeathAchievement({
    TITLE: "Ultimate Underworld",
    DESCRIPTION: "Complete Underworld World without dying",
    POINTS: 25,
    START_STAGE: UNDERWORLD_START_STAGE,
    END_STAGE: GOOD_ENDING_ROOM,
    ALTERNATE_TRIGGER: (goodEnding() && currentStage() == GOOD_ENDING_ROOM)
})

achievement(
    title = "Credits?  We Don't Need No Stinking Credits!",
    description = "Complete the game without using a continue",
    type = MISSABLE_TYPE,
    points = 25,
    trigger = twoPlayerProtection() &&
              never(playerUsedCredit()) &&
              trigger_when(goodEnding() && currentStage() == GOOD_ENDING_ROOM)
)



function scoreAchievement(data)
{
    achievement( title = data[TITLE],
                  description = data[DESCRIPTION],
                  points= data[POINTS],
                  trigger = twoPlayerProtection() &&
                             fullScore() >= data[SCORE] &&
                             prev(fullScore()) < data[SCORE]
    )
}

scoreAchievement({
    TITLE: "First 1-up Is the Easiest",
    DESCRIPTION: "Get a score of 100,000 or more",
    POINTS: 3,
    SCORE: 100000
})

scoreAchievement({
    TITLE: "The First Million Is the Hardest",
    DESCRIPTION: "Get a score of 1,000,000 or more",
    POINTS: 3,
    SCORE: 1000000
})

scoreAchievement({
    TITLE: "Racking Up a Huge Score",
    DESCRIPTION: "Get a score of 5,000,000 or more",
    POINTS: 10,
    SCORE: 5000000
})

scoreAchievement({
    TITLE: "You're Just Showing Off",
    DESCRIPTION: "Get a score of 25,000,000 or more",
    POINTS: 25,
    SCORE: 25000000
})

achievement(
    title = "Leaving Nothing On the Table",
    description = "Get a perfect score in any bonus game (Any collecting item game)",
    points = 5,
    trigger = twoPlayerProtection() &&
              perfectBonusGame() &&
              inBonusRound()
)


leaderboard(
    title = format("High Score"),
    description = format("Get the highest score possible"),
    start = 
    (
        twoPlayerProtection() &&
        ((livesCount() == 0xff && prev(livesCount()) != 0xff) ||
         (goodEnding() && currentStage() == GOOD_ENDING_ROOM) ||
         (badEnding() && currentStage() == BAD_ENDING_ROOM)
        ) &&
        fullScore() != 0
    ),
    cancel = always_false(),
    submit = always_true(),
    value = fullScore() * 10,
    format = "SCORE"
)

leaderboard(
    title = format("Fastest Rainbow Clear"),
    description = format("Beat the first eight world as fast as possible"),
    start = 
    (
        gameJustStartDetected() 
                    
    ),
    cancel =  secondPlayerActive() ||  gameNotStarted(),
    submit =  (badEnding() && currentStage() == BAD_ENDING_ROOM) ||
              (currentStage() == RAINBOW_FINISHED_STAGE && prev(currentStage()) == RAINBOW_BOSS_ROOM),
    value = measured(always_true(), when=!gameplayPaused()) && unless(gameplayPaused()),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = format("Fastest Good Ending Clear"),
    description = format("Beat the entire game and get the best ending as fast as possible"),
    start = 
    (
        gameJustStartDetected() 
                    
    ),
    cancel =  secondPlayerActive() ||  gameNotStarted(),
    submit =  (goodEnding() && currentStage() == GOOD_ENDING_ROOM),
    value = measured(always_true(), when=!gameplayPaused()) && unless(gameplayPaused()),
    lower_is_better = true,
    format = "FRAMES"
)


rich_presence_conditional_display(gameHasStarted() && livesCount() != 0xff && !secondPlayerActive(), "1P Score: {0} 1P Lives: {1} Level: {2}",
                                  rich_presence_value("Score", fullScore()),
                                  rich_presence_value("Number", livesCount()+1),
                                  rich_presence_lookup("StageName", currentStage(), stageLookup)
                                  )

rich_presence_conditional_display(gameHasStarted() && livesCount() != 0xff && secondPlayerActive(), "1P Score: {0} 1P Lives: {1} 2P Score: {3} 2P Lives {4} Level: {2}",
                                  rich_presence_value("Score", fullScore()),
                                  rich_presence_value("Number", livesCount()+1),
                                  rich_presence_lookup("StageName", currentStage(), stageLookup),
                                  rich_presence_value("Score", secondPlayerFullScore()),
                                  rich_presence_value("Number", secondPlayerLives()+1)
                                  )

rich_presence_conditional_display(gameHasStarted() && livesCount() == 0xff && secondPlayerActive(), " 2P Score: {1} 2P Lives {2} Level: {0}",
                                  rich_presence_lookup("StageName", currentStage(), stageLookup),
                                  rich_presence_value("Score", secondPlayerFullScore()),
                                  rich_presence_value("Number", secondPlayerLives()+1)
                                  )

rich_presence_display("Learning from Demos")

