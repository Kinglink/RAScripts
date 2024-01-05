// Girls in Motion Puzzle Vol. 1: Hiyake no Omoide + Himekuri
// #ID = 14954

// $10034A: (8-bit) Movie Indicator
//          
//          0x74 = Large Screen movie Playing.
//          0x7c = In a puzzle
//          Other values are possible.
function movieIndicator() => byte(0x10034A)

MOVIE_PLAYING_VALUE = 0x74
function isMoviePlaying() => prev(movieIndicator()) != MOVIE_PLAYING_VALUE && movieIndicator() == MOVIE_PLAYING_VALUE

// $1304C0: (8-bit) Menu Selection VS Puzzle
//          
//          0x1304c0 is the same as 0x1e8e3b
//          
//          0x00 = 1P vs 2P
//          0x01 = 1P vs Com1
//          0x02 = 1P vs Com2
function vsMenuSelection() => byte(0x1304C0)

VS_Puzzle_1_VS_2 = 0x00
VS_Puzzle_1_VS_CPU_1 = 0x01
VS_Puzzle_1_VS_CPU_2 = 0x02

vsPuzzleLookup = 
{
    VS_Puzzle_1_VS_2: "1P vs 2P",
    VS_Puzzle_1_VS_CPU_1: "1P vs Com 1",
    VS_Puzzle_1_VS_CPU_2: "1P vs Com 2",
    
}

// $1BF89C: (8-bit) Completed Indicator.
//          
//          Use 1bf89c and 1bf8a8 together.
//          
//          0x00 Current level Completed
//          Any other number when it's not.
//          
//          Note: This remains until a new level is started.  Use a delta.
function completeIndicatorPart1() => byte(0x1BF89C)

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
                                  completeIndicatorPart2() == COMPLETE_LEVEL_VALUE &&
                                  (prev(completeIndicatorPart1()) != COMPLETE_LEVEL_VALUE ||
                                   prev(completeIndicatorPart2()) != COMPLETE_LEVEL_VALUE )

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

// $1bfa1c: (372-bytes)  Array of Calendar Picture Unlocks.
//
//          12 arrays of 31 values, each representing a month. 
//
//          Note that if the month doesn't have 31 days, no picture will be shown for the extra days.
//
//          Feburary does have a picture for Feburary 29th.
function startOfDateArray() => 0x1bfa1c

DAYS_IN_MONTH = 31
LOCKED_VALUE = 0x00
UNLOCKED_VALUE = 0x01

adjustment =
{
    0: 1,
    1: -1,
    2: 1,
    3: -1,
}
function dateUnlockLookup(month, day) => startOfDateArray() +  day - 1 + ((month -1) * DAYS_IN_MONTH) + adjustment[(day - 1 + ((month-1) * DAYS_IN_MONTH)) % 4]

