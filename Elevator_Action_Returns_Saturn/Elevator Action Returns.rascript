// Elevator Action Returns
// #ID = 11654

// $044802: (8-bit) Elevator Action Arcade Level
//          
//          
//          0x00 = First level
//          0x01 = Second level
//          0x02 = Third level
//          0x03 = Fourth level
//          0x04 = Repeat first level .
function arcadeLevelIndex() => byte(0x044802)

// $19FD04: (8-bit) Elevator Action/Elevator Action Return mode switch.
//          
//          Setting to 0x03 on the main menu loads the Arcade version of Elevator action (the "OLD" Option)  And remains true until the game comes back to the front end.
//          
//          0x00 = Elevator Action Returns
//          0x03 = Elevator Action (Arcade)
function arcadeModeSwitch() => byte(0x19FD04)

ARCADE_MODE_SWITCH_ELEVATOR_ACTION_RETURNS_VALUE = 0x00
ARCADE_MODE_SWITCH_ELEVATOR_ACTION_ARCADE_VALUE = 0x03
function elevatorActionReturns() => arcadeModeSwitch() == ARCADE_MODE_SWITCH_ELEVATOR_ACTION_RETURNS_VALUE
function elevatorActionArcade() => arcadeModeSwitch() == ARCADE_MODE_SWITCH_ELEVATOR_ACTION_RETURNS_VALUE

// $19FD24: (8-bit) Second player's Credits Remaining.
//          
//          0x04 = Normal gameplay.
//          0x08 = Cheating!!!
//          
//          All other values probably means second player is active.
function secondPlayerCreditsRemaining() => byte(0x19FD24)

SECOND_PLAYER_CREDIT_REMAING_CORRECT_VALUE = 0x04

// $19FD25: (8-bit) First Player Credits Remaining
//          
//          Starts at 3 meaning 3 credits + the initial.
//          
//          NOTE! There is a cheat code to start with 7 Credits, which is really 7 + 1 starting credit.
function firstPlayerCreditsRemaining() => byte(0x19FD25)

// $1A10F2: (8-bit) Current Level ID
//          
//          0x00 = Mission 1 Red After Image
//          0x01 = Mission 2 Cross The Breeze
//          0x02 = Mission 3 Colors of Night
//          0x03 = Mission 4 Under The Crack
//          0x04 = Mission 5 Crimson Line
//          0x05 = Mission 6 Vermillion Sun
function levelId() => byte(0x1A10F2)

LEVEL_ONE = 0
LEVEL_TWO = 1
LEVEL_THREE = 2
LEVEL_FOUR = 3
LEVEL_FIVE = 4
LEVEL_SIX = 5
LEVEL_POSTGAME = 6 // only triggered when beating level 6, either way.

// $1A110D: (8-bit) Game Level (Difficulty)
//          
//          0x00 = Easy
//          0x01 = Normal
//          0x02 = Hard
function gameDifficulty() => byte(0x1A110D)

Easy = 0x00
Normal = 0x01
Hard = 0x02

// Everyone
function easyModeAndAbove() => true
function normalModeAndAbove() => gameDifficulty() >= Normal
function hardMode() => gameDifficulty()  == Hard

// $1A1162: (8-bit) Cheat mod option for Player Stock
//          
//          If this is set to any value other than 0x1 CHEATING!!!!!
function playerStockOption() => byte(0x1A1162)

REQUIRED_PLAYER_STOCK_SETTING = 0x1

// $1A1164: (8-bit) Cheat mod option for Bomb Stock
//          
//          If this is set to any value other than 0x14 CHEATING!!!!!
function bombStockOption() => byte(0x1A1164)

REQUIRED_BOMB_STOCK_SETTING = 0x14

// $1A1166: (8-bit) Violence mode
//          
//          
//          0x00 = Normal
//          0x01 = Hard
//          
//          Just adds more blood.
function violenceMode() => byte(0x1A1166)

ULTRA_VIOLENCE_OPTION_VALUE = 0x01
function ultraViolence() => violenceMode() == ULTRA_VIOLENCE_OPTION_VALUE

