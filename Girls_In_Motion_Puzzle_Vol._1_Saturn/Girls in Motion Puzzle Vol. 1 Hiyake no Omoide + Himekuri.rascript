// Girls in Motion Puzzle Vol. 1: Hiyake no Omoide + Himekuri
// #ID = 14954

// $10034A: (8-bit) Movie Indicator
//          
//          0x74 = Large Screen movie Playing.
//          0x7c = In a puzzle
//          Other values are possible.
function movieIndicator() => byte(0x10034A)

MOVIE_PLAYING_VALUE = 0x74
function isMoviePlaying() => movieIndicator() == MOVIE_PLAYING_VALUE

// $1304C0: (8-bit) Menu Selection VS Puzzle
//          
//          0x1304c0 is the same as 0x1e8e3b
//          
//          0x00 = 1P vs 2P
//          0x01 = 1P vs Com1
//          0x02 = 1P vs Com2
function vsMenuSelection() => byte(0x1304C0)

// $1BF89C: (8-bit) Completed Indicator.
//          
//          Use 1bf89c and 1bf8a8 together.
//          
//          0x00 Current level Completed
//          Any other number when it's not.
//          
//          Note: This remains until a new level is started.  Use a delta.
function completIndicatorPart1() => byte(0x1BF89C)

// $1BF8A8: (8-bit) Completed Indicator.
//          
//          Use 1bf89c and 1bf8a8 together.
//          
//          0x00 Current level Completed
//          Any other number when it's not.
//          
//          Note: This remains until a new level is started.  Use a delta.
function completeIndicatorPart2() => byte(0x1BF8A8)

COMPLETE_LEVEL_VALUE = 0x00

function moviePuzzleComplete() => completeIndicatorPart1() == COMPLETE_LEVEL_VALUE && 
                                  completeIndicatorPart2() == COMPLETE_LEVEL_VALUE

// $1BFA08: (20-bytes (array of 5 sets of 4 bytes)) Scene unlock pattern.
//          
//          Pattern goes Scene 2, Scene 1 Scene 4 scene 3.
//          
//          The sets go Ayumi, Mami, Kyoko, Miwako, Chiyoko
//          
//          (8-bit) Ayumi Scene 2 Complete
//          
//          0x00 = Not Unlocked
//          0x01 = Complete + Scene 3 unlocked.
function arrayOfUnlocks() => byte(0x1BFA08)

AYUMI  = 0x00
MAMI   = 0x01
KYOKO  = 0x02
MIWAKO = 0x03
CHIYOKO= 0x04

girlLookup = 
{
    AYUMI   : "Ayumi",
    MAMI    : "Mami", 
    KYOKO   : "Kyoko",  
    MIWAKO  : "Miwako", 
    CHIYOKO : "Chiyoko",
}

// Actually I don't think we need the unlocks. 


// $1BFBA6: (8-bit) Practice Mode
//          
//          0x00 = Practice Mode
//          0x01 = Normal Mode.
//          
//          Practice mode should be blocked for any time, or life value
function practiceModeToggle() => byte(0x1BFBA6)

PRACTICE_MODE_VALUE = 0x00
NORMAL_MODE_VALUE = 0x01
function practiceModeCheck() = practiceModeToggle() == NORMAL_MODE_VALUE

// $1CBF27: (8-bit) Discard indicator Part 1
//          
//          Set to 0x02 when discarding a tile.
//          
//          Note: Some other times it may be set to 0x02, check 0x1cbf27, 0x1cbf31 and 0x1cbf33 together.
function discardIndicator1() => byte(0x1CBF27)

DISCARD_VALUE_1 = 0x02

// $1CBF31: (8-bit) Discard indicator Part 2
//          
//          Set to 0x06 when discarding a tile.
//          
//          Note: Some other times it may be set to 0x06, check 0x1cbf27, 0x1cbf31 and 0x1cbf33 together.
function discardIndicator2() => byte(0x1CBF31)

DISCARD_VALUE_2 = 0x06

// $1CBF33: (8-bit) Discard indicator Part 3
//          
//          Set to 0xfa when discarding a tile.
//          
//          Note: Some other times it may be set to 0xfa, check 0x1cbf27, 0x1cbf31 and 0x1cbf33 together.
function discardIndicator3() => byte(0x1CBF33)

DISCARD_VALUE_3 = 0xfa

// Note this isn't designed to be on delta, but that should be ok
function tileDiscarded() => discardIndicator1() == DISCARD_VALUE_1 &&
                            discardIndicator2() == DISCARD_VALUE_2 &&
                            discardIndicator3() == DISCARD_VALUE_3

// $1CC8E4: (8-bit) Mode Select
//          
//          0x01 = Movie Puzzles
//          0x0e = Vs Puzzle
//          0x04 = Calendar
function modeSelect() => byte(0x1CC8E4)

MOVIE_PUZZLE_VALUE = 0x01
VS_PUZZLE_VALUE = 0x0e
CALENDAR_VALUE = 0x04

function moviePuzzleMode() => modeSelect() == MOVIE_PUZZLE_VALUE
function vsPuzzleMode() => modeSelect() == VS_PUZZLE_VALUE
function calendarMode() => modeSelect() == CALENDAR_VALUE

// $1D90B6: (8-bit) Calendar Success indicator.
//          
//          0x00 Calendar Success.
//          
//          Combine 0x1d90b6, 0x1d90b9 0x1d90bf
function calendarSuccessPart1() => byte(0x1D90B6)

// $1D90B9: (8-bit) Calendar Success indicator.
//          
//          0x00 Calendar Success.
//          
//          Combine 0x1d90b6, 0x1d90b9 0x1d90bf
function calendarSuccessPart2() => byte(0x1D90B9)

