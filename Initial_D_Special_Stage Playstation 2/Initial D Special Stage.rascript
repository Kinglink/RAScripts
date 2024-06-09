// Initial D: Special Stage
// #ID = 24419

storyMissionLookup =
{
    0x00: "Let's Buy an Eight-Six (Part 1)",
    0x01: "Let's Buy an Eight-Six (Part 2)",
    0x02: "The Ultimate Tofu Vendor Drift",
    0x03: "Dogfight",
    0x04: "Iketani's Valuable Experience",
    0x05: "Stupid Father, Bring Back the Eight-Six!!",
    0x06: "Battle to the Limit",
    0x07: "Deathmatch of Madness",
    0x08: "Sparkling Line Cross!!",
    0x09: "Hot Winds! Mad Racing! Usui Pass",
    0x0a: "Know the Fear of the Rain Battle",
    0x0b: "High Tech vs. Super Technique",
    0x0c: "Let Takumi Do the Driving!!",
    0x0d: "Suicidal Fireball Battle",
    0x0e: "The Seal Shall Be Released",
    0x0f: "Hunch of Awakening",
    0x10: "Challenge!! Irohazaka",
    0x11: "Further Inside Corner!!",
    0x12: "Blazing Course Record",
    0x13: "Eve Of The Rivals",
    0x14: "Conflicting Pride!!",
    0x15: "Trial Battle",
    0x16: "Breakthrough of Fear!!",
    0x17: "A Critical Moment for the FD!!",
    0x18: "Who is the More Reckless!",
    0x19: "Full Throttle Hill Climb!!",
    0x1a: "Don't Look Behind",
    0x1b: "Takumi Attacks!!",
    0x1c: "A Turbo FF Driving",
    0x1d: "Blind Attack",
    0x1e: "A Nightmarish Machine"
}

// $22d284: (32-bit) Save Indicator 
//
//          0xffffffff = Not Saving
//          0x0000000b = Save menu or initial save. 
function saveIndicator() => dword(0x22D284)
NOT_SAVING_VALUE = 0xFFFFFFFF

function notSaving() => saveIndicator() == NOT_SAVING_VALUE

// $2F394B: (8-bit) Arcade Difficulty 
//
//          0x01 = Easy
//          0x02 = Medium 
//          0x03 = Hard
function arcadeDifficulty() => byte(0x2F394B)
HARD_DIFFICULTY_VALUE = 0x03

function arcadeHardMode() => arcadeDifficulty() == HARD_DIFFICULTY_VALUE


// $2F3951: (32 array of 8-bit values) Iketani Car Guide
//          
//          Each byte is either 0x00 or 0x01
//          
//          0x00 = Unowned
//          0x01 = Owned.  when all 20 bytes are 0x01, you can hear Iggy talk about any car.   But why would you?
IKETANI_CAR_GUIDE_MEMORY_LOCATION = 0x2F3951
function iketaniCarGuide() => byte(0x2F3951)

function iketaniCarCount() => sum_of(range(0,31), i => byte(IKETANI_CAR_GUIDE_MEMORY_LOCATION + i))

// $2F3972: (31 array of 8-bit) Song Unlocks
//          
//          0x0 = Locked
//          0x1 = Unlocked
//          
//          Starts with 11 songs unlocked.
SONG_UNLOCK_MEMORY_LOCATION = 0x2F3972
function songUnlock() => byte(0x2F3972)
SONGS_ALREADY_UNLOCKED = 11
TOTAL_SONGS = 31

function songCount() => SONGS_ALREADY_UNLOCKED + sum_of(range(0, TOTAL_SONGS - 1), i => byte(SONG_UNLOCK_MEMORY_LOCATION + i))

// $3172E0: (8-bit) Story mode Progression
//          
//          How many Stages are complete
//          
//          0x01 = Stage 1 Complete
//          0x02 = Stage 2 Complete
function storyModeProgress() => byte(0x3172E0)

function beatStoryModeStage(stage) => storyModeProgress() == stage && 
                                      prev(storyModeProgress()) == stage - 1

// $3172F0: (Array of 31 8-bit Values)  Story Mode Stage Grade
//          
//          This is Stage 1
//          
//          0x00 = Rank D
//          0x01 = Rank C
//          0x02 = Rank B
//          0x03 = Rank A
//          0x04 = Rank S
STORY_MODE_STAGE_GRADE_MEMORY_LOCATION = 0x3172F0
function storyModeStageGrade() => byte(0x3172F0)