// $1A9C76: (8-bit) Blue door roulette Indicator.
//          
//          Cycles between 0x20 and 0x40 when in the roulette.  Set to 0x00 at beginning of game.
//          
//          Note this will be set back to 0x00 at other times.  However it appears to only be not 0x00 when in the roulette wheels.
function blueDoorIndicator() => byte(0x1A9C76)

// $1ADE91: (8-bit) Level Script Index
//          
//          Appears to be a representation of the script for a level.   What it means will vary. But It's been tracked down on level 1 as needed
//          
//          0x00 = Start of level (always) 
//          0x01 = Level 1 open first Red door.
//          0x03 = Level 1 Big Gun shots
//          0x04 = Level 1 Building collapses
//          0x05 = Level 1 Gameplay resumes. . 
//          
//          Note 0x03 0x04 and 0x05 happen quickly after each other, but they're different parts of what ever appears to be the script. 0x05 on level 1 is a safe assumption that players will see, and can be used for the achievement in mind. 
//          
//          
//          On Level 2. 0x04 is inside the aircraft, 0x05 and 0x06 is when the aircraft blows up and the player walks out of the aircraft.
//          
//          On Stage 6 after 0x04 (0x04 and 0x05) Caution will constantly play.  This is acceptable for no caution. 
//          
//          (For Stage 6 It appears to be 0x01 after first door, 0x02 after second, and 0x03 after third, but those values are probably not needed)
function levelScriptIndex() => byte(0x1ADE90)

LEVEL_ONE_SCRIPT_INDEX_END_CUTSCENE = 0x05
STAGE_SIX_LEVEL_SCRIPT_INDEX_FINALE_BEGIN = 0x04

// $1ADEA6: (16-bit) Time until Caution alarm.
//          
//          Starts at different times, but will trigger the caution when it hits 0x00.  Set 0x1adea8 to 0x13 and then resets self to 0x3b to create a cycle.
function timeUntilCaution() => word(0x1ADEA6)

// $1B0648: (8-bit) Player 1 Character
//          
//          0x02 = Kart Bradfield
//          0x01 = Edie Burrett
//          0x00 = Jad the Taff
function firstPlayerCharacterId() => byte(0x1B0648)

Kart = 0x02
Edie = 0x01
Jad = 0x00

// $1B064A: (8-bit) First player lives remaining
//          
//          (Always starts at 1 life, meaning two lives)
//          
//          0x0 = No lives left (Check health)
//          0x1 = Starting value (1 life remaining)
function firstPlayerLivesRemaining() => byte(0x1B064A)

MAX_LIVES = 1

// $1B065A: (16-bit)  In Game Score
//          
//          Tens and Ones is number of Continues used (starts at 00 and increases to 01 on first death.
//          
//          Values are in hex.
//          
//          Not always writable, but is a correct representation of the score.
//          0x1b0742 is similar, but disappears when restarting the game.
function inGameScore() => word(0x1B065A)

// $1B0680: (8-bit) Jumping indicator
//          
//          0x00 = On the ground
//          0xff = In the air (Jumping, being shot out of the air does not trigger this)
function jumpingIndicator() => byte(0x1B0680)

// $1B0682: (16-bit) First player Alternate X Location
//          
//          The location in the game world of the player.  This appears to do a better job lining up with enemy characters.
function firstPlayerXLocation() => word(0x1B0682)

// $1B0684: (16-bit) First player Alternate Y Location
//          
//          The location in the game world of the player.  This appears to do a better job lining up with enemy characters.
function firstPlayerYLocation() => word(0x1B0684)

// $1B06B0: (8-bit) Special Ammo type
//          
//          0x00 = None
//          0x01 = Machine gun (Fast fire)
//          0x02 = Launcher (Rockets)
//          
//          Note setting to 0x03 warps the player out of the level?  WUTTTTT
function specialAmmoType() => byte(0x1B06B0)

