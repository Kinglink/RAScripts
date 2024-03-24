// ~Homebrew~ Mighty Mighty Missile!
// #ID = 5

// $0000: (24-bit) Key
//        
//        Set to 0x0a43fa when game's memory is loaded.
function memoryKey() => tbyte(0x000000)

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

// $20C0: (8-bit) Currently selected level
//        
//        Updates with each level beaten.
function currentLevelSelected() => byte(0x0020C0)

// $20C8: (8-bit) AI difficulty.
//        
//        0x01 = Idiot
//        0x09 = Genius (Still idiot)
function aiDifficulty() => byte(0x0020C8)

// $20CC: (16-bit) Player 1's Games won in Original game
//        
//        Full games, not rounds
function player1GamesWon() => word(0x0020CC)

// $20D4: (16-bit) Player 1 in Original Game
//        
//        0x00 = None
//        0x01 = Player
//        0x02 = CPU
function player1Type() => word(0x0020D4)

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

// $20F2: (8-bit) Levels unlocked
function levelsUnlocked() => byte(0x0020F2)

// $20FC: (16-bit) Your Time for Level 1
//        
//        (25 * 16 bits)  All YOUR times for Levels.
function timeForLevel0() => word(0x0020FC)

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
function bestTimeForLevel0() => word(0x0021C4)

// $2282: (16-bit) Best time of stage 95
function bestTimeForLevel95() => word(0x002282)

// $3194: (16-bit) Player 1's round wins in Original game
//        
//        Not game wins, but round wins
function player1RoundWins() => word(0x003194)

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
function speedOfGameplayer1Score() => word(0x00FC4E)

// $FC80: (16-bit) Number of mice left to "Save"
//        
//        If this is 0, move to next stage.  Used in conjunction with 0x00fc90 to control moving to next screen, or exiting.
function numberOfMiceToSave() => word(0x00FC80)

// $FC90: (16-bit) Fade out control
//        
//        When Set to 0x0 Fade out, either to stage select or to next level.
//        
//        This controls the screen progressing.
//        
//        If 0x00fc80 = 0x0 then it's progressing to the next stage.
//        Otherwise to the menu.
function fadeOutControl() => word(0x00FC90)

// $FC92: (8-bit) Display 10th position of the hundredths of a second
function tensHundredthOfASecond() => byte(0x00FC92)

// $FC94: (8-bit) Display 1th position of the hundredths of a second
//        
//        (8-bit) Hundred position for Snake score
function onesHundredthOfASecond() => byte(0x00FC94)

// $FC96: (8-bit) Display 10th position of the seconds
//        
//        (8-bit) Tens position for Snake score
function tensSeconds() => byte(0x00FC96)

// $FC98: (8-bit) Display 1 position of the seconds
//        
//        (8-bit) Ones position for Snake score
function onesSecond() => byte(0x00FC98)

// $FC9E: (8-bit) Display 1th position of the Minutes
function onesMinute() => byte(0x00FC9E)

achievement(
    title = "Complete Level 05", points = 5,
    description = "Complete Puzzle Level 05",
    id = 95, badge = "00150", published = "2/19/2013 6:17:42 PM", modified = "2/19/2013 6:58:57 PM",
    trigger = word(0x0000EE) > 5
)

achievement(
    title = "Complete Level 10", points = 5,
    description = "Complete Puzzle Level 10",
    id = 96, badge = "00134", published = "2/19/2013 6:57:52 PM", modified = "2/19/2013 6:58:55 PM",
    trigger = word(0x0000EE) > 10
)

achievement(
    title = "1000 Mice", points = 1,
    description = "Player 1 - Save 1000 Mice",
    id = 93, badge = "00173", published = "2/19/2013 2:04:04 PM", modified = "6/7/2020 3:09:08 AM",
    trigger = word(0x00FF52) >= 1000 && word(0x0000B6) == 4 && word(0x00FE90) == 65535
)

achievement(
    title = "4000 Mice", points = 5,
    description = "Player 1 - Earn 4000 points",
    id = 94, badge = "00173", published = "2/19/2013 6:06:59 PM", modified = "6/7/2020 3:09:06 AM",
    trigger = word(0x00FF52) >= 4000 && word(0x0000B6) == 4 && word(0x00FE90) == 65535
)
