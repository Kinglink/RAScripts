// Virtua Cop
// #ID = 14569

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
function levelID() => byte(0x1578E8)

// $1578EA: (8-bit) Scene ID
//          
//          Which scene in the Stage is it.
//          
//          Note: Changing this will break the scripting for the current stage.
//          
//          Appears to be Training stage as well.  Off by one so 0x06 = Training 7 when Level is set to 0x05
//          
//          Note: On Versus this is the "Game" being played but not the versus
function sceneID() => byte(0x1578EA)

// $157900: (8-bit) 1P Joined
//          
//          0x00 = Not in Game  (front end or
//          0x01 = In Game
function player1Joined() => byte(0x157900)

// $157910: (8-bit) Overlay for 1P
//          
//          0x00 = Not playing (note Player 2 doesn't set this)
//          0x01 = "Press start"  (Not playing)
//          0x02 = In Game (Show score)
//          0x04 = Continue?
//          0x08 = "Game Over"  Will revert to 0x01 eventually
function overlayP1() => byte(0x157910)

// $157913: (8-bit) 1P Life
//          
//          How many hits the first played can take.
function lifeP1() => byte(0x157913)

// $157920: (16-bit) Upper P1 Score Bits.
//          
//          Upper 16-bits of the player 1's score. Upper bits at 0x157922p
function upperScoreBitsP1() => word(0x157920)

// $157922: (16-bit) Lower P1 Score Bits.
//          
//          Lower 16-bits of the player 1's score. Upper bits at 0x157920
function lowerScoreBitsP2() => word(0x157922)

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

// $15799C: (8-bit) Gun Select Option.
//          
//          0x00 = Off
//          0x01 = On
function gunSelectOption() => byte(0x15799C)

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

// $15E9E5: (8-bit) Finished Scene Indicator
//          
//          Need to catch the transition from 0 to 1 to confirm "Victory"
//          
//          0x00 = When scene is in progress, or Game Over happens.
//          0x01 = When scene is over (Won)
function finishedSceneIndicator() => byte(0x15E9E5)

// $160271: (8-bit) Main menu option Selected
//          
//          0x00 = Arcade Mode
//          0x01 = Training mode
//          0x02 = Options
//          0x03 = Ranking Mode
function mainMenuOptionSelected() => byte(0x160271)

// $16A93A: (8-bit) Bosses Health
//          
//          Not a control value, but a representation of their life.
//          
//          Kong (Level 1)  = a0
//          King (Level 2)  = a0
//          Boss (Level 3)  = a0
//          Secret Boss = c8
function bossHealth() => byte(0x16A93A)

// $16A970: (8-bit) 1P Life Option
//          
//          Number of "hits" player can take.
//          
//          0x01 = min
//          0x05 = default
//          0x09 = max
function optionLife1P() => byte(0x16A970)

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

// $16A994: (8-bit) Continue Option
//          
//          0x00 = No Credit (minimum, no continues)
//          0x09 = Maximum, 9 continues.
//          0xff = Free Play
function creditsOption1P() => byte(0x16A994)

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
function difficultyOption1P() => byte(0x16A995)

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

// $16B90E: (8-bit) Timer for Training mode
//          
//          Becomes 0xff at the end of a level.
function timerInTrainingMode() => byte(0x16B90E)

// $16B911: (8-bit) Training Exercise Success Indicator
//          
//          Transitions from 0 to 1 if you succeeded on the level.
//          
//          This is used for something else in Training vs Play
function trainingExerciseSuccessIndicator() => byte(0x16B911)
