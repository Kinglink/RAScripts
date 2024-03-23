// Wonder Momo
// #ID = 8360

// $0003: (8-bit) Stage Select Detection
//        
//        0x49 when in stage select, any other value when not.
function stageSelectDetector1() => byte(0x000003)

// $0015: (8-bit) Stage Select Detection
//        
//        0x49 when in stage select, any other value when not.
function stageSelectDetector2() => byte(0x000015)

// $0040: (8-bit) Controller input
//        
//        Duplicated at 0x040
function controllerInput() => byte(0x000040)

// $01F5: (8-bit) Stage Select Detection
//        
//        0x46 when in stage select, any other value when not.
function stageSelectDetector3() => byte(0x0001F5)

// $01F7: (8-bit) Stage Select Detection
//        
//        0x46 when in stage select, any other value when not.
function stageSelectDetector4() => byte(0x0001F7)

// $01FA: (8-bit) Stage Select Detection
//        
//        0x37 when in stage select, any other value when not.
function stageSelectDetector5() => byte(0x0001FA)

// $0200: (8-bit) Game State
//        
//        0x01 = Main Menu
//        0x02 = High Score
//        0x03 = Demo
//        0x04 = Unused?
//        0x09 = Entering into the game/ Stage Select (pretty sure it's only stage select but it triggers enter game
//        0x0a- 0x0d = Entering into the level. 
//        0xe = Gameplay of level 
//        0x0f = Change into Hero
//        0x10 = Lose
//        0x12 = Screen closes on win
//        0x13 = Cutscenes
//        0x14 = Screen closes
//        0x15 = Enter your score (Not finale end game)
//        0x16 = Continue
//        0x17 = Beginning of finale
//        0x18 = Enter your score.at finale
//        0x19 = Final screen of ending
function gameState() => byte(0x000200)
FINAL_ENTERING_LEVEL_VALUE = 0x0d
GAMEPLAY_VALUE = 0x0e
LOST_STAGE_VALUE = 0x10
WON_STAGE_VALUE = 0x12
MAIN_MENU_VALUE = 0x01
HIGH_SCORE_VALUE = 0x02 
DEMO_VALUE = 0x03
NO_VALUE = 0x00
function lockoutAchievements() => gameState() == MAIN_MENU_VALUE || gameState() == HIGH_SCORE_VALUE || gameState() == DEMO_VALUE || gameState() == NO_VALUE

function justEnteringLevel() => prev(gameState()) == FINAL_ENTERING_LEVEL_VALUE && gameState() == GAMEPLAY_VALUE
function gameplayRunning() => gameState() == GAMEPLAY_VALUE
function justLostStage() => prev(gameState()) == GAMEPLAY_VALUE && gameState() == LOST_STAGE_VALUE
function justWonStage() => prev(gameState()) == GAMEPLAY_VALUE && gameState() == WON_STAGE_VALUE

// $0209: (8-bit) Game Paused
//        
//        0x00 = Game Running
//        0x01 = Game Paused
//        
//        This is a control value.
function gamePausedState() => byte(0x000209)
GAME_RUNNING_VALUE = 0x00
GAME_PAUSED_VALUE = 0x01   

function gameIsRunning() => gamePausedState() == GAME_RUNNING_VALUE

// $0216: (8-bit) Current stage
//        
//        0x00 = Stage 1
//        0x01 = Stage 2
//        0x02 = Stage 3
//        all the way up
//        0x0b = Stage 12
function currentStage() => byte(0x000216)

// $0220: (8-bit) Vital Amount (HP)
//        
//        0x00 = Death
//        0x7e = Max health (Higher values at 7e, too high results at death
function lifeLeft() => byte(0x000220)

MAX_LIFE_VALUE = 0x7e
function maxLifeReached() => lifeLeft() == MAX_LIFE_VALUE
function justTookDamage() => prev(lifeLeft()) > lifeLeft()

// $0221: (8-bit) Wonder Amount (HP)
//        
//        0x00 = Death
//        0x7e = Max health (Higher values at 7e,
function wonderAmount() => byte(0x000221)

