// Oink!
// #ID = 13032

// $0000: (8-bit) Game Mode
//        
//        0x00 = Game Mode 1 (Single player, the only allowed value)
//        0x01 = Game Mode 2 (Two Player Vs CPU, Turn based)
//        0x02 = Game Mode 3 (Two Player, Wolf Controlled by other controller
function gameMode() => byte(0x000000)

SINGLE_PLAYER_VALUE == 0x0
function singlePlayer() => gameMode() == SINGLE_PLAYER_VALUE

// $0007: (8-bit) Lives Left/Stage
//        
//        0x02 = Two Lives Left / Straw
//        0x01 = One Life Left / Clay
//        0x00 = No Lives left / Brick
function livesLeft() => byte(0x000007)

FIRST_LIFE_VALUE = 0x02
function firstLife() => livesLeft() == FIRST_LIFE_VALUE

// $003D: (8-bit) Pig X Position
//        
//        0x19-0x75
function pigXPosition() => byte(0x00003D)

// $004F: (8-bit) Pig Y Location
//        
//        0x0d-0x38
//        
//        If player is in Difficulty A, They can't drop the block while above 0x32.  Difficulty B can drop it at any height
function pigYPosition() => byte(0x00004F)

DIFFICULTY_A_REQUIREMENT_VALUE = 0x32


// $0050: (4-bit Upper) Game State
//        
//        0x0 = Game started
//        0x4 = Displaying Game Mode, waiting for game start
//        0x8 = Demo Started
function gameState() => upper4(0x000050)

GAME_STARTED_VALUE = 0x0

function noDemo() => gameState() == GAME_STARTED_VALUE 

// $0054: (8-bit) 0000XX BCD values for score.
function scoreTensOnes() => byte(0x000054)

// $0056: (8-bit) 00XX00 BCD values for Score
function scoreHundredsThousands() => byte(0x000056)

// $0058: (8-bit) XX0000 BCD Value for Bits
function scoreTenThousands() => byte(0x000058)

function actualScore() => (BCD(scoreTenThousands()) * 10000) + (BCD(scoreHundredsThousands()) * 100)  + BCD(scoreTenOnes())

function prevScore() => (BCD(prev(scoreTenThousands())) * 10000) + (BCD(prev(scoreHundredsThousands())) * 100)  + BCD(prev(scoreTenOnes()))

function difficultyBDetection() => actualScore() > prevScore() && pigYPosition() > DIFFICULTY_A_REQUIREMENT_VALUE


10k in one life achievement.

25k in 3 lives achievement

100k in 3 lives achievement
10k in 3 lives achievement

1k on Difficulty A 
10k on Difficulty A 

Leaderboard  

One Life Difficulty A 
One Life Difficulty B 
Difficulty A 
Difficulty B 

Real presence 



achievement(
    title = "Score +100 Level 1", points = 1,
    description = "Score +100 Level 1",
    id = 210833, badge = "00000", published = "4/12/2022 9:51:59 PM", modified = "4/14/2022 7:07:02 PM",
    trigger = gameMode() == 0 && prev(scoreHundredsThousands()) == 0 && scoreHundredsThousands() == 1
)

achievement(
    title = "Score +1000", points = 1,
    description = "Score +1000",
    id = 210834, badge = "00000", published = "4/12/2022 9:52:05 PM", modified = "4/12/2022 9:52:05 PM",
    trigger = scoreHundredsThousands() == 16
)

achievement(
    title = "Score +500 Level 1", points = 2,
    description = "Score +500 Level 1",
    id = 210835, badge = "00000", published = "4/12/2022 9:52:10 PM", modified = "4/17/2022 12:56:03 AM",
    trigger = scoreHundredsThousands() == 5 && prev(scoreHundredsThousands()) == 4 && gameMode() == 0
)

achievement(
    title = "Score +1000 Level 1", points = 3,
    description = "Score +1000 Level 1",
    id = 211699, badge = "00000", published = "4/17/2022 12:56:28 AM", modified = "4/17/2022 12:56:28 AM",
    trigger = scoreHundredsThousands() == 16 && prev(scoreHundredsThousands()) == 9 && gameMode() == 0
)