weeks =
[
    {
        "week": 1,
        "name": "National Bobblehead Day",
        "arrayOfDates": [
            {"month": 1,"day": 1},
            {"month": 1,"day": 2},
            {"month": 1,"day": 3},
            {"month": 1,"day": 4},
            {"month": 1,"day": 5},
            {"month": 1,"day": 6},
            {"month": 1,"day": 7}
        ]
    },
    {
        "week": 2,
        "name": "World Logic Day",
        "arrayOfDates": [
            {"month": 1,"day": 8},
            {"month": 1,"day": 9},
            {"month": 1,"day": 10},
            {"month": 1,"day": 11},
            {"month": 1,"day": 12},
            {"month": 1,"day": 13},
            {"month": 1,"day": 14}
        ]
    },
    {
        "week": 3,
        "name": "National Bagel Day",
        "arrayOfDates": [
            {"month": 1,"day": 15},
            {"month": 1,"day": 16},
            {"month": 1,"day": 17},
            {"month": 1,"day": 18},
            {"month": 1,"day": 19},
            {"month": 1,"day": 20},
            {"month": 1,"day": 21}
        ]
    },
    {
        "week": 4,
        "name": "National Lego Day",
        "arrayOfDates": [
            {"month": 1,"day": 22},
            {"month": 1,"day": 23},
            {"month": 1,"day": 24},
            {"month": 1,"day": 25},
            {"month": 1,"day": 26},
            {"month": 1,"day": 27},
            {"month": 1,"day": 28}
        ]
    },
    {
        "week": 5,
        "name": "National Puzzle Day",
        "arrayOfDates": [
            {"month": 1,"day": 29},
            {"month": 1,"day": 30},
            {"month": 1,"day": 31},
            {"month": 2,"day": 1},
            {"month": 2,"day": 2},
            {"month": 2,"day": 3},
            {"month": 2,"day": 4}
        ]
    },
    {
        "week": 6,
        "name": "Safer Internet Day",
        "arrayOfDates": [
            {"month": 2,"day": 5},
            {"month": 2,"day": 6},
            {"month": 2,"day": 7},
            {"month": 2,"day": 8},
            {"month": 2,"day": 9},
            {"month": 2,"day": 10},
            {"month": 2,"day": 11}
        ]
    },
    {
        "week": 7,
        "name": "Pluto Day",
        "arrayOfDates": [
            {"month": 2,"day": 12},
            {"month": 2,"day": 13},
            {"month": 2,"day": 14},
            {"month": 2,"day": 15},
            {"month": 2,"day": 16},
            {"month": 2,"day": 17},
            {"month": 2,"day": 18}
        ]
    },
    {
        "week": 8,
        "name": "National Clam Chowder Day",
        "arrayOfDates": [
            {"month": 2,"day": 19},
            {"month": 2,"day": 20},
            {"month": 2,"day": 21},
            {"month": 2,"day": 22},
            {"month": 2,"day": 23},
            {"month": 2,"day": 24},
            {"month": 2,"day": 25}
        ]
    },
    {
        "week": 9,
        "name": "National Pokemon Day",
        "arrayOfDates": [
            {"month": 2,"day": 26},
            {"month": 2,"day": 27},
            {"month": 2,"day": 28},
            {"month": 2,"day": 29},
            {"month": 3,"day": 1},
            {"month": 3,"day": 2},
            {"month": 3,"day": 3}
        ]
    },
    {
        "week": 10,
        "name": "National Day of Unplugging",
        "arrayOfDates": [
            {"month": 3,"day": 4},
            {"month": 3,"day": 5},
            {"month": 3,"day": 6},
            {"month": 3,"day": 7},
            {"month": 3,"day": 8},
            {"month": 3,"day": 9},
            {"month": 3,"day": 10}
        ]
    },
    {
        "week": 11,
        "name": "Pi Day",
        "arrayOfDates": [
            {"month": 3,"day": 11},
            {"month": 3,"day": 12},
            {"month": 3,"day": 13},
            {"month": 3,"day": 14},
            {"month": 3,"day": 15},
            {"month": 3,"day": 16},
            {"month": 3,"day": 17}
        ]
    },
    {
        "week": 12,
        "name": "National Kick Butts Day",
        "arrayOfDates": [
            {"month": 3,"day": 18},
            {"month": 3,"day": 19},
            {"month": 3,"day": 20},
            {"month": 3,"day": 21},
            {"month": 3,"day": 22},
            {"month": 3,"day": 23},
            {"month": 3,"day": 24}
        ]
    },
    {
        "week": 13,
        "name": "Earth Hour... Day",
        "arrayOfDates": [
            {"month": 3,"day": 25},
            {"month": 3,"day": 26},
            {"month": 3,"day": 27},
            {"month": 3,"day": 28},
            {"month": 3,"day": 29},
            {"month": 3,"day": 30},
            {"month": 3,"day": 31}
        ]
    },
    {
        "week": 14,
        "name": "National Burrito Day",
        "arrayOfDates": [
            {"month": 4,"day": 1},
            {"month": 4,"day": 2},
            {"month": 4,"day": 3},
            {"month": 4,"day": 4},
            {"month": 4,"day": 5},
            {"month": 4,"day": 6},
            {"month": 4,"day": 7}
        ]
    },
    {
        "week": 15,
        "name": "National Name Yourself Day",
        "arrayOfDates": [
            {"month": 4,"day": 8},
            {"month": 4,"day": 9},
            {"month": 4,"day": 10},
            {"month": 4,"day": 11},
            {"month": 4,"day": 12},
            {"month": 4,"day": 13},
            {"month": 4,"day": 14}
        ]
    },
    {
        "week": 16,
        "name": "National Columnists’ Day",
        "arrayOfDates": [
            {"month": 4,"day": 15},
            {"month": 4,"day": 16},
            {"month": 4,"day": 17},
            {"month": 4,"day": 18},
            {"month": 4,"day": 19},
            {"month": 4,"day": 20},
            {"month": 4,"day": 21}
        ]
    },
    {
        "week": 17,
        "name": "International Creativity and Innovation Day",
        "arrayOfDates": [
            {"month": 4,"day": 22},
            {"month": 4,"day": 23},
            {"month": 4,"day": 24},
            {"month": 4,"day": 25},
            {"month": 4,"day": 26},
            {"month": 4,"day": 27},
            {"month": 4,"day": 28}
        ]
    },
    {
        "week": 18,
        "name": "No Pants Day",
        "arrayOfDates": [
            {"month": 4,"day": 29},
            {"month": 4,"day": 30},
            {"month": 5,"day": 1},
            {"month": 5,"day": 2},
            {"month": 5,"day": 3},
            {"month": 5,"day": 4},
            {"month": 5,"day": 5}
        ]
    },
    {
        "week": 19,
        "name": "International No Diet Day",
        "arrayOfDates": [
            {"month": 5,"day": 6},
            {"month": 5,"day": 7},
            {"month": 5,"day": 8},
            {"month": 5,"day": 9},
            {"month": 5,"day": 10},
            {"month": 5,"day": 11},
            {"month": 5,"day": 12}
        ]
    },
    {
        "week": 20,
        "name": "World Baking Day",
        "arrayOfDates": [
            {"month": 5,"day": 13},
            {"month": 5,"day": 14},
            {"month": 5,"day": 15},
            {"month": 5,"day": 16},
            {"month": 5,"day": 17},
            {"month": 5,"day": 18},
            {"month": 5,"day": 19}
        ]
    },
    {
        "week": 21,
        "name": "World Goth Day",
        "arrayOfDates": [
            {"month": 5,"day": 20},
            {"month": 5,"day": 21},
            {"month": 5,"day": 22},
            {"month": 5,"day": 23},
            {"month": 5,"day": 24},
            {"month": 5,"day": 25},
            {"month": 5,"day": 26}
        ]
    },
    {
        "week": 22,
        "name": "National Brisket Day",
        "arrayOfDates": [
            {"month": 5,"day": 27},
            {"month": 5,"day": 28},
            {"month": 5,"day": 29},
            {"month": 5,"day": 30},
            {"month": 5,"day": 31},
            {"month": 6,"day": 1},
            {"month": 6,"day": 2}
        ]
    },
    {
        "week": 23,
        "name": "Leave The Office Early Day",
        "arrayOfDates": [
            {"month": 6,"day": 3},
            {"month": 6,"day": 4},
            {"month": 6,"day": 5},
            {"month": 6,"day": 6},
            {"month": 6,"day": 7},
            {"month": 6,"day": 8},
            {"month": 6,"day": 9}
        ]
    },
    {
        "week": 24,
        "name": "Kamehameha Day",
        "arrayOfDates": [
            {"month": 6,"day": 10},
            {"month": 6,"day": 11},
            {"month": 6,"day": 12},
            {"month": 6,"day": 13},
            {"month": 6,"day": 14},
            {"month": 6,"day": 15},
            {"month": 6,"day": 16}
        ]
    },
    {
        "week": 25,
        "name": "World Sauntering Day",
        "arrayOfDates": [
            {"month": 6,"day": 17},
            {"month": 6,"day": 18},
            {"month": 6,"day": 19},
            {"month": 6,"day": 20},
            {"month": 6,"day": 21},
            {"month": 6,"day": 22},
            {"month": 6,"day": 23}
        ]
    },
    {
        "week": 26,
        "name": "Please Take My Children To Work Day",
        "arrayOfDates": [
            {"month": 6,"day": 24},
            {"month": 6,"day": 25},
            {"month": 6,"day": 26},
            {"month": 6,"day": 27},
            {"month": 6,"day": 28},
            {"month": 6,"day": 29},
            {"month": 6,"day": 30}
        ]
    },
    {
        "week": 27,
        "name": "I Forgot Day",
        "arrayOfDates": [
            {"month": 7,"day": 1},
            {"month": 7,"day": 2},
            {"month": 7,"day": 3},
            {"month": 7,"day": 4},
            {"month": 7,"day": 5},
            {"month": 7,"day": 6},
            {"month": 7,"day": 7}
        ]
    },
    {
        "week": 28,
        "name": "Cow Appreciation Day",
        "arrayOfDates": [
            {"month": 7,"day": 8},
            {"month": 7,"day": 9},
            {"month": 7,"day": 10},
            {"month": 7,"day": 11},
            {"month": 7,"day": 12},
            {"month": 7,"day": 13},
            {"month": 7,"day": 14}
        ]
    },
    {
        "week": 29,
        "name": "World Jump Day",
        "arrayOfDates": [
            {"month": 7,"day": 15},
            {"month": 7,"day": 16},
            {"month": 7,"day": 17},
            {"month": 7,"day": 18},
            {"month": 7,"day": 19},
            {"month": 7,"day": 20},
            {"month": 7,"day": 21}
        ]
    },
    {
        "week": 30,
        "name": "National Gorgeous Grandma Day",
        "arrayOfDates": [
            {"month": 7,"day": 22},
            {"month": 7,"day": 23},
            {"month": 7,"day": 24},
            {"month": 7,"day": 25},
            {"month": 7,"day": 26},
            {"month": 7,"day": 27},
            {"month": 7,"day": 28}
        ]
    },
    {
        "week": 31,
        "name": "National Lipstick Day",
        "arrayOfDates": [
            {"month": 7,"day": 29},
            {"month": 7,"day": 30},
            {"month": 7,"day": 31},
            {"month": 8,"day": 1},
            {"month": 8,"day": 2},
            {"month": 8,"day": 3},
            {"month": 8,"day": 4}
        ]
    },
    {
        "week": 32,
        "name": "National Spoil Your Dog Day",
        "arrayOfDates": [
            {"month": 8,"day": 5},
            {"month": 8,"day": 6},
            {"month": 8,"day": 7},
            {"month": 8,"day": 8},
            {"month": 8,"day": 9},
            {"month": 8,"day": 10},
            {"month": 8,"day": 11}
        ]
    },
    {
        "week": 33,
        "name": "Happy Kinglink's Birthday Day",
        "arrayOfDates": [
            {"month": 8,"day": 12},
            {"month": 8,"day": 13},
            {"month": 8,"day": 14},
            {"month": 8,"day": 15},
            {"month": 8,"day": 16},
            {"month": 8,"day": 17},
            {"month": 8,"day": 18}
        ]
    },
    {
        "week": 34,
        "name": "Pluto Demoted Day",
        "arrayOfDates": [
            {"month": 8,"day": 19},
            {"month": 8,"day": 20},
            {"month": 8,"day": 21},
            {"month": 8,"day": 22},
            {"month": 8,"day": 23},
            {"month": 8,"day": 24},
            {"month": 8,"day": 25}
        ]
    },
    {
        "week": 35,
        "name": "National WebMistress Day",
        "arrayOfDates": [
            {"month": 8,"day": 26},
            {"month": 8,"day": 27},
            {"month": 8,"day": 28},
            {"month": 8,"day": 29},
            {"month": 8,"day": 30},
            {"month": 8,"day": 31},
            {"month": 9,"day": 1}
        ]
    },
    {
        "week": 36,
        "name": "Bison Ten Yell Day",
        "arrayOfDates": [
            {"month": 9,"day": 2},
            {"month": 9,"day": 3},
            {"month": 9,"day": 4},
            {"month": 9,"day": 5},
            {"month": 9,"day": 6},
            {"month": 9,"day": 7},
            {"month": 9,"day": 8}
        ]
    },
    {
        "week": 37,
        "name": "Day of the Programmer",
        "arrayOfDates": [
            {"month": 9,"day": 9},
            {"month": 9,"day": 10},
            {"month": 9,"day": 11},
            {"month": 9,"day": 12},
            {"month": 9,"day": 13},
            {"month": 9,"day": 14},
            {"month": 9,"day": 15}
        ]
    },
    {
        "week": 38,
        "name": "National Queso Day",
        "arrayOfDates": [
            {"month": 9,"day": 16},
            {"month": 9,"day": 17},
            {"month": 9,"day": 18},
            {"month": 9,"day": 19},
            {"month": 9,"day": 20},
            {"month": 9,"day": 21},
            {"month": 9,"day": 22}
        ]
    },
    {
        "week": 39,
        "name": "World Gorilla Day",
        "arrayOfDates": [
            {"month": 9,"day": 23},
            {"month": 9,"day": 24},
            {"month": 9,"day": 25},
            {"month": 9,"day": 26},
            {"month": 9,"day": 27},
            {"month": 9,"day": 28},
            {"month": 9,"day": 29}
        ]
    },
    {
        "week": 40,
        "name": "National Custodian Day",
        "arrayOfDates": [
            {"month": 9,"day": 30},
            {"month": 10,"day": 1},
            {"month": 10,"day": 2},
            {"month": 10,"day": 3},
            {"month": 10,"day": 4},
            {"month": 10,"day": 5},
            {"month": 10,"day": 6}
        ]
    },
    {
        "week": 41,
        "name": "National No Bra Day",
        "arrayOfDates": [
            {"month": 10,"day": 7},
            {"month": 10,"day": 8},
            {"month": 10,"day": 9},
            {"month": 10,"day": 10},
            {"month": 10,"day": 11},
            {"month": 10,"day": 12},
            {"month": 10,"day": 13}
        ]
    },
    {
        "week": 42,
        "name": "World Okapi Day",
        "arrayOfDates": [
            {"month": 10,"day": 14},
            {"month": 10,"day": 15},
            {"month": 10,"day": 16},
            {"month": 10,"day": 17},
            {"month": 10,"day": 18},
            {"month": 10,"day": 19},
            {"month": 10,"day": 20}
        ]
    },
    {
        "week": 43,
        "name": "National Clean Your Virtual Desktop Day",
        "arrayOfDates": [
            {"month": 10,"day": 21},
            {"month": 10,"day": 22},
            {"month": 10,"day": 23},
            {"month": 10,"day": 24},
            {"month": 10,"day": 25},
            {"month": 10,"day": 26},
            {"month": 10,"day": 27}
        ]
    },
    {
        "week": 44,
        "name": "National Text Your Ex Day",
        "arrayOfDates": [
            {"month": 10,"day": 28},
            {"month": 10,"day": 29},
            {"month": 10,"day": 30},
            {"month": 10,"day": 31},
            {"month": 11,"day": 1},
            {"month": 11,"day": 2},
            {"month": 11,"day": 3}
        ]
    },
    {
        "week": 45,
        "name": "American Football Day",
        "arrayOfDates": [
            {"month": 11,"day": 4},
            {"month": 11,"day": 5},
            {"month": 11,"day": 6},
            {"month": 11,"day": 7},
            {"month": 11,"day": 8},
            {"month": 11,"day": 9},
            {"month": 11,"day": 10}
        ]
    },
    {
        "week": 46,
        "name": "National Unfriend Day",
        "arrayOfDates": [
            {"month": 11,"day": 11},
            {"month": 11,"day": 12},
            {"month": 11,"day": 13},
            {"month": 11,"day": 14},
            {"month": 11,"day": 15},
            {"month": 11,"day": 16},
            {"month": 11,"day": 17}
        ]
    },
    {
        "week": 47,
        "name": "Fibonacci Day",
        "arrayOfDates": [
            {"month": 11,"day": 18},
            {"month": 11,"day": 19},
            {"month": 11,"day": 20},
            {"month": 11,"day": 21},
            {"month": 11,"day": 22},
            {"month": 11,"day": 23},
            {"month": 11,"day": 24}
        ]
    },
    {
        "week": 48,
        "name": "National Mason Jar Day",
        "arrayOfDates": [
            {"month": 11,"day": 25},
            {"month": 11,"day": 26},
            {"month": 11,"day": 27},
            {"month": 11,"day": 28},
            {"month": 11,"day": 29},
            {"month": 11,"day": 30},
            {"month": 12,"day": 1}
        ]
    },
    {
        "week": 49,
        "name": "Day of the Ninja",
        "arrayOfDates": [
            {"month": 12,"day": 2},
            {"month": 12,"day": 3},
            {"month": 12,"day": 4},
            {"month": 12,"day": 5},
            {"month": 12,"day": 6},
            {"month": 12,"day": 7},
            {"month": 12,"day": 8}
        ]
    },
    {
        "week": 50,
        "name": "Dewey Decimal System Day",
        "arrayOfDates": [
            {"month": 12,"day": 9},
            {"month": 12,"day": 10},
            {"month": 12,"day": 11},
            {"month": 12,"day": 12},
            {"month": 12,"day": 13},
            {"month": 12,"day": 14},
            {"month": 12,"day": 15}
        ]
    },
    {
        "week": 51,
        "name": "Look on the Bright Side Day",
        "arrayOfDates": [
            {"month": 12,"day": 16},
            {"month": 12,"day": 17},
            {"month": 12,"day": 18},
            {"month": 12,"day": 19},
            {"month": 12,"day": 20},
            {"month": 12,"day": 21},
            {"month": 12,"day": 22}
        ]
    },
    {
        "week": 52,
        "name": "National Download Day",
        "arrayOfDates": [
            {"month": 12,"day": 23},
            {"month": 12,"day": 24},
            {"month": 12,"day": 25},
            {"month": 12,"day": 26},
            {"month": 12,"day": 27},
            {"month": 12,"day": 28},
            {"month": 12,"day": 29}
        ]
    },
    {
        "week": 53,
        "name": "National Bacon Day",
        "arrayOfDates": [
            {"month": 12,"day": 30},
            {"month": 12,"day": 31}
        ]
    }
]


