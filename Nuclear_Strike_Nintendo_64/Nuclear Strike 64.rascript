// Nuclear Strike 64
// #ID = 10086


MissionName = {
    0x00: "Level 1 Delta Scenario 1",
    0x01: "Level 1 Delta Scenario 2",
    0x02: "Level 1 Delta Scenario 3",
    0x03: "Level 2 Island Scenario 1",
    0x04: "Level 2 Island Scenario 2",
    0x05: "Level 2 Island Scenario 3",
    0x06: "Level 3 Peace Scenario 1",
    0x07: "Level 3 Peace Scenario 2",
    0x08: "Level 3 Peace Scenario 3",
    0x09: "Level 4 DMZ Scenario 1",
    0x0A: "Level 5 Fortress Scenario 1",
    0x0B: "Level 5 Fortress Scenario 2"
}


// THIS is incorrect. 
// $0A5DF2: (8-bit) Mission Gameplay Value 
//
//          0x00- 0x0b
//
//          Freezing this means the current Mission will display the wrong  data.  
//          Note, the label for the mission and info on it will not change, but you'll be given the wrong indicators. 
// function missionIndex() => byte(0x0A5DF2)

// $0a8e69: (8-bit) Current Level 
//
// This doesn't change on level completion. 
function missionIndex() => byte(0x0A8E69)

// $0A5DF3: (8-bit) Lives
//          
//          0x00 = Last Life
//          0x02 = Initial Lives (2 extra)
function livesCount() => byte(0x0A5DF3)

function lostLife() => livesCount() < prev(livesCount())

// $0A8E8A: (16-bit) Gameplay Check
//          
//          0x00 = Main Menu
//          0x01 = In Game and fighting.
function gameplayCheck() => byte(0x0A8E8A)
MAIN_MENU_VALUE = 0x00
IN_GAME_VALUE = 0x01

function startedGameplay() => gameplayCheck() == IN_GAME_VALUE && prev(gameplayCheck()) == MAIN_MENU_VALUE
function notInGame() => gameplayCheck() != IN_GAME_VALUE
function inGame() => gameplayCheck() == IN_GAME_VALUE

// $0A8E9A: (8-bit) Difficulty Selected
//          
//          0x00 = Easy
//          0x01 = Normal
//          0x02 = Hard
function difficultySelected() => byte(0x0A8E9A)
HARD_DIFFICULTY_VALUE = 0x02 

function hardDifficulty() => difficultySelected() == HARD_DIFFICULTY_VALUE

// $0A9730: (Array of 16 8-bit Values) Some cheats
//          
//          0x00 = No Cheat
//          0x01 = Cheat
//          
//          Note: Not all the cheats.
CHEAT_ARRAY_MEMORY_LOCATION = 0x0A9730
function cheatArray() => byte(0x0A9730)

// $0A9742: (2 8-bit)  Cheats
//          
//          0x00 = Not in use
//          0x01 = In use
SECOND_CHEAT_ARRAY_MEMORY_LOCATION = 0x0A9742
function secondCheatArray() => byte(0x0A9742)

CHEAT_NOT_IN_USE_VALUE = 0x00

function noCheatsActive() => all_of(range(0,15), i => byte(CHEAT_ARRAY_MEMORY_LOCATION + i) == CHEAT_NOT_IN_USE_VALUE) &&
                             all_of(range(0,1), i => byte(SECOND_CHEAT_ARRAY_MEMORY_LOCATION + i) == CHEAT_NOT_IN_USE_VALUE)

// $0b0779: (8-bit) Pause Indicator. 
// 
//          When game is paused this is set to 0x00.  Appears to control the sides panels of the menus. 
//
//          0x00 = Gameplay
//          0x01= Paused
function pauseIndicator() => byte(0x0B0779)
PAUSED_VALUE = 0x01

function isPaused() => pauseIndicator() == PAUSED_VALUE
// $170040: (24-bit) Pointer to player information 
//
//          +0xa=(16-bit) Machine Gun Ammo
//          +0x26=(16-bit) Rocket Ammo
//          +0x42=(16-bit) Missile ammo
//          +0x4e=(16-bit) Wing Ammo
//          +0x2eea= (16-bit) Armor
function playerPointer() => tbyte(0x170040)
function playerMachineGunAmmo() => word(playerPointer() + 0x0A)
function playerRocketAmmo() => word(playerPointer() + 0x26)
function playerMissileAmmo() => word(playerPointer() + 0x42)
function playerWingAmmo() => word(playerPointer() + 0x5e)
function playerArmor() => word(playerPointer() + 0x2eea)


