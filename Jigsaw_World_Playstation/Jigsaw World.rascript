// Jigsaw World
// #ID = 14953

// $010800: (8-bit) Mode Indicator.
//          
//          Appears to be "Main menu Return value"  (Which icon should be selected  when returning to the main menu.)
//          
//          0x00 = Puzzle mode.
//          0x01 = Versus
//          0x02 = Alice in Puzzleland
//          
//          Note: Not a control
function modeIndicator() => byte(0x010800)

PUZZLE_MODE_VALUE = 0x00
VERSUS_MODE_VALUE = 0x01
STORY_MODE_VALUE = 0x02

function puzzleModeSelected() => modeIndicator() == PUZZLE_MODE_VALUE
function versusModeSelected() => modeIndicator() == VERSUS_MODE_VALUE
function storyModeSelected() => modeIndicator() == ALICE_IN_PUZZLELAND_MODE_VALUE

// $011004: (8-bit) Mode 1 Puzzle
//          
//          0x00 = First puzzle
//          0x05 = First Basketball Puzzle
//          0x0a = First Beaches
//          0xf = Buildings
function puzzleChosen() => byte(0x011004)

// $011006: (8-bit) Piece Count for Puzzle Mode
//          
//          0x00 = 24 Pieces
//          0x01 = 96 Pieces
//          0x02 = 150 Pieces
function pieceCount() => byte(0x011006)

function pieceCount24() => pieceCount() == 0x00
function pieceCount96() => pieceCount() == 0x01
function pieceCount150() => pieceCount() == 0x02


// $011008: (8-bit) Rotation mode for Puzzle Mode
//          
//          0x00 = Off
//          0x01 = On
function rotationMode() => byte(0x011008)

ROTATION_MODE_OFF_VALUE = 0x00
ROTATION_MODE_ON_VALUE = 0x01

function rotationModeOn() => rotationMode() == 0x01


// $01100A: (8-bit) Tanuki mode for Puzzle Mode
//          
//          Doesn't really affect anything but has an annoying piece every level.   Doesn't even hurt you.
//          
//          0x00 = Off
//          0x01 = On
function tanukiMode() => byte(0x01100A)

TANUKI_MODE_OFF_VALUE = 0x00
TANUKI_MODE_ON_VALUE = 0x01

// $01103F: (110-byte) Puzzle 1 Beaten
//          
//          bit0 = 24 piece
//          bit1 = 96 piece
//          bit2 = 150 piece
//          
//          Follow up bytes are for the next puzzles
function puzzleBeatenMarker() => byte(0x01103F)
PUZZLE_BEATEN_MEMORY_LOCATION = 0x01103F
SIZE_OF_PUZZLE_BEATEN = 0x01    
function puzzleBeatenLookup(puzzleIndex) => byte(PUZZLE_BEATEN_MEMORY_LOCATION + (puzzleIndex * SIZE_OF_PUZZLE_BEATEN ))



// $0110B8: (8-bit) Number of Pages Open
//          
//          Starting =- 0x05
//          Max = 016
//          
//          0x00 = Racing
//          0x01 = Sports
//          0xx2 = Vacation
//          0x03 = Buildings
//          0x04 = Paintings/Demons
//          0x05 = Streets
//          0x06 = Anime babes
//          0x07 = Beaches
//          0x08 = Art
//          0x09 = Tokyo Cities
//          0x0a = Cats and Dogs
//          0x0b = Non standard Animals (Fish, Butterfly, Dolphin, Rat, Eagle)
//          0x0c=  Photos
//          0x0d = Anime Characters
//          0x0e = Flowers
//          0x0f = Windows
//          0x10 = Tourism
//          0x11 = Vehicles
//          0x12 =Strange Art
//          0x13 = Birds  (penguins, Swans, Flamingos, Ostriach)
//          0x14 = Photos
//          0x15 = WUT?
function pagesAvailable() => byte(0x0110B8)