RANK_S_GRADE_VALUE = 0x04

function storyStageGrade(stage) => byte(STORY_MODE_STAGE_GRADE_MEMORY_LOCATION + stage - 1)

function justReachedRankS(stage) => storyStageGrade(stage) == RANK_S_GRADE_VALUE &&
                                     prev(storyStageGrade(stage)) <= RANK_S_GRADE_VALUE
// $32791E: (8-bit) Main Menu Chosen.
//          
//          0x00 = Arcade mode.
//          0x01 = Story Mode
//          0x02 = Time Attack
function modechoice() => byte(0x32791E)

ARCADE_MODE_VALUE = 0x00 // Note it defaults to this. 
STORY_MODE_VALUE = 0x01
TIME_TRIAL_MODE_VALUE = 0x02

function ArcadeMode() => modechoice() == ARCADE_MODE_VALUE
function StoryMode() => modechoice() == STORY_MODE_VALUE
function timeTrialMode() => modechoice() == TIME_TRIAL_MODE_VALUE

// $327934: (32-bit) EXP of the current car. 

//          120000 is Basic tune.
//          999000 is considered "Full Tune" 

function currentCarEXP() => dword(0x327934)

BASIC_TUNE_VALUE = 120000
FULL_TUNE_VALUE = 999000

function currentCarJustPastedExp(target) => currentCarEXP() >= target  &&
                                            prev(currentCarEXP()) < target

// $327950: (Array of 44 8-bit numbers).  Win Loss of CURRENT car in Arcade
//          
//          0x00 = Unbeaten
//          0x01 = Beaten in Dry.
//          Any number is Beaten in Rain, continues to increments.
//          
//          - Myogi Start
//          0x00=Itsuki Takeuchi
//          0x02=Takumi Fujiwara
//          0x04=Shingo Shouji
//          0x06=Takeshi Nakazato
//          - Usui Start
//          0x08=Two People From Tokyo
//          0x0a=Nobuhiko Akiyama
//          0x0c=Mako Satou & Sayuki
//          0x0e=Tsukamoto
//          - Akagi Start
//          0x10=Kyouko Iwase
//          0x12=Kenta Nakamura
//          0x14=Keisuke Takahashi
//          0x16=Ryosuke Takahashi
//          - Akina Start
//          0x18=Kenji
//          0x1a=Iketani Kouichirou
//          0x1c=Wataru Akiyama
//          0x1e=Takumi Fujiwara
//          - Happougahara Start
//          0x20=Tooru Suetsugu
//          0x22=Daiki Ninomiya
//          0x24=Sakai
//          0x26=Tomoyuki Tachi
//          - Irouhazaka Start
//          0x28=Seiji Iwaki
//          0x2a=Kyouichi Sudou
//          0x2c=Kai Kogashiwa
//          0x2e=Keisuke Takahashi
//          0x30=Takumi Fujiwara Final
//          0x32=Bunta Akina (Out of line)
//          - Real Myogi Start
//          0x34=Shingo
//          0x36=Nakazato
//          - Real Usui Start
//          0x38=Mako Satou & Sayuki
//          - Shomaru Start
//          0x3a=Wataru
//          - Momiji Line Start
//          0x3c=Toru
//          0x3e=Atsure
//          - Enna Skyline Start
//          0x40=Daiki
//          0x42=Smiley Sakai
ARCADE_WIN_MEMORY_LOCATION = 0x327950
ARCADE_WIN_OFFSET = 0x01 // Technically it's two, but the indexes are already correct. 
function arcadeWinsLocation() => byte(0x327950)

function arcadeWinByIndex(index) => byte(ARCADE_WIN_MEMORY_LOCATION + index * ARCADE_WIN_OFFSET)
function justBeatDriver(index) => arcadeWinByIndex(index) == 
                                  prev(arcadeWinByIndex(index) ) + 1

function driverBeaten(index) => arcadeWinByIndex(index) > 0

function driverPrevUnbeaten(index) => prev(arcadeWinByIndex(index)) == 0x00

function justBeatDriverSecondTime(index) => arcadeWinByIndex(index) == 2 &&
                                            prev( arcadeWinByIndex(index) ) == 1

// $328154: (8-bit) Current Arcade Opponent/Current Story Mission Chapter
function currentArcadeOpponent() => byte(0x328154)
function currentStoryMission() => byte(0x328154)

