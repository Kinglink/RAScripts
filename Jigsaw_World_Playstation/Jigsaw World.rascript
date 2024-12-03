// Jigsaw World
// #ID = 14953

ID = "ID"
NAME = "NAME"
EASY_POINTS = "EASY_POINTS"
MEDIUM_POINTS = "MEDIUM_POINTS"
HARD_POINTS = "HARD_POINTS"
TYPE = "TYPE"

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
function storyModeSelected() => modeIndicator() == STORY_MODE_VALUE

// $011000 (8-bit) Mode 1 Set
//
//          0x00 = Racing
//          0x01 = Sports
//          0x02 = Vacation
function puzzleSetIndex() => byte(0x011000)

// $011004: (8-bit) Mode 1 Puzzle
//          
//          0x00 = First puzzle
//          0x05 = First Basketball Puzzle
//          0x0a = First Beaches
//          0xf = Buildings
function puzzleIndex() => byte(0x011004)

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
function puzzleBeatenLookup(puzzleIndex) => PUZZLE_BEATEN_MEMORY_LOCATION + (puzzleIndex * SIZE_OF_PUZZLE_BEATEN )

function puzzlebeaten24(puzzleIndex) => bit0( puzzleBeatenLookup(puzzleIndex) ) == 1
function puzzlebeaten96(puzzleIndex) => bit1( puzzleBeatenLookup(puzzleIndex) ) == 1
function puzzlebeaten150(puzzleIndex) => bit2( puzzleBeatenLookup(puzzleIndex) ) == 1

function puzzleBeatenCount(puzzleIndex) => byte(puzzleBeatenLookup(puzzleIndex)) / byte(puzzleBeatenLookup(puzzleIndex))
function prevpuzzleBeatenCount(puzzleIndex) => prev(byte( puzzleBeatenLookup(puzzleIndex))) / prev(byte(puzzleBeatenLookup(puzzleIndex)))


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
        NAME: "Racing"
    },
    {
        ID: 0x01,
        NAME: "Sports"
    },
    {
        ID: 0x02,
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
    },
    {
        ID: 0x14,
        NAME: "More Photos"
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
        HARD_POINTS: 5,
        TYPE: "Progression"

    },
    {
        ID: 0x03,
        NAME: "Dealing with Cards",
        EASY_POINTS: 3,
        MEDIUM_POINTS: 4,
        HARD_POINTS: 5,
        TYPE: "Progression"

    },
    {
        ID: 0x04,
        NAME: "Fresh Bacon",
        EASY_POINTS: 3,
        MEDIUM_POINTS: 5,
        HARD_POINTS: 5,
        TYPE: "Progression"

    },
    {
        ID: 0x05,
        NAME: "Two Opponents, One Battle",
        EASY_POINTS: 3,
        MEDIUM_POINTS: 5,
        HARD_POINTS: 10,
        TYPE: "Progression"

    },
    {
        ID: 0x06,
        NAME: "Egg Drop",
        EASY_POINTS: 4,
        MEDIUM_POINTS: 5,
        HARD_POINTS: 10,
        TYPE: "Progression"

    },
    {
        ID: 0x07,
        NAME: "Pea Tear Griffin",
        EASY_POINTS: 4,
        MEDIUM_POINTS: 5,
        HARD_POINTS: 10,
        TYPE: "Progression"

    },
    {
        ID: 0x08,
        NAME: "Off With Her Head",
        EASY_POINTS: 5,
        MEDIUM_POINTS: 10,
        HARD_POINTS: 10,
        TYPE: "Progression"

    },
    {
        ID: 0x09,
        NAME: "The Moon's Smile",
        EASY_POINTS: 5,
        MEDIUM_POINTS: 10,
        HARD_POINTS: 25,
        TYPE: "Win_Condition"

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

function puzzleLandCpuPlaying() => puzzleLandCpuState() == 0x06

// $0B0BF4: (8-bit) Puzzleland Player Picture count
//
//  0x00 = First Picture
//  0x01 = Second Picture
//  0x02 = Third Picture
function puzzleLandPlayerPicture() => byte(0x0B0BF4)

function puzzleLandPlayerFinalPicture() => puzzleLandPlayerPicture() == 0x02

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
             description = "Complete any 24 piece Puzzle without making a mistake (Rotation Mode On)",
             points = 2,
             trigger = puzzleModeSelected() && 
                       pieceCount24() && 
                       noErrors() && 
                       totalCorrect() == 24 &&
                       normalModeWon() &&
                       rotationModeOn()
)

