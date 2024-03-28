// Parodius Da!
// #ID = 2189

// $0027: (8-bit) Demo check
//        
//        0x00 = Demo or Main Menu
//        0x01 = In Game
function demoCheck1() => byte(0x000027)

// $0030: (8-bit) Demo check
//        
//        0x01 = Main Menu
//        0x02 = Demo
//        0x04 = Legit Gameplay
//        0x05 = Konami Logo
//        0x06 = Intro
function demoCheck2() => byte(0x000030)

// $004E: (8-bit) Credit Remaining
function creditRemaining() => byte(0x00004E)

// $0087: (8-bit) Lives remaining
//        
//        0xff = Game Over (continue screen)
//        
//        Note it becomes 0, and maybe even 1 after Special.
//        0x00 on the main menu.  Look for 0xff for "game over"
function livesRemaining() => byte(0x000087)

// $00A3: (8-bit) Character select
//        
//        0x00 = Vic Viper
//        0x01 = Octopus
//        0x02 = Twin Bee
//        0x03 = Pentarou
function characterSelect() => byte(0x0000A3)

// $00A5: (8-bit) Shot type
//        
//        0x03 = TwinBee Rear Shot
//        0x04 = TwinBee 3-way Shot
//        0x05 = Octopus Ripple
//        0x0a = TwinBee Normal Shot
//        0x0b = Octopus Normal shot
//        0x0c = Octopus Tail Gun
//        0x0d = Penguin Normal shot
//        0x0f = Penguin Double Shot
//        0x10 = Penguin Spread
function shotType() => byte(0x0000A5)

// $00A6: (8-bit) Special shot
//        
//        Note: If you have the wrong value the shot is correct, the graphics look wrong.
//        
//        0x00 = Normal shot
//        0x08 = 2-way Octopus
//        0x09 = TwinBee Rocket
//        0x0e = Penguin Potion
function specialShot() => byte(0x0000A6)

// $00A7: (8-bit) Power level
//        
//        0x00 = Out of power.
//        0x01 = Speed up
//        0x02 = 2-way
//        and so on.
function powerLevel() => byte(0x0000A7)

// $00A8: (8-bit) Speed up
//        
//        0x00 = Starting speed
//        0x01 = Level 1 speed
function speedUp() => byte(0x0000A8)

// $00B4: (8-bit) Equipped weapon
//        
//        0x07= Vic Viper  Wall special  (orange bell)  (Same for TwinBee)
//        0x09 = Blue Bell Blast (different ability per character)
function equippedWeapon() => byte(0x0000B4)

// $00B7: (8-bit) Shoot special
//        
//        0x03 = No shooting (Enlargen/green bell)
//        0x01 = Horn attack (Grey bell, not used)
function shootSpecial() => byte(0x0000B7)

// $00B8: (8-bit) Invincibility + damage
//        
//        0x00 = Normal Collision
//        0x01 = Reverse Collision
function invincibilityField() => byte(0x0000B8)

// $00c0: (8-bit) Difficulty
//
//        0x00 = Easy
//        0x01 = Normal
//        0x02 = Hard
function difficulty() => byte(0x0000C0)

EASY_MODE_VALUE = 0x00
NORMAL_MODE_VALUE = 0x01
HARD_MODE_VALUE = 0x02
difficultyLookup = {
    EASY_MODE_VALUE: "Easy",
    NORMAL_MODE_VALUE: "Normal",
    HARD_MODE_VALUE: "Hard"
}

function isHardDifficulty() => return difficulty() == HARD_MODE_VALUE


// $0965: (8-bit) Option 1
//        
//        0x00 = Active
//        0x02 = Octopus Option (mini Octopus)
//        0x04 = Penguin Option
function optionType1() => byte(0x000965)

// $0966: (8-bit) Option 2
//        
//        0x00 = Active
//        0x02 = Octopus Option (mini Octopus)
function optionType2() => byte(0x000966)

// $0967: (8-bit) Option 3
//        
//        0x00 = Active
//        0x02 = Octopus Option (mini Octopus)
function optionType3() => byte(0x000967)

// $0968: (8-bit) Option 4
//        
//        0x00 = Active
//        0x02 = Octopus Option (mini Octopus)
function optionType4() => byte(0x000968)