// $1B06B2: (8-bit) Special ammo remaining
//          
//          0x1b06b0 will be the type of ammo.
//          
//          0x00 = Out of ammo.
//          0x14 = Launcher starting ammo (20)
//          0x64 = Value when picking up Machine guns (100 bullets)
function specialAmmoRemaining() => byte(0x1B06B2)

// $1B0746: (8-bit) First player combined health total
//          
//          Comes from 0x1b064c's lower, and 0x1b064f upper.  But 0x1b064c is the upper and 0x1b064f is the lowers, Strange.
//          
//          Kurt starts at 30 points.
//          Edie starts at 28 points
//          Jad starts at 38 points
function firstPlayerHealth() => byte(0x1B0746)

// $1B0792: (8-bit) First player secondary weapon uses left
//          
//          0x00 = Out of uses.
//          0x14 = Starting count
//          
//          Note this can increase above the starting count.
function firstPlayerSecondaryWeaponLeft() => byte(0x1B0792)

// $1C5E99: (8-bit) Elevator Action Arcade Difficulty selector
//          
//          0x00 = Easy
//          0x01 = Normal
//          0x02 = Hard
//          0x03 = Very Hard
function arcadeDifficultySelector() => byte(0x1C5E99)

// $1C5EB2: (8-bit) Elevator Action Arcade Score
function arcadeScore() => byte(0x1C5EB2)

// $1C9A0E: (8-bit) Second player joined game
//          
//          (Basically treated as two player mode started, however players can use only the second controller.
//          
//          Appears to be set the minute player hit start, and remain set.  May need more investigation.
function secondPlayerJoined() => byte(0x1C9A0E)

// $1C9A0F: (8-bit) First player joined game
//          
//          (Basically treated as not demo mode started, but need to check second player as well at 0x01c9a0e
//          
//          Appears to be set the minute player hit start, and remain set.  May need more investigation.
function firstPlayerJoined() => byte(0x1C9A0F)

// $1CB537: (16-bit) Initial Enemy's "Animation" index
//          
//          Appears to be part of the animations used by the NPCs.
//          0x17 = crushed by an elevator (At least for the blue and red shirts.)  Not sure if the other enemies can be squished.
function initialEnemyAnimation() => word(0x1CB537)

// $1CB570: (16-bit) Initial Enemy's X position on the screen.
//          
//          Character will fall if this isn't on the ground.
function initialEnemyXPosition() => word(0x1CB570)
function offsetInitialEnemyXPosition(index) => word(0x1CB570 + offsetMath(index))

// $1CB574: (16-bit) Initial Enemy's Y position on the screen.
//          
//          Character will fall if this isn't on the ground.
function initialEnemyYPosition() => word(0x1CB574)
function offsetInitialEnemyYPosition(index) => word(0x1CB574 + offsetMath(index))
// $1CB582: (8-bit) Initial Enemy's hp on the first level of the game.
//          
//          Likely reused, but an example of a NPC
LOCATION_OF_FIRST_ENEMY_ARRAY_HP = 0x1CB582 
function initialEnemyHP() => byte(0x1CB582)
function offsetInitialEnemyHP(index) => byte(0x1CB582 + offsetMath(index))



// $1ADEE8: (8-bit) Stage 6 Success check.
//          
//          This will be set to 0x02 if the player stops the bomb at the end of stage six (full success).  This gets set to 0x0c if the bomb blows up.
function stage6FinaleCheck() => byte(0x1ADEE8)
// These are not boolean values, 0 means it hasn't been finished. 
STAGE_SIX_FINALE_SUCCESS_VALUE = 0x02
STAGE_SIX_FINALE_FAILED_VALUE = 0x0c
function stage6Success() =>  stage6FinaleCheck() == STAGE_SIX_FINALE_SUCCESS_VALUE
function stage6Failed() =>  stage6FinaleCheck() == STAGE_SIX_FINALE_FAILED_VALUE

