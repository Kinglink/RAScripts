// ~Homebrew~ Mighty Mighty Missile!
// #ID = 5

// $0000: (24-bit) Key
//        
//        Set to 0x0a43fa when game's memory is loaded.
function memoryKey() => tbyte(0x000000)

MEMORY_KEY_VALUE = 0x0a43fa
function memoryKeyValid() => memoryKey() == MEMORY_KEY_VALUE

// $20BE: (8-bit) Original Game Map Selection
//        
//        0x00 = 1st Play
//        0x01 = Maze Helix
//        0x02 = Cool Cube
//        0x03 = Labyrinth1
//        0x04 = Mousers
//        0x05 = Emergency
//        0x06 = Zig Zag
//        0x07 = You Got Me
//        0x08 = Cross&Roll
//        0x09 = DMA !-))))
//        0x10 = Bombers!
function originalGameMapSelection() => byte(0x0020BE)

FIRST_ORIGINAL_MAP = 00
LAST_ORIGINAL_MAP = 10
levelLookup ={
    00: "1st Play",
    01: "Maze Helix",
    02: "Cool Cube",
    03: "Labyrinth1",
    04: "Mousers",
    05: "Emergency",
    06: "Zig Zag",
    07: "You Got Me",
    08: "Cross&Roll",
    09: "DMA !-))))",
    10: "Bombers!"
}

// $20C0: (8-bit) Currently selected level
//        
//        Updates with each level beaten.
//        Stage 00 = Where To Go?
//        Stage 01 = Roundabout
//        Stage 02 = Zigzag
//        Stage 03 = Ages Bus !
//        Stage 04 = Use the Wall
//        Stage 05 = Maze!
//        Stage 06 = Japan
//        Stage 07 = Lots of Mice
//        Stage 08 = No Way Out
//        Stage 09 = Headon Crash
//        Stage 10 = Hear & There
//        Stage 11 = Round & Round
//        Stage 12 = Dream Catch
//        Stage 13 = Ready? Go!
//        Stage 14 = Two on One
//        Stage 15 = Long Journey
//        Stage 16 = GoGo Nine!!
//        Stage 17 = Stay Away!
//        Stage 18 = Mouser  !
//        Stage 19 = Which One?
//        Stage 20 = Tabby!
//        Stage 21 = Tabby Patrol
//        Stage 22 = Run Away!
//        Stage 23 = Catch Up
//        Stage 24 = Gang of Tabs
//        Stage 25 = Battlefield!
//        Stage 26 = Sentries
//        Stage 27 = Sharp    Turns
//        Stage 28 = From  Behind
//        Stage 29 = Loopy
//        Stage 30 = Stairway
//        Stage 31 = Blockade
//        Stage 32 = Mice Cracker
//        Stage 33 = Go Around
//        Stage 34 = Trapped Cat
//        Stage 35 = Get In Line
//        Stage 36 = Out 4 a Walk
//        Stage 37 = Delay Tactic
//        Stage 38 = Cat In A Box
//        Stage 39 = Runaround?
//        Stage 40 = Prisoners!
//        Stage 41 = Drop  In
//        Stage 42 = Escape Route
//        Stage 43 = Center Line!
//        Stage 44 = The "Zone"
//        Stage 45 = Gonna Get In
//        Stage 46 = Launch Pad
//        Stage 47 = The Tour
//        Stage 48 = Run For It
//        Stage 49 = Outnumbered!
//        Stage 50 = Chicken Race
//        Stage 51 = Speed Waltz
//        Stage 52 = Refections
//        Stage 53 = Ages Sonic
//        Stage 54 = Arnd Ze Wrld
//        Stage 55 = No Problem !
//        Stage 56 = Dead End
//        Stage 57 = Puzzle Box
//        Stage 58 = Lucky 218
//        Stage 59 = Apartement
//        Stage 60 = Red Spiral
//        Stage 61 = Mouse Racing
//        Stage 62 = Int Distance
//        Stage 63 = Tab Lane
//        Stage 64 = Guillotine
//        Stage 65 = Quick Turn
//        Stage 66 = Ze Gang Turn
//        Stage 67 = Ouch!
//        Stage 68 = Empty  Earth
//        Stage 69 = Missile Fac.
//        Stage 70 = Ghosh  House
//        Stage 71 = Microwave!
//        Stage 72 = Crack Mirror
//        Stage 73 = The Gauntlet
//        Stage 74 = Tenements$
//        Stage 75 = Steroid Belt
//        Stage 76 = Square Dance
//        Stage 77 = Fvr Got Me
//        Stage 78 = Turn Right
//        Stage 79 = Intersection
//        Stage 80 = GDG Club 9
//        Stage 81 = Sprinter
//        Stage 82 = Inner Circle
//        Stage 83 = Cat's Eden
//        Stage 84 = Older ????
//        Stage 85 = That's Odd !
//        Stage 86 = Understood ?
//        Stage 87 = :Reversed:
//        Stage 88 = !Dedicace!
//        Stage 89 = Cat Ballad
//        Stage 90 = ?! Hummmmm
//        Stage 91 = Maximum???
//        Stage 92 = Thanx!
//        Stage 93 = A!
//        Stage 94 = Lot
//        Stage 95 = Goodbye =)
function currentLevelSelected() => byte(0x0020C0)