// $328156: (8-bit) Track Choice for Time Trial  
//
//           Control value. 
//
//           0x00 = Myogi
//           0x01 = Usui
//           0x02 = Akagi
//           0x03 = Akina
//           0x05 = Happo
//           0x06 = Iroha
//           0x07 = R-Myogi
//           0x08 = R-Usui
//           0x09 = Shomaru
//           0x0a = Momiji
//           0x0b = Enna
// Might work for all modes. 
function timeTrialTrack() => byte(0x328156)


// $328157: (8-bit) Track Configuration
//
//          Depending on track
//
//          0x00 = CCW/ DH/OB(Happo, Shomaru)
//          0x01 = CW/ UH/IB(Happo, Shomaru)/HC(Irohazaka)
function timeTrialTrackConfig() => byte(0x328157)

NAME = "NAME"
FIRST_DIRECTION = "FIRST_DIRECTION"
SECOND_DIRECTION = "SECOND_DIRECTION"

configurationsLookup =
{
    0x00: { NAME: "Myogi", FIRST_DIRECTION: "CCW", SECOND_DIRECTION: "CW" },
    0x01: { NAME: "Usui", FIRST_DIRECTION: "CCW", SECOND_DIRECTION: "CW" },
    0x02: { NAME: "Akagi", FIRST_DIRECTION: "DH", SECOND_DIRECTION: "UH" },
    0x03: { NAME: "Akina", FIRST_DIRECTION: "DH", SECOND_DIRECTION: "UH" },
    0x04: { NAME: "Happogahara", FIRST_DIRECTION: "DH", SECOND_DIRECTION: "OB" },
    0x05: { NAME: "Irouhazaka", FIRST_DIRECTION: "DH", SECOND_DIRECTION: "HC" },
    0x06: { NAME: "Real Myogi", FIRST_DIRECTION: "DH", SECOND_DIRECTION: "UH" },
    0x07: { NAME: "Real Usui", FIRST_DIRECTION: "DH", SECOND_DIRECTION: "UH" },
    0x08: { NAME: "Momiji Line", FIRST_DIRECTION: "DH", SECOND_DIRECTION: "UH" },
    0x09: { NAME: "Enna Skyline", FIRST_DIRECTION: "DH", SECOND_DIRECTION: "UH" },
    0x0a: { NAME: "Shomaru", FIRST_DIRECTION: "OB", SECOND_DIRECTION: "IB" }
}

// $328158: (8-bit) Track Weather
//
//          0x00 = Dry
//          0x01 = Wet
function timeTrialTrackWeather() => byte(0x328158)

weatherLookup =
{
    0x00: "Dry",
    0x01: "Wet"
}


// $3281b0: (32-bit) Frames multiplied by 100 
// 
//          This is the display value on the result screens of each race.  This is a control value.   Note this doesn't control "Past" Time, but does appear to control Car and Total. 
//
//          Used in all modes, any change can be assume a race just finished.  Useful for Time Trials.  
//
//          However if someone turns in the exact same lap. *Shrug* it won't change. 
function raceTime() => dword(0x3281B0)

// DO NOT USE! THIS IS INCORRECT
// $3281ba: (8-bit) Front End Check 
//
//          0x00 = On the front end  (Especially the initial boot save/load) 
//          0x01 = In-Game. 
// function frontEndCheck() => byte(0x3281BA)
// function inGame() => frontEndCheck() != 0x00

// $19ECA18: (8-bit) Gameplay Indicator
//           
//           0x00 = Gameplay
//           0x01 = Front End
//           
//           Not this goes to 0 on reboot.
function gameplayIndicator() => byte(0x19ECA18)



function achievementsActiveCheck() => gameplayIndicator() == 0 && notSaving()


achievement(
    title = "Speedy Speed Boy", points = 2,
    description = "Win your first Arcade Race",
    trigger = achievementsActiveCheck() &&
              any_of (range(0, 0x42, step=2 ), i => justBeatDriver(i))
)

VALUES = "VALUE"
POINTS = "POINTS"
ID = "ID"
ACHIEVEMENT_NAME = "ACHIEVEMENT_NAME"
DIFFICULTY = "DIFFICULTY"
TITLE = "TITLE"
DESCRIPTION = "DESCRIPTION"

