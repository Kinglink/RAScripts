// Hudson Hawk
// #ID = 1740

// $1873: (8-bit) Level Index
//        
//        0x00 = First level
//        0x01 = Second Level
//        0x02 = Third Level
//        0x03 = Finished game
function LevelIndex() => byte(0x000073)

function BeatLevel1() => LevelIndex() == 0x01 && prev(LevelIndex()) == 0x00
function BeatLevel2() => LevelIndex() == 0x02 && prev(LevelIndex()) == 0x01
function BeatGame() => LevelIndex() == 0x03 && prev(LevelIndex()) == 0x02

// $00EF: (24 bit BE BCD)  6 digits (This is the 10 thousand range)
function Score() => bcd(tbyte_be(0x0000EF))
function PriorScore() => bcd(prior(tbyte_be(0x0000EF)))

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
function ContinuesLeft() => byte(0x0000F9)

function LostContinue() => ContinuesLeft() < prev(ContinuesLeft())


// $19FF: (8-bit) In Game check.
//        
//        0xc6 = Demo (No actual demo.)
//        0xc7 = In-Game
function InGameCheck() => byte(0x001FF)

function IsInGame() => InGameCheck() == 0xC7
function IsDemo() => InGameCheck() == 0xC6
function StartGame() => IsInGame() && prev(IsDemo())

function Protection() => IsInGame() && !CheatCodeActive() && never(IsDemo())

achievement( title =  "Swinging On A Star",
            description = "Beat Level 1",
            points = 5,
            type = "Progression",
            trigger = BeatLevel1() && Protection()
)

achievement( title =  "We will not lie down for some schmuck from New Jersey",
            description = "Beat Level 2",
            points = 10,
            type = "Win_Condition",
            trigger = BeatLevel2() && Protection()
)

achievement( title =  "Side By Side",
            description = "Beat the Game",
            points = 10,
            type = "Progression",
            trigger = BeatGame() && Protection()
)

achievement( title = "All this trouble for a horsey",
            description = "Beat Level 1 without losing a life",
            points = 10,
            trigger = once(StartGame()) &&
                      trigger_when(BeatLevel1()) && 
                      Protection() && 
                      never(LostLife()) &&
                      never(LostContinue()) &&
                      never(prev(LevelIndex()) != 0x00)
)

achievement( title = "I'm being blackmailed into robbing the Vatican by a psychotic American Corporation and the CIA",
            description = "Beat Level 2 without losing a life",
            points = 10,
            trigger = once(BeatLevel1()) &&
                      trigger_when(BeatLevel2()) && 
                      Protection() && 
                      never(LostLife()) &&
                      never(LostContinue()) &&
                      never(LevelIndex() != 0x01 &&
                            prev(LevelIndex()) != 0x01)
)

achievement( title = "Money isn't everything. Gold Is!",
            description = "Beat Level 3 without losing a life",
            points = 10,
            trigger = once(BeatLevel2()) &&
                      trigger_when(BeatGame()) && 
                      Protection() && 
                      never(LostLife()) &&
                      never(LostContinue()) &&
                      never(LevelIndex() != 0x02 &&
                            prev(LevelIndex()) != 0x02 )
)

achievement( title = "What do you wanna do?  Play Nintendo? Bone Some Chicks?",
            description = "Beat the Game without using a Continue",
            points = 25,
            trigger = trigger_when(BeatGame()) &&
                      Protection() && 
                      ContinuesLeft() == 3
)

leaderboard(
      title = format("High Score Level 1"),
      description = format("Earn the highest score during Level 1") ,
      start = 
      (
      Protection() &&
      BeatLevel1()
      ),
      cancel = always_false(),
      submit = always_true(),
      value = Score(),
      format = "VALUE", 
      lower_is_better = false 
)

leaderboard(
      title = format("High Score Level 2"),
      description = format("Earn the highest score during Level 2") ,
      start = 
      (
      Protection() &&
      BeatLevel2()
      ),
      cancel = always_false(),
      submit = always_true(),
      value = Score(),
      format = "VALUE",
      lower_is_better = false 
)

leaderboard(
      title = format("High Score Level 3"),
      description = format("Earn the highest score during Level 3") ,
      start = 
      (
      Protection() &&
      BeatGame()
      ),
      cancel = always_false(),
      submit = always_true(),
      value = Score(),
      format = "VALUE",
      lower_is_better = false 
)

rich_presence_conditional_display(LevelIndex() == 0x03, "Beat the game")
rich_presence_conditional_display(IsInGame(), "Level: {0} Continues: {1} Lives: {2} Energy: {3} Score: {4}",
                                    rich_presence_value("Level", LevelIndex() + 1 ),
                                    rich_presence_value("Continues", ContinuesLeft()),
                                    rich_presence_value("Lives", Lives()),
                                    rich_presence_value("Energy", Energy()),
                                    rich_presence_value("Score", Score()))  
rich_presence_display("Looking at 4 screens, over and over again.")