FIRST_PUZZLE_LEVEL = 00
LAST_PUZZLE_LEVEL = 95
stageLookup ={
    00: "Where To Go?",
    01: "Roundabout",
    02: "Zigzag",
    03: "Ages Bus !",
    04: "Use the Wall",
    05: "Maze!",
    06: "Japan",
    07: "Lots of Mice",
    08: "No Way Out",
    09: "Headon Crash",
    10: "Hear & There",
    11: "Round & Round",
    12: "Dream Catch",
    13: "Ready? Go!",
    14: "Two on One",
    15: "Long Journey",
    16: "GoGo Nine!!",
    17: "Stay Away!",
    18: "Mouser  !",
    19: "Which One?",
    20: "Tabby!",
    21: "Tabby Patrol",
    22: "Run Away!",
    23: "Catch Up",
    24: "Gang of Tabs",
    25: "Battlefield!",
    26: "Sentries",
    27: "Sharp    Turns",
    28: "From  Behind",
    29: "Loopy",
    30: "Stairway",
    31: "Blockade",
    32: "Mice Cracker",
    33: "Go Around",
    34: "Trapped Cat",
    35: "Get In Line",
    36: "Out 4 a Walk",
    37: "Delay Tactic",
    38: "Cat In A Box",
    39: "Runaround?",
    40: "Prisoners!",
    41: "Drop  In",
    42: "Escape Route",
    43: "Center Line!",
    44: "The \"Zone\"",
    45: "Gonna Get In",
    46: "Launch Pad",
    47: "The Tour",
    48: "Run For It",
    49: "Outnumbered!",
    50: "Chicken Race",
    51: "Speed Waltz",
    52: "Refections",
    53: "Ages Sonic",
    54: "Arnd Ze Wrld",
    55: "No Problem !",
    56: "Dead End",
    57: "Puzzle Box",
    58: "Lucky 218",
    59: "Apartement",
    60: "Red Spiral",
    61: "Mouse Racing",
    62: "Int Distance",
    63: "Tab Lane",
    64: "Guillotine",
    65: "Quick Turn",
    66: "Ze Gang Turn",
    67: "Ouch!",
    68: "Empty  Earth",
    69: "Missile Fac.",
    70: "Ghosh  House",
    71: "Microwave!",
    72: "Crack Mirror",
    73: "The Gauntlet",
    74: "Tenements$",
    75: "Steroid Belt",
    76: "Square Dance",
    77: "Fvr Got Me",
    78: "Turn Right",
    79: "Intersection",
    80: "GDG Club 9",
    81: "Sprinter",
    82: "Inner Circle",
    83: "Cat's Eden",
    84: "Older ????",
    85: "That's Odd !",
    86: "Understood ?",
    87: ":Reversed:",
    88: "!Dedicace!",
    89: "Cat Ballad",
    90: "?! Hummmmm",
    91: "Maximum???",
    92: "Thanx!",
    93: "A!",
    94: "Lot",
    95: "Goodbye =)"
}

// $20C8: (8-bit) AI difficulty.
//        
//        0x01 = Idiot
//        0x09 = Genius (Still idiot)
function aiDifficulty() => byte(0x0020C8)

EXPECTED_AI_DIFFICULTY_VALUE = 0x09

function isAIAtExpectedDifficulty() => aiDifficulty() == EXPECTED_AI_DIFFICULTY_VALUE

// $20CC: (16-bit) Player 1's Games won in Original game
//        
//        Full games, not rounds
function player1GamesWon() => word(0x0020CC)

function justP1WonGame() => player1GamesWon() > prev(player1GamesWon())

// $20D4: (16-bit) Player 1 in Original Game
//        
//        0x00 = None
//        0x01 = Player
//        0x02 = CPU
function player1Type() => word(0x0020D4)

PLAYER_TYPE_NONE_VALUE = 0x00
PLAYER_TYPE_PLAYER_VALUE = 0x01
PLAYER_TYPE_CPU_VALUE = 0x02

// $20D6: (16-bit) Player 2 in Original Game
//        
//        0x00 = None
//        0x01 = Player
//        0x02 = CPU
function player2Type() => word(0x0020D6)

// $20D8: (16-bit) Player 3 in Original Game
//        
//        0x00 = None
//        0x01 = Player
//        0x02 = CPU
function player3Type() => word(0x0020D8)