achievement( title = "96-0  Perfect!",
             description = "Complete any 96 piece Puzzle without making a mistake (Rotation Mode On)",
             points = 4,
             trigger = puzzleModeSelected() && 
                       pieceCount96() && 
                       noErrors() && 
                       totalCorrect() == 96 &&
                       normalModeWon() &&
                       rotationModeOn()
                       
)   

achievement( title = "150-0 Perfect!",
             description = "Complete any 150 piece Puzzle without making a mistake (Rotation Mode On)",
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
                 points = 3,
                 trigger = measured(tally_of(range(0, NUMBER_OF_PUZZLES_IN_SET - 1), 5, 
                                                index => once( puzzleIndex() == index &&
                                                               puzzleSetIndex() == data[ID] && 
                                                               totalCorrect() == 24 &&
                                                               puzzleModeSelected() &&
                                                               pieceCount24() &&
                                                               normalModeWon() &&
                                                               rotationModeOn()
    ))))

    achievement( title = format("{0} (96 piece)", data[NAME]),
                 description = format("Beat all five {0} puzzles with 96 pieces in one session (Rotation Mode On)", data[NAME]),
                 points = 5,
                 trigger = measured(tally_of(range(0, NUMBER_OF_PUZZLES_IN_SET), 5, 
                                                index => once( puzzleIndex() == index &&
                                                               puzzleSetIndex() == data[ID] && 
                                                               totalCorrect() == 96 &&
                                                               puzzleModeSelected() &&
                                                               pieceCount96() &&
                                                               normalModeWon() &&
                                                               rotationModeOn()
    ))))

    achievement( title = format("{0} (150 piece)", data[NAME]),
                 description = format("Beat all five {0} puzzles with 150 pieces in one session (Rotation Mode On)", data[NAME]),
                 points = 10,
                 trigger = measured(tally_of(range(0, NUMBER_OF_PUZZLES_IN_SET), 5, 
                                                index => once( puzzleIndex() == index &&
                                                               puzzleSetIndex() == data[ID] && 
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
             type = "Progression",
             trigger = pagesAvailable() == 0x16 &&
                       prev(pagesAvailable()) < 0x16 &&
                       prev(pagesAvailable()) > 0x04 &&  // default
                       puzzleModeSelected()
)

achievement( title = "Seen it all",
             description = "Beat each puzzle in the game at any size",
             points = 10,
             type = "Progression",
             trigger = measured(sum_of(range(0, 0x16 * 5 ), 
                                        index =>  puzzleBeatenCount(index) ) == 0x16 * 5 , 
                                        when = pagesAvailable() != 0 && puzzleModeSelected())  &&
                       sum_of(range(0, 0x16 * 5 - 1 ), 
                                        index => prevpuzzleBeatenCount(index) ) ==  0x16 * 5 - 1  &&
                       normalModeGameState() > 0x06 && 
                       normalModeGameState() < 0x09 &&  // probably is 8, but let's allow 7
                       puzzleModeSelected() 
)
                    

for data in OpponentInfo
{
    achievement( title = format("{0} (Easy)", data[NAME]),
                 description = format("Beat {0} in Alice in Puzzleland", OpponentLookup[data[ID]]),
                 type = data[TYPE],
                 points = data[EASY_POINTS],
                 trigger = opponentAlice() == data[ID] &&
                           storyModeSelected() &&
                           puzzleLandWon() &&
                           puzzleLandCpuPlaying() && 
                           puzzleLandPlayerFinalPicture() &&
                           ( easySelected() || normalSelected() || hardSelected() )
    )

    achievement( title = format("{0} (Medium)", data[NAME]),
                 description = format("Beat {0} in Alice in Puzzleland on Medium or Hard Difficulty", OpponentLookup[data[ID]]),
                 points = data[MEDIUM_POINTS],
                 trigger = opponentAlice() == data[ID] &&
                           storyModeSelected() &&
                           puzzleLandWon() &&
                           puzzleLandCpuPlaying() &&
                           puzzleLandPlayerFinalPicture() &&
                           ( normalSelected() || hardSelected() )
    )

    achievement( title = format("{0} (Hard)", data[NAME]),
                 description = format("Beat {0} in Alice in Puzzleland on Hard Difficulty", OpponentLookup[data[ID]]),
                 points = data[HARD_POINTS],
                 trigger = opponentAlice() == data[ID] &&
                           storyModeSelected() &&
                           puzzleLandWon() &&
                           puzzleLandCpuPlaying() &&
                           puzzleLandPlayerFinalPicture() &&
                           hardSelected()
    )   
}


leaderboard(
    title = "Fastest 24 Piece Puzzle",
    description = "Complete any 24 piece puzzle as fast as you can. (One player only, rotation mode on)",
    start  =
    (
        puzzleModeSelected() &&
        correctPiecesP1() == 24 &&
        correctPiecesP2() == 0 &&
        errorPiecesP2() == 0 &&
        pieceCount24() &&
        normalModeWon() &&
        rotationModeOn()
    ),
    cancel = always_false(),
    submit = always_true(),
    value = framesForPuzzleMode(),
    format = "FRAMES", 
    lower_is_better = true 
)


leaderboard(
    title = "Fastest 96 Piece Puzzle",
    description = "Complete any 96 piece puzzle as fast as you can. (One player only, rotation mode on)",
    start  =
    (
        puzzleModeSelected() &&
        correctPiecesP1() == 96 &&
        correctPiecesP2() == 0 &&
        errorPiecesP2() == 0 &&
        pieceCount96() &&
        normalModeWon() &&
        rotationModeOn()
    ),
    cancel = always_false(),
    submit = always_true(),
    value = framesForPuzzleMode(),
    format = "FRAMES", 
    lower_is_better = true 
)

leaderboard(
    title = "Fastest 150 Piece Puzzle",
    description = "Complete any 150 piece puzzle as fast as you can. (One player only, rotation mode on)",
    start  =
    (
        puzzleModeSelected() &&
        correctPiecesP1() == 150 &&
        correctPiecesP2() == 0 &&
        errorPiecesP2() == 0 &&
        pieceCount150() &&
        normalModeWon() &&
        rotationModeOn()
    ),
    cancel = always_false(),
    submit = always_true(),
    value = framesForPuzzleMode(),
    format = "FRAMES", 
    lower_is_better = true 
)

leaderboard(
    title = "Fastest Perfect 24 Piece Puzzle",
    description = "Complete any 24 piece puzzle as fast as you can with no errors. (One player only, rotation mode on)",
    start  =
    (
        puzzleModeSelected() &&
        correctPiecesP1() == 24 &&
        errorPiecesP1() == 0 &&
        correctPiecesP2() == 0 &&
        errorPiecesP2() == 0 &&
        pieceCount24() &&
        normalModeWon() &&
        rotationModeOn()
    ),
    cancel = always_false(),
    submit = always_true(),
    value = framesForPuzzleMode(),
    format = "FRAMES", 
    lower_is_better = true 
)


leaderboard(
    title = "Fastest Perfect 96 Piece Puzzle",
    description = "Complete any 96 piece puzzle as fast as you can with no mistakes. (One player only, rotation mode on)",
    start  =
    (
        puzzleModeSelected() &&
        correctPiecesP1() == 96 &&
        errorPiecesP1() == 0 &&
        correctPiecesP2() == 0 &&
        errorPiecesP2() == 0 &&
        pieceCount96() &&
        normalModeWon() &&
        rotationModeOn()
    ),
    cancel = always_false(),
    submit = always_true(),
    value = framesForPuzzleMode(),
    format = "FRAMES", 
    lower_is_better = true 
)

leaderboard(
    title = "Fastest Perfect150 Piece Puzzle",
    description = "Complete any 150 piece puzzle as fast as you can with no mistakes. (One player only, rotation mode on)",
    start  =
    (
        puzzleModeSelected() &&
        correctPiecesP1() == 150 &&
        errorPiecesP1() == 0 &&
        correctPiecesP2() == 0 &&
        errorPiecesP2() == 0 &&
        pieceCount150() &&
        normalModeWon() &&
        rotationModeOn()
    ),
    cancel = always_false(),
    submit = always_true(),
    value = framesForPuzzleMode(),
    format = "FRAMES", 
    lower_is_better = true 
)


puzzleNameLookup =
{
    0x00: "Racing",
    0x01: "Sports",
    0x02: "Vacation",
    0x03: "Architecture",
    0x04: "Oni and Demons",
    0x05: "Streets",
    0x06: "Anime Babes",
    0x07: "Beaches",
    0x08: "Art",
    0x09: "Tokyo Cityscapes",
    0x0a: "Cats and Dogs",
    0x0b: "Other Animals",
    0x0c: "Photos",
    0x0d: "Anime Characters",
    0x0e: "Flowers",
    0x0f: "Windows",
    0x10: "Tourism",
    0x11: "Vehicles",
    0x12: "Strange Art",
    0x13: "Birds",
    0x14: "More photos",
    0x15: "Random"
}

puzzleIndexLookup = 
{
    0x0: "1",
    0x1: "2",
    0x2: "3",
    0x3: "4",
    0x4: "5",
    0x5: "1",
    0x6: "2",
    0x7: "3",
    0x8: "4",
    0x9: "5",
    0xa: "1",
    0xb: "2",
    0xc: "3",
    0xd: "4",
    0xe: "5",
    0xf: "1",
    0x10: "2",
    0x11: "3",
    0x12: "4",
    0x13: "5",
    0x14: "1",
    0x15: "2",
    0x16: "3",
    0x17: "4",
    0x18: "5",
    0x19: "1",
    0x1a: "2",
    0x1b: "3",
    0x1c: "4",
    0x1d: "5",
    0x1e: "1",
    0x1f: "2",
    0x20: "3",
    0x21: "4",
    0x22: "5",
    0x23: "1",
    0x24: "2",
    0x25: "3",
    0x26: "4",
    0x27: "5",
    0x28: "1",
    0x29: "2",
    0x2a: "3",
    0x2b: "4",
    0x2c: "5",
    0x2d: "1",
    0x2e: "2",
    0x2f: "3",
    0x30: "4",
    0x31: "5",
    0x32: "1",
    0x33: "2",
    0x34: "3",
    0x35: "4",
    0x36: "5",
    0x37: "1",
    0x38: "2",
    0x39: "3",
    0x3a: "4",
    0x3b: "5",
    0x3c: "1",
    0x3d: "2",
    0x3e: "3",
    0x3f: "4",
    0x40: "5",
    0x41: "1",
    0x42: "2",
    0x43: "3",
    0x44: "4",
    0x45: "5",
    0x46: "1",
    0x47: "2",
    0x48: "3",
    0x49: "4",
    0x4a: "5",
    0x4b: "1",
    0x4c: "2",
    0x4d: "3",
    0x4e: "4",
    0x4f: "5",
    0x50: "1",
    0x51: "2",
    0x52: "3",
    0x53: "4",
    0x54: "5",
    0x55: "1",
    0x56: "2",
    0x57: "3",
    0x58: "4",
    0x59: "5",
    0x5a: "1",
    0x5b: "2",
    0x5c: "3",
    0x5d: "4",
    0x5e: "5",
    0x5f: "1",
    0x60: "2",
    0x61: "3",
    0x62: "4",
    0x63: "5",
    0x64: "1",
    0x65: "2",
    0x66: "3",
    0x67: "4",
    0x68: "5",
    0x69: "1",
    0x6a: "2",
    0x6b: "3",
    0x6c: "4",
    0x6d: "5"

}

PieceCountLookup =
{
    0x00: "24",
    0x01: "96",
    0x02: "150"
}

difficultyLookup =
{
    0x00: "Easy",
    0x01: "Normal",
    0x02: "Hard"
}

// 0x00 is fade in 0x09 is post game.  Note sometimes this will show when you quit a puzzle mid game but oh well. 
rich_presence_conditional_display(puzzleModeSelected() && normalModeGameState() > 0x00 && normalModeGameState() < 0x09,
                                  "Puzzle Mode: {0} Puzzle number {1} {2} Pieces",
                                  rich_presence_lookup("PuzzleNameLookup", puzzleSetIndex(), puzzleNameLookup), 
                                  rich_presence_value("Number",puzzleIndex()+1),
                                  rich_presence_lookup("PieceCountLookup", pieceCount(), PieceCountLookup)
                                  )

rich_presence_conditional_display(versusModeSelected(), "Versus Mode")

rich_presence_conditional_display(storyModeSelected() && opponentAlice() >= 0x02 && opponentAlice() <= 0x09, 
                                  "Alice in Puzzleland: Playing against {0} Difficulty: {1}",
                                  rich_presence_lookup("OpponentLookup", opponentAlice(), OpponentLookup),
                                  rich_presence_lookup("DifficultySelected", difficultySelected(), difficultyLookup)
                                  )

rich_presence_display( "In the Menus" )




            