// $1D90BF: (8-bit) Calendar Success indicator.
//          
//          0x00 Calendar Success.
//          
//          Combine 0x1d90b6, 0x1d90b9 0x1d90bf
function calendarSuccessPart3() => byte(0x1D90BF)

CALENDAR_SUCCESS_VALUE = 0x00

function calendarSuccess() => calendarSuccessPart1() == CALENDAR_SUCCESS_VALUE &&
                              calendarSuccessPart2() == CALENDAR_SUCCESS_VALUE &&
                              calendarSuccessPart3() == CALENDAR_SUCCESS_VALUE

// $1DEBA1: (8-bit) Scene ID in game
//          
//          Will select the stage, no matter what is chosen.
//          
//          0x00-0x03
function sceneId() => byte(0x1DEBA1)

FINAL_SCENE_ID = 0x03

// $1DEBA2: (8-bit) Girl ID
//          
//          Girl that's chosen.
//          
//          0x00 = Ayumi
//          0x01 = Mami
//          0x02 = Kyoko
//          0x03 = Miwako
//          0x04 = Chiyoko
function girlId() => byte(0x1DEBA2)

function ayumiSelected() => girlId() == AYUMI  
function mamiSelected() => girlId() == MAMI   
function kyokoSelected() => girlId() == KYOKO  
function miwakoSelected() => girlId() == MIWAKO 
function chiyokoSelected() => girlId() == CHIYOKO

// $1E0174: (16-bit) Upper 16-bits of Timer
//          
//          Couns frames (60fps) counting up.  Rest of timer is located at 0x1e0174
function upperTimerBits() => word(0x1E0174)

// $1E0176: (16-bit) Lower 16-bits of Timer
//          
//          Couns frames (60fps) counting up.  Rest of timer is located at 0x1e0174
function lowerTimerBits() => word(0x1E0176)

function timerInFrames() => lowerTimerBits() + upperTimerBits() * 1<<16

function timerInSeconds() => timerInFrames() /60

// $1E018C: (4-bit) Life left.
//          
//          0x0 - 0xe is the displayed life.
//          Note: Changing High bits will freeze the level.   May be used for something.
//          
//          Make sure to check practice mode.
function lifeLeft() => low4(0x1E018C)

FULL_VISIBLE_LIFE = 0x0e // Note this can actually reach 0x0f. 

function fullLife() => lifeLeft() >= FULL_VISIBLE_LIFE

// $1e018f: (8-bit) Incremental count up to a new life. 
//          
//          0x00-0x02
//          
//          Increments on each piece being added.  When a piece is added and this is set to 0x02 it resets to 0x00 and adds 1 to 0x1e018c
function incrementalLife() => low4(0x1e018f)

function detectLifeLoss() => (prev(incrementalLife()) != 0 && 
                              incrementalLife() == 0 && 
                              lifeLeft() != 0xf && 
                              lifeLeft() > prev(lifeLeft())) || 
                              lifeLeft() < prev(lifeLeft())


// $1E8DD2: (8-bit) Player 1's wins in Vs Mode
//          
//          Need to test for reset, or deltas.
function player1Wins() => byte(0x1E8DD2)

// $1E8DD4: (8-bit) Player 2 (CPUs)'s wins in Vs Mode
//          
//          Need to test for reset, or deltas.
function player2Wins() => byte(0x1E8DD4)

// $1E8DE2: (8-bit) vsMode Results of a round
//          
//          0x00 = No result
//          0x01 = You Won
//          0x02 = You Lost
function vsModeResult() => byte(0x1E8DE2)

// $1E8E3B: (8-bit) Menu Selection VS Puzzle
//          
//          0x1304c0 is the same as 0x1e8e3b
//          
//          0x00 = 1P vs 2P
//          0x01 = 1P vs Com1
//          0x02 = 1P vs Com2
function vsModeSelectionAlt() => byte(0x1E8E3B)

VS_COM1_VALUE = 0x01
VS_COM2_VALUE = 0x02
function playerVsCom1() => vsModeSelectionAlt() == VS_COM1_VALUE
function playerVsCom2() => vsModeSelectionAlt() == VS_COM2_VALUE


// $1EAC26: (8-bit) Vs Mode Round count
//          
//          0x00 = 1 Round
//          0x01 = 3 Round
//          0x02 = 5 Round
function vsModeRoundCount() => byte(0x1EAC26)

VS_1_ROUND_VALUE = 0x00
VS_3_ROUND_VALUE = 0x01
VS_5_ROUND_VALUE = 0x02
function vsMode1RoundOption() => vsModeRoundCount() == VS_1_ROUND_VALUE
function vsMode3RoundOption() => vsModeRoundCount() == VS_3_ROUND_VALUE
function vsMode5RoundOption() => vsModeRoundCount() == VS_5_ROUND_VALUE

function vsMode1RoundP1Won() => vsMode1RoundOption() && prev(player1Wins) == 0 && player1Wins() == 1
function vsMode3RoundP2Won() => vsMode3RoundOption() && prev(player1Wins) == 1 && player1Wins() == 2
function vsMode5RoundP3Won() => vsMode5RoundOption() && prev(player1Wins) == 2 && player1Wins() == 3

function girlUnlocks(id )
{
    // Achievement for getting the fourth scene id complete. 
}

for girl in girlLookup
{
    girlUnlocks(id = girl)
}

for id in range(0,4)
{
    Achievement for beating with no mistakes.
    Achievement for beating with full life. 
    Achievement for beating in X time. 
}

for id in range(0,3)
{
    Achievement for beating vs CPU 1 with X rounds
    Achievement for beating vs CPU 2 with X rounds
    
}

Achievement for beating Calendar

Achievement for happy birthday

// 25 achievements, not bad. 