// $20DA: (16-bit) Player 4 in Original Game
//        
//        0x00 = None
//        0x01 = Player
//        0x02 = CPU
function player4Type() => word(0x0020DA)

function originalGamePlayerSelectionCorrect() => player1Type() == PLAYER_TYPE_PLAYER_VALUE && 
                                                 player2Type() == PLAYER_TYPE_CPU_VALUE && 
                                                 player3Type() == PLAYER_TYPE_CPU_VALUE && 
                                                 player4Type() == PLAYER_TYPE_CPU_VALUE

// $20EA: (8-bit) Game Mode.
//        
//        Mainly "What is selected from the main menu"
//        
//        0x01 = Original Game.
//        0x02 = Puzzle
//        0x03 = Catz Soccer
//        0x04 = Snake
//        0x05 = Options
//        0x06 = Load/Save (Doesn't work)
function gameMode() => byte(0x0020EA)

ORIGINAL_GAME_VALUE = 0x01
PUZZLE_VALUE = 0x02
CATZ_SOCCER_VALUE = 0x03
SNAKE_VALUE = 0x04
OPTIONS_MENU_VALUE = 0x05
LOAD_SAVE_MENU_VALUE = 0x06

// $20F2: (8-bit) Levels unlocked
function levelsUnlocked() => byte(0x0020F2)

// $20FC: (16-bit) Your Time for Level 1
//        
//        (96 * 16 bits)  All YOUR times for Levels.
TIME_FOR_LEVEL_BASE = 0x0020FC
SIZE_OF_TIMES_FOR_LEVELS = 2
function timeForLevel0() => word(TIME_FOR_LEVEL_BASE + SIZE_OF_TIMES_FOR_LEVELS * 0)

function hasBeatenLevel(number) => word(TIME_FOR_LEVEL_BASE + SIZE_OF_TIMES_FOR_LEVELS * number) > 0 && 
                                   gameMode() == PUZZLE_VALUE
function justHasBeatenLevel(number) => word(TIME_FOR_LEVEL_BASE + SIZE_OF_TIMES_FOR_LEVELS * number) > 0 && prev(word(TIME_FOR_LEVEL_BASE + SIZE_OF_TIMES_FOR_LEVELS * number)) == 0

// $21C4: (16-bit) Best time for Stage 1
//        
//        If this number lowers it's because you beat the time.
//        
//        Stage times
//        Stage 00 = 0x10
//        Stage 01 = 0x14
//        Stage 02 = 0x13
//        Stage 03 = 0x28
//        Stage 04 = 0x25
//        Stage 05 = 0x46
//        Stage 06 = 0x35
//        Stage 07 = 0x19
//        Stage 08 = 0x3a
//        Stage 09 = 0x28
//        Stage 10 = 0x19
//        Stage 11 = 0x28
//        Stage 12 = 0x5c
//        Stage 13 = 0x0c
//        Stage 14 = 0x3e
//        Stage 15 = 0x14
//        Stage 16 = 0x31
//        Stage 17 = 0x46
//        Stage 18 = 0x55
//        Stage 19 = 0x67
//        Stage 20 = 0x7d
//        Stage 21 = 0x94
//        Stage 22 = 0x66
//        Stage 23 = 0x100
//        Stage 24 = 0x59
//        Stage 25 = 0x5a
//        Stage 26 = 0x5c
//        Stage 27 = 0x19e
//        Stage 28 = 0x58
//        Stage 29 = 0x66
//        Stage 30 = 0x81
//        Stage 31 = 0x89
//        Stage 32 = 0xe8
//        Stage 33 = 0x113
//        Stage 34 = 0x19
//        Stage 35 = 0x5d
//        Stage 36 = 0x57
//        Stage 37 = 0x1da
//        Stage 38 = 0x9f
//        Stage 39 = 0x3a
//        Stage 40 = 0xe4
//        Stage 41 = 0xa8
//        Stage 42 = 0x1ee
//        Stage 43 = 0x33
//        Stage 44 = 0x8e
//        Stage 45 = 0x78
//        Stage 46 = 0x54
//        Stage 47 = 0x108
//        Stage 48 = 0x13b
//        Stage 49 = 0x19
//        Stage 50 = 0x2b
//        Stage 51 = 0x161
//        Stage 52 = 0x49
//        Stage 53 = 0x1d
//        Stage 54 = 0x74
//        Stage 55 = 0x6b
//        Stage 56 = 0x36
//        Stage 57 = 0x57
//        Stage 58 = 0x2d
//        Stage 59 = 0x184
//        Stage 60 = 0xd3
//        Stage 61 = 0xa0
//        Stage 62 = 0x9c
//        Stage 63 = 0x52
//        Stage 64 = 0x30
//        Stage 65 = 0xb2
//        Stage 66 = 0x4d
//        Stage 67 = 0x3f
//        Stage 68 = 0x246
//        Stage 69 = 0x52
//        Stage 70 = 0x18a
//        Stage 71 = 0x53
//        Stage 72 = 0x77
//        Stage 73 = 0x5e
//        Stage 74 = 0x19f
//        Stage 75 = 0x5a
//        Stage 76 = 0x59
//        Stage 77 = 0x48
//        Stage 78 = 0x21
//        Stage 79 = 0xa9
//        Stage 80 = 0x143
//        Stage 81 = 0x20
//        Stage 82 = 0xcb
//        Stage 83 = 0x26f
//        Stage 84 = 0x26
//        Stage 85 = 0x110
//        Stage 86 = 0x363
//        Stage 87 = 0x97
//        Stage 88 = 0x446
//        Stage 89 = 0xa5
//        Stage 90 = 0x4a
//        Stage 91 = 0x2b
//        Stage 92 = 0x1e
//        Stage 93 = 0x1e
//        Stage 94 = 0x1e
//        Stage 95 = 0x1e
BEST_TIME_FOR_LEVEL_MEMORY_LOCATION = 0x0021C4
SIZE_OF_BEST_TIME_FOR_LEVEL = 2
function bestTimeForLevel0() => word(BEST_TIME_FOR_LEVEL_MEMORY_LOCATION + SIZE_OF_BEST_TIME_FOR_LEVEL * 0)