// $1BFBA6: (8-bit) Practice Mode
//          
//          0x00 = Practice Mode
//          0x01 = Normal Mode.
//          
//          Practice mode should be blocked for any time, or life value
function practiceModeToggle() => byte(0x1BFBA6)

PRACTICE_MODE_VALUE = 0x00
NORMAL_MODE_VALUE = 0x01
function practiceModeCheck() => practiceModeToggle() == NORMAL_MODE_VALUE

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


// $1dc760: (8-bit) Main Menu Selection
// 
//          0x00 = Movie Puzzle
//          0x01 = Vs Puzzle
//          0x02 = Calendar Choice. 
function mainMenuSelection() => byte(0x1dc760)

MAIN_MENU_MOVIE_PUZZLE = 0x00
MAIN_MENU_VS_PUZZLE = 0x01
MAIN_MENU_CALENDAR_VALUE = 0x02 
function mainMenuCalendarChoice() => mainMenuSelection() == MAIN_MENU_CALENDAR_VALUE


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

function timerInFrames() => (lowerTimerBits() + (upperTimerBits() * 0x10000))

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

function detectLifeLoss() => lifeLeft() < prev(lifeLeft()) ||
                             (prev(incrementalLife()) != 0 && 
                              incrementalLife() == 0 && 
                              lifeLeft() != 0xf && 
                              lifeLeft() <= prev(lifeLeft())
                             )
                              


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


