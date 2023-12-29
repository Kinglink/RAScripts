// Virtua Cop
// #ID = 14569

defaultOptionsSinglePlayerTag = "(Default Options and Single Player only, no Gun Select)"

// $157884: (8-bit) Training Level Selection
//          
//          0x01 = Main Menu
//          0x02 = Exercise
//          0x04 = Training
//          0x09 = Vs Play
//          0x0c = Training Menu
//          
//          If setting this to 0x09, when selecting exercise, you go to Vs. Player
function trainingLevelSelection() => byte(0x157884)

// $1578B2: (8-bit) Innocents hit in current continue
function innocentsHitP1() => byte(0x1578B2)

// $1578C5: (8-bit) Ranking Mode Indicator
//          
//          Appears to block Second Player
//          
//          0x00 = Arcade Mode (or Training)
//          0x01 = Ranking Mode
function rankingModeIndicator() => byte(0x1578C5)

// $1578D6: (8-bit) Main Menu Indicator
//          
//          0x00 = On Main Menu
//          0x01 = Not on Main Menu
function mainMenuIndicator() => byte(0x1578D6)

MAIN_MENU_INDICATOR = 0x00
NOT_ON_MAIN_MENU_INDICATOR = 0x01
function onMainMenu() => mainMenuIndicator() == MAIN_MENU_INDICATOR
function notOnMainMenu() => mainMenuIndicator() == NOT_ON_MAIN_MENU_INDICATOR
function justLeftMainMenu() => prev(mainMenuIndicator()) == MAIN_MENU_INDICATOR && notOnMainMenu()

// $1578DD: (8-bit) 1P Credits
//          
//          How many times you can continue.
//          
//          Note: Doesn't update immediately on the screen.
function creditsCount() => byte(0x1578DD)

// $1578E8: (8-bit) Level ID
//          
//          0x00 = Level 1
//          0x01 = Level  2
//          0x02 = Level 3
//          0x05  Training
//          
//          Note: Freezing this will force you into a scene.  Freezing this to more than 2 will break the loading.
function levelId() => byte(0x1578E8)

FIRST_LEVEL = 0x00
SECOND_LEVEL = 0x01
THIRD_LEVEL = 0x02
TRAINING_LEVEL = 0x05

// $1578EA: (8-bit) Scene ID
//          
//          Which scene in the Stage is it.
//          
//          Note: Changing this will break the scripting for the current stage.
//          
//          Appears to be Training stage as well.  Off by one so 0x06 = Training 7 when Level is set to 0x05
//          
//          Note: On Versus this is the "Game" being played but not the versus
function sceneId() => byte(0x1578EA)

FIRST_SCENE = 0x00
FINAL_SCENE = 0x02  // ALL scene ends on scene 3 (0x02)


// $157900: (8-bit) 1P Joined
//          
//          0x00 = Not in Game  (front end or
//          0x01 = In Game
function player1Joined() => byte(0x157900)

PLAYER_JOINED_VALUE = 0x01

// $157910: (8-bit) Overlay for 1P
//          
//          0x00 = Not playing (note Player 2 doesn't set this)
//          0x01 = "Press start"  (Not playing)
//          0x02 = In Game (Show score)
//          0x04 = Continue?
//          0x08 = "Game Over"  Will revert to 0x01 eventually
function overlayP1() => byte(0x157910)

PRESS_START_OVERLAY_ID = 0x01
PLAYER_NOT_JOINED_VALUE = 0x00
function firstPlayerPlaying() => overlayP1() >= PRESS_START_OVERLAY_ID && player1Joined() == PLAYER_JOINED_VALUE
function firstPlayerJustJoined() => player1Joined() == PLAYER_JOINED_VALUE && prev(player1Joined()) == PLAYER_NOT_JOINED_VALUE
function firstPlayerJustLeft() => player1Joined() == PLAYER_NOT_JOINED_VALUE && prev(player1Joined()) == PLAYER_JOINED_VALUE
// $157913: (8-bit) 1P Life
//          
//          How many hits the first played can take.
function lifeP1() => byte(0x157913)

