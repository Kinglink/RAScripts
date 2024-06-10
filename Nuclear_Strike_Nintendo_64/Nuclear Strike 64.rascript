// Nuclear Strike 64
// #ID = 10086

// $0A5DF3: (8-bit) Lives
//          
//          0x00 = Last Life
//          0x02 = Initial Lives (2 extra)
function livesCount() => byte(0x0A5DF3)

// $0A8E8A: (16-BIT) Gameplay Check
//          
//          0x00 = Main Menu
//          0x01 = In Game and fighting.
function gameplayCheck() => word(0x0A8E8A)

// $0A8E9A: (8-bit) Difficulty Selected
//          
//          0x00 = Easy
//          0x01 = Normal
//          0x02 = Hard
function difficultySelected() => byte(0x0A8E9A)

// $0A8EAC: (Array of 12 8-bit numbers)  Mission complete status.
//          
//          NOTE: THis is not in the order you expect.
//          
//          First value is mission 4 (level 2, Scenario 1)
//          Second Value is mission 3 (Level 1 Scenario 3)
//          Second Value is mission 2 (Level 1 Scenario 2)
//          Fourth Value is mission 1 (Level 1 Scenario 1)
//          Fifth Value is mission 8 and so on.
//          
//          0x00 = Not complete
//          Any other value marks it as complete (0x01 is most common)
function missionComplete() => byte(0x0A8EAC)

// $0A9730: (Array of 16 8-bit Values) Some cheats
//          
//          0x00 = No Cheat
//          0x01 = Cheat
//          
//          Note: Not all the cheats.
function cheatArray() => byte(0x0A9730)

// $0A9742: (2 8-bit)  Cheats
//          
//          0x00 = Not in use
//          0x01 = In use
function secondCheatArray() => byte(0x0A9742)

// $17F46C: (8-bit) Result (menu system)
//          
//          0x00 = Gameplay
//          0x01 = Mission failed
//          0x02 = Alternate Mission Failed
//          0x08 = Mission success
function missionResult() => byte(0x17F46C)

// $182ED5: (8-bit) Final Mission Result
//          
//          0x02 = Gameplay
//          0x01 = Won
//          
//          Might be a 16 bit number but we can just check this value.
function finalMIssionResult() => word(0x182ED5)