// $1e018e :(8-bit) Menu for Movie Puzzle Indicator
//
//          0x00 in game for Movie Puzzle, 
//          0x01 Menu for Movie puzzle. 
//
//          Other values are possible if not in movie puzzle. 
function MoviePuzzleIndicator() => byte(0x1e018e)

IN_GAME_MOVIE_PUZZLE_VALUE = 0x00

function inMoviePuzzle() => MoviePuzzleIndicator() == IN_GAME_MOVIE_PUZZLE_VALUE

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

function vsMode1RoundP1Won() => vsMode1RoundOption() && prev(player1Wins()) == 0 && player1Wins() == 1
function vsMode3RoundP1Won() => vsMode3RoundOption() && prev(player1Wins()) == 1 && player1Wins() == 2
function vsMode5RoundP1Won() => vsMode5RoundOption() && prev(player1Wins()) == 2 && player1Wins() == 3

vsRoundCountLookup = 
{
    VS_1_ROUND_VALUE: "Best of 1",
    VS_3_ROUND_VALUE: "Best of 3",
    VS_5_ROUND_VALUE: "Best of 5"
}

// $1bfbaa: (8-bit) Month for Calendar
// 
//          0x01-0x12
function currentMonth() => byte(0x1bfbaa)

// $1bfbad: (8-bit) Calculated day for Calendar Puzzle
function currentDate() => byte(0x1bfbad)