areaAchievementData = {
  "Myogi": { VALUES: [0x00, 0x02, 0x04, 0x06], POINTS: 5 },
  "Usui": { VALUES: [0x08, 0x0a, 0x0c, 0x0e], POINTS: 5 },
  "Akagi": { VALUES: [0x10, 0x12, 0x14, 0x16], POINTS: 10 },
  "Akina": { VALUES: [0x18, 0x1a, 0x1c, 0x1e, 0x32], POINTS: 10 },
  "Happougahara": { VALUES: [0x20, 0x22, 0x24, 0x26], POINTS: 10 },
  "Irouhazaka": { VALUES: [0x28, 0x2a, 0x2c, 0x2e, 0x30], POINTS: 10 },
  "Real Myogi": { VALUES: [0x34, 0x36], POINTS: 10 },
  "Real Usui": { VALUES: [0x38], POINTS: 5 },
  "Shomaru": { VALUES: [0x3a], POINTS: 5 },
  "Momiji Line": { VALUES: [0x3c, 0x3e], POINTS: 10 },
  "Enna Skyline": { VALUES: [0x40, 0x42], POINTS: 10 }
}

for key in areaAchievementData
{
    achievement(
        type = "Progression",
        title = "King of " + key,
        points = areaAchievementData[key][POINTS],
        description = "Win against all drivers in " + key,
        trigger = achievementsActiveCheck() &&
                  all_of(areaAchievementData[key][VALUES], i => driverBeaten(i)) &&
                  any_of(areaAchievementData[key][VALUES], i => driverPrevUnbeaten(i))
    )
}