// $19eab5: (8-bit) First stage started check
// 
// 0x01 = on Main menu, Character select, and initial briefing screen.
// 0x00 = All Other times. 
// 
// This should be used to do a hit when the game started (After choosing your character).  For everything else please see First Player Joined at 0x1c9a0f
function firstStageStartedCheck() => byte(0x19eab5)

FIRST_STAGE_STARTED_CHECK_CHARACTER_SELECT = 0x01
FIRST_STAGE_STARTED_CHECK_IN_GAME = 0x00

function cheatProtection()
{
    // first the first player must be playing. 
    return firstPlayerJoined() == 1  && 
           // Second player must not, but the credit remaining value should be correct. 
           secondPlayerCreditsRemaining() == SECOND_PLAYER_CREDIT_REMAING_CORRECT_VALUE &&
           secondPlayerJoined() == 0 &&
           // Secret Options must be correct. 
           playerStockOption() == REQUIRED_PLAYER_STOCK_SETTING &&
           bombStockOption() == REQUIRED_BOMB_STOCK_SETTING &&
           // And just in case, the first player should never have more than 1 lives remaining. 
           firstPlayerLivesRemaining() <= 1
}


function normalLevelAchievement(title, levelNumber, points)
{
    achievement(title = title,
            description = format("Beat Stage {0} on normal or hard difficulty", levelNumber + 1),
            points = points, 
            trigger = elevatorActionReturns() &&
                      cheatProtection() &&
                      normalModeAndAbove() &&
                      prev(levelId()) == levelNumber &&
                      levelId() == levelNumber + 1
            )
}

function hardLevelAchievement(title, levelNumber, points)
{
    achievement(title = title,
            description = format("Beat Stage {0} on hard difficulty", levelNumber + 1),
            points = points, 
            trigger = elevatorActionReturns() &&
                      cheatProtection() &&
                      hardMode() &&
                      prev(levelId()) == levelNumber &&
                      levelId() == levelNumber + 1
            )
}

function noDeathLevelAchievement(title, levelNumber, points)
{
    if (levelNumber != 0)
    {
        achievement(title = title, 
                description = format("Beat Stage {0} on normal or hard difficulty with out losing a life", levelNumber + 1),
                points = points, 
                trigger = elevatorActionReturns() &&
                          cheatProtection() &&
                          normalModeAndAbove() &&
                          once( prev(levelId()) == levelNumber - 1 &&
                                levelId() == levelNumber ) &&
                          never(firstPlayerLivesRemaining() != prev(firstPlayerLivesRemaining())) &&
                          trigger_when( prev(levelId()) == levelNumber &&
                                        levelId() == levelNumber + 1 )
                )
    }
}

function levelAchievement(title, levelNumber, normalPoints, hardPoints, immortalPoints) {
    normalLevelAchievement(title, levelNumber, normalPoints)
    hardLevelAchievement("Hard "+ title, levelNumber, hardPoints)
    noDeathLevelAchievement("Immortal " + title, levelNumber, immortalPoints)
}

levelAchievement(title = "Red After Image", 
                 levelNumber = LEVEL_ONE,
                 normalPoints = 2,
                 hardPoints = 2,
                 immortalPoints = 2)
levelAchievement(title = "Cross The Breeze", 
                 levelNumber = LEVEL_TWO,
                 normalPoints = 2,
                 hardPoints = 3,
                 immortalPoints = 4)
levelAchievement(title = "Colors of Night", 
                 levelNumber = LEVEL_THREE,
                 normalPoints = 3,
                 hardPoints = 4,
                 immortalPoints = 5)
levelAchievement(title = "Crimson Line", 
                 levelNumber = LEVEL_FOUR,
                 normalPoints = 4,
                 hardPoints = 5,
                 immortalPoints = 5)
levelAchievement(title = "Under the Crack", 
                 levelNumber = LEVEL_FIVE,
                 normalPoints = 5,
                 hardPoints = 5,
                 immortalPoints = 10)