bestTimeForLevelLooup = 
{
    00: 0x10,
    01: 0x14,
    02: 0x13,
    03: 0x28,
    04: 0x25,
    05: 0x46,
    06: 0x35,
    07: 0x19,
    08: 0x3a,
    09: 0x28,
    10: 0x19,
    11: 0x28,
    12: 0x5c,
    13: 0x0c,
    14: 0x3e,
    15: 0x14,
    16: 0x31,
    17: 0x46,
    18: 0x55,
    19: 0x67,
    20: 0x7d,
    21: 0x94,
    22: 0x66,
    23: 0x10,
    24: 0x59,
    25: 0x5a,
    26: 0x5c,
    27: 0x19,
    28: 0x58,
    29: 0x66,
    30: 0x81,
    31: 0x89,
    32: 0xe8,
    33: 0x11,
    34: 0x19,
    35: 0x5d,
    36: 0x57,
    37: 0x1d,
    38: 0x9f,
    39: 0x3a,
    40: 0xe4,
    41: 0xa8,
    42: 0x1e,
    43: 0x33,
    44: 0x8e,
    45: 0x78,
    46: 0x54,
    47: 0x10,
    48: 0x13,
    49: 0x19,
    50: 0x2b,
    51: 0x16,
    52: 0x49,
    53: 0x1d,
    54: 0x74,
    55: 0x6b,
    56: 0x36,
    57: 0x57,
    58: 0x2d,
    59: 0x18,
    60: 0xd3,
    61: 0xa0,
    62: 0x9c,
    63: 0x52,
    64: 0x30,
    65: 0xb2,
    66: 0x4d,
    67: 0x3f,
    68: 0x24,
    69: 0x52,
    70: 0x18,
    71: 0x53,
    72: 0x77,
    73: 0x5e,
    74: 0x19,
    75: 0x5a,
    76: 0x59,
    77: 0x48,
    78: 0x21,
    79: 0xa9,
    80: 0x14,
    81: 0x20,
    82: 0xcb,
    83: 0x26,
    84: 0x26,
    85: 0x11,
    86: 0x36,
    87: 0x97,
    88: 0x44,
    89: 0xa5,
    90: 0x4a,
    91: 0x2b,
    92: 0x1e,
    93: 0x1e,
    94: 0x1e,
    95: 0x1e
}

function beatenBestTimeForLevel(number) => word(BEST_TIME_FOR_LEVEL_MEMORY_LOCATION + SIZE_OF_BEST_TIME_FOR_LEVEL * number) < bestTimeForLevelLooup[number] && 
                                           gameMode() == PUZZLE_VALUE

function justBeatBestTimeForLevel(number) => word(BEST_TIME_FOR_LEVEL_MEMORY_LOCATION + SIZE_OF_BEST_TIME_FOR_LEVEL * number) < bestTimeForLevelLooup[number] && prev(word(BEST_TIME_FOR_LEVEL_MEMORY_LOCATION + SIZE_OF_BEST_TIME_FOR_LEVEL * number)) == bestTimeForLevelLooup[number]

// $2282: (16-bit) Best time of stage 95
function bestTimeForLevel95() => word(0x002282)

// $3194: (16-bit) Player 1's round wins in Original game
//        
//        Not game wins, but round wins
function player1RoundWins() => word(0x003194)

function justP1WonRound() => player1RoundWins() > prev(player1RoundWins())

// $FC48: (16-bit) Player 4 Score in Original Mode
function player4Score() => word(0x00FC48)

