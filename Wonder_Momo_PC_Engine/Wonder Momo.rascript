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
//        0x0a-0xe = Gameplay  Looks like 0xa-0xd is entrance.
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

// $0209: (8-bit) Game Paused
//        
//        0x00 = Game Running
//        0x01 = Game Paused
//        
//        This is a control value.
function gamePausedState() => byte(0x000209)

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