// $17F46C: (8-bit) Result (menu system)
//          
//          0x00 = Gameplay
//          0x01 = Mission failed
//          0x02 = Alternate Mission Failed
//          0x08 = Mission success
function missionResult() => byte(0x17F46C)
MISSION_WON_VALUE = 0x08

function missionWon() => missionResult() == MISSION_WON_VALUE && prev(missionResult()) != MISSION_WON_VALUE

// $182ED5: (8-bit) Final Mission Result
//          
//          0x02 = Gameplay
//          0x01 = Won
//          
//          Might be a 16 bit number but we can just check this value.
function finalMissionResult() => word(0x182ED5)
MISSION_WON_FINAL_VALUE = 0x01

function finalMissionWon() => finalMissionResult() == MISSION_WON_FINAL_VALUE && prev(finalMissionResult()) != MISSION_WON_FINAL_VALUE

NORMAL_NAME = "NORMAL_NAME"
HARD_NAME = "HARD_NAME"
NO_DEATH = "NO_DEATH"
LEVEL_INDEX = "LEVEL_INDEX"
MISSION_COMPLETE_FUNCTION = "MISSION_COMPLETE_FUNCTION"
NORMAL_PROGRESSION_TYPE = "NORMAL_PROGRESSION_TYPE"
NORMAL_POINTS = "NORMAL_POINTS"
HARD_POINTS = "HARD_POINTS"
NO_DEATH_POINTS = "NO_DEATH_POINTS"

levelData = [
    {
        NORMAL_NAME: "Shutting Down the Informant",
        HARD_NAME: "Saving the Agent",
        NO_DEATH: "Guard Duty",
        LEVEL_INDEX: 0, 
        MISSION_COMPLETE_FUNCTION: missionWon(),
        NORMAL_PROGRESSION_TYPE: "Progression",
        NORMAL_POINTS: 1,
        HARD_POINTS: 5,
        NO_DEATH_POINTS: 10

    },
    {
        NORMAL_NAME: "Counter Attack",
        HARD_NAME: "Going Up The River",
        NO_DEATH: "Rescue Mission",
        LEVEL_INDEX: 1,
        MISSION_COMPLETE_FUNCTION: missionWon(),
        NORMAL_PROGRESSION_TYPE: "Progression",
        NORMAL_POINTS: 1,
        HARD_POINTS: 5,
        NO_DEATH_POINTS: 10
    },
    {
        NORMAL_NAME: "Interogation",
        HARD_NAME: "Tomb Raider",
        NO_DEATH: "Convoy Attack",
        LEVEL_INDEX: 2,
        MISSION_COMPLETE_FUNCTION: missionWon(),
        NORMAL_PROGRESSION_TYPE: "Progression",
        NORMAL_POINTS: 1,
        HARD_POINTS: 5,
        NO_DEATH_POINTS: 10
    },
    {  
        NORMAL_NAME: "Treasure Hunting",
        HARD_NAME: "Bribing Cash",
        NO_DEATH: "Cashing Out",
        LEVEL_INDEX: 3,
        MISSION_COMPLETE_FUNCTION: missionWon(),
        NORMAL_PROGRESSION_TYPE: "Progression",
        NORMAL_POINTS: 2,
        HARD_POINTS: 5,
        NO_DEATH_POINTS: 10
    },
    {
        NORMAL_NAME: "Octo Heli",
        HARD_NAME: "Taking a Bulldozer to a Helicopter Fight",
        NO_DEATH: "I Sunk Your Battleship",
        LEVEL_INDEX: 4,
        MISSION_COMPLETE_FUNCTION: missionWon(),
        NORMAL_PROGRESSION_TYPE: "Progression",
        NORMAL_POINTS: 2,
        HARD_POINTS: 5,
        NO_DEATH_POINTS: 10
    },
    {
        NORMAL_NAME: "Brothers in Jail",
        HARD_NAME: "Blowing Up an Oil Rig is Not Very Enviromental",
        NO_DEATH: "He Didn't Even Try to Get Away",
        LEVEL_INDEX: 5,
        MISSION_COMPLETE_FUNCTION: missionWon(),
        NORMAL_PROGRESSION_TYPE: "Progression",
        NORMAL_POINTS: 2,
        HARD_POINTS: 5,
        NO_DEATH_POINTS: 10
    },
    {
        NORMAL_NAME: "Deep Undercover",
        HARD_NAME: "Drop the Bridge",
        NO_DEATH: "Fighting in My Civies",
        LEVEL_INDEX: 6,
        MISSION_COMPLETE_FUNCTION: missionWon(),
        NORMAL_PROGRESSION_TYPE: "Progression",
        NORMAL_POINTS: 3,
        HARD_POINTS: 5,
        NO_DEATH_POINTS: 10
    },
    {
        NORMAL_NAME: "The Wheels on the Bus Go Round and Round",
        HARD_NAME: "Are We There Yet?",
        NO_DEATH: "How Long Is This Trip?",
        LEVEL_INDEX: 7,
        MISSION_COMPLETE_FUNCTION: missionWon(),
        NORMAL_PROGRESSION_TYPE: "Progression",
        NORMAL_POINTS: 3,
        HARD_POINTS: 5,
        NO_DEATH_POINTS: 10
    },
    {
        NORMAL_NAME: "All Aboard!",
        HARD_NAME: "Choo-Choo!",
        NO_DEATH: "Diplomat Guardian",
        LEVEL_INDEX: 8,
        MISSION_COMPLETE_FUNCTION: missionWon(),
        NORMAL_PROGRESSION_TYPE: "Progression",
        NORMAL_POINTS: 3,
        HARD_POINTS: 5,
        NO_DEATH_POINTS: 10
    },
    {
        NORMAL_NAME: "War! What is it good for?",
        HARD_NAME: "Absolutely Nothing",
        NO_DEATH: "Say It Again",
        LEVEL_INDEX: 9,
        MISSION_COMPLETE_FUNCTION: missionWon(),
        NORMAL_PROGRESSION_TYPE: "Progression",
        NORMAL_POINTS: 5,
        HARD_POINTS: 10,
        NO_DEATH_POINTS: 25
    },
    {
        NORMAL_NAME: "Drilldozer",
        HARD_NAME: "Cry Havoc",
        NO_DEATH: "Hack Attack",
        LEVEL_INDEX: 10,
        MISSION_COMPLETE_FUNCTION: missionWon(),
        NORMAL_PROGRESSION_TYPE: "Progression",
        NORMAL_POINTS: 4,
        HARD_POINTS: 5,
        NO_DEATH_POINTS: 10
    },
]