// $FC4A: (16-bit) Player 3 Score in Original Mode
function player3Score() => word(0x00FC4A)

// $FC4C: (16-bit) Player 2 Score in Original Mode
function player2Score() => word(0x00FC4C)

// $FC4E: (8-bit) Speed
//        
//        0x00 = Planning
//        0x01 = Normal
//        0x02 = Running
//        
//        (16-bit) Player 1 Score in Original Mode
function speedOfGame() => word(0x00FC4E)
function player1Score() => word(0x00FC4E)


// $FC80: (16-bit) Number of mice left to "Save"
//        
//        If this is 0, move to next stage.  Used in conjunction with 0x00fc90 to control moving to next screen, or exiting.
function numberOfMiceToSave() => word(0x00FC80)
TARGET_NUMBER_OF_MICE_TO_SAVE = 0x0

// $FC90: (16-bit) Fade out control
//        
//        When Set to 0x0 Fade out, either to stage select or to next level.
//        
//        This controls the screen progressing.
//        
//        If 0x00fc80 = 0x0 then it's progressing to the next stage.
//        Otherwise to the menu.
function fadeOutControl() => word(0x00FC90)
FADE_OUT_VALUE = 0x0
function justStartedFadingOut() => fadeOutControl() == FADE_OUT_VALUE && prev(fadeOutControl()) != FADE_OUT_VALUE
function justWonLevel() => numberOfMiceToSave() == TARGET_NUMBER_OF_MICE_TO_SAVE && justStartedFadingOut()

// $FC92: (8-bit) Display 10th position of the hundredths of a second
function tensHundredthOfASecond() => byte(0x00FC92)

// $FC94: (8-bit) Display 1th position of the hundredths of a second
//        
//        (8-bit) Hundred position for Snake score
function onesHundredthOfASecond() => byte(0x00FC94)
function hundredsSnakeScore() => onesHundredthOfASecond()

// $FC96: (8-bit) Display 10th position of the seconds
//        
//        (8-bit) Tens position for Snake score
function tensSeconds() => byte(0x00FC96)
function tensSnakeScore() => tensSeconds()

// $FC98: (8-bit) Display 1 position of the seconds
//        
//        (8-bit) Ones position for Snake score
function onesSecond() => byte(0x00FC98)
function onesSnakeScore() => onesSecond()

// $FC9E: (8-bit) Display 1th position of the Minutes
function onesMinute() => byte(0x00FC9E)

function minutes() => onesMinute()
function seconds() => tensSeconds() * 10 + onesSecond()
function hundredthsOfASecond() => tensHundredthOfASecond() * 10 + onesHundredthOfASecond()
function totalTimeInHundredthsOfASecond() => minutes() * 60 * 100 + seconds() * 100 + hundredthsOfASecond()

function totalSnakeScore() => hundredsSnakeScore() * 100 + tensSnakeScore() * 10 + onesSnakeScore()

// $fc17: (8-bit) Flashing when losing Snake
//
//          0x00 = normal
//          0x038 and 0xda switching.  means death. 
function flashingWhenLosingSnake() => byte(0x00FC17)
NORMAL_SNAKE_VALUE = 0x00
DEATH_SNAKE_VALUE_1 = 0x38
DEATH_SNAKE_VALUE_2 = 0xDA

function normalSnakeGameplay() => flashingWhenLosingSnake() == NORMAL_SNAKE_VALUE
function deathSnakeGameplay() => flashingWhenLosingSnake() == DEATH_SNAKE_VALUE_1 && prev(flashingWhenLosingSnake()) == NORMAL_SNAKE_VALUE

// $FCA4: (8-bit) Second Arrow direction
//        
//        0x01 = Up Arrow
//        0x04 =- Right Arrow
//        0x0b = Up Arrow Used
//        0x0e = Right Arrow Used
//        
//        (6*8-bit) arrow items.
//        
//        If 0x00 no arrow.  If 0x1-0x4 directional. if 0xb-0xe Directional used.
MEMORY_LOCATION_FOR_ITEMS = 0x00FCA4

// $FCB0: (8-bit) Gameplay Check Part 1
//        
//        0xff when in game for Snake/Puzzle/Original game.
//        Any other number when not in these games.
function gameplayCheckPart1() => byte(0x00FCB0)

GAMEPLAY_CHECK_PART_1_VALUE = 0xFF

// $FCB1: (8-bit) Gameplay Check Part 2
//        
//        0xff when in game for Snake/Puzzle/Original game.
//        Any other number when not in these games.
function gameplayCheckPart2() => byte(0x00FCB1)

GAMEPLAY_CHECK_PART_2_VALUE = 0xFF

// $FCB3: (8-bit) Gameplay Check Part 3
//        
//        0xfc when in game for Snake/Puzzle/Original game.
//        Any other number when not in these games.
function gameplayCheckPart3() => byte(0x00FCB3)