function p1TookDamage() => lifeP1() < prev(lifeP1()) || creditsCount() < prev(creditsCount())

// $157920: (16-bit) Upper P1 Score Bits.
//          
//          Upper 16-bits of the player 1's score. Upper bits at 0x157922p
function upperScoreBitsP1() => word(0x157920)

// $157922: (16-bit) Lower P1 Score Bits.
//          
//          Lower 16-bits of the player 1's score. Upper bits at 0x157920
function lowerScoreBitsP1() => word(0x157922)

function player1Score() => upperScoreBitsP1() * 2^16 + lowerScoreBits()

// $157932: (8-bit) Hits in Training mode
//          
//          Does not appear to be the same as the arcade game.
function hitsTrainingMode() => byte(0x157932)

// $157935: (8-bit) 1P Score Multiplier
//          
//          Note this gets lowered
function scoreMultiplierP1() => byte(0x157935)

// $157937: (8-bit) 1P Combo count
//          
//          When this reaches 0x32 (50) Increment Multiplier by 1 and reset to 1
function comboCountP1() => byte(0x157937)

// $157950: (8-bit) Overlay for 2P
//          
//          0x01 = "Press start"  (Not playing)
//          0x02 = In Game (Show score)
//          0x04 = Continue?
//          0x08 = "Game Over"  Will revert to 0x01 eventually
function overlayP2() => byte(0x157950)

function secondPlayerPlaying() => overlayP2() > PRESS_START_OVERLAY_ID 

// $157953: (8-bit) 2P Life
//          
//          How many hits the Second played can take.
//          
//          0x00 = Dead/not started.
function lifeP2() => byte(0x157953)

// $157960: (16-bit) Upper P2 Score Bits.
//          
//          Upper 16-bits of the player 2's score. Upper bits at 0x157962
function upperScoreP2() => word(0x157960)

// $157962: (16-bit) Lower P2 Score Bits.
//          
//          Lower 16-bits of the player 2's score. Upper bits at 0x157960
function lowerScoreP2() => word(0x157962)

function player1Score() => upperScoreP2() * 2^16 + lowerScoreP2()

// $157972: (8-bit) P2 Hits (or Opponent in Training)
function hitsP2() => byte(0x157972)

// $157999: (8-bit) Cheat Level
//          
//          0x00 = No Cheats used
//          0x01 = Ranking, advanced options Unlocked
//          0x02 = Gun Select unlocked (note that doesn't mean unlocks are in use, check 0x15799c)
function cheatLevel() => byte(0x157999)

// $15799A: (8-bit) Mirror Option.
//          
//          0x00 = Off
//          0x01 = On
function mirrorOption() => byte(0x15799A)

MIRROR_OPTION_ACTIVE = 0x01 

function mirrorOptionActive() => mirrorOption() == MIRROR_OPTION_ACTIVE

// $15799C: (8-bit) Gun Select Option.
//          
//          0x00 = Off
//          0x01 = On
function gunSelectOption() => byte(0x15799C)

GUN_SELECT_ON = 0x01
function cheatProtection() => gunSelectOption() != GUN_SELECT_ON

// $15E8DC: (8-bit) Level 2 Complete
//          
//          0x00 = Level 2 Not complete
//          0x01 = Level 2 Complete First
//          0x02 = Level 2 Complete Second
//          0x03 = Level 2 Complete Final (third)
//          
//          For secret boss, this MUST be 2.
function level2Complete() => byte(0x15E8DC)

// $15E8DD: (8-bit) Level 1 Complete
//          
//          0x00 = Level 1 Not Complete (Selectable
//          0x01 = Level 1 Complete First
//          0x02 = Level 1 complete Second
//          0x03 = Level 1 Complete Final (third)
//          
//          For Secret boss this Must be 1
function level1Complete() => byte(0x15E8DD)

// $15E8DE: (8-bit) Number of Levels complete
//          
//          0x00 = Initial stage.
//          0x01 = Finished 1 Level
//          0x02 = Finished 2 Levels
//          0x03 = Finished Game.
//          
//          For secret boss, this should be 2.
function numberLevelsComplete() => byte(0x15E8DE)