// $040C: (8-bit) Transformed
//        
//        0x00 = Girl
//        0x01 = Hero
//        
//        This is a control
function isTransformed() => byte(0x00040C)
HERO_VALUE = 0x01
function isHero() => isTransformed() == HERO_VALUE

// $06D0: (8-bit) Ring weapon status.
//        
//        0x00 = Human form, no ring status.
//        0x01 = Carrying ring.
//        0x02 = Ring thrown, straight line
//        0x03 = Ring High Bounces
//        0x04 = Ring Low Bounces (when knocked down while holding the ring)
function ringWeaponStatus() => byte(0x0006D0)

// $07F0: (16-bit) Score (internal value)
//        
//        This is the current score. Updating it doesn't change the on screen score until the next score update.
//        
//        *10 because the zero's digit doesn't move.
function score() => word(0x0007F0)

function passedScore(value) => score() * 10 >= value && prev(score()) * 10 < value

TITLE = "TITLE"
DESCRIPTION = "DESCRIPTION"
LEVEL_VALUE = "LEVEL_VALUE"
POINTS = "POINTS"

function levelAchievement(data)
{
    type = "Progression"
    if(data[LEVEL_VALUE] == 12)
    {
        type = "Win_Condition"
    }
    achievement( title = data[TITLE], 
                 description = data[DESCRIPTION], 
                 points = data[POINTS],
                 type = type,
                 trigger = !lockoutAchievements() &&
                           justWonStage() &&
                           currentStage() + 1 == data[LEVEL_VALUE]
    )
}

levelAchievement({TITLE: "Crab People", 
                  DESCRIPTION: "Beat the first act", 
                  LEVEL_VALUE: 1, 
                  POINTS: 1}
)

levelAchievement({TITLE: "The Golden God", 
                  DESCRIPTION: "Beat the second act", 
                  LEVEL_VALUE: 2, 
                  POINTS: 1}
)

levelAchievement({TITLE: "Two Golden Gods", 
                  DESCRIPTION: "Beat the third act", 
                  LEVEL_VALUE: 3, 
                  POINTS: 1}
)
levelAchievement({TITLE: "Crabs at the Beach", 
                  DESCRIPTION: "Beat the fourth act", 
                  LEVEL_VALUE: 4, 
                  POINTS: 2}
)
levelAchievement({TITLE: "Rubbery Crab", 
                  DESCRIPTION: "Beat the fifth act", 
                  LEVEL_VALUE: 5, 
                  POINTS: 2}
)

levelAchievement({TITLE: "Double Bounce", 
                  DESCRIPTION: "Beat the sixth act", 
                  LEVEL_VALUE: 6, 
                  POINTS: 3}
)

levelAchievement({TITLE: "Crabs And Guns", 
                  DESCRIPTION: "Beat the seventh act", 
                  LEVEL_VALUE: 7, 
                  POINTS: 3}
)

levelAchievement({TITLE: "A Relaxing Bath", 
                  DESCRIPTION: "Beat the eighth act", 
                  LEVEL_VALUE: 8, 
                  POINTS: 4}
)

levelAchievement({TITLE: "Twice The Guns", 
                  DESCRIPTION: "Beat the ninth act", 
                  LEVEL_VALUE: 9, 
                  POINTS: 4}
)

levelAchievement({TITLE: "Bouncing Gold", 
                  DESCRIPTION: "Beat the tenth act", 
                  LEVEL_VALUE: 10, 
                  POINTS: 5}
)

levelAchievement({TITLE: "A Ninja's Revenge", 
                  DESCRIPTION: "Beat the eleventh act", 
                  LEVEL_VALUE: 11, 
                  POINTS: 5}
)

levelAchievement({TITLE: "The Final Battle", 
                  DESCRIPTION: "Beat the twelfth act", 
                  LEVEL_VALUE: 12, 
                  POINTS: 10}
)   