PuzzleGroups =[
    {
        ID: 0x00,
        NAME: "RaceTrack"
    },
    {
        ID: 0x01,
        NAME: "Sports"
    },
    {
        ID: 0xx2,
        NAME: "Vacation"
    },
    {
        ID: 0x03,
        NAME: "Architecture"
    },
    {
        ID: 0x04,
        NAME: "Oni and Demons"
    },
    {
        ID: 0x05,
        NAME: "Streets"
    },
    {
        ID: 0x06,
        NAME: "Anime Babes"
    },
    {
        ID: 0x07,
        NAME: "Beaches"
    },
    {
        ID: 0x08,
        NAME: "Art"
    },
    {
        ID: 0x09,
        NAME: "Tokyo Cityscapes"
    },
    {
        ID: 0x0a,
        NAME: "Cats and Dogs"
    },
    {
        ID: 0x0b,
        NAME: "Other Animals"
    },
    {
        ID: 0x0c,
        NAME: "Photos"
    },
    {
        ID: 0x0d,
        NAME: "Anime Characters"
    },
    {
        ID: 0x0e,
        NAME: "Flowers"
    },
    {
        ID: 0x0f,
        NAME: "Windows"
    },
    {
        ID: 0x10,
        NAME: "Tourism"
    },
    {
        ID: 0x11,
        NAME: "Vehicles"
    },
    {
        ID: 0x12,
        NAME: "Strange Art"
    },
    {
        ID: 0x13,
        NAME: "Birds"
    }
    {
        ID: 0x14,
        NAME: "Photos"
    },
    {
        ID: 0x15,
        NAME: "Random"
    }
]

// $015014: (8-bit) Current opponent Alice in Puzzleland
//          
//          0x02 = Rabbit
//          0x03 = Card
//          0x04 = Pig
//          0x05 = Tweedledee
//          0x06 = Egg
//          0x07 = Griffin
//          0x08 = Queen of Hearts
//          0x09 = Cheshire cat
function opponentAlice() => byte(0x015014)

OpponentLookup = 
{ 
    0x02: "Rabbit",
    0x03: "Card",
    0x04: "Pig",
    0x05: "Tweedledee And Tweedledum",
    0x06: "Egg",
    0x07: "Griffin",
    0x08: "Queen of Hearts",
    0x09: "Cheshire Cat"
}

OpponentInfo = 
[
    {
        ID: 0x02,
        NAME: "Chasing Rabbits",
        EASY_POINTS: 2,
        MEDIUM_POINTS: 4,
        HARD_POINTS: 5
    },
    {
        ID: 0x03,
        NAME: "Dealing with Cards",
        EASY_POINTS: 3,
        MEDIUM_POINTS: 4,
        HARD_POINTS: 5
    },
    {
        ID: 0x04,
        NAME: "Fresh Bacon",
        EASY_POINTS: 3,
        MEDIUM_POINTS: 5,
        HARD_POINTS: 5
    },
    {
        ID: 0x05,
        NAME: "Two Opponents, One Battle",
        EASY_POINTS: 3,
        MEDIUM_POINTS: 5,
        HARD_POINTS: 10
    },
    {
        ID: 0x06,
        NAME: "Egg Drop",
        EASY_POINTS: 4,
        MEDIUM_POINTS: 5,
        HARD_POINTS: 10
    },
    {
        ID: 0x07,
        NAME: "Gryphon's Roar",
        EASY_POINTS: 4,
        MEDIUM_POINTS: 5,
        HARD_POINTS: 10
    },
    {
        ID: 0x08,
        NAME: "Off With Her Head",
        EASY_POINTS: 5,
        MEDIUM_POINTS: 10,
        HARD_POINTS: 10
    },
    {
        ID: 0x09,
        NAME: "The Moon's Smile",
        EASY_POINTS: 5,
        MEDIUM_POINTS: 10,
        HARD_POINTS: 25
    }
]

// $015016: (8-bit) Difficulty Selected for Alice in Puzzle world 
//      
//      0x00 = Easy
//      0x01 = Normal
//      0x02 = Hard
function difficultySelected() => byte(0x015016)

