// Oink!
// #ID = 13032

// $0000: (8-bit) Game Mode
//        
//        0x00 = Game Mode 1 (Single player, the only allowed value)
//        0x01 = Game Mode 2 (Two Player Vs CPU, Turn based)
//        0x02 = Game Mode 3 (Two Player, Wolf Controlled by other controller
function gameMode() => byte(0x000000)

SINGLE_PLAYER_VALUE = 0x0
function singlePlayer() => gameMode() == SINGLE_PLAYER_VALUE
TWO_VS_CPU_VALUE = 0x1
TWO_VS_PLAYER_VALUE = 0x2
function twoVsCpuMode() => gameMode() == TWO_VS_CPU_VALUE
function twoVsPlayerMode() => gameMode() == TWO_VS_PLAYER_VALUE

// $0007: (8-bit) Lives Left/Stage
//        
//        0x02 = Two Lives Left / Straw
//        0x01 = One Life Left / Clay
//        0x00 = No Lives left / Brick
function livesLeft() => byte(0x000007)

FIRST_LIFE_VALUE = 0x02
SECOND_LIFE_VALUE = 0x01
function firstLife() => livesLeft() == FIRST_LIFE_VALUE
function justLostFirstLife() => prev(livesLeft()) == FIRST_LIFE_VALUE &&
                                livesLeft() == SECOND_LIFE_VALUE

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
function gameState() => high4(0x000050)

GAME_STARTED_VALUE = 0x0
DEMO_STARTED_VALUE = 0x8
function noDemo() => gameState() == GAME_STARTED_VALUE 
function inDemo() => gameState() == DEMO_STARTED_VALUE

// $0054: (8-bit) 0000XX BCD values for score.
function scoreTensOnes() => byte(0x000054)
function scoreTens()=> high4(0x000054)
function scoreOnes()=> low4(0x000054)

// $0056: (8-bit) 00XX00 BCD values for Score
function scoreHundredsThousands() => byte(0x000056)
function scoreThousands() => high4(0x000056)
function scoreHundreds() => low4(0x000056)

// $0058: (8-bit) XX0000 BCD Value for Bits
function scoreTenThousands() => byte(0x000058)
function scoreTenThousand() => low4(0x000058)
function scoreHundredThousand() => high4(0x000058)

function actualScore() => (bcd(scoreTenThousands()) * 10000) + (bcd(scoreHundredsThousands()) * 100)  + bcd(scoreTensOnes())

function prevScore() => (prev(scoreHundredThousand()) * 100000) + 
                        (prev(scoreTenThousand()) * 10000) + 
                        (prev(scoreThousands()) * 1000)  + 
                        (prev(scoreHundreds()) * 100)  + 
                        (prev(scoreTens()) * 10)  + 
                        prev(scoreOnes())

// $005E: (8-bit) Game over Indicator
//
//        Cycles between different numbers when pigs walk on the stage and die.  
//
//        0xe6 when game is over. 
function gameOverIndicator() => byte(0x005E)

GAME_OVER_VALUE = 0xE6
function isGameOver() => gameOverIndicator() == GAME_OVER_VALUE

function gameOverFirstLife() => isGameOver() && firstLife()

function difficultyBDetection() => actualScore() > prevScore() && pigYPosition() < DIFFICULTY_A_REQUIREMENT_VALUE

function requirementsForAllAchievements() => noDemo() && singlePlayer()

function oneLifeAchievement(title, description, points, target)
{
    achievement(title = title,
                description = description,
                points = points,
                trigger = requirementsForAllAchievements() &&
                          prevScore() < target &&
                          actualScore() > target &&
                          firstLife()
    )
}

function fullGameAchievement(title, description, points, target)
{
    achievement(title = title,
                description = description,
                points = points,
                trigger = requirementsForAllAchievements() &&
                          prevScore() < target &&
                          actualScore() > target
    )
}

function difficultyAAchievement(title, description, points, target)
{
    achievement(title = title,
                description = description,
                points = points,
                trigger = requirementsForAllAchievements() &&
                          trigger_when(prevScore() < target &&
                                       actualScore() > target) &&
                          once(actualScore() == 0) &&
                          never(difficultyBDetection()) 
    )
}

fullGameAchievement("Holding the Wall", "Earn 10,000 points in Game Mode 1", 2, 10000)
fullGameAchievement("Oinkers", "Earn 25,000 points to earn your Activision Badge in Game Mode 1", 5, 25000)
fullGameAchievement("Swine Savant", "Earn 100,000 points in Game Mode 1", 25, 100000 ) 

oneLifeAchievement("Even Straw Can Stop A Wolf", "Earn 10,000 points in a single life in Game Mode 1", 3, 10000 ) 
oneLifeAchievement("Expert Oinkers", "Earn 25,000 points in a single life in Game Mode 1", 10, 25000 ) 
oneLifeAchievement("Solo Swine Savant", "Earn 100,000 points in a single life in Game Mode 1", 25, 100000 ) 

difficultyAAchievement("Hogwall Hero", "Earn 1,000 with both difficulty switches set to A in Game Mode 1", 5, 1000)
difficultyAAchievement("Superior Swine", "Earn 5,000 with both difficulty switches set to A in Game Mode 1", 10, 5000)
difficultyAAchievement("Perfect Porker", "Earn 10,000 with both difficulty switches set to A in Game Mode 1", 25, 10000)



leaderboard(
    title = "Highest Score",
    description = "Get the highest score in Game Mode 1",
    start  = once(actualScore() == 0) &&
             isGameOver() &&
             never(!requirementsForAllAchievements()),
    cancel = always_false(),
    submit = always_true(),
    value = actualScore(),
    format = "SCORE"
)

leaderboard(
    title = "Highest Score One Life",
    description = "Get the highest score in Game Mode 1",
    start  = once(actualScore() == 0) &&
             (justLostFirstLife() || 
              gameOverFirstLife() )&&
             never(!requirementsForAllAchievements()),
    cancel = always_false(),
    submit = always_true(),
    value = actualScore(),
    format = "SCORE"
)

leaderboard(
    title = "Highest Score Hard Difficulty",
    description = "Get the highest score in Game Mode 1 with both Difficulties set to A",
    start  = once(actualScore() == 0) &&
             isGameOver() &&
             never(difficultyBDetection() || 
             !requirementsForAllAchievements()),
    cancel = always_false(),
    submit = always_true(),
    value = actualScore(),
    format = "SCORE"
)

leaderboard(
    title = "Highest Score One Life Hard Difficulty",
    description = "Get the highest score in Game Mode 1 with both Difficulties set to A",
    start  = once(actualScore() == 0) &&
             (justLostFirstLife() || 
              gameOverFirstLife() )&&
             never(difficultyBDetection() || 
             !requirementsForAllAchievements()),
    cancel = always_false(),
    submit = always_true(),
    value = actualScore(),
    format = "SCORE"
)


rich_presence_conditional_display(inDemo(), "Watching the demo")

rich_presence_conditional_display(singlePlayer() && noDemo(), "Lives: {0}, Score: {1}",
                                  rich_presence_value("Number", livesLeft()),
                                  rich_presence_value("Score", actualScore())
)

rich_presence_conditional_display(twoVsCpuMode() && noDemo(), "Playing Two Player VS CPU")

rich_presence_conditional_display(twoVsPlayerMode() && noDemo(), "Playing Two Player VS Player")

rich_presence_display( "Considering game mode {0}",
    rich_presence_value("Number", gameMode() + 1)
)