monthLookup =
{
    1: "January",
    2: "Feburary",
    3: "March",
    4: "April",
    5: "May",
    6: "June",
    7: "July",
    8: "August",
    9: "September",
    10: "October",
    11: "November",
    12: "December"
}

function girlUnlocks(id)
{
    achievement(title = girlLookup[id],
                description = format("Complete all four puzzles of {0} in one session. No Practice mode, these women only respect real jigsaw masters.", girlLookup[id]),
                points = 5,                
                trigger = measured(tally_of(range(0,3), 
                                            4,  
                                            index => once(moviePuzzleMode() &&
                                                          girlId() == id &&
                                                          sceneId() == index &&
                                                          moviePuzzleComplete() &&
                                                          practiceModeCheck()
                                                         )
                                           )
                                  )
                                  
                                  
                )
}

for girl in girlLookup
{
    girlUnlocks(id = girl)
}

timeRequirements =
{
    1: {"minutes": 1, "seconds": 45 , "string": "one minute and fourty five seconds", "points": 10},
    2: {"minutes": 2, "seconds": 30 , "string": "two minutes and thirty seconds", "points": 10},
    3: {"minutes": 3, "seconds": 00 , "string": "three minutes", "points": 10},
    4: {"minutes": 3, "seconds": 30 , "string": "three minutes and thirty seconds", "points": 10},
}