GAMEPLAY_CHECK_PART_3_VALUE = 0xFC

// $FCB7: (8-bit) Gameplay Check Part 2
//        
//        0x13 when in game for Snake/Puzzle/Original game.
//        Any other number when not in these games.
function gameplayCheckPart4() => byte(0x00FCB7)

GAMEPLAY_CHECK_PART_4_VALUE = 0x13

function achievementReady() => memoryKeyValid() &&
                               gameplayCheckPart1() == GAMEPLAY_CHECK_PART_1_VALUE &&
                               gameplayCheckPart2() == GAMEPLAY_CHECK_PART_2_VALUE &&
                               gameplayCheckPart3() == GAMEPLAY_CHECK_PART_3_VALUE &&
                               gameplayCheckPart4() == GAMEPLAY_CHECK_PART_4_VALUE

TITLE = "TITLE"
NORMAL_TITLE = "NORMAL_TITLE"
SPEED_TITLE = "SPEED_TITLE"
DESCRIPTION = "DESCRIPTION"
POINTS = "POINTS"
NORMAL_POINTS = "NORMAL_POINTS"
SPEED_POINTS = "SPEED_POINTS"
FIRST = "FIRST"
LAST = "LAST"
AP = "MAP"

puzzleData = 
[
    {
        NORMAL_TITLE: "Ages Bus !",
        SPEED_TITLE: "Zigzag",
        NORMAL_POINTS: 1,
        SPEED_POINTS: 2,
        FIRST: 0,
        LAST: 5
    },
    {
        NORMAL_TITLE: "Japan",
        SPEED_TITLE: "Lots of Mice",
        NORMAL_POINTS: 1,
        SPEED_POINTS: 2,
        FIRST: 6,
        LAST: 11
    },
    {
        NORMAL_TITLE: "Two on One",
        SPEED_TITLE: "Ready? Go!",
        NORMAL_POINTS: 2,
        SPEED_POINTS: 3,
        FIRST: 12,
        LAST: 17
    
    },
    {
        NORMAL_TITLE: "Catch up", 
        SPEED_TITLE: "Run Away!",
        NORMAL_POINTS: 3,
        SPEED_POINTS: 4,
        FIRST: 18,
        LAST: 23
    },
    {
        NORMAL_TITLE: "Gang of Tabs",
        SPEED_TITLE: "Loopy",
        NORMAL_POINTS: 3,
        SPEED_POINTS: 4,
        FIRST: 24,
        LAST: 29
    },
    {
        NORMAL_TITLE: "Trapped Cat",
        SPEED_TITLE: "Mice Cracker",
        NORMAL_POINTS: 4,
        SPEED_POINTS: 4,
        FIRST: 30,
        LAST: 35
    },
    {
        NORMAL_TITLE: "Out 4 a Walk",
        SPEED_TITLE: "Prisoners!",
        NORMAL_POINTS: 4,
        SPEED_POINTS: 4,
        FIRST: 36,
        LAST: 41
    },
    {
        NORMAL_TITLE: "Escape Route",
        SPEED_TITLE: "The Tour",
        NORMAL_POINTS: 4,
        SPEED_POINTS: 5,
        FIRST: 42,
        LAST: 47
    },
    {
        NORMAL_TITLE: "Chicken Race",
        SPEED_TITLE: "Speed Waltz",
        NORMAL_POINTS: 5,
        SPEED_POINTS: 5,
        FIRST: 48,
        LAST: 53
    },
    {
        NORMAL_TITLE: "Arnd Ze Wrld",
        SPEED_TITLE: "Lucky 218",
        NORMAL_POINTS: 5,
        SPEED_POINTS: 5,
        FIRST: 54,
        LAST: 59
    },
    {
        NORMAL_TITLE: "Guillotine",
        SPEED_TITLE: "Quick Turn",
        NORMAL_POINTS: 5,
        SPEED_POINTS: 5,
        FIRST: 60,
        LAST: 65
    },
    {
        NORMAL_TITLE: "Missile Fac",
        SPEED_TITLE: "Microwave!",
        NORMAL_POINTS: 5,
        SPEED_POINTS: 5,
        FIRST: 66,
        LAST: 71
    },
    {
        NORMAL_TITLE: "The Gauntlet",
        SPEED_TITLE: "Steroid Belt",
        NORMAL_POINTS: 5,
        SPEED_POINTS: 5,
        FIRST: 72,
        LAST: 77
    },
    {
        NORMAL_TITLE: "Cat's Eden",
        SPEED_TITLE: "Sprinter",
        NORMAL_POINTS: 5,
        SPEED_POINTS: 5,
        FIRST: 78,
        LAST: 83
    },
    {
        NORMAL_TITLE: "Cat Ballad",
        SPEED_TITLE: ":Reversed:",
        NORMAL_POINTS: 5,
        SPEED_POINTS: 5,
        FIRST: 84,
        LAST: 89
    },
    {
        NORMAL_TITLE: "Goodbye =)",
        SPEED_TITLE: "Maximum???",
        NORMAL_POINTS: 1,
        SPEED_POINTS: 1,
        FIRST: 90,
        LAST: 95
    }
]
    
    
function levelSetAchievement(data) {
    type = "Progression"
    if(data[LAST] == 95)
    {
        type = "Win_Condition"
    }
    achievement(title = data[NORMAL_TITLE],
                type = type,
                description = format("Beat levels {0} through {1} in Puzzle Mode", data[FIRST], data[LAST]),
                points = data[NORMAL_POINTS],
                trigger = measured(tally_of(range(data[FIRST], data[LAST]), data[LAST] - data[FIRST] + 1, index => once(hasBeatenLevel(index)))) &&
                          any_of(range(data[FIRST], data[LAST]), index => justHasBeatenLevel(index))&&
                          achievementReady() &&
                          gameMode() == PUZZLE_VALUE
                )
}