// $15E8DF: (8-bit) Level 3 Complete
//          
//          0x00 = Level 3 Not Complete  (Selectable
//          0x00 = Level 3 Complete First
//          0x02 = Level 3 Complete Second
//          0x03 = Level 3 Complete Final (third)
//          
//          For secret boss this will be 0
function level3Complete() => byte(0x15E8DF)


// Magic numbers here.  It's ok, take a deep breath. 
function secretBossActive() => level1Complete() == 1 && level2Complete() == 2 && (level3Complete() == 0 || level3Complete() == 3) && numberLevelsComplete() >= 2

// $15E9E5: (8-bit) Finished Scene Indicator
//          
//          Need to catch the transition from 0 to 1 to confirm "Victory"
//          
//          0x00 = When scene is in progress, or Game Over happens.
//          0x01 = When scene is over (Won)
function finishedSceneIndicator() => byte(0x15E9E5)

SCENE_NOT_COMPLETE = 0x00
SCENE_COMPLETE = 0x01

function sceneJustCompleted() => prev(finishedSceneIndicator()) == SCENE_NOT_COMPLETE && finishedSceneIndicator() == SCENE_COMPLETE

// $160271: (8-bit) Main menu option Selected
//          
//          0x00 = Arcade Mode
//          0x01 = Training mode
//          0x02 = Options
//          0x03 = Ranking Mode
function mainMenuOptionSelected() => byte(0x160271)

ARCADE_MODE = 0x00
TRAINING_MODE = 0x01
RANKING_MODE = 0x03

// Forcing firstPlayerPlaying on these. 
function arcadeMode() => mainMenuOptionSelected() == ARCADE_MODE && firstPlayerPlaying()
function trainingMode() => mainMenuOptionSelected() == TRAINING_MODE && firstPlayerPlaying()
function rankingMode() => mainMenuOptionSelected() == RANKING_MODE && firstPlayerPlaying()
function arcadeOrRanking() => arcadeMode() || rankingMode()

// $16A93A: (8-bit) Bosses Health
//          
//          Not a control value, but a representation of their life.
//          
//          Kong (Level 1)  = a0
//          King (Level 2)  = a0
//          Boss (Level 3)  = a0
//          Secret Boss = c8
function bossHealth() => byte(0x16A93A)

NORMAL_BOSS_HEALTH = 0xa0
SECRET_BOSS_HEALTH = 0xc8
// You still need to check which level you're on.   Must have prev, otherwise Secret will fall into this range.
function NormalBossStarted() => bossHealth() == NORMAL_BOSS_HEALTH && prev(bossHealth()) == 0
function SecretBossStarted() => bossHealth() == SECRET_BOSS_HEALTH && prev(bossHealth()) == 0
function BossDefeated() => bossHealth() == 0 && prev(bossHealth()) != 0 

// $16A970: (8-bit) 1P Life Option
//          
//          Number of "hits" player can take.
//          
//          0x01 = min
//          0x05 = default
//          0x09 = max
function optionLife1P() => byte(0x16A970)

DEFAULT_LIFE_OPTION = 0x05

// $16A973: (8-bit) Gun Looseness 1P Option
//          
//          Changes the "Ease" of hitting enemies Meaning you can aim further away.  So FF means aim anywhere on the screen.
//          
//          HOWEVER That also means the innocents too.
//          
//          Changing during game doesn't appear to change anything.
//          
//          0x00 = Minimum
//          0x09 = Default
//          0x1d = Maximum (29)
function optionGunLooseness1P() => byte(0x16A973)

DEFAULT_GUN_LOOSENESS = 0x09


// $16A994: (8-bit) Continue Option
//          
//          0x00 = No Credit (minimum, no continues)
//          0x05 = Default Option
//          0x09 = Maximum, 9 continues.
//          0xff = Free Play
function optionsCredit() => byte(0x16A994)

DEFAULT_CREDITS = 0x05