for targetSceneId in range(1,4)
{
    letterIs = ""
    for id in range(1,targetSceneId)
    {
        letterIs = letterIs + "I"
    }
    achievement(title = format("Perfection {0}", letterIs),
            description = format("Complete a scene {0} puzzles for any woman with out making a mistake or discarding a tile. No Practice mode.", targetSceneId),
            points = 5,                
            trigger = moviePuzzleMode() &&
                      inMoviePuzzle() &&
                      sceneId() == targetSceneId - 1 &&
                      once(timerInFrames() == 1) &&
                      never (sceneId() != prev(sceneId())) &&
                      never(!moviePuzzleMode()) &&
                      never(tileDiscarded()) &&
                      never(detectLifeLoss()) &&
                      trigger_when(moviePuzzleComplete()) &&
                      practiceModeCheck()
            )
            
    achievement(title = format("Jigsaw Race {0}", letterIs),
            description = format("Complete a scene {0} puzzles in under {1}. No Practice mode.", targetSceneId, timeRequirements[targetSceneId]["string"]),
            points = timeRequirements[targetSceneId]["points"],
            trigger = moviePuzzleMode() &&
                      inMoviePuzzle() &&
                      sceneId() == targetSceneId - 1 &&
                      timerInFrames() <= (timeRequirements[targetSceneId]["minutes"] * 60 + timeRequirements[targetSceneId]["seconds"]) * 60 && 
                      trigger_when(moviePuzzleComplete()) &&
                      practiceModeCheck()
            )
     leaderboard(title = format("Fastest Stage {0}", targetSceneId),
                description = format("Beat a stage {0} puzzle from any woman as fast as possible", targetSceneId),
                start = moviePuzzleMode() &&
                        inMoviePuzzle() &&
                        sceneId() == targetSceneId - 1 &&
                        trigger_when(moviePuzzleComplete()) &&
                        practiceModeCheck(),
                cancel = always_false(),
                submit = always_true(),
                value = timerInFrames(),
                lower_is_better = true,
                format = "FRAMES"
                )
}

