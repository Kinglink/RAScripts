// Bank Panic
// #ID = 15747

// $000A: (7 digit BCD) This is the high value
BCD_SCORE_UPPER = 0x000A
STARTING_SCORE_MULTIPLIER = 1000000
TOTAL_SCORE_DIGITS = 7
//function bcdScore() => byte(0x00000A)

function power(base, multiple)
{
    return base ^ multiple
}

function totalScore() => sum_of(range (0,TOTAL_SCORE_DIGITS-1), index => byte(BCD_SCORE_UPPER+index) * (STARTING_SCORE_MULTIPLIER / power(10,index)) )

// $003C: (8-bit) Bomb Indicator
//        
//        0x00 = No Bomb
//        0x01-0xc = Which door bomb is set at
function bombIndicator() => byte(0x00003C)

function bombSet() => bombIndicator() != 0
function bombJustRemoves() => prev(bombIndicator()) != 0 && bombIndicator() == 0

// $0077: (BCD 16-bit) TImer for bomb.
//        
//        This becomes 0x00 if Bomb explodes.   Time is frozen otherwise. p
function timerForBomb() => word(0x000077)
function bombTimerActive() => timerForBomb() != 0

// $00A0: (8-bit) Lives
//        
//        0x00 = Game Over (or 256)
function lives() => byte(0x0000A0)

function justLostLife() => lives() < prev(lives())
function justGameOver() => lives() == 0 && prev(lives()) == 1

// $00A3: (8-bit) Current level.
//        
//        Note this is NOT a control for the day night cycle but is a control for what is displayed to the player.
function currentRound() => byte(0x0000A3)

function justWonRound() => currentRound() == prev(currentRound()) + 1

function levelSkipped() => currentRound() >= prev(currentRound()) + 1

// $00AB: (8-bit) EXTRA counter
//        
//        0x00 -> 0x05
//        
//        When reaches 0x05 Level ends gives an extra guy and round advances.
function extraCounter() => byte(0x0000AB)

function extraTriggered() => extraCounter() == 5 && prev(extraCounter()) != 5

// $00CD: (8-bit) Number of money bags dropped in the level
//        
//        Decrementes once Round is won
function moneyBagsDropped() => byte(0x0000CD)

// $00CE: (Array of 12 bytes)  Number of Bags dropped at each door.
//        
//        First 8-bit = number of bags at the first door
ARRAY_OF_BAGS_MEMORY_LOCATIONS = 0x0000CE
function arrayofBagsDropped() => byte(0x0000CE)

function bagsDroppedAtDoor(doorIndex) => byte(ARRAY_OF_BAGS_MEMORY_LOCATIONS + doorIndex)

function at1000Bonus(doorIndex) >= bagsDroppedAtDoor(doorIndex) == prev(bagsDroppedAtDoor(doorIndex)) + 1 && prev(bagsDroppedAtDoor(doorIndex)) >= 3

// $012A: (Array of 12 8-bit bitfields) Location of Tellers.
//        
//        bit0 = Teller will appear.
//        bit1 =Teller is currently Visible, will disappear when off screen.
TELLER_AT_DOOR_MEMORY_LOCATION = 0x00012A
function locationOfTellers() => byte(0x00012A)

function telleratDoor(doorIndex) => byte(TELLER_AT_DOOR_MEMORY_LOCATION + doorIndex) & 0x3

// $014D: (16-bit) Total Seconds for shootings of all "Fair" bandits
//        
//        Used for calculation of reaction time.
function totalSecondsOfFairShooting() => word(0x00014D)

// $014F: (8-bit) Number of bandits shot.
//        
//        Used for calculation of reaction time.
function numberOfFairBanditsShot() => byte(0x00014F)

function fairTiming() => totalSecondsOfFairShooting() / numberOfFairBanditsShot()

// $0461: (bitfield) Left Door Bandit States
//        
//        bit 2 = Alive
//        bit4 = Shooting
//        
//        If bit 2 is disabled with out bit4 unfair.  If bit 4 is set Fair shoot.
//        
//        If bit 2 and bit 4 is enabled and disabled at the SAME time, death.
function leftDoorBanditStats() => byte(0x000461)

function unfairShot(memoryAccessor) => memoryAccessor & 0x4 == 0 && 
                                               prev(memoryAccessor) & 0x4 == 4
                                               memoryAccessor & 0x10 == 0x10

// $0463: (8-bit) Left door enemy
//        
//        0x00 = Guy dropping off money
//        0x01 = Box Bonus
//        0x02 = Green Bandit
function leftDoorType() => byte(0x000463)
BANDIT_VALUE = 0x02

function banditUnfairKilled(doorType, banditStates) => unfairShot(banditStates) && 
                                                       doorType == BANDIT_VALUE

// $0481: (bitfield) Middle Door Bandit States
//        
//        bit 2 = Alive
//        bit4 = Shooting
//        
//        If bit 2 is disabled with out bit4 unfair.  If bit 4 is set Fair shoot.
//        
//        If bit 2 and bit 4 is enabled and disabled at the SAME time, death.
function middleDoorBanditStates() => byte(0x000481)

// $0483: (8-bit) Middle door enemy
//        
//        0x00 = Guy dropping off money
//        0x01 = Box Bonus
//        0x02 = Green Bandit
function middleDoorType() => byte(0x000483)

// $04A1: (bitfield) Right Door Bandit States
//        
//        bit2 = Alive
//        bit4 = Shooting
//        
//        If bit 2 is disabled with out bit4 unfair.  If bit 4 is set Fair shoot.
//        
//        If bit 2 and bit 4 is enabled and disabled at the SAME time, death.
function rightDoorBanditStates() => byte(0x0004A1)

// $04A3: (8-bit) Right door enemy
//        
//        0x00 = Guy dropping off money
//        0x01 = Box Bonus
//        0x02 = Green Bandit
function rightDoorType() => byte(0x0004A3)

// $075E: (16-bit) Demo Indicator. pp
//        
//        0x0000 = Demo Mode
//        0xffac = Gameplay
function demoIndicator() => word(0x00075E)
DEMO_MODE_VALUE = 0x0000

function notInDemoMode() => demoIndicator() != DEMO_MODE_VALUE