// $0969: (8-bit) Shield
//        
//        0x00 = Active
//        0x01 = Vic Viper Shield
//        0x02 = Octopus Shield
//        0x03 = TwinBee Forcefield
//        0x04 = Penguin Bubble
//        0x05 = Horn Special (Grey Bell)
//        0x0a = Enlargen (control)
//        
//        If this sets to Enlargen it grows and then stays big and shrinks
function shieldType() => byte(0x000969)

// $096A: (8-bit)  Special Attack
//        
//        0x06 = Horn Attack
function specialType() => byte(0x00096A)

// $0D27: (8-bit) Boss Health
//        
//        0x0f = Starting health
//        0x0e = Lost one life.
//        0x80 = Death
//        Bit7 = Invincible (coming out)
//        
//        At Level 0 Major 0x10 Minor 0xC0
//        Become 0x80 Level 0x80 Then 0x00 at 010 minor 0xc1
//        
//        Appears to also be used for the dancer .But she's invincible
//        
//        Also used for Uncle Sam (Don't know where yet.
//        
//        Stage 3. This becomes 0x80. then next 8 bytes is swapping between 0x08 and 0x06.  Starts at 0x84, then swaps to this, then Level 0x02 = Major 0x14 Minor 0x20
//        switches on invicibility (0x80) when attacking.
//        
//        Become 0x00 when leaving.
//        Level 0x02 = Major 0x14 Minor 0x21
//        
//        Level 0x04  = Major 0x17 Minor 0xd8
//        Don't gain more than 100 points at a time.
//        
//        Level 0x05 = Major 0x11 Minor 0x81
//        This is 0x86  Becomes minor 0x82  Stays 86
//        
//        Final boss is weird.  The gate closes around level 0x07 Major 0x0f Minor 0x99
//        
//        Wait until it becomes Major 0x0 and Minor 0x00
//        
//        
//        Boss for special is score dependant.
//        
//        For special stage.   Level 0b Majoir 0c Minor 3a
//        0x1381
function bossHealth() => byte(0x000D27)

// $0D31: (8-bit) Cat Ship Boss Health
//        
//        0x08= Starting life.
//        0x07 = Damaged and abvle to be damaged again
//        bit 7  = "No damage"
//        0x89 = Dead
//        
//        Starts from level 0 Major 0x0c/Minor 0x58
//        Until  Becomes 0x00  at Level 0x0f / Minor 0xa8
function catShipBossHealth() => byte(0x000D31)

// $0D3F: (8-bit) Level 4 Boss  Health (Sumo)
//        
//        Seems to be 0x17 life Level 0x03 Major 0x10 Minor 0x49
function altBossHealth() => byte(0x000D3F)

// $0D4D: (8-bit) 7th Boss Health
//        
//        Level 0x06 Major 0x0a Minor 0x28
//        Becomes 0x00 and then 0x29-p
function thirdBossHealth() => byte(0x000D4D)

// $0D4E: (8-bit)  Boss for Special
//        
//        (900k Boss Special)(
//        
//        0x0f
//        
//        (30k or less boss ) 0x8f
function specialBossHealth() => byte(0x000D4E)

// $1381: (8-bit) Boss Of Special Mode
//        
//        0x00 = "Less than 30k"
//        0x01 = "General" Boss (level 1)
//        0x05 = 900Thousand Boss for Special mode
//        0x09 = 1 Million+ Boss for Special mode
function bossTypeForSpecial() => byte(0x001381)

// $1860: (8-bit) Major How far you've scrolled through the stage.
//        
//        Next 8-bit is counts up and triggers this.
//        
//        0x10 / 0xc0 Stage 1 Boss 1.
function majorStageLocation() => byte(0x001860)

// $1861: (8-bit) Minor How far you've scrolled through the stage.
//        
//        Next 8-bit is counts up and triggers this.
function minorStageLocation() => byte(0x001861)

// $1D02: p(8-bit) Level Number (True Number)
//        
//        0x00 = Stage 1
//        0x01 = Stage 2
//        0x07 = Stage 8 (final) resets to 0
function stageNumber() => byte(0x001D02)

// $1D04: (8-bit) Loop Number
//        
//        0x00 = First loop
//        0x01 = Second Loop
function loopNumber() => byte(0x001D04)

// $1F8C: (32-bit) BCD of Players Score
//        
//        (Control Value)
function playerScore() => dword(0x001F8C)

// $1F95: (8-bit) Gameplay Mode
//        
//        0x00 = 1 Player
//        0x01 = 2 Player
//        0x02 = Special
function gameMode() => byte(0x001F95)