vsCPUInfo = 
{
    VS_1_ROUND_VALUE: {"string": "one", "vsCheck": vsMode1RoundP1Won(), "points1": 2, "points2": 5},
    VS_3_ROUND_VALUE: {"string": "three", "vsCheck": vsMode3RoundP1Won(), "points1": 3, "points2": 5},
    VS_5_ROUND_VALUE: {"string": "five", "vsCheck": vsMode5RoundP1Won(), "points1": 4, "points2": 10},
}

for id in [VS_1_ROUND_VALUE, VS_3_ROUND_VALUE, VS_5_ROUND_VALUE]
{
    letterIs = ""
    for id in range(0,id)
    {
        letterIs = letterIs + "I"
    }
    achievement(title = format("Easy Peasy {0}", letterIs),
            description = format("Complete a VS CPU 1 best ouf of {0}.", vsCPUInfo[id]["string"]),
            points = vsCPUInfo[id]["points1"],                
            trigger = vsPuzzleMode() &&
                      playerVsCom1() &&
                      vsCPUInfo[id]["vsCheck"]
            )
    
    achievement(title = format("The Real Deal {0}", letterIs),
            description = format("Complete a VS CPU 2 best ouf of {0}.", vsCPUInfo[id]["string"]),
            points = vsCPUInfo[id]["points2"],                
            trigger = vsPuzzleMode() &&
                      playerVsCom2() &&
                      vsCPUInfo[id]["vsCheck"]
            )
}