// $16A995: (8-bit) Difficulty Option
//          
//          0x00 = Easiest
//          0x01 = Very Easy
//          0x02 = Easy
//          0x03 = Medium Easy
//          0x04 = Normal
//          0x05 = Medium Hard
//          0x06 = Hard
//          0x07 = Very Hard
//          0x08 = Hardest
function optionsDifficulty() => byte(0x16A995)

NORMAL_DIFFICULTY = 0x04
HARD_DIFFICULTY = 0x06

function hardDifficulty() => optionsDifficulty() >= HARD_DIFFICULTY

// $16B8F9: (8-bit) Training Versus Stage Opponent
//          
//          0x00 = Police
//          0x01 = Tom
//          0x02 = Jack
//          0x03 = Terry
//          0x04 = Kong
//          0x05 = King
//          0x06 = Boss
//          0x07 = Smarty
//          0x08 = Rage
function trainingVersusOpponent() => byte(0x16B8F9)

VS_POLICE = 0x00
VS_TOM = 0x01
VS_JACK = 0x02
VS_TERRY = 0x03
VS_KONG = 0x04
VS_KING = 0x05
VS_BOSS = 0x06
VS_SMARTY = 0x07
VS_RAGE = 0x08

trainingVersusOpponentLookup =
{
    VS_POLICE: "Police",
    VS_TOM: "Tom",
    VS_JACK: "Jack",
    VS_TERRY: "Terry",
    VS_KONG: "Kong",
    VS_KING: "King",
    VS_BOSS: "Boss",
    VS_SMARTY: "Smarty",
    VS_RAGE: "Rage",
}

// $16B90E: (8-bit) Timer for Training mode
//          
//          Becomes 0xff at the end of a level.
function timerInTrainingMode() => byte(0x16B90E)

TRAINING_TIME_OVER = 0xff
function endOfTraining() => prev(timerInTrainingMode()) == 0x00 && timerInTrainingMode == TRAINING_TIME_OVER

// $16B911: (8-bit) Training Exercise Success Indicator
//          
//          Transitions from 0 to 1 if you succeeded on the level.
//          
//          This is used for something else in Training vs Play
function trainingExerciseSuccessIndicator() => byte(0x16B911)

TRAINING_SUCCESS = 0x01

function trainingExerciseJustWon() => prev(trainingExerciseSuccessIndicator()) == 0 && trainingExerciseSuccessIndicator() == TRAINING_SUCCESS

// This is required by almost any achievement 
function validOptions() => optionLife1P() <= DEFAULT_LIFE_OPTION &&
                           optionGunLooseness1P() <= DEFAULT_GUN_LOOSENESS &&
                           optionsCredit() <= DEFAULT_CREDITS &&
                           optionsDifficulty() >= NORMAL_DIFFICULTY

function startedGame() => once(justLeftMainMenu()) &&
                          once(firstPlayerJustJoined()) &&
                          never(onMainMenu() || 
                                secondPlayerPlaying() || 
                                firstPlayerJustLeft())

function startedLevel(targetLevelId) => once(levelId() == targetLevelId && 
                                             sceneId() == FIRST_SCENE &&
                                             notOnMainMenu()) &&
                                        firstPlayerPlaying() && // this might be duplicate. 
                                        never(levelId() != targetLevelId ||
                                             onMainMenu() || 
                                             secondPlayerPlaying() || 
                                             !firstPlayerPlaying() )

function normalAchievementLocks() => cheatProtection() &&
                                     validOptions()

function beatLevel(targetLevelId) => startedLevel(targetLevelId) && 
                                     levelId() == targetLevelId &&
                                     sceneId() == FINAL_SCENE &&
                                     sceneJustCompleted()

function triggerBeatLevel(targetLevelId) => startedLevel(targetLevelId) && 
                                     levelId() == targetLevelId &&
                                     trigger_when( sceneId() == FINAL_SCENE &&
                                              sceneJustCompleted())


