// Parasol Stars: The Story of Bubble Bobble III
// #ID = 2318

// $0040: [16-bit] Player 1 Y Pos
function player1YPos() => word(0x000040)

// $0042: [16-bit] Player 1 X Pos
function player1XPos() => word(0x000042)

// $0166: (24-bit) Game Start Detection.
//        
//        0x000000 When in main menu.
//        Set to 0x03040b When game starts.
//        
//        Does not get reset on continue.
function gameStartDetection() => tbyte(0x000166)

// $0B2A: (8-bit) End credits detector
//        
//        0x00 = Normal Gameplay
//        0x01 = "Bad" Ending
//        0xff = "Good" Ending.
function endCreditsDetector() => byte(0x000B2A)

// $0E8A: (8-bit) Second End credit detector
//        
//        0x06 = Set on Bad Ending
function secondEndCreditsDetector() => byte(0x000E8A)

// $1846: (8-bit) Current state of Powerup
//        
//        0x02 = Waiting to show
//        0x04 = Shown
//        0x0c = Collected
//        0x00 = Done
function currentStateOfPowerup() => byte(0x001846)

// $1847: (8-bit) Powerup Ability.
//        
//        NOTE: This is ONLY ability.  Not display.
//        
//        0x00 = Miracle item (instant win + Secret + 100 credits in secret room
//        0x01 = Rainbow Star
//        0x07 = Purple Book
//        0x11 = Unknown (Collect items bonus)
//        0x13 = Orange Ring
//        0x14 = Red Ring
//        0x1a = Clock
//        0x1b = Other object (lightning bolts, small);p
//        0x1c = Bomb
//        0x1d = Orange Cross (lightning blasts)
//        0x2f = Red Shoe  (Speed up)
//        0x34 = Yellow Heart
//        0x35 = Orange Potion ? (coin game)
//        0x36 = Red Heart
//        0x39 = Lightning Bottle (Will give what ever the boss gives)
//        0x3c = Water Secret Item (Crystal Ball)
//        0x3d = Fire Secret Item (Magic lamp)
//        0x3e = Lightning Secret Item (Bell)
//        0x3f = (Fireball ring/Unreachable
//        0x40 = Star Secret Item (5 credit Coin)
//        0x41 = Secret Secret Item (99 credit coin (100k))
function powerupAbility() => byte(0x001847)

// $19AD: (8-bit) Number of Lives
//        
//        0xff = Game Over
//        0x00 = On main Menu Or 0 lives in game.
//        Any other value in Game. (not will switch to 0xff after last life
function livesCount() => byte(0x0019AD)

// $19B0: (8-bit) Second Player Lives
//        
//        0xff = No Second Player
//        0x00 = On main Menu Or 0 lives in game.
//        All other value second player is active
function secondPlayerLives() => byte(0x0019B0)

// $19B7: [8-bit] Current Stage
//        
//        0x01 = Music World Stage 2
//        0x02 = Music World Stage 3
//        0x03 = Music World Stage 4
//        0x04 = Music World Stage 5
//        0x05 = Music World Stage 6
//        0x06 = Music World Boss
//        0x07 = Music World Secret Room
//        0x08 = Woods World Stage 1
//        0x09 = Woods World Stage 2
//        0x0a = Woods World Stage 3
//        0x0b = Woods World Stage 4
//        0x0c = Woods World Stage 5
//        0x0d = Woods World Stage 6
//        0x0e = Woods World Boss
//        0x0f = Woods World Secret Room
//        0x10 = Ocean World Stage 1
//        0x11 = Ocean World Stage 2
//        0x12 = Ocean World Stage 3
//        0x13 = Ocean World Stage 4
//        0x14 = Ocean World Stage 5
//        0x15 = Ocean World Stage 6
//        0x16 = Ocean World Boss
//        0x17 = Ocean World Secret Room
//        0x18 = Machine World Stage 1
//        0x19 = Machine World Stage 2
//        0x1a = Machine World Stage 3
//        0x1b = Machine World Stage 4
//        0x1c = Machine World Stage 5
//        0x1d = Machine World Stage 6
//        0x1e = Machine World Boss
//        0x1f = Machine World Secret Room
//        0x20 = Gamble World Stage 1
//        0x21 = Gamble World Stage 2
//        0x22 = Gamble World Stage 3
//        0x23 = Gamble World Stage 4
//        0x24 = Gamble World Stage 5
//        0x25 = Gamble World Stage 6
//        0x26 = Gamble World Boss
//        0x27 = Gamble World Secret Room
//        0x28 = Clouds World Stage 1
//        0x29 = Clouds World Stage 2
//        0x2a = Clouds World Stage 3
//        0x2b = Clouds World Stage 4
//        0x2c = Clouds World Stage 5
//        0x2d = Clouds World Stage 6
//        0x2e = Clouds World Boss
//        0x2f = Clouds World Secret Room
//        0x30 = Giant World Stage 1
//        0x31 = Giant World Stage 2
//        0x32 = Giant World Stage 3
//        0x33 = Giant World Stage 4
//        0x34 = Giant World Stage 5
//        0x35 = Giant World Stage 6
//        0x36 = Giant World Boss
//        0x37 = Giant World Secret Room
//        0x38 = Rainbow World Stage 1
//        0x39 = Rainbow World Stage 2
//        0x3a = Rainbow World Stage 3
//        0x3b = Rainbow World Stage 4
//        0x3c = Rainbow World Stage 5
//        0x3d = Rainbow World Stage 6
//        0x3e = Rainbow World Boss
//        0x3f = Rainbow World Secret Room (Likely unreachable.)
//        0x40 = Bubble World Stage 1
//        0x41 = Bubble World Stage 2
//        0x42 = Bubble World Stage 3
//        0x43 = Bubble World Stage 4
//        0x44 = Bubble World Stage 5
//        0x45 = Bubble World Stage 6
//        0x46 = Bubble World Boss
//        0x47 = Bubble World Secret Room
//        0x48 = Underworld World Stage 1
//        0x49 = Underworld World Stage 2
//        0x4a = Underworld World Stage 3
//        0x4b = Underworld World Stage 4
//        0x4c = Underworld World Stage 5
//        0x4d = Underworld World Stage 6
//        0x4e = Underworld World Boss
//        0x4f = Underworld World Secret Room (unreachable, but I believe it would exist)
function currentStage() => byte(0x0019B7)

// $19BA: [8-bit] Score: 000000xx0
function scoreLower() => byte(0x0019BA)

// $19BB: [8-bit] Score: 0000xx000
function scoreMidLower() => byte(0x0019BB)

// $19BC: [8-bit] Score: 00xx00000
function scoreMidUpper() => byte(0x0019BC)

// $19BD: [8-bit] Score: xx0000000
function scoreUpper() => byte(0x0019BD)

// $1D00: (8-bit) Credits Remaining
//        
//        0-63  (99 is max)
function creditRemaining() => byte(0x001D00)

// $1D4B: [8-bit] Magic Crest 1 type (00=off, 01=Water, 02=Fire, 03=Lightning, 04=Fireball, 05=Star)
function magicCrestType1() => byte(0x001D4B)

// $1D4C: [8-bit] Magic Crest 3 type (00=off, 01=Water, 02=Fire, 03=Lightning, 04=Fireball, 05=Star)
function magicCrestType3() => byte(0x001D4C)

// $1D4D: [8-bit] Magic Crest 2 type (00=off, 01=Water, 02=Fire, 03=Lightning, 04=Fireball, 05=Star)
function magicCrestType2() => byte(0x001D4D)