EASY_VALUE = 0x00
NORMAL_VALUE = 0x01
HARD_VALUE = 0x02

function easySelected() => difficultySelected() == EASY_VALUE
function normalSelected() => difficultySelected() == NORMAL_VALUE
function hardSelected() => difficultySelected() == HARD_VALUE

// $097D50: (8-bit) Number of Correct Pieces for Player 1
function correctPiecesP1() => byte(0x097D50)

// $097D52: (8-bit) Number of Correct Pieces for Player 2
function correctPiecesP2() => byte(0x097D52)

// $097D58: (8-bit) Number of Error Pieces for Player 1
function errorPiecesP1() => byte(0x097D58)

// $097D5A: (8-bit) Number of Error Pieces for Player 2
function errorPiecesP2() => byte(0x097D5A)

function noErrors() => errorPiecesP1() == 0x00 && errorPiecesP2() == 0x00
function totalCorrect() => correctPiecesP1() + correctPiecesP2()

// $097D80: (32-bit) Frames For Puzzle Mode
//          
//          0x00 = Starting
//          0x01 = first frame.
function framesForPuzzleMode() => dword(0x097D80)

// $0B0BDA: (8-bit) Alice in PuzzleLand  Player State
//          
//          (Question marks are guesses based on Single player.  8-9 is confirmed to be a win.
//          ? 0x00 = Fade In
//          ? 0x01 = Slide in
//          ? 0x03 = Start Count down
//          ? 0x04 = Finish Count down.
//          0x06 = Gameplay
//          ? 0x07 = Remove Puzzle Edge Lines
//          0x08 = Flash Winner
//          0x09 = Finished Run
function puzzleLandPlayerState() => byte(0x0B0BDA)

function puzzleLandWon() => prev(puzzleLandPlayerState()) == 0x07 && puzzleLandPlayerState() == 0x08

// $0B0BFA: (8-bit) Alice in PuzzleLand CPU State
//          
//          (Question marks are guesses based on Single player.  8-9 is confirmed to be a win.
//          ? 0x00 = Fade In
//          ? 0x01 = Slide in
//          ? 0x03 = Start Count down
//          ? 0x04 = Finish Count down.
//          0x06 = Gameplay
//          ? 0x07 = Remove Puzzle Edge Lines
//          0x08 = Flash Winner
//          0x09 = Finished Run
function puzzleLandCpuState() => byte(0x0B0BFA)

function puzzleLandCpuPlaying => puzzleLandCpuState() == 0x06

// $0C6858: (8-bit) Mode 1 Game State
//          
//          0x00 = Fade In
//          0x01 = Slide in
//          0x03 = Start Count down
//          0x04 = Finish Count down.
//          0x07 = Remove Puzzle Edge Lines
//          0x08 = Flash Winner
//          0x09 = Finished Run
function normalModeGameState() => byte(0x0C6858)

function normalModeWon() => prev(normalModeGameState()) == 0x07 && normalModeGameState() == 0x08



achievement( title = "24-0  Perfect!",
             description = "Complete any 24 piece Puzzle with out making a mistake (Rotation Mode On)",
             points = 2,
             trigger = puzzleModeSelected() && 
                       pieceCount24() && 
                       noErrors() && 
                       totalCorrect() == 24 &&
                       normalModeWon() &&
                       rotationModeOn()
)

achievement( title = "96-0  Perfect!",
             description = "Complete any 96 piece Puzzle with out making a mistake (Rotation Mode On)",
             points = 4,
             trigger = puzzleModeSelected() && 
                       pieceCount96() && 
                       noErrors() && 
                       totalCorrect() == 96 &&
                       normalModeWon() &&
                       rotationModeOn()
                       
)   

achievement( tile = "150-0 Perfect!",
             description = "Complete any 150 piece Puzzle with out making a mistake (Rotation Mode On)",
             points = 5,
             trigger = puzzleModeSelected() && 
                       pieceCount150() && 
                       noErrors() && 
                       totalCorrect() == 150 &&
                       normalModeWon() &&
                       rotationModeOn()
)