function hitlessAchievement(data)
{
    achievement( title = data[TITLE], 
                 description = data[DESCRIPTION], 
                 points = data[POINTS],
                 trigger = never(lockoutAchievements()) &&
                           trigger_when(justWonStage()) &&
                           once(currentStage() + 1 == data[LEVEL_VALUE] && 
                                justEnteringLevel()) &&
                           never(justTookDamage())
    )
}

hitlessAchievement({TITLE: "Crazy Crab", 
                  DESCRIPTION: "Beat the first act without taking damage", 
                  LEVEL_VALUE: 1, 
                  POINTS: 1}
)   

hitlessAchievement({TITLE: "Glorious Golden God", 
                  DESCRIPTION: "Beat the second act without taking damage", 
                  LEVEL_VALUE: 2, 
                  POINTS: 2}
)

hitlessAchievement({TITLE: "Gang of Golden Gods", 
                  DESCRIPTION: "Beat the third act without taking damage", 
                  LEVEL_VALUE: 3, 
                  POINTS: 2}
)

hitlessAchievement({TITLE: "Breaking the Dancer's Leg", 
                  DESCRIPTION: "Beat the fourth act without taking damage", 
                  LEVEL_VALUE: 4, 
                  POINTS: 3}
)

hitlessAchievement({TITLE: "Bouncing Crab", 
                  DESCRIPTION: "Beat the fifth act without taking damage", 
                  LEVEL_VALUE: 5, 
                  POINTS: 3}
)

hitlessAchievement({TITLE: "Dodging Acroballs", 
                  DESCRIPTION: "Beat the sixth act without taking damage", 
                  LEVEL_VALUE: 6, 
                  POINTS: 4}
)

hitlessAchievement({TITLE: "The Crab Brought a Friend", 
                  DESCRIPTION: "Beat the seventh act without taking damage", 
                  LEVEL_VALUE: 7, 
                  POINTS: 4}
)

hitlessAchievement({TITLE: "No Ninjas Allowed", 
                  DESCRIPTION: "Beat the eighth act without taking damage", 
                  LEVEL_VALUE: 8, 
                  POINTS: 5}
)

hitlessAchievement({TITLE: "Double the Guns, Double the Misses", 
                  DESCRIPTION: "Beat the ninth act without taking damage", 
                  LEVEL_VALUE: 9, 
                  POINTS: 5}
)

hitlessAchievement({TITLE: "Gold Doesn't Bounce", 
                  DESCRIPTION: "Beat the tenth act without taking damage", 
                  LEVEL_VALUE: 10, 
                  POINTS: 10}
)

hitlessAchievement({TITLE: "Ninja's Nightmare", 
                  DESCRIPTION: "Beat the eleventh act without taking damage", 
                  LEVEL_VALUE: 11, 
                  POINTS: 10}
)

hitlessAchievement({TITLE: "You Might Not Have Noticed But Your Brain Did", 
                  DESCRIPTION: "Beat the twelfth act without taking damage", 
                  LEVEL_VALUE: 12, 
                  POINTS: 25}
)

function izumiAchievement(data)
{
    achievement( title = data[TITLE], 
                 description = data[DESCRIPTION], 
                 points = data[POINTS],
                 trigger = never(lockoutAchievements()) &&
                           trigger_when(justWonStage()) &&
                           once(currentStage() + 1 == data[LEVEL_VALUE] && 
                                justEnteringLevel()) &&
                           never(isHero())
    )
}

izumiAchievement({TITLE: "A Girl Walks Through a Park", 
                  DESCRIPTION: "Beat the first act without transforming into Momo", 
                  LEVEL_VALUE: 1, 
                  POINTS: 1}
)

izumiAchievement({TITLE: "A Girl Walks by an Apartment", 
                  DESCRIPTION: "Beat the second act without transforming into Momo", 
                  LEVEL_VALUE: 2, 
                  POINTS: 2}
)

izumiAchievement({TITLE: "A Girl Walks Through a Construction Site", 
                  DESCRIPTION: "Beat the third act without transforming into Momo", 
                  LEVEL_VALUE: 3, 
                  POINTS: 2}
)