achievement( title = "Case Closed",
             description = "Finish the game any way you want in single player.  (No gun select)",
             points = 1,
             // Don't use valid options
             trigger = arcadeOrRanking() &&
                       cheatProtection() &&
                       startedGame() && 
                       numberLevelsComplete() == 3 &&
                       prev(numberLevelsComplete()) == 2
)

function stageAchievement(title, description, points, targetLevelId)
{
    achievement( title = title,
                  description = description + defaultOptionsSinglePlayerTag,
                  points = points,
                  trigger = arcadeOrRanking() &&
                            normalAchievementLocks() &&
                            beatLevel(targetLevelId)
                       
    )
}

stageAchievement( title = "Arms Black Market",
                  description = "Beat Stage 1",
                  points = 3,
                  targetLevelId = FIRST_LEVEL
)

stageAchievement( title = "Underground Weapon Storage",
                  description = "Beat Stage 2",
                  points = 4,
                  targetLevelId = SECOND_LEVEL
)

stageAchievement( title = "Gang Headquarters",
                  description = "Beat Stage 3",
                  points = 5,
                  targetLevelId = THIRD_LEVEL
)

function innocentsAchievement(title, description, points, targetLevelId)
{
    achievement( title = title,
                  description = description + defaultOptionsSinglePlayerTag,
                  points = points,
                trigger = arcadeOrRanking() &&
                          normalAchievementLocks() &&
                          triggerBeatLevel(targetLevelId) &&
                          never(innocentsHitP1() > prev(innocentsHitP1()))  
    )
}

innocentsAchievement( title = "Hero of the People: Arms Black Market",
                  description = "Beat Stage 1 with out shooting any hostages",
                  points = 3,
                  targetLevelId = FIRST_LEVEL
)

innocentsAchievement( title = "Hero of the People:Underground Weapon Storage",
                  description = "Beat Stage 2 with out shooting any hostages",
                  points = 4,
                  targetLevelId = SECOND_LEVEL
)

innocentsAchievement( title = "Hero of the People: Gang Headquarters",
                  description = "Beat Stage 3 with out shooting any hostages",
                  points = 5,
                  targetLevelId = THIRD_LEVEL
)

function bossAchievement(title, description, points, targetLevelId)
{
    achievement( title = title,
                  description = description + defaultOptionsSinglePlayerTag,
                  points = points,
                  trigger = arcadeOrRanking() &&
                            normalAchievementLocks() &&
                            once(NormalBossStarted() && levelId() == targetLevelId) && 
                            never(levelId() != targetLevelId ||
                                  onMainMenu() || 
                                  secondPlayerPlaying() || 
                                  !firstPlayerPlaying() ||
                                  p1TookDamage()) &&                                            
                            trigger_when(BossDefeated())
    )
}

bossAchievement( title = "What a Donkey",
                  description = "Beat Kong in Stage 1 with out taking any damage",
                  points = 5,
                  targetLevelId = FIRST_LEVEL
)

bossAchievement( title = "Regicide",
                  description = "Beat King in Stage 2 with out taking any damage",
                  points = 5,
                  targetLevelId = SECOND_LEVEL
)

bossAchievement( title = "Boss of Nothing",
                  description = "Beat Boss in Stage 3 without taking any damage",
                  points = 5,
                  targetLevelId = THIRD_LEVEL
)


achievement( title = "The real boss found",
                  description = "Beat the 'Secret' fourth boss" + defaultOptionsSinglePlayerTag,
                  points = 10,
                  trigger = arcadeOrRanking() &&
                            normalAchievementLocks() &&
                            once(SecretBossStarted() && levelId() == 3) && 
                            never(levelId() != 3 ||
                                  onMainMenu() || 
                                  secondPlayerPlaying() || 
                                  !firstPlayerPlaying()) &&                                            
                            trigger_when( BossDefeated())
)

achievement( title = "Perfect Fang",
                  description = "Beat the 'Secret' fourth boss without taking any damage" + defaultOptionsSinglePlayerTag,
                  points = 10,
                  trigger = arcadeOrRanking() &&
                            normalAchievementLocks() &&
                            once(SecretBossStarted() && levelId() == 3) && 
                            never(levelId() != 3 ||
                                  onMainMenu() || 
                                  secondPlayerPlaying() || 
                                  !firstPlayerPlaying() ||
                                  p1TookDamage()) &&                                            
                            trigger_when( BossDefeated())
)