// Level six will be different because you can win or lose.  
// We'll give all the achievements per win and one on loss. 
achievement(title = "Vermillion Sun",
            description = "Beat Stage 6 and stop the missile on normal difficulty",
            points = 10, 
            trigger = elevatorActionReturns() &&
                      cheatProtection() &&
                      normalModeAndAbove() &&
                      prev(levelId()) == LEVEL_SIX &&
                      levelId() == LEVEL_POSTGAME &&
                      stage6Success()
            )

achievement(title = "Hard Vermillion Sun",
        description = "Beat Stage 6 and stop the missile on hard difficulty",
        points = 10, 
        trigger = elevatorActionReturns() &&
                    cheatProtection() &&
                    hardMode() &&
                    prev(levelId()) == LEVEL_SIX &&
                    levelId() == LEVEL_POSTGAME &&
                    stage6Success()
        )

achievement(title = "Immortal Vermillion Sun",
        description = "Beat Stage 6 on normal or hard difficulty with out losing a life",
        points = 10, 
        trigger = elevatorActionReturns() &&
                    cheatProtection() &&
                    normalModeAndAbove() &&
                    once( prev(levelId()) == LEVEL_FIVE &&
                        levelId() == LEVEL_SIX )&&
                    never(firstPlayerLivesRemaining() != prev(firstPlayerLivesRemaining())) &&
                    trigger_when(prev(levelId()) == LEVEL_SIX &&
                                  levelId() == LEVEL_POSTGAME &&
                                  stage6Success())
        )

achievement(title = "Your mission is Over ",
            description = "Beat Stage 6 and fail to stop the bomb on normal or hard difficulty",
            points = 10, 
            trigger = elevatorActionReturns() &&
                      cheatProtection() &&
                      normalModeAndAbove() &&
                      prev(levelId()) == LEVEL_SIX &&
                      levelId() == LEVEL_POSTGAME &&
                      stage6Failed()
            )

achievement(title = "Elevator Action Returns is so Easy",
            description = "Beat Stage 6 on any difficulty",
            points = 10, 
            trigger = elevatorActionReturns() &&
                      cheatProtection() &&
                      easyModeAndAbove() &&
                      prev(levelId()) == LEVEL_SIX &&
                      levelId() == LEVEL_POSTGAME 
            )


function characterAchievement(character, characterName, title)
{
    achievement(title = title,
            description = format("Finish the game on normal or hard difficulty while playing as {0}", characterName),
            points = 3, 
            trigger = elevatorActionReturns() &&
                      cheatProtection() &&
                      normalModeAndAbove() &&
                      once(prev(firstStageStartedCheck()) == FIRST_STAGE_STARTED_CHECK_CHARACTER_SELECT &&
                           firstStageStartedCheck() == FIRST_STAGE_STARTED_CHECK_IN_GAME) &&
                      never(firstPlayerCharacterId() != character) &&
                      trigger_when(prev(levelId()) == LEVEL_SIX &&
                                   levelId() == LEVEL_POSTGAME)
            )
}

characterAchievement(Kart, "Kart Bradfield", "Go Kart!")
characterAchievement(Edie, "Edie Burret", "Fireball Edie")
characterAchievement(Jad, "Jad the Taff", "More like Jad the Tank")

achievement(title = "Not going to blue myself",
        description = "Beat the game on normal or hard difficulty with out using a blue door.",
        points = 5, 
        trigger = elevatorActionReturns() &&
                    cheatProtection() &&
                    normalModeAndAbove() &&
                    once( prev(firstPlayerJoined()) == 0 &&
                        firstPlayerJoined() == 1 )&&
                    never(blueDoorIndicator() != 0) &&
                    trigger_when( prev(levelId()) == LEVEL_SIX &&
                                  levelId() == LEVEL_POSTGAME)
        )


