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

// $19FD24: (8-bit) Second player's Credits Remaining.
//          
//          0x04 = Normal gameplay.
//          0x08 = Cheating!!!
//          
//          All other values probably means second player is active.
function secondPlayerCreditsRemaining() => byte(0x19FD24)

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
function hardModeAndAbove() => gameDifficulty()  == Hard

// $1A1162: (8-bit) Cheat mod option for Player Stock
//          
//          If this is set to any value other than 0x1 CHEATING!!!!!
function playerStockOption() => byte(0x1A1162)

// $1A1164: (8-bit) Cheat mod option for Bomb Stock
//          
//          If this is set to any value other than 0x14 CHEATING!!!!!
function bombStockOption() => byte(0x1A1164)

// $1A1166: (8-bit) Violence mode
//          
//          
//          0x00 = Normal
//          0x01 = Hard
//          
//          Just adds more blood.
function violenceMode() => byte(0x1A1166)

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
function levelScriptIndex() => byte(0x1ADE91)

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

// $1B064A: (8-bit) First player lives remaining
//          
//          (Always starts at 1 life, meaning two lives)
//          
//          0x0 = No lives left (Check health)
//          0x1 = Starting value (1 life remaining)
function firstPlayerLivesRemaining() => byte(0x1B064A)

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

// $1CB574: (16-bit) Initial Enemy's Y position on the screen.
//          
//          Character will fall if this isn't on the ground.
function initialEnemyYPosition() => word(0x1CB574)

// $1CB582: (8-bit) Initial Enemy's hp on the first level of the game.
//          
//          Likely reused, but an example of a NPC
function initialEnemyHP() => byte(0x1CB582)

function cheatProtection() => true