driverAchievementData = [
  { ID: 0x00, ACHIEVEMENT_NAME: "Itsuki Takeuchi", DIFFICULTY: 1, TITLE: "Itsuki Takeuchi", DESCRIPTION: "Itsuki Takeuchi at Myogi" },
  { ID: 0x02, ACHIEVEMENT_NAME: "Legend's", DIFFICULTY: 2, TITLE: "Beginner Takumi Fujiwara", DESCRIPTION: "Takumi Fujiwara at Myogi" },
  { ID: 0x04, ACHIEVEMENT_NAME: "Shingo Shouji", DIFFICULTY: 4, TITLE: "Beginner Shingo Shouji", DESCRIPTION: "Shingo Shouji at Myogi" },
  { ID: 0x06, ACHIEVEMENT_NAME: "Takeshi Nakazato", DIFFICULTY: 5, TITLE: "Beginner Takeshi Nakazato", DESCRIPTION: "Takeshi Nakazato at Myogi" },
  { ID: 0x08, ACHIEVEMENT_NAME: "Two People From Tokyo", DIFFICULTY: 2, TITLE: "Two People From Tokyo", DESCRIPTION: "Two People From Tokyo at Usui" },
  { ID: 0x0a, ACHIEVEMENT_NAME: "Nobuhiko Akiyama", DIFFICULTY: 3, TITLE: "Nobuhiko Akiyama", DESCRIPTION: "Nobuhiko Akiyama at Usui" },
  { ID: 0x0c, ACHIEVEMENT_NAME: "Impact Blue", DIFFICULTY: 6, TITLE: "Beginner Impact Blue", DESCRIPTION: "Mako and Sayuki at Usui" },
  { ID: 0x0e, ACHIEVEMENT_NAME: "Sakamoto", DIFFICULTY: 7, TITLE: "Sakamoto", DESCRIPTION: "Sakamoto at Usui" },
  { ID: 0x10, ACHIEVEMENT_NAME: "Kyouko Iwase", DIFFICULTY: 3, TITLE: "Kyoko Iwase", DESCRIPTION: "Kyoko Iwase at Akagi" },
  { ID: 0x12, ACHIEVEMENT_NAME: "Kenta Nakamura", DIFFICULTY: 4, TITLE: "Kenta Nakamura", DESCRIPTION: "Kenta Nakamura at Akagi" },
  { ID: 0x14, ACHIEVEMENT_NAME: "Keisuke Takahashi", DIFFICULTY: 7, TITLE: "Beginner Keisuke Takahashi", DESCRIPTION: "Keisuke Takahashi at Akagi" },
  { ID: 0x16, ACHIEVEMENT_NAME: "Ryosuke Takahashi", DIFFICULTY: 8, TITLE: "Beginner Ryosuke Takahashi", DESCRIPTION: "Ryosuke Takahashi at Akagi" },
  { ID: 0x18, ACHIEVEMENT_NAME: "Kenji", DIFFICULTY: 2, TITLE: "Kenji", DESCRIPTION: "Kenji at Akina" },
  { ID: 0x1a, ACHIEVEMENT_NAME: "Iketani Kouichirou", DIFFICULTY: 3, TITLE: "Iketani Kouichirou", DESCRIPTION: "Iketani Kouichirou at Akina" },
  { ID: 0x1c, ACHIEVEMENT_NAME: "Wataru Akiyama", DIFFICULTY: 8, TITLE: "Beginner Wataru Akiyama", DESCRIPTION: "Wataru Akiyama at Akina" },
  { ID: 0x1e, ACHIEVEMENT_NAME: "Takumi Fujiwara", DIFFICULTY: 9, TITLE: "Medium Takumi Fujiwara", DESCRIPTION: "Takumi Fujiwara at Akina" },
  { ID: 0x20, ACHIEVEMENT_NAME: "Tooru Suetsugu", DIFFICULTY: 4, TITLE: "Beginner Toru Suetsugu", DESCRIPTION: "Toru Suetsuguat Happo" },
  { ID: 0x22, ACHIEVEMENT_NAME: "Daiki Ninomiya", DIFFICULTY: 8, TITLE: "Beginner Daiki Ninomiya", DESCRIPTION: "Daiki Ninomiya at Happo" },
  { ID: 0x24, ACHIEVEMENT_NAME: "Sakai", DIFFICULTY: 8, TITLE: "Beginner Smiley Sakai", DESCRIPTION: "Smiley Sakai at Happo" },
  { ID: 0x26, ACHIEVEMENT_NAME: "Tomoyuki Tachi", DIFFICULTY: 9, TITLE: "Tomoyuki Tachi", DESCRIPTION: "Tomoyuki Tachi at Happo" },
  { ID: 0x28, ACHIEVEMENT_NAME: "Seiji Iwaki", DIFFICULTY: 6, TITLE: "Seiji Iwaki", DESCRIPTION: "Seiji Iwaki at Irohazaka" },
  { ID: 0x2a, ACHIEVEMENT_NAME: "Kyouichi Sudou", DIFFICULTY: 7, TITLE: "Kyouichi Sudou", DESCRIPTION: "Kyouichi Sudou at Irohazaka" },
  { ID: 0x2c, ACHIEVEMENT_NAME: "Kai Kogashiwa", DIFFICULTY: 8, TITLE: "Kai Kogashiwa", DESCRIPTION: "Kai Kogashiwa at Irohazaka" },
  { ID: 0x2e, ACHIEVEMENT_NAME: "Keisuke Takahashi", DIFFICULTY: 9, TITLE: "Elite Keisuke Takahashi", DESCRIPTION: "Keisuke Takahashi at Irohazaka" },
  { ID: 0x30, ACHIEVEMENT_NAME: "Takumi Fujiwara Final", DIFFICULTY: 9, TITLE: "Elite Takumi Fujiwara", DESCRIPTION: "Takumi Fujiwara at Irohazaka" },
  { ID: 0x32, ACHIEVEMENT_NAME: "Bunta", DIFFICULTY: 10, TITLE: "Bunta", DESCRIPTION: "Bunta at Akina" },
  { ID: 0x34, ACHIEVEMENT_NAME: "Shingo", DIFFICULTY: 8, TITLE: "Elite Shingo Shouji", DESCRIPTION: "Shingo at Real Myogi" },
  { ID: 0x36, ACHIEVEMENT_NAME: "Nakazato", DIFFICULTY: 9, TITLE: "Elite Takeshi Nakazato", DESCRIPTION: "Takeshi Nakazato at Real Myogi" },
  { ID: 0x38, ACHIEVEMENT_NAME: "Impact Blue(Real Usui) ", DIFFICULTY: 9, TITLE: "Elite Impact Blue", DESCRIPTION: "Mako and Sayuki at Real Usui " },
  { ID: 0x3a, ACHIEVEMENT_NAME: "Wataru", DIFFICULTY: 9, TITLE: "Elite Wataru Akiyama", DESCRIPTION: "Wataru Akiyama at Shomaru" },
  { ID: 0x3c, ACHIEVEMENT_NAME: "Toru", DIFFICULTY: 8, TITLE: "Elite Toru Suetsugu", DESCRIPTION: "Toru Suetsugu at Momiji Line" },
  { ID: 0x3e, ACHIEVEMENT_NAME: "Atsure", DIFFICULTY: 8, TITLE: "Atsuro Kawai", DESCRIPTION: "Atsuro Kawai at Momiji Line" },
  { ID: 0x40, ACHIEVEMENT_NAME: "Daiki", DIFFICULTY: 9, TITLE: "Elite Daiki Ninomiya", DESCRIPTION: "Daiki Ninomiya at Enna Skyline" },
  { ID: 0x42, ACHIEVEMENT_NAME: "Smiley Sakai", DIFFICULTY: 9, TITLE: "Elite Smiley Sakai", DESCRIPTION: "Smiley Sakai at Enna Skyline" }
]