for data in puzzleData {
    levelSetAchievement(data)
}

function speedAchievement(data)
{
    achievement(title = data[SPEED_TITLE],
                description = format("Beat Best time for the levels from {0} to {1}", data[FIRST], data[LAST]),
                points = data[SPEED_POINTS],
                trigger = measured(tally_of(range(data[FIRST], data[LAST]), data[LAST] - data[FIRST] + 1, index => once(beatenBestTimeForLevel(index)))) &&
                          any_of(range(data[FIRST], data[LAST]), index => justBeatBestTimeForLevel(index)) &&
                          achievementReady() &&
                          gameMode() == PUZZLE_VALUE
                )

}

for data in puzzleData {
    speedAchievement(data)
}


STAGE = "STAGE"
ITEMS = "ITEMS"
LEFT = "LEFT"
itemLeftData =[
    {STAGE: 46, TITLE: "Left on the Launch Pad", POINTS: 3, ITEMS: 2, LEFT: 1},
    {STAGE: 57, TITLE: "Opening the Puzzle Box", POINTS: 3, ITEMS: 3, LEFT: 1},
    {STAGE: 59, TITLE: "Looking for an Apartement", POINTS: 3, ITEMS: 3, LEFT: 1},
    {STAGE: 70, TITLE: "Ghosh House", POINTS: 3, ITEMS: 3, LEFT: 2},
    {STAGE: 74, TITLE: "Tenements Housing", POINTS: 3, ITEMS: 10, LEFT: 1},
    {STAGE: 76, TITLE: "Calling a Square Dance", POINTS: 3, ITEMS: 2, LEFT: 1},
    {STAGE: 78, TITLE: "Turn Right Left One", POINTS: 3, ITEMS: 6, LEFT: 1},
    {STAGE: 82, TITLE: "Inner Circle Square Tile", POINTS: 3, ITEMS: 5, LEFT: 2},
    {STAGE: 88, TITLE: "What is Dedicace", POINTS: 3, ITEMS: 6, LEFT: 1},
    {STAGE: 90, TITLE: "One Last Hummmmm", POINTS: 3, ITEMS: 3, LEFT: 1}
]

function correctedNumber(number) => number/2*2 + 1 - number%2
function isItemLeftOver(index) => byte(MEMORY_LOCATION_FOR_ITEMS + correctedNumber(index)) >= 0x1 && 
                                  byte(MEMORY_LOCATION_FOR_ITEMS + correctedNumber(index)) <= 0x4
function itemJustUsed(index) =>  byte(MEMORY_LOCATION_FOR_ITEMS + correctedNumber(index)) >= 0xb && 
                                 byte(MEMORY_LOCATION_FOR_ITEMS + correctedNumber(index)) <= 0xe && 
                                 prev(byte(MEMORY_LOCATION_FOR_ITEMS + correctedNumber(index))) >= 0x1 && 
                                 prev(byte(MEMORY_LOCATION_FOR_ITEMS + correctedNumber(index))) <= 0x4

function itemLeftAchievement(data)
{
    achievement(title = data[TITLE],
                description = format("Win level {0} with at least {1} items remaining", data[STAGE], data[LEFT]),
                points = data[POINTS],
                trigger = trigger_when( numberOfMiceToSave() == 0 &&
                                        justStartedFadingOut() &&
                                        currentLevelSelected() == data[STAGE] &&
                                        tally_of(range(0, data[ITEMS] - 1), data[LEFT], index => once(isItemLeftOver(index)))) &&
                          never( any_of(range(0, data[ITEMS] - 1), index => itemJustUsed(index))) &&
                          never(currentLevelSelected() != data[STAGE]) &&
                          achievementReady() &&
                          gameMode() == PUZZLE_VALUE
                )
}