// This logic could be simplied to firstPlayerCreditsRemaining == 3 but we'll do it this way. 
achievement(title = "Continues are for the weak",
        description = "Beat Elevator Action Returns on normal or hard difficulty with out using a continue",
        points = 10, 
        trigger = elevatorActionReturns() &&
                    cheatProtection() &&
                    normalModeAndAbove() &&
                    once( prev(firstPlayerJoined()) == 0 &&
                        firstPlayerJoined() == 1 ) &&
                    never(firstPlayerCreditsRemaining() != prev(firstPlayerCreditsRemaining())) &&
                    trigger_when( prev(levelId()) == LEVEL_SIX &&
                        levelId() == LEVEL_POSTGAME )
        )

achievement(title = "Invincible Red After Image",
            description = "Finish level 1 with out taking any damage",
            points = 3, 
            trigger = elevatorActionReturns() &&
                    cheatProtection() &&
                    normalModeAndAbove() &&
                    once( prev(firstStageStartedCheck()) == FIRST_STAGE_STARTED_CHECK_CHARACTER_SELECT &&
                           firstStageStartedCheck() == FIRST_STAGE_STARTED_CHECK_IN_GAME ) &&
                    never(firstPlayerHealth() != prev(firstPlayerHealth()) && prev(firstPlayerHealth()) != 0xff) &&
                    trigger_when( prev(levelId()) == LEVEL_ONE &&
                        levelId() == LEVEL_TWO )
            )

achievement(title = "Too fast for the alarm",
        description = "Beat the game on normal or hard difficulty with out getting a caution before the final section",
        points = 5, 
        trigger = elevatorActionReturns() &&
                    cheatProtection() &&
                    normalModeAndAbove() &&
                    once( prev(firstPlayerJoined()) == 0 &&
                        firstPlayerJoined() == 1 )&&
                    never(timeUntilCaution() == 0 && 
                          (levelId() != 5 || 
                           levelScriptIndex() < STAGE_SIX_LEVEL_SCRIPT_INDEX_FINALE_BEGIN)) &&
                    trigger_when( prev(levelId()) == LEVEL_SIX &&
                                  levelId() == LEVEL_POSTGAME)
        )

// This logic could be simplied to firstPlayerCreditsRemaining == 3 but we'll do it this way. 
achievement(title = "No credit needed, 250k ",
        description = "Earn 250,0000 points with out using a credit on normal or hard difficulty",
        points = 5, 
        trigger = elevatorActionReturns() &&
                    cheatProtection() &&
                    normalModeAndAbove() &&
                    once( prev(firstPlayerJoined()) == 0 &&
                        firstPlayerJoined() == 1 ) &&
                    never(firstPlayerCreditsRemaining() != prev(firstPlayerCreditsRemaining())) &&
                    trigger_when( inGameScore() >= 250 * 1000 )
        )

achievement(title = "Half a million points",
        description = "Earn 500,0000 points any way you can on normal or hard difficulty",
        points = 5, 
        trigger = elevatorActionReturns() &&
                    cheatProtection() &&
                    normalModeAndAbove() &&
                    once( prev(firstPlayerJoined()) == 0 &&
                        firstPlayerJoined() == 1 ) &&
                    never(firstPlayerCreditsRemaining() != prev(firstPlayerCreditsRemaining())) &&
                    inGameScore() >= 500 * 1000 
        )



// A small hack for the absolute value function.   This moves the -c to be equal to 0 and moves the +c to 2*c. 
function lessabs(a, b, c) => c + a - b <= 2 * c

// Trust me on these locations (or look it up yourself) 
SIZE_OF_ENEMY_OBJECT = 0x100
LOCATION_OF_SECOND_ENEMY_ARRAY_HP = 0x1ae3a2  
SIZE_OF_ENEMY_ARRAYS = 16
TOTAL_ENEMY_OBJECTS = 32
function offsetMath(index)
{
    if (index < SIZE_OF_ENEMY_ARRAYS)
    {
        return index * SIZE_OF_ENEMY_OBJECT
    }
    else
    {
        // Just use the HP location of the two to find the major offset, then use the minor offset to figure out where tehe exact data is. 
        // Note this is the Offset, so it's applied to any element of the First enemy, and it'll be correct. 
        return LOCATION_OF_SECOND_ENEMY_ARRAY_HP-LOCATION_OF_FIRST_ENEMY_ARRAY_HP + ((index-SIZE_OF_ENEMY_ARRAYS) * SIZE_OF_ENEMY_OBJECT)
    }
}
                   