opponentLookup = 
{
    0x00: "Itsuki Takeuchi",
    0x01: "Beginner Takumi Fujiwara",
    0x02: "Beginner Shingo Shouji",
    0x03: "Beginner Takeshi Nakazato",
    0x04: "Two People From Tokyo",
    0x05: "Nobuhiko Akiyama",
    0x06: "Beginner Impact Blue",
    0x07: "Sakamoto",
    0x08: "Kyouko Iwase",
    0x09: "Kenta Nakamura",
    0x0a: "Beginner Keisuke Takahashi",
    0x0b: "Beginner Ryosuke Takahashi",
    0x0c: "Kenji",
    0x0d: "Iketani Kouichirou",
    0x0e: "Beginner Wataru Akiyama",
    0x0f: "Takumi Fujiwara",
    0x10: "Toru Suetsugu",
    0x11: "Daiki Ninomiya",
    0x12: "Smiley Sakai",
    0x13: "Tomoyuki Tachi",
    0x14: "Seiji Iwaki",
    0x15: "Kyouichi Sudou",
    0x16: "Kai Kogashiwa",
    0x17: "Keisuke Takahashi",
    0x18: "Elite Takumi Fujiwara",
    0x19: "Elite Shingo Shouji",
    0x1a: "Elite Takeshi Nakazato",
    0x1b: "Elite Impact Blue",
    0x1c: "Elite Wataru Akiyama",
    0x1d: "Elite Toru Suetsugu",
    0x1e: "Atsuro Kawai",
    0x1f: "Elite Daiki Ninomiya",
    0x20: "Elite Smiley Sakai",
    0x21: "Bunta"
}

doublePoints =
{
    1: 1,
    2: 1,
    3: 2,
    4: 3,
    5: 4,
    6: 4,
    7: 5,
    8: 5,
    9: 10,
    10: 10
}

hardPoints =
{
    1: 1,
    2: 2,
    3: 3,
    4: 4,
    5: 5,
    6: 5,
    7: 10,
    8: 10,
    9: 25,
    10: 25
}

for data in driverAchievementData
{
    achievement(
        type = "",
        title = data[TITLE] + " Beaten",
        points = doublePoints[data[DIFFICULTY]],
        description = format("Beat {0} twice in Arcade Mode",data[DESCRIPTION]),
        trigger = achievementsActiveCheck() &&
                  ArcadeMode() &&
                  justBeatDriverSecondTime(data[ID])
    )

    achievement(
        type = "",
        title = data[TITLE] + " Conquered",
        points = hardPoints[data[DIFFICULTY]],
        description = format("Beat {0} on Hard in Arcade Mode", data[DESCRIPTION]),
        trigger = achievementsActiveCheck() &&
                  ArcadeMode() &&
                  justBeatDriver(data[ID]) &&
                  arcadeHardMode()
    )
}

achievement( title = "There's an Ending?",
             points = 5,
             description = "Beat everyone in Arcade Mode twice",
             trigger = achievementsActiveCheck() &&
                        ArcadeMode() &&
                        all_of(range(0, 0x42, step=2), index => arcadeWinByIndex(index) >= 2) &&
                        any_of(range(0, 0x42, step=2), index => prev(arcadeWinByIndex(index)) == 1)
)