for data in itemLeftData {
    itemLeftAchievement(data)
}


VALUE = "VALUE"

function snakeAchievement(data)
{
    achievement(title = data[TITLE],
                description = format("Score {0} Snake Mode", data[VALUE]),
                points = data[POINTS],
                trigger = totalSnakeScore() >= data[VALUE] &&
                          prev(totalSnakeScore()) < data[VALUE] &&
                          normalSnakeGameplay() &&
                          achievementReady() &&
                          gameMode() == SNAKE_VALUE
                )
}

snakeAchievement({TITLE: "Small Snake", POINTS: 3, VALUE: 100})
snakeAchievement({TITLE: "Long Snake", POINTS: 5, VALUE: 200})
snakeAchievement({TITLE: "Fill the Screen", POINTS: 10, VALUE: 250})

MAP = "MAP"
function originalGameAchievement(data)
{
    achievement(title = levelLookup[data[MAP]],
                description = "Win an Original Game Mode on the " + levelLookup[data[MAP]] + " map.  P1 is the only Human, all other players must be CPU, AI Difficulty should be 9(max)",
                points = data[POINTS],
                trigger = trigger_when(justP1WonGame()) &&
                          originalGamePlayerSelectionCorrect() &&
                          isAIAtExpectedDifficulty() &&
                          originalGameMapSelection() == data[MAP] &&   
                          achievementReady() &&
                          gameMode() == ORIGINAL_GAME_VALUE
                )
}

for index in range(FIRST_ORIGINAL_MAP, LAST_ORIGINAL_MAP) {
    originalGameAchievement({MAP: index, POINTS: 3})
}

achievement(title = "Four Thousand Points",
            description = "Get 4000 points in Original Game Mode. P1 is the only Human, all other players must be CPU, AI Difficulty should be 9(max)",
            points = 3,
            trigger = player1Score() >= 4000 &&
                      prev(player1Score()) < 4000 &&
                      originalGamePlayerSelectionCorrect() &&
                      isAIAtExpectedDifficulty() &&
                      achievementReady() &&
                      gameMode() == ORIGINAL_GAME_VALUE
            )


leaderboard(
    title = format("High Original Round Score"),
    description = format("Get the highest Original Score possible. P1 is the only Human, all other players must be CPU, AI Difficulty should be 9(max)"),
    start = 
    (
        justP1WonRound() &&
        originalGamePlayerSelectionCorrect() &&
        isAIAtExpectedDifficulty() &&
        achievementReady() &&
        gameMode() == ORIGINAL_GAME_VALUE

    ),
    cancel = always_false(),
    submit = always_true(),
    value = player1Score(),
    format = "SCORE"
)

function StageLeaderboard(index)
{
    leaderboard(
        title = format("Fastest {0}", stageLookup[index]),
        description = format("Get the fastest time on {0}", stageLookup[index]),
        start = 
        (
            justWonLevel() &&
            currentLevelSelected() == index &&
            achievementReady() &&
            gameMode() == PUZZLE_VALUE
        ),
        cancel = always_false(),
        submit = always_true(),
        value = totalTimeInHundredthsOfASecond(),
        format = "MILLISECS"
    )
}

for index in range(FIRST_PUZZLE_LEVEL, LAST_PUZZLE_LEVEL) {
    StageLeaderboard(index)
}

leaderboard(
    title = "High Snake Score",
    description = "Get the highest score in Snake",
    start = 
    (
        deathSnakeGameplay() &&
        achievementReady() &&
        gameMode() == SNAKE_VALUE
    ),
    cancel = always_false(),
    submit = always_true(),
    value = totalSnakeScore(),
    format = "SCORE"
)

rich_presence_conditional_display(achievementReady() && gameMode() == ORIGINAL_GAME_VALUE, "Playing Original Game, Level: {0} P1 Score: {1} P2 Score: {2} P3 Score: {3} P4 Score: {4}", 
                                  rich_presence_lookup("OriginalGameLevel", originalGameMapSelection(), levelLookup),
                                  rich_presence_value("Score", player1Score()),
                                  rich_presence_value("Score", player2Score()),
                                  rich_presence_value("Score", player3Score()),
                                  rich_presence_value("Score", player4Score())
)

rich_presence_conditional_display(achievementReady() && gameMode() == PUZZLE_VALUE, "Playing Puzzle Mode , Level: {0}", 
                                  rich_presence_lookup("PuzzleStageLevel", currentLevelSelected(), stageLookup)
)

rich_presence_conditional_display(achievementReady() && gameMode() == SNAKE_VALUE, "Playing Snake Mode, Score: {0}", 
                                  rich_presence_value("Score", totalSnakeScore())
)

rich_presence_conditional_display(achievementReady() && gameMode() == CATZ_SOCCER_VALUE, "Playing Catz Soccer")

rich_presence_display("In Menus")