achievement(title = "Celebrating Your Special Day",
            description = "Enjoy a special video from all the women, and then have a big slice of cake",
            points = 1,                
            trigger = mainMenuCalendarChoice() &&
                      isMoviePlaying()
            )

function generateCalendarTrigger(week) => mainMenuCalendarChoice() && 
                                          tally_of(week["arrayOfDates"], 
                                                   1, 
                                                   a => once(prev(byte( dateUnlockLookup(a["month"], a["day"]))) == LOCKED_VALUE)) &&
                                          measured(tally_of(week["arrayOfDates"], 
                                                            length(week["arrayOfDates"]), 
                                                            a => once(byte( dateUnlockLookup(a["month"], a["day"])) == UNLOCKED_VALUE )))
                                    

function weekAchievement(week) 
{
    lastValue = length(week["arrayOfDates"]) - 1
    points = 5
    if(lastValue != 6)
    {
        points = 2
    }
    achievement(title = week["name"],
                description = format("Earn all the pictures in Himekumi mode from {0} {1} to {2} {3}.", 
                                    monthLookup[week["arrayOfDates"][0]["month"]],
                                    week["arrayOfDates"][0]["day"],
                                    monthLookup[week["arrayOfDates"][lastValue]["month"]],
                                    week["arrayOfDates"][lastValue]["day"]),
                points = points,
                trigger = generateCalendarTrigger(week)
     )
}

for week in weeks
{
    weekAchievement(week)
}

rich_presence_conditional_display(moviePuzzleMode() && inMoviePuzzle(), 
                                  "Movie Puzzle.  Woman: {0} Scene: {1}",
                                  rich_presence_lookup("womanLookup", girlId(), girlLookup),
                                  rich_presence_value("Number", sceneId()+1))

rich_presence_conditional_display(vsPuzzleMode(), 
                                  "VS Puzzle Mode: {0} {1} P1 Score:  P2 Score",
                                  rich_presence_lookup("vsPuzzleLookup", vsMenuSelection(), vsPuzzleLookup),
                                  rich_presence_lookup("vsRoundCountLookup", vsModeRoundCount(), vsRoundCountLookup),
                                  rich_presence_value("Number", player1Wins()),
                                  rich_presence_value("Number", player2Wins()))


rich_presence_conditional_display(mainMenuSelection() == MAIN_MENU_CALENDAR_VALUE(), 
                                  "Himekuri Mode: Playing {0} {1}, unlocked {2}/366", 
                                  rich_presence_lookup("MonthLookup", currentMonth(), monthLookup), 
                                  rich_presence_value("Number", currentDate()),
                                  rich_presence_value("Number", sum_of( range(0, (12*31) - 1), i => byte(startOfDateArray() + i)))
                                  )

rich_presence_display("Enjoying beautiful women, and moving puzzles") // intentionally adding a period to signify a problem. 