HARD_TITLE = "HARD_TITLE"
HARD_POINTS = "HARD_POINTS"
storyModeAchievements =
[
    {ID: 1, TITLE: "Learning to Turn", HARD_TITLE: "Mastering the Drift", POINTS: 1, HARD_POINTS: 5},
    {ID: 2, TITLE: "A Typical Night Drive", HARD_TITLE: "A Fast Night Drive", POINTS: 2, HARD_POINTS: 5},
    {ID: 3, TITLE: "Announcing Yourself", HARD_TITLE: "Inertial Drift!", POINTS: 2, HARD_POINTS: 5},
    {ID: 4, TITLE: "First Race Won", HARD_TITLE: "Rival Made", POINTS: 3, HARD_POINTS: 5},
    {ID: 5, TITLE: "A Wild Ride", HARD_TITLE: "Takumi's Wild Ride", POINTS: 3, HARD_POINTS: 5},
    {ID: 6, TITLE: "He can actually drive?", HARD_TITLE: "Speed Stars Number 2 Replaced", POINTS: 1, HARD_POINTS: 5},
    {ID: 7, TITLE: "Night Night Kids", HARD_TITLE: "Nights Out", POINTS: 5, HARD_POINTS: 10},
    {ID: 8, TITLE: "A Different Type of Race", HARD_TITLE: "Go Duct Yourself", POINTS: 5, HARD_POINTS: 10},
    {ID: 9, TITLE: "Red Sunset", HARD_TITLE: "A Master Plan Destroyed", POINTS: 5, HARD_POINTS: 10},
    {ID: 10, TITLE: "Two Beautiful Ladies", HARD_TITLE: "Iketani was an Idiot", POINTS: 5, HARD_POINTS: 10},
    {ID: 11, TITLE: "Trying to do what The Takeshi Brothers couldn't?", HARD_TITLE: "Even in Rain I Win", POINTS: 5, HARD_POINTS: 10},
    {ID: 12, TITLE: "Can't He Even Follow the Plan?", HARD_TITLE: "The Slap", POINTS: 5, HARD_POINTS: 10},
    {ID: 13, TITLE: "Quite a Date", HARD_TITLE: "A Woman's Pride", POINTS: 5, HARD_POINTS: 10},
    {ID: 14, TITLE: "It's Over", HARD_TITLE: "Victory in the Face of Defeat", POINTS: 5, HARD_POINTS: 10},
    {ID: 15, TITLE: "The Secret is Out", HARD_TITLE: "The Seal is Broken", POINTS: 5, HARD_POINTS: 10},
    {ID: 16, TITLE: "The Long Battle", HARD_TITLE: "The All-Night Battle", POINTS: 5, HARD_POINTS: 10},
    {ID: 17, TITLE: "Emperor Dethroned", HARD_TITLE: "Regicide", POINTS: 5, HARD_POINTS: 10},
    {ID: 18, TITLE: "A Father's Honor", HARD_TITLE: "Bunta's Son", POINTS: 5, HARD_POINTS: 10},
    {ID: 19, TITLE: "Project D's Initiation", HARD_TITLE: "Proving Your Worth", POINTS: 5, HARD_POINTS: 10},
    {ID: 20, TITLE: "Night of Fire", HARD_TITLE: "Break The Night", POINTS: 10, HARD_POINTS: 10},
    {ID: 21, TITLE: "No More Night", HARD_TITLE: "Red Sun Rising", POINTS: 10, HARD_POINTS: 10},
    {ID: 22, TITLE: "Miata > Mitsubishi", HARD_TITLE: "De-Evolution", POINTS: 10, HARD_POINTS: 10},
    {ID: 23, TITLE: "A Rival Defeated", HARD_TITLE: "A Conquest Stopped", POINTS: 10, HARD_POINTS: 10},
    {ID: 24, TITLE: "AE86 Defeated", HARD_TITLE: "Finally Got that Win", POINTS: 10, HARD_POINTS: 10},
    {ID: 25, TITLE: "Project D Begins", HARD_TITLE: "A Final Race", POINTS: 10, HARD_POINTS: 25},
    {ID: 26, TITLE: "A Hill Climb ", HARD_TITLE: "Weak Cornering Defeated", POINTS: 10, HARD_POINTS: 25},
    {ID: 27, TITLE: "A Slow Start", HARD_TITLE: "Baiting the Trap", POINTS: 10, HARD_POINTS: 25},
    {ID: 28, TITLE: "Letting Go", HARD_TITLE: "Snaring the Opponent", POINTS: 10, HARD_POINTS: 25},
    {ID: 29, TITLE: "Ignoring the Brake Lights", HARD_TITLE: "Replacing That Smile with a Frown", POINTS: 10, HARD_POINTS: 25},
    {ID: 30, TITLE: "Beating a Professional", HARD_TITLE: "Project D's Success", POINTS: 10, HARD_POINTS: 25},
    {ID: 31, TITLE: "The Unknown", HARD_TITLE: "Even Better Than Takumi", POINTS: 10, HARD_POINTS: 25}
]