function finishAchievement(title, description, points, targetLevelId, targetMemory)
{
    achievement( title = title,
                  description = description + defaultOptionsSinglePlayerTag,
                  points = points,
                  trigger = arcadeOrRanking() &&
                            normalAchievementLocks() &&
                            startedGame() && 
                            numberLevelsComplete() == 3 &&
                            prev(numberLevelsComplete()) == 2 &&
                            targetMemory == 3 &&
                            prev(targetMemory) == 0
                       
    )
}

finishAchievement( title = "King of Kong?",
                  description = "Complete Stage 1 after beating the other two stages",
                  points = 3,
                  targetLevelId = FIRST_LEVEL,
                  targetMemory = level1Complete()
)

finishAchievement( title = "The King Pin?",
                  description = "Complete Stage 2 after beating the other two stages",
                  points = 4,
                  targetLevelId = SECOND_LEVEL,
                  targetMemory = level2Complete()
)

finishAchievement( title = "Big Boss?",
                  description = "Complete Stage 3 after beating the other two stages",
                  points = 5,
                  targetLevelId = THIRD_LEVEL,
                  targetMemory = level3Complete()
)

achievement( title = "Grade me, bro",
             description = "Beat the 'Secret' Ranking Mode" + defaultOptionsSinglePlayerTag,
             points = 10,
             trigger = rankingMode() &&
                       normalAchievementLocks() &&
                       startedGame() && 
                       numberLevelsComplete() == 3 &&
                       prev(numberLevelsComplete()) == 2
)

achievement( title = "Left? Right!",
             description = "Beat Mirror Mode" + defaultOptionsSinglePlayerTag,
             points = 3,
             trigger = arcadeOrRanking() &&
                       normalAchievementLocks() &&
                       startedGame() && 
                       numberLevelsComplete() == 3 &&
                       prev(numberLevelsComplete()) == 2 &&
                       mirrorOptionActive()
)

function multiplierAchievement(title, description, points, targetMultiplier)
{
    achievement( title = title,
                  description = description + defaultOptionsSinglePlayerTag,
                  points = points,
                  trigger = arcadeOrRanking() &&
                            normalAchievementLocks() &&
                            startedGame() && 
                            scoreMultiplierP1() == targetMultiplier &&
                            prev(scoreMultiplierP1()) < targetMultiplier 
                       
    )
}

multiplierAchievement( title = "Getting Started",
                       description = "Reach a 2x multiplier" + defaultOptionsSinglePlayerTag,
                       points = 3,
                       targetMultiplier = 2 
)

multiplierAchievement( title = "Careful shooting",
                       description = "Reach a 5x multiplier" + defaultOptionsSinglePlayerTag,
                       points = 10,
                       targetMultiplier = 5
)

achievement( title = "Master",
             description = "Beat Virtua Cop on Hard or higher difficulty mode" + defaultOptionsSinglePlayerTag,
             points = 10,
             trigger = arcadeOrRanking() &&
                       hardDifficulty() &&
                       normalAchievementLocks() &&
                       startedGame() && 
                       numberLevelsComplete() == 3 &&
                       prev(numberLevelsComplete()) == 2 
)

// Sharpshooter
// beat training mode. 
//     Level 8, when the success indicator flips from 0 to 1.
// 
// Better shot than X  (Wait which was better? vs Rage)
// Beat each enemy in Vs. Training
//     Calculate this by checking Hits Vs Hits after time hits 0xff
// 
// 
// 
// Leaderboards
// 
// Best Score Normal or harder
// 
// Best score on Very Hard or harder
// 
// Best (Arcade) Score on Ranking Mode 
// 
// 
// REAL Presence
// Ranking Mode or Arcade Mode 
// 
// 2P 
// 
// 1P 
// 
// Training Exercise
// 
// Training Versus