achievement(
    title = "Foot beats face", points = 10,
    description = "Kill 50 human or animals with jump kicks in a single game on normal or hard difficulty. (Killing blow must be the jump kick)",
    trigger = elevatorActionReturns() &&
              cheatProtection() &&                         
              never(firstPlayerJoined() == 0) &&                                    
              measured(tally_of(range(0,TOTAL_ENEMY_OBJECTS-1), 50, index => offsetInitialEnemyHP(index) == 0xff &&
                                                          prev(offsetInitialEnemyHP(index)) != 0xffff &&
                                                          lessabs(offsetInitialEnemyXPosition(index), firstPlayerXLocation(), 0x30) &&
                                                          lessabs(offsetInitialEnemyYPosition(index), firstPlayerYLocation(), 0x30) &&
                                                          jumpingIndicator() == 0xff))
)

achievement(title = "I Wouldn’t Want to Be the Guy Who Has to Clean That Up",
            description = "Beat the game with violence option set to hard on either normal or hard difficulty",
            points = 1, 
            trigger = elevatorActionReturns() &&
                      cheatProtection() &&
                      normalModeAndAbove() &&
                      prev(levelId()) == LEVEL_SIX &&
                      levelId() == LEVEL_POSTGAME &&
                      ultraViolence()
            )

achievement(title = "That wasn't in the original Elevator Action!",
            description = "Meet the boss in a dramatic scene.",
            points = 1, 
            trigger = elevatorActionReturns() &&
                      cheatProtection() &&
                      levelId() == LEVEL_ONE &&
                      prev(levelScriptIndex()) != LEVEL_ONE_SCRIPT_INDEX_END_CUTSCENE &&
                      levelScriptIndex() == LEVEL_ONE_SCRIPT_INDEX_END_CUTSCENE
            )

achievement(title = "I didn't even realize I had bombs!",
            description = "Beat the game with out using your bombs on either normal or hard difficulty",
            points = 1, 
            trigger = elevatorActionReturns() &&
                    cheatProtection() &&
                    normalModeAndAbove() &&
                    once( prev(firstPlayerJoined()) == 0 &&
                        firstPlayerJoined() == 1 )&&
                    never(firstPlayerSecondaryWeaponLeft() < prev(firstPlayerSecondaryWeaponLeft())) &&
                    trigger_when( prev(levelId()) == LEVEL_SIX &&
                                  levelId() == LEVEL_POSTGAME)
                
            )
                                                   
// Removed Squish an enemy, most of the time enemies get squished randomly, and the player isn't even aware of it.   Could use the players X position to make sure he's in the elevator coming down but it's a bit too random anyways. 

function arcadeNormalLevelAchievement(title, levelNumber, points)
{
    achievement(title = title,
            description = format("Beat level {0} on the classic Elevator Action Arcade game", levelNumber + 1),
            points = points, 
            trigger = elevatorActionArcade() &&
                      prev(arcadeLevelIndex()) == levelNumber &&
                      arcadeLevelIndex() == levelNumber + 1
            )
}

arcadeNormalLevelAchievement(title = "Remembering 1983",      
                             levelNumber = 0, 
                             points = 3)
arcadeNormalLevelAchievement(title = "Remembering Taito", 
                             levelNumber = 1, 
                             points = 5)
arcadeNormalLevelAchievement(title = "Remembering Toshio Kono", 
                             levelNumber = 2, 
                             points = 5)
arcadeNormalLevelAchievement(title = "Remembering Otto", 
                             levelNumber = 3, 
                             points = 10)

// leaderboards 1cc 
// leaderboards highest score
// leaderboard fastest clear overall? 
// leaderboard fastest clear Hard? 
// leaderboards highest score Original game
// leaderboards 1cc Hard
// leaderboards highest score Hard