for data in storyModeAchievements
{
    achievement(
        type = "Progression",
        title = data[TITLE],
        points = data[POINTS],
        description = "Win Stage " + data[ID] + " in Story Mode",
        trigger = achievementsActiveCheck() &&
                  StoryMode() &&
                  beatStoryModeStage(data[ID])
    )

    achievement(
        type = "",
        title = data[HARD_TITLE],
        points = data[HARD_POINTS],
        description = "Win Stage " + data[ID] + " in Story Mode with Rank S",
        trigger = achievementsActiveCheck() &&
                  StoryMode() &&
                  justReachedRankS(data[ID])
    )
}

achievement( title = "Basic Tune Achieved",
             points = 5,
             description = "Earn your first Basic Tune",
             trigger = achievementsActiveCheck() &&
                       currentCarJustPastedExp(BASIC_TUNE_VALUE)
                       
)


function leaderboardCourse(key, dryWetIndex)
{
    data = configurationsLookup[key]
    directionKey =
    [
        data[FIRST_DIRECTION],
        data[SECOND_DIRECTION]
    ]
    for direction in range(0,1)
    {
        leaderboard(
            title = format("Fastest Time on {0} {1} {2}", data[NAME], directionKey[direction], weatherLookup[dryWetIndex]),
            description = format("Complete {0} {1} {2} in Time Attack Mode as fast as possible", data[NAME], directionKey[direction], weatherLookup[dryWetIndex]),
            start = 
            (
                timeTrialTrack() == key &&
                timeTrialTrackWeather() == dryWetIndex &&
                timeTrialMode() &&
                timeTrialTrackConfig() == direction &&
                achievementsActiveCheck() &&
                raceTime() != prev(raceTime()) // This shows that a course has finished.  Note this changes in other modes as well. 
            ),
            cancel = always_false(),
            submit = always_true(),
            value = raceTime()/100,
            lower_is_better = true,
            format = "FRAMES"
        )
    }
    
}
for key in configurationsLookup
{
    leaderboardCourse(key, 0)
    leaderboardCourse(key, 1)
}

rich_presence_conditional_display(!achievementsActiveCheck(), "In the Menus")

for key in configurationsLookup
{
    rich_presence_conditional_display(ArcadeMode() && timeTrialTrack() == key && timeTrialTrackConfig() == 0,
                                      "Arcade Mode: Racing {0} on {1} {2} {3}",
                                      rich_presence_lookup("OpponentLookup", currentArcadeOpponent(), opponentLookup),
                                      configurationsLookup[key][NAME],
                                      configurationsLookup[key][FIRST_DIRECTION],
                                      rich_presence_lookup("WeatherLookup", timeTrialTrackWeather(), weatherLookup)
    )
    rich_presence_conditional_display(ArcadeMode() && timeTrialTrack() == key && timeTrialTrackConfig() == 1,
                                      "Arcade Mode: Racing {0} on {1} {2} {3}",
                                      rich_presence_lookup("OpponentLookup", currentArcadeOpponent(), opponentLookup),
                                      configurationsLookup[key][NAME],
                                      configurationsLookup[key][SECOND_DIRECTION],
                                      rich_presence_lookup("WeatherLookup", timeTrialTrackWeather(), weatherLookup)
    )
    rich_presence_conditional_display(timeTrialMode() && timeTrialTrack() == key && timeTrialTrackConfig() == 0,
                                      "Time Trial: Racing {0} on {1} {2} {3}",
                                      rich_presence_lookup("OpponentLookup", currentArcadeOpponent(), opponentLookup),
                                      configurationsLookup[key][NAME],
                                      configurationsLookup[key][FIRST_DIRECTION],
                                      rich_presence_lookup("WeatherLookup", timeTrialTrackWeather(), weatherLookup)
    )
    rich_presence_conditional_display(timeTrialMode() && timeTrialTrack() == key && timeTrialTrackConfig() == 1,
                                      "Time Trial: Racing {0} on {1} {2} {3}",
                                      rich_presence_lookup("OpponentLookup", currentArcadeOpponent(), opponentLookup),
                                      configurationsLookup[key][NAME],
                                      configurationsLookup[key][SECOND_DIRECTION],
                                      rich_presence_lookup("WeatherLookup", timeTrialTrackWeather(), weatherLookup)
    )
}

rich_presence_conditional_display(StoryMode(), "Story Mode: Playing {0}", 
                                  rich_presence_lookup("storyMissionLookup", currentStoryMission(), storyMissionLookup))


rich_presence_display("In the menus.")

