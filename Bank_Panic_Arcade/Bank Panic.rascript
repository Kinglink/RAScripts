// Bank Panic
// #ID = 15747

achievementInfoString = " (Single player, 3 lives, all other dip switches allowed)" 

// $0001: (bitfield) Control Bits. 
//
//        bit6 = Two player. 
//        bit7  = Player In control.  (Credit in, game start, or gameplay.) 
// 
//        bit4 = may be playable. 
//        bit5 = might indicate which player is play. 
CONTROL_BIT_MEMORY_LOCATIONS = 0x00001
// function controlBits() => byte(0x00001)

function singlePlayer() => bit6(CONTROL_BIT_MEMORY_LOCATIONS) == 0
// Just in case demo is in an odd state.
function notInDemoMode() => bit7(CONTROL_BIT_MEMORY_LOCATIONS) == 1 && prev(bit7(CONTROL_BIT_MEMORY_LOCATIONS)) == 1

// $0007: (bitfield) Dip switches
//
//        bit3 = 4 lives (3 lives when off)
function dipSwitches() => byte(0x00007)

function threeLives() => dipSwitches() & 0x08 == 0x00

// $0008: (8-bit) Upper Credits
function upperCredits() => low4(0x00008)
// $0009: (8-bit) Lower Credits
function lowerCredits() => low4(0x00009)

function credits() => upperCredits() * 10 + lowerCredits()
function prevCredits() => prev(upperCredits()) * 10 + prev(lowerCredits())

function justSpentCredit() => credits() < prevCredits()


// $000A: (7 digit BCD) This is the high value
BCD_SCORE_UPPER = 0x000A
STARTING_SCORE_MULTIPLIER = 1000000
TOTAL_SCORE_DIGITS = 7
//function bcdScore() => byte(0x00000A)

function power(base, multiple)
{
    if (multiple == 0)
    {
        return 1
    }
    returnValue = 1
    for index in range(1, multiple)
    {
        returnValue = returnValue * base
    } 
    return returnValue
}

function totalScore() => sum_of(range (0,TOTAL_SCORE_DIGITS-1), index => low4(BCD_SCORE_UPPER+index) * (STARTING_SCORE_MULTIPLIER / power(10,index)) )

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
function actualTimeForBomb() => low4(0x000078) + low4(0x000077) * 10
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

function justWonRound() => currentRound() == prev(currentRound()) + 1 && prev(currentRound()) != 0

function levelSkipped() => currentRound() > prev(currentRound()) + 1

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

function at1000Bonus(doorIndex) => bagsDroppedAtDoor(doorIndex) == prev(bagsDroppedAtDoor(doorIndex)) + 1 && prev(bagsDroppedAtDoor(doorIndex)) >= 3

// $012A: (Array of 12 8-bit bitfields) Location of Tellers.
//        
//        bit0 = Teller will appear.
//        bit1 =Teller is currently Visible, will disappear when off screen.
TELLER_AT_DOOR_MEMORY_LOCATION = 0x00012A
function locationOfTellers() => byte(0x00012A)

function telleratDoor(doorIndex) => byte(TELLER_AT_DOOR_MEMORY_LOCATION + doorIndex) & 0x3 == 0x03

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
LEFT_DOOR_BADIT_STATS_MEMORY_LOCATION = 0x000461
function leftDoorBanditStats() => byte(0x000461)

function unfairShot(memoryLocation) => bit2(memoryLocation) == 0 && 
                                       prev(bit2(memoryLocation)) == 1 &&
                                       bit4(memoryLocation) == 0

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
MIDDLE_DOOR_BADIT_STATS_MEMORY_LOCATION = 0x000481
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
RIGHT_DOOR_BADIT_STATS_MEMORY_LOCATION = 0x0004A1
function rightDoorBanditStates() => byte(0x0004A1)