izumiAchievement({TITLE: "A Girl Walks Along a Beach", 
                  DESCRIPTION: "Beat the fourth act without transforming into Momo", 
                  LEVEL_VALUE: 4, 
                  POINTS: 3}
)

izumiAchievement({TITLE: "A Girl Walks Through the Mountains", 
                  DESCRIPTION: "Beat the fifth act without transforming into Momo", 
                  LEVEL_VALUE: 5, 
                  POINTS: 3}
)

izumiAchievement({TITLE: "A Girl Walks Through a Construction Site Again", 
                  DESCRIPTION: "Beat the sixth act without transforming into Momo", 
                  LEVEL_VALUE: 6, 
                  POINTS: 3}
)

izumiAchievement({TITLE: "A Girl Walks Through the Park... Again", 
                  DESCRIPTION: "Beat the seventh act without transforming into Momo", 
                  LEVEL_VALUE: 7, 
                  POINTS: 5}
)

izumiAchievement({TITLE: "A Girl Walks Along a Beach at Night", 
                  DESCRIPTION: "Beat the eighth act without transforming into Momo", 
                  LEVEL_VALUE: 8, 
                  POINTS: 5}
)

izumiAchievement({TITLE: "And She's Back in the Mountains", 
                  DESCRIPTION: "Beat the ninth act without transforming into Momo", 
                  LEVEL_VALUE: 9, 
                  POINTS: 5}
)

izumiAchievement({TITLE: "Honestly, I Think She's Lost", 
                  DESCRIPTION: "Beat the tenth act without transforming into Momo", 
                  LEVEL_VALUE: 10, 
                  POINTS: 10}
)

izumiAchievement({TITLE: "A Girl Finds a Secret Hidden Bunker, Why Not", 
                  DESCRIPTION: "Beat the eleventh act without transforming into Momo", 
                  LEVEL_VALUE: 11, 
                  POINTS: 10}
)

izumiAchievement({TITLE: "A Girl Beats the Final Boss and Goes Home", 
                  DESCRIPTION: "Beat the twelfth act without transforming into Momo", 
                  LEVEL_VALUE: 12, 
                  POINTS: 25}
)


achievement( title = "Full Life", 
             description = "Reach Full Health",
             points = 5,
             trigger = !lockoutAchievements() &&
                       maxLifeReached()
)

achievement( title = "I Will Not Fall", 
             description = "Beat all twelve acts without continuing",
             points = 25,
             trigger = never(lockoutAchievements()) &&
                       once(currentStage() + 1 == 1 && 
                                justEnteringLevel()) &&
                       never(justLostStage()) &&
                       trigger_when(currentStage() + 1 == 12 && 
                                    justWonStage()) 
)

achievement( title = "Breaking the Default Score", 
             description = "Reach 10,000 points",
             points = 2,
             trigger = passedScore(10000)
)

achievement( title = "Quite a Woman", 
             description = "Reach 100,000 points",
             points = 10,
             trigger = passedScore(100000)
)


leaderboard(
    title = format("High Score"),
    description = format("Get the highest score possible"),
    start = 
    (
        (currentStage() + 1 == 12 && justWonStage())||
        (justLostStage()) &&
        score() > 0 &&
        !lockoutAchievements()

    ),
    cancel = always_false(),
    submit = always_true(),
    value = score() * 10,
    format = "SCORE"
)


leaderboard(
    title = format("Fastest Clear"),
    description = format("Beat all 12 acts as fast as possible"),
    start = 
    (
        (currentStage() + 1== 1 && justEnteringLevel()) &&
        !lockoutAchievements()
                    
    ),
    cancel =  lockoutAchievements(),
    submit =  (currentStage() + 1 == 12 && justWonStage()),
    value = measured(always_true(), when=gameIsRunning() && gameplayRunning() ),
    lower_is_better = true,
    format = "FRAMES"
)

rich_presence_conditional_display(lockoutAchievements(), "Watching Demos")

rich_presence_display("Score: {0}, Act {1}", 
                      rich_presence_value("Number", score()*10),
                      rich_presence_value("Number", currentStage())
                      )