for data in levelData
{
    achievement( type = data[NORMAL_PROGRESSION_TYPE],
                 title = data[NORMAL_NAME],
                 description = format("Complete {0}", MissionName[data[LEVEL_INDEX]]),
                 points = data[NORMAL_POINTS],
                 trigger = noCheatsActive() && 
                           missionIndex() == data[LEVEL_INDEX] && 
                           data[MISSION_COMPLETE_FUNCTION] && 
                           inGame() 
    )
}


achievement( title = "Breaking Shiva's Dagger",
                description = format("Complete {0} on hard difficulty", MissionName[0x0b]),
                points = 10,
                trigger = noCheatsActive() && 
                        missionIndex() == 0x0b && // This is correct
                        finalMissionWon() && 
                        inGame()
)

for data in levelData
{
    achievement( title = data[HARD_NAME],
                 description = format("Complete {0} on hard difficulty", MissionName[data[LEVEL_INDEX]]),
                 points = data[HARD_POINTS],
                 trigger = noCheatsActive() && 
                           missionIndex() == data[LEVEL_INDEX] && 
                           data[MISSION_COMPLETE_FUNCTION] && 
                           inGame() &&
                           hardDifficulty()
    )
}

achievement( title = "Shattering Shiva's Dagger",
                description = format("Complete {0} on hard difficulty", MissionName[0x0b]),
                points = 10,
                trigger = noCheatsActive() && 
                        missionIndex() == 0x0b && // This is correct
                        finalMissionWon() && 
                        inGame() &&
                        hardDifficulty()
)