// $04A3: (8-bit) Right door enemy
//        
//        0x00 = Guy dropping off money
//        0x01 = Box Bonus
//        0x02 = Green Bandit
function rightDoorType() => byte(0x0004A3)

// THIS DOES NOT WORK. 
// $075E: (16-bit) FAILED Demo Indicator.
//        
//        0x0000 = Demo Mode
//        0xffac = Gameplay
function demoIndicator() => word(0x00075E)
DEMO_MODE_VALUE = 0x0000

// function notInDemoMode() => demoIndicator() != DEMO_MODE_VALUE

function achievementActive()
{
    return notInDemoMode() &&
           singlePlayer() &&
           threeLives()

}

TITLE = "TITLE"
POINTS = "POINTS"
TYPE = "TYPE"
ROUND = "ROUND"

achievementData =
[
    { 
        ROUND: 1,
        TITLE: "New Sheriff in Town",
        POINTS: 5,
    },
    {
        ROUND: 3,
        TITLE: "Rookie Ranger",
        POINTS: 10,
    },
    {
        ROUND: 6,
        TITLE: "Vault Vigalante",
        POINTS: 10,
    },
    {
        ROUND: 9,
        TITLE: "Door Defender",
        POINTS: 25,
    }
]


function roundAchievement(data)
{
    achievement(title = data[TITLE],
                type = "Progression",
                description = format("Beat Round {0}.  Players must start at level 1 to earn this achievement" + achievementInfoString, data[ROUND]),
                points = data[POINTS],
                trigger = achievementActive() && 
                          justWonRound() && 
                          currentRound() == data[ROUND] + 1 &&
                          once(currentRound() == 1) &&
                          never(justGameOver()) &&
                          never(levelSkipped())
                )
}

for data in achievementData
{
    roundAchievement(data)
}

achievement( title = "Legendary Lawmam",
             type = "Win_Condition",
             description = "Beat Round 12.  Players must start at level 1 to earn this achievement" + achievementInfoString,
             points = 50,
             trigger = achievementActive() && 
                       trigger_when(justWonRound() && 
                                    currentRound() == 12) &&
                       once(currentRound() == 1) &&
                       never(justGameOver()) &&
                       never(levelSkipped())
)

allDoors = range(1,12)

achievement( title = "Big Deposits",
             description = "Earn 1000 + 1000 Bonus from a single Bag Drop",
             points = 2,
             trigger = achievementActive() &&
                       any_of( allDoors, doorIndex => at1000Bonus(doorIndex) && telleratDoor(doorIndex))
)

noDeathAchievementData =
[
    {
        ROUND: 3,
        TITLE: "Bullet Dodger",
        POINTS: 5
    },
    {
        ROUND: 6,
        TITLE: "Iron Oven Door",
        POINTS: 10
    },
    {
        ROUND: 9,
        TITLE: "Bullet Proof Vest",
        POINTS: 10
    }
]

// reach level with no death. 
function noDeathAchievement(data)
{
    achievement(title = data[TITLE],
                description = format("Starting at Round 1 Beat Round {0} with out losing a life" + achievementInfoString, data[ROUND]),
                type = "Missable",
                points = data[POINTS],
                trigger = achievementActive() && 
                          trigger_when(justWonRound() && 
                                       currentRound() == data[ROUND]) &&
                          once (currentRound() == 1) &&
                          never(justLostLife()) &&
                          never(levelSkipped())
                )
}

for data in noDeathAchievementData
{
    noDeathAchievement(data)
}

SCORE= "SCORE"
scoreAchievementData =
[
    {
        SCORE: 50000,
        TITLE: "Pay Day",
        POINTS: 1
    },
    {
        SCORE: 100000,
        TITLE: "Big Pay Day",
        POINTS: 5
    },
    {
        SCORE: 300000,
        TITLE: "Huge Pay Day",
        POINTS: 10
    }
]