achievement(
    title = "Jump Kick Palooza", points = 2,
    description = "Jump kick that mo fo right off the building!",
    trigger = measured(tally(100, 
                  (initialEnemyHP() == 255 && prev(initialEnemyHP()) != 255 && ((48 + initialEnemyXPosition() - firstPlayerXLocation())
                   <= 96) && ((48 + initialEnemyYPosition() - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1CB682) == 255 && prev(byte(0x1CB682)) != 255 && ((48 + word(0x1CB670) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1CB674) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1CB782) == 255 && prev(byte(0x1CB782)) != 255 && ((48 + word(0x1CB770) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1CB774) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1CB882) == 255 && prev(byte(0x1CB882)) != 255 && ((48 + word(0x1CB870) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1CB874) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1CB982) == 255 && prev(byte(0x1CB982)) != 255 && ((48 + word(0x1CB970) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1CB974) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1CBA82) == 255 && prev(byte(0x1CBA82)) != 255 && ((48 + word(0x1CBA70) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1CBA74) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1CBB82) == 255 && prev(byte(0x1CBB82)) != 255 && ((48 + word(0x1CBB70) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1CBB74) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1CBC82) == 255 && prev(byte(0x1CBC82)) != 255 && ((48 + word(0x1CBC70) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1CBC74) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1CBD82) == 255 && prev(byte(0x1CBD82)) != 255 && ((48 + word(0x1CBD70) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1CBD74) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1CBE82) == 255 && prev(byte(0x1CBE82)) != 255 && ((48 + word(0x1CBE70) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1CBE74) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1CBF82) == 255 && prev(byte(0x1CBF82)) != 255 && ((48 + word(0x1CBF70) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1CBF74) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1CC082) == 255 && prev(byte(0x1CC082)) != 255 && ((48 + word(0x1CC070) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1CC074) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1CC182) == 255 && prev(byte(0x1CC182)) != 255 && ((48 + word(0x1CC170) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1CC174) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1CC282) == 255 && prev(byte(0x1CC282)) != 255 && ((48 + word(0x1CC270) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1CC274) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1CC382) == 255 && prev(byte(0x1CC382)) != 255 && ((48 + word(0x1CC370) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1CC374) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1CC482) == 255 && prev(byte(0x1CC482)) != 255 && ((48 + word(0x1CC470) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1CC474) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1AE4A2) == 255 && prev(byte(0x1AE4A2)) != 255 && ((48 + word(0x1AE490) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1AE494) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1AE5A2) == 255 && prev(byte(0x1AE5A2)) != 255 && ((48 + word(0x1AE590) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1AE594) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1AE6A2) == 255 && prev(byte(0x1AE6A2)) != 255 && ((48 + word(0x1AE690) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1AE694) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1AE7A2) == 255 && prev(byte(0x1AE7A2)) != 255 && ((48 + word(0x1AE790) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1AE794) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1AE8A2) == 255 && prev(byte(0x1AE8A2)) != 255 && ((48 + word(0x1AE890) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1AE894) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1AE9A2) == 255 && prev(byte(0x1AE9A2)) != 255 && ((48 + word(0x1AE990) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1AE994) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1AEAA2) == 255 && prev(byte(0x1AEAA2)) != 255 && ((48 + word(0x1AEA90) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1AEA94) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1AEBA2) == 255 && prev(byte(0x1AEBA2)) != 255 && ((48 + word(0x1AEB90) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1AEB94) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1AECA2) == 255 && prev(byte(0x1AECA2)) != 255 && ((48 + word(0x1AEC90) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1AEC94) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1AEDA2) == 255 && prev(byte(0x1AEDA2)) != 255 && ((48 + word(0x1AED90) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1AED94) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1AEEA2) == 255 && prev(byte(0x1AEEA2)) != 255 && ((48 + word(0x1AEE90) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1AEE94) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1AEFA2) == 255 && prev(byte(0x1AEFA2)) != 255 && ((48 + word(0x1AEF90) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1AEF94) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1AF0A2) == 255 && prev(byte(0x1AF0A2)) != 255 && ((48 + word(0x1AF090) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1AF094) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1AF1A2) == 255 && prev(byte(0x1AF1A2)) != 255 && ((48 + word(0x1AF190) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1AF194) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1AF2A2) == 255 && prev(byte(0x1AF2A2)) != 255 && ((48 + word(0x1AF290) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1AF294) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
                  (byte(0x1AF3A2) == 255 && prev(byte(0x1AF3A2)) != 255 && ((48 + word(0x1AF390) - firstPlayerXLocation())
                   <= 96) && ((48 + word(0x1AF394) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255), 
              byte(0x1AF4A2) == 255 && prev(byte(0x1AF4A2)) != 255 && ((48 + word(0x1AF490) -
               firstPlayerXLocation()) <= 96) && ((48 + word(0x1AF494) - firstPlayerYLocation()) <= 96) && jumpingIndicator() == 255))
)

achievement(
    title = "That's gotta hurt", points = 2,
    description = "Squish an enemy!",
    trigger = always_true() &&
              ((initialEnemyHP() != 255 && initialEnemyAnimation() == 791) ||
               (byte(0x1CB682) != 255 && word(0x1CB637) == 791) ||
               (byte(0x1CB782) != 255 && word(0x1CB737) == 791) ||
               (byte(0x1CB882) != 255 && word(0x1CB837) == 791) ||
               (byte(0x1CB982) != 255 && word(0x1CB937) == 791) ||
               (byte(0x1CBA82) != 255 && word(0x1CBA37) == 791) ||
               (byte(0x1CBB82) != 255 && word(0x1CBB37) == 791) ||
               (byte(0x1CBC82) != 255 && word(0x1CBC37) == 791) ||
               (byte(0x1CBD82) != 255 && word(0x1CBD37) == 791) ||
               (byte(0x1CBE82) != 255 && word(0x1CBE37) == 791) ||
               (byte(0x1CBF82) != 255 && word(0x1CBF37) == 791) ||
               (byte(0x1CC082) != 255 && word(0x1CC037) == 791) ||
               (byte(0x1CC182) != 255 && word(0x1CC137) == 791) ||
               (byte(0x1CC282) != 255 && word(0x1CC237) == 791) ||
               (byte(0x1CC382) != 255 && word(0x1CC337) == 791) ||
               (byte(0x1CC482) != 255 && word(0x1CC437) == 791) ||
               (byte(0x1AE4A2) != 255 && word(0x1AE457) == 791) ||
               (byte(0x1AE5A2) != 255 && word(0x1AE557) == 791) ||
               (byte(0x1AE6A2) != 255 && word(0x1AE657) == 791) ||
               (byte(0x1AE7A2) != 255 && word(0x1AE757) == 791) ||
               (byte(0x1AE8A2) != 255 && word(0x1AE857) == 791) ||
               (byte(0x1AE9A2) != 255 && word(0x1AE957) == 791) ||
               (byte(0x1AEAA2) != 255 && word(0x1AEA57) == 791) ||
               (byte(0x1AEBA2) != 255 && word(0x1AEB57) == 791) ||
               (byte(0x1AECA2) != 255 && word(0x1AEC57) == 791) ||
               (byte(0x1AEDA2) != 255 && word(0x1AED57) == 791) ||
               (byte(0x1AEEA2) != 255 && word(0x1AEE57) == 791) ||
               (byte(0x1AEFA2) != 255 && word(0x1AEF57) == 791) ||
               (byte(0x1AF0A2) != 255 && word(0x1AF057) == 791) ||
               (byte(0x1AF1A2) != 255 && word(0x1AF157) == 791) ||
               (byte(0x1AF2A2) != 255 && word(0x1AF257) == 791) ||
               (byte(0x1AF3A2) != 255 && word(0x1AF357) == 791) ||
               (byte(0x1AF4A2) != 255 && word(0x1AF457) == 791))
)