for data in levelData
{
    achievement( title = data[NO_DEATH],
                    description = format("Complete {0} without losing a life on hard difficulty", MissionName[data[LEVEL_INDEX]]),
                    points = data[NO_DEATH_POINTS],
                    trigger = noCheatsActive() && 
                            missionIndex() == data[LEVEL_INDEX] && 
                            trigger_when(data[MISSION_COMPLETE_FUNCTION]) && 
                            once(startedGameplay() && missionIndex() == data[LEVEL_INDEX]) &&
                            never(lostLife()) &&
                            never(notInGame()) &&
                            never(missionIndex() != data[LEVEL_INDEX]) && 
                            hardDifficulty() &&
                            never(!hardDifficulty())
    )
}

achievement( title = "Dodging Shiva's Dagger",
             description = format("Complete {0} without losing a life on hard difficulty", MissionName[0x0b]),
             points = 25,
             trigger = noCheatsActive() && 
                       (missionIndex() == 0x0b) && 
                       trigger_when(finalMissionWon()) && 
                       once(startedGameplay() && missionIndex() == 0x0b) &&
                       never(lostLife()) &&
                       never(missionIndex() != 0x0b) && 
                       hardDifficulty() &&
                       never(!hardDifficulty())
    )
        
for data in levelData
{
    leaderboard(
        title = format("Fastest {0}", MissionName[data[LEVEL_INDEX]]),
        description = format("Beat {0} as fast as possible", MissionName[data[LEVEL_INDEX]]),
        start = 
        (
            noCheatsActive() &&
            startedGameplay() && 
            missionIndex() == data[LEVEL_INDEX]
            
                        
        ),
        cancel =  !noCheatsActive() || 
                  notInGame() || 
                  missionIndex() != data[LEVEL_INDEX],
        submit =  data[MISSION_COMPLETE_FUNCTION],
        value = measured(always_true(), when=!isPaused()) && unless(isPaused()),
        lower_is_better = true,
        format = "FRAMES"
    )

    leaderboard(
        title = format("Fastest {0} on Hard", MissionName[data[LEVEL_INDEX]]),
        description = format("Beat {0} on hard as fast as possible", MissionName[data[LEVEL_INDEX]]),
        start = 
        (
            noCheatsActive() &&
            startedGameplay() && 
            missionIndex() == data[LEVEL_INDEX] &&
            hardDifficulty()
            
                        
        ),
        cancel =  !noCheatsActive() || 
                  notInGame() || 
                  missionIndex() != data[LEVEL_INDEX] ||
                  !hardDifficulty(),
        submit =  data[MISSION_COMPLETE_FUNCTION],
        value = measured(always_true(), when=!isPaused()) && unless(isPaused()),
        lower_is_better = true,
        format = "FRAMES"
    )
}

leaderboard(
        title = format("Fastest {0}", MissionName[0x0b]),
        description = format("Beat {0} as fast as possible", MissionName[0x0b]),
        start = 
        (
            noCheatsActive() &&
            startedGameplay() && 
            missionIndex() == 0x0b
            
                        
        ),
        cancel =  !noCheatsActive() || 
                  notInGame() || 
                  missionIndex() != 0x0b,
        submit =  finalMissionWon(),
        value = measured(always_true(), when=!isPaused()) && unless(isPaused()),
        lower_is_better = true,
        format = "FRAMES"
    )

    leaderboard(
        title = format("Fastest {0} on Hard", MissionName[0x0b]),
        description = format("Beat {0} on hard as fast as possible", MissionName[0x0b]),
        start = 
        (
            noCheatsActive() &&
            startedGameplay() && 
            missionIndex() == 0x0b &&
            hardDifficulty()
            
                        
        ),
        cancel =  !noCheatsActive() || 
                  notInGame() || 
                  missionIndex() != 0x0b ||
                  !hardDifficulty(),
        submit =  finalMissionWon(),
        value = measured(always_true(), when=!isPaused()) && unless(isPaused()),
        lower_is_better = true,
        format = "FRAMES"
    )

rich_presence_conditional_display( inGame(),
                                   "Mission: {0} Armor:{1} Guns: {2} Rockets: {3} Missiles: {4} Wings: {5}",
                                   rich_presence_lookup("MissionName", missionIndex(), MissionName),
                                   rich_presence_value("Number", playerArmor()),
                                   rich_presence_value("Number", playerMachineGunAmmo()),
                                   rich_presence_value("Number", playerRocketAmmo()),
                                   rich_presence_value("Number", playerMissileAmmo()),
                                   rich_presence_value("Number", playerWingAmmo())
                                  )

rich_presence_display("Looking at the Main Menu")