function scoreAchievement(data)
{
    achievement(title = data[TITLE],
                description = format("Reach a score of {0}, starting from round 1" + achievementInfoString, data[SCORE]),
                points = data[POINTS],
                trigger = achievementActive() &&
                          totalScore() >= data[SCORE] &&
                          prev(totalScore()) < data[SCORE] &&
                          once (currentRound() == 1) &&
                          never(levelSkipped())
                )
}

for data in scoreAchievementData
{
    scoreAchievement(data)
}

// stop a bomb at any time. 
achievement( title = "Shoot the Fuse",
             description = "Stop any bomb" + achievementInfoString,
             points = 2,
             trigger = achievementActive() &&
                       bombJustRemoves() && 
                       bombTimerActive()
)


achievement( title = "Just in Time",
             description = "Stop a bomb at the last second" + achievementInfoString,
             points = 5,
             trigger = achievementActive() &&
                       bombJustRemoves() && 
                       actualTimeForBomb() == 1 &&
                       bombTimerActive()
)

achievement( title = "Extra Bonus",
             description = "Spell out EXTRA and get a free life" + achievementInfoString,
             points = 5,
             trigger = achievementActive() &&
                       extraTriggered()
)

achievement( title = "Gunslinger",
             description = "Finish any round with out losing a life or shooting a bandit unfairly" + achievementInfoString,
             points = 5,
             trigger = achievementActive() &&
                       trigger_when(repeated(2, justWonRound() || justSpentCredit())) &&
                       once(justWonRound() || justSpentCredit()) &&
                       never(banditUnfairKilled(leftDoorType(), LEFT_DOOR_BADIT_STATS_MEMORY_LOCATION)) &&
                       never(banditUnfairKilled(middleDoorType(), MIDDLE_DOOR_BADIT_STATS_MEMORY_LOCATION)) &&
                       never(banditUnfairKilled(rightDoorType(), RIGHT_DOOR_BADIT_STATS_MEMORY_LOCATION)) &&
                       never(justLostLife())
)

achievement( title = "Sharpshooter",
             description = "Finish any round after round 6 with out losing a life or shooting a bandit unfairly" + achievementInfoString,
             points = 10,
             trigger = achievementActive() &&
                       trigger_when(repeated(2, justWonRound() || justSpentCredit())) &&
                       once(justWonRound() || justSpentCredit()) &&
                       never(banditUnfairKilled(leftDoorType(), LEFT_DOOR_BADIT_STATS_MEMORY_LOCATION)) &&
                       never(banditUnfairKilled(middleDoorType(), MIDDLE_DOOR_BADIT_STATS_MEMORY_LOCATION)) &&
                       never(banditUnfairKilled(rightDoorType(), RIGHT_DOOR_BADIT_STATS_MEMORY_LOCATION)) &&
                       never(justLostLife()) &&
                       currentRound() > 6
                    
)




leaderboard(
    title = format("High Score"),
    description = format("Get the highest score possible. Scores submit on game over. Requires Single Player and 3 lives dip switch"),
    start = 
    (
        achievementActive() &&
        justGameOver()
    ),
    cancel = always_false(),
    submit = always_true(),
    value = totalScore(),
    format = "VALUE"
)

leaderboard(
    title = format("Highest Round"),
    description = format("Reach the highest round possible. Scores submit on gameover. Requires Single Player and 3 lives dip switch"),
    start = 
    (
        achievementActive() &&
        justGameOver()
    ),
    cancel = always_false(),
    submit = always_true(),
    value = currentRound(),
    format = "VALUE"
)


rich_presence_conditional_display(!notInDemoMode(), "Watching Demos")

rich_presence_conditional_display(!singlePlayer(), "Two Player Mode")

rich_presence_display("Round {0} Score {1} Lives {2}", 
                      rich_presence_value("Number", currentRound()),
                      rich_presence_value("Number", totalScore()),
                      rich_presence_value("Number", lives())
                      )



// find new Demo thing, maybe the two player set up? 
// Unfair on the first level? 

// Quick shooter. 