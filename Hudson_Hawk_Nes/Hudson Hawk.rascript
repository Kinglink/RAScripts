// Hudson Hawk
// #ID = 1740

// $00EF: (24 bit BE BCD)  6 digits (This is the 10 thousand range)
function Score() => tbyte_be(0x0000EF)

// $00F2: (8-bit) Lives Value
//        
//        0x05 = Initial Value
//        
//        Control Value.
function Lives() => byte(0x0000F2)

function LostLife() => Lives() < prev(Lives())

// $00F3: (8-bit) Energy Value
//        
//        0x00 = Dead (not instant)
//        0xff = Max Value (8 hearts)
//        
//        Control Value.
function Energy() => byte(0x0000F3)

function LostEnergy() => Energy() < prev(Energy())

// $00F6: (8-bit) Infinite Life Cheat Code active
//        
//        0x00 = No cheat code active.
//        0xff = Cheat code active
//        bit 8 =  Actual Control of Cheat code.
function InfiniteLivesCheatCode() => byte(0x0000F6)

function CheatCodeActive() => bit7(0x0000F6) == 0x01

// $00FA: (8-bit) Continues Left.   Note when this is 1, it appears you can continue one last time, even though it says continues = 0.   What a !@#$ game.
function ContinuesLeft() => byte(0x0000FA)

function LostContinue() => ContinuesLeft() < prev(ContinuesLeft())

// $1873: (8-bit) Level Index
//        
//        0x00 = First level
//        0x01 = Second Level
//        0x02 = Third Level
//        0x03 = Finished game
function LevelIndex() => byte(0x001873)

function BeatLevel1() => LevelIndex() == 0x01 && prev(LevelIndex()) == 0x00
function BeatLevel2() => LevelIndex() == 0x02 && prev(LevelIndex()) == 0x01
function BeatGame() => LevelIndex() == 0x03 && prev(LevelIndex()) == 0x02

// $19FF: (8-bit) In Game check.
//        
//        0xc6 = Demo (No actual demo.)
//        0xc7 = In-Game
function InGameCheck() => byte(0x0019FF)

function IsInGame() => InGameCheck() == 0xC7
function IsDemo() => InGameCheck() == 0xC6
function StartGame() => IsInGame() && prev(IsDemo())

function Protection() => IsInGame() && !CheatCodeActive() && never(IsDemo())

achievement( title =  "REPLACE_LEVEL_1",
            description = "Beat Level 1",
            points = 5,
            type = "Progression",
            trigger = BeatLevel1() && Protection()
)

achievement( title =  "REPLACE_LEVEL_2",
            description = "Beat Level 2",
            points = 10,
            type = "Win_Condition",
            trigger = BeatLevel2() && Protection()
)

achievement( title =  "REPLACE_GAME_COMPLETE",
            description = "Beat the Game",
            points = 10,
            type = "Progression",
            trigger = BeatGame() && Protection()
)

achievement( title = "Replace_No_Death_Level_ 1",
            description = "Beat Level 1 without losing a life",
            points = 10,
            trigger = once(StartGame()) &&
                      trigger_when(BeatLevel1()) && 
                      Protection() && 
                      never(LostLife()) &&
                      never(LostContinue()) &&
                      never(prev(LevelIndex()) != 0x00)
)

achievement( title = "Replace_No_Death_Level_ 2",
            description = "Beat Level 2 without losing a life",
            points = 10,
            trigger = once(BeatLevel1()) &&
                      trigger_when(BeatLevel2()) && 
                      Protection() && 
                      never(LostLife()) &&
                      never(LostContinue()) &&
                      never(prev(LevelIndex()) != 0x01 && 
                            LevelIndex() != 0x02)
)

achievement( title = "Replace_No_Death_Level_3",
            description = "Beat Level 3 without losing a life",
            points = 10,
            trigger = once(BeatLevel2()) &&
                      trigger_when(BeatGame()) && 
                      Protection() && 
                      never(LostLife()) &&
                      never(LostContinue()) &&
                      never(prev(LevelIndex()) != 0x02 && 
                            LevelIndex() != 0x03)
)

achievement( title = "Replace_No_Death_Game",
            description = "Beat the Game without using a Continue",
            points = 25,
            trigger = once(StartGame()) &&
                      trigger_when(BeatGame()) &&
                      Protection() && 
                      never(LostContinue()) &&
                      never(prev(LevelIndex()) != 0x03)
)