NUMBER_OF_PUZZLES_IN_SET = 5
for data in PuzzleGroups
{
    achievement( title = format("{0} (24 piece)", data[NAME]),
                 description = format("Beat all five {0} puzzles with 24 pieces in one session (Rotation Mode On)", data[NAME]),
                 points = 5,
                 trigger = measured(tally_of(range(0, NUMBER_OF_PUZZLES_IN_SET), 5, 
                                                index => once( puzzleBeatenLookup(index + (data[ID] * NUMBER_OF_PUZZLES_IN_SET)) && 
                                                               totalCorrect() == 24 &&
                                                               puzzleModeSelected() &&
                                                               pieceCount24() &&
                                                               normalModeWon() &&
                                                               rotationModeOn()
    ))))

    achievement( title = format("{0} (96 piece)", data[NAME]),
                 description = format("Beat all five {0} puzzles with 96 piecesin one session (Rotation Mode On)", data[NAME]),
                 points = 10,
                 trigger = measured(tally_of(range(0, NUMBER_OF_PUZZLES_IN_SET), 5, 
                                                index => once( puzzleBeatenLookup(index + (data[ID] * NUMBER_OF_PUZZLES_IN_SET)) && 
                                                               totalCorrect() == 96 &&
                                                               puzzleModeSelected() &&
                                                               pieceCount96() &&
                                                               normalModeWon() &&
                                                               rotationModeOn()
    ))))

    achievement( title = format("{0} (150 piece)", data[NAME]),
                 description = format("Beat all five {0} puzzles with 150 pieces in one session (Rotation Mode On)", data[NAME]),
                 points = 15,
                 trigger = measured(tally_of(range(0, NUMBER_OF_PUZZLES_IN_SET), 5, 
                                                index => once( puzzleBeatenLookup(index + (data[ID] * NUMBER_OF_PUZZLES_IN_SET)) && 
                                                               totalCorrect() == 150 &&
                                                               puzzleModeSelected() &&
                                                               pieceCount150() &&
                                                               normalModeWon() &&
                                                               rotationModeOn()
    ))))
}

achievement( title = "Choose Any Puzzle",
             description = "Unlock all the puzzles in the puzzle mode",
             points = 2,
             trigger = pagesAvailable() == 0x16 &&
                       prev(pagesAvailable()) < 0x16 &&
                       prev(pagesAvailable()) > 0x04 &&  // default
                       puzzleModeSelected()
)

for data in OpponentInfo
{
    achievement( title = format("{0} (Easy)", data[NAME]),
                 description = format("Beat {0} in Alice in Puzzleland", OpponentLookup[data[ID]]),
                 points = data[EASY_POINTS],
                 trigger = opponentAlice() == data[ID] &&
                           storyModeSelected() &&
                           PlayerWon() &&
                           puzzleLandWon() &&
                           puzzleLandCpuPlaying() &&
                           ( easySelected() || normalSelected() || hardSelected() )
    )

    achievement( title = format("{0} (Medium)", data[NAME]),
                 description = format("Beat {0} in Alice in Puzzleland on Medium or Hard Difficulty", OpponentLookup[data[ID]]),
                 points = data[MEDIUM_POINTS],
                 trigger = opponentAlice() == data[ID] &&
                           storyModeSelected() &&
                           PlayerWon() &&
                           puzzleLandWon() &&
                           puzzleLandCpuPlaying() &&
                           ( normalSelected() || hardSelected() )
    )

    achievement( title = format("{0} (Hard)", data[NAME]),
                 description = format("Beat {0} in Alice in Puzzleland on Hard Difficulty", OpponentLookup[data[ID]]),
                 points = data[HARD_POINTS],
                 trigger = opponentAlice() == data[ID] &&
                           storyModeSelected() &&
                           PlayerWon() &&
                           puzzleLandWon() &&
                           puzzleLandCpuPlaying() &&
                           hardSelected()
    )   

}






            