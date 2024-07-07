// South Park
// #ID = 10328

// $0B0D34: cut scenes intros = 01 -- 8-bit
function cutsceneIntros() => byte(0x0B0D34)

// $0C2A8C: (8-bit) Actual Level number
// 
//          This is the level number that you're currently playing.
//
//          These values are also true during boss battles.  Episode 1 and Episode 2 work normal, Episode 3 Stage 4 does not. 
//
//          0x00 = Episode 1 Stage 1
//          0x01 = Episode 1 Stage 2 
//          0x02 = Episode 1 Stage 3
//          0x03 = Episode 1 Stage 4
//          0x04 = Episode 2 Stage 1
function trueLevelNumber() => byte(0x0C2A8C)


levelLookup = {
    00: "Faire Game",
    01: "Turkey Shoot",
    02: "Search and Destroy",
    03: "Homecoming",
    04: "There Goes the Neighborhood",
    05: "Warehouse Run",
    06: "Mother Lovin' Spoonful",
    07: "The Visitors Return",
    08: "Road to Craterville",
    09: "One Mother of a Ship",
    10: "Blow the Core",
    11: "Seismic Rumble",
    12: "Militia Madness",
    13: "Nuts and Boltz",
    14: "Toy Rampage",
    15: "Parking Problem",
    16: "Batteries Included"
}


WeaponLookup = {
    0x00: " Snowball",
    0x01: " Dodgeball",
    0x02: " Toilet Plunger Launcher",
    0x03: " Sponge Dart Gun",
    0x04: " Terrance and Phillip Doll",
    0x05: " Warpo Ray",
    0x06: " Super Sniper Chicken",
    0x07: " Alien Dancing Gizmo",
    0x08: " Cow Launcher",
}


// $0C4200: Current Episode (Changes with level select in menu)
function currentEpisode() => byte(0x0C4200)

// $0C4204: Current Stage (Changes with level select in menu)
function currentStage() => byte(0x0C4204)

// $0C431C: [Float] Level 2-2 Town: Amount of Town Destroyed
//          Max = 1.0
function townDestroyed() => float(0x0C431C)

// $0CD220: Currently Activated Cheats
function currentlyActivatedCheats() => byte(0x0CD220)

// $0CD340: intro screens 0, 1, 2...8 = theme song --- 8-bit
function introScreens() => byte(0x0CD340)

// $0CD344: (8-bit) Screen ID:
//          0x0a = Main Menu
//          0x0b = Select Kid Screen
//          0x0c = Stage Information Screen
//          0x0d = Gameplay
//          0x0e = Result Screen
function screenId() => byte(0x0CD344)

function stageOver() => prev(screenId()) == 0x0D && screenId() == 0x0E
function triggerStageOver() => prev(screenId()) == 0x0D && trigger_when(screenId() == 0x0E)

// $1A9FFE: final boss health = 2 phases. C2 is max for each phase --- 8-bit
function finalBossHealth() => byte(0x1A9FFE)

// $1AB736: Boss 2-3 HP
function boss2Hp() => byte(0x1AB736)

// $6FE4C6: health = 8-bit
function playerHealth() => byte(0x6FE4C6)

// $6FE4CA: armor amount = 8-bit
function armorAmount() => byte(0x6FE4CA)

// $6FE4CC: Score
function scoreByte() => byte(0x6FE4CC)
function scoreDword() => dword(0x6FE4CC)

// $6FE4DC: Dodge Ball Ammo
function dodgeballAmmo() => byte(0x6FE4DC)

// $6FE4E0: Sponge Dart Ammo
function spongeDartAmmo() => byte(0x6FE4E0)

// $6FE4E2: plunger ammo  = 8-bit
function plungerAmmo() => byte(0x6FE4E2)

// $6FE4E4: Warpo Ray Ammo
function warpoRayAmmo() => byte(0x6FE4E4)

// $6FE4E6: Terrance and Phillip Dolls Ammo
function terranceAndPhillipDollAmmo() => byte(0x6FE4E6)

// $6FE4E8: Alien Dancing Gizmo Ammo
function alienDancingGizmoAmmo() => byte(0x6FE4E8)

// $6FE4EA: Super Sniper Chicken Ammo
function superSniperChickenAmmo() => byte(0x6FE4EA)

// $6FE4EE: Cow Launcher Ammo
function cowLauncherAmmo() => byte(0x6FE4EE)

// $6FE4FA: Current Weapon?
function currentWeaponMaybe() => byte(0x6FE4FA)

// $6FE528: double fire rate = 01 when active --- 8-bit
function doubleFireRateTrigger() => byte(0x6FE528)

// $6FE5EE: Current Weapon?
function currentWeaponMaybeAlso() => byte(0x6FE5EE)

// $6FE600: Alternate Ammo
function altenateAmmo() => byte(0x6FE600)

// $6FEFD4: innocent creatures = 8-bit
function InnocentCreatures() => byte(0x6FEFD4)

// $6FEFD5: number of minions killed = -8-bit
function minionsKilled() => byte(0x6FEFD5)

// $6FEFD6: tanks escaped = -8bit
function tanksEscapedCount() => byte(0x6FEFD6)

// $6FEFD7: tank kills = 8 -bit
function tanksKillCount() => byte(0x6FEFD7)

// $6FEFD8: Score
function OtherScore() => byte(0x6FEFD8)

// $6FEFFE: mr hankey 1 = goes to 18 when picked up --- 8- bit
function mrHankeyOne() => byte(0x6FEFFE)

// $6FEFFF: mr hankey 2 = goes to 80 when picked up--- 8- bit
function mrHankeyTwo() => byte(0x6FEFFF)

// $754942: Kid select
//          01=cartman
//          02=kyle
//          03=stan
//          04=kenny
function chosenKid() => byte(0x754942)

achievement(
    title = "What the Hell is Going on?", points = 2,
    description = "Complete Episode 1 - Stage 1",
    id = 115914, published = "6/28/2020 6:11:02 AM", modified = "6/2/2021 1:53:19 PM",
    trigger = currentlyActivatedCheats() == 0 && currentStage() == 1 &&
              currentEpisode() == 1 && stageOver()  
)

EPISODE = "EPISODE"
STAGE = "STAGE"
NAME = "NAME"
LEVEL_NAME = "LEVEL_NAME"
POINTS = "POINTS"
TRUESTAGE = "TRUESTAGE"

levelAchievements =
[
    {
        EPISODE: 1,
        STAGE: 2,
        TRUESTAGE: 1,
        NAME: "It’s Coming Right for Us!",
        LEVEL_NAME: "Episode 1 - Stage 2",
        POINTS: 1
    },
    {
        EPISODE: 1,
        STAGE: 3,
        TRUESTAGE: 2,
        NAME: "Oh My God They Killed Kenny",
        LEVEL_NAME: "Episode 1 - Stage 3",
        POINTS: 1
    },
    {
        EPISODE: 2,
        STAGE: 1,
        TRUESTAGE: 4,
        NAME: "Me Bad??",
        LEVEL_NAME: "Episode 2 - Stage 1",
        POINTS: 2
    },
    {
        EPISODE: 2,
        STAGE: 2,
        TRUESTAGE: 5,
        NAME: "Stan, Are You Wearing a Different Hat?",
        LEVEL_NAME: "Episode 2 - Stage 2",
        POINTS: 2
    },
    {
        EPISODE: 3,
        STAGE: 1,
        TRUESTAGE: 7,
        NAME: "Moo",
        LEVEL_NAME: "Episode 3 - Stage 1",
        POINTS: 3
    },
    {
        EPISODE: 3,
        STAGE: 2,
        TRUESTAGE: 8,
        NAME: "What the Hell Are They Talking About?",
        LEVEL_NAME: "Episode 3 - Stage 2",
        POINTS: 3
    },
    {
        EPISODE: 4,
        STAGE: 1,
        TRUESTAGE: 11,
        NAME: "I Am the A.W.E.S.O.M.-O 4000",
        LEVEL_NAME: "Episode 4 - Stage 1",
        POINTS: 4
    },
    {
        EPISODE: 4,
        STAGE: 2,
        TRUESTAGE: 12,
        NAME: "Are You by Chance a Pleasure Model?",
        LEVEL_NAME: "Episode 4 - Stage 2",
        POINTS: 4
    },
    {
        EPISODE: 5,
        STAGE: 1,
        TRUESTAGE: 14,
        NAME: "Must Be Over 100 Courics!",
        LEVEL_NAME: "Episode 5 - Stage 1",
        POINTS: 5
    },
    {
        EPISODE: 5,
        STAGE: 2,
        TRUESTAGE: 15,
        NAME: "It's a Jersey Thing",
        LEVEL_NAME: "Episode 5 - Stage 2",
        POINTS: 5
    }

]

for data in levelAchievements
{
    achievement(
        type = "Progression",
        title = data[NAME] ,
        points = data[POINTS],
        description = "Complete " + data[LEVEL_NAME],
        trigger = currentlyActivatedCheats() == 0 && 
                  trueLevelNumber() == data[TRUESTAGE] && 
                  stageOver() &&
                  tanksEscapedCount() == 0
    )
}


achievement(
    type = "Missable",
    title = "It’s Coming Right for Us!!", points = 4,
    description = "Complete Episode 1 - Stage 2 with 0 tanks escaped (or remaining)",
    id = 115915, published = "6/28/2020 6:11:07 AM", modified = "6/2/2021 1:53:25 PM",
    trigger = currentlyActivatedCheats() == 0 && 
              currentStage() == 2 && 
              currentEpisode() == 1 && 
              triggerStageOver() &&
              tanksEscapedCount() == 0 
)

// Ticket 58508: Didn't pop upon completion or viewing the scene.
//               RetroAchievements Hash: 1730119B0455EF89C4E495DEC8E950A5
//               Emulator: RetroArch (Parallel)
//               Emulator Version: 1.10.3
achievement(
    type = "Missable",
    title = "You Bastards!", points = 4,
    description = "Complete Episode 1 - Stage 3 with 0 tanks escaped (or remaining)",
    id = 115916, published = "6/28/2020 6:11:09 AM", modified = "6/2/2021 1:53:31 PM",
    trigger = currentlyActivatedCheats() == 0 && 
              currentEpisode() == 1 && 
              currentStage() == 3 && 
              triggerStageOver() &&
              tanksEscapedCount() == 0 
)

achievement(
    type = "Progression",
    title = "These are what we call Appetizers", points = 10,
    description = "Complete Episode 1 - Stage 4",
    id = 115917, published = "6/28/2020 6:11:11 AM", modified = "6/28/2020 8:22:48 AM",
    trigger = currentlyActivatedCheats() == 0 && 
              currentEpisode() == 1 && 
              currentStage() == 4 && 
              stageOver()
              
)

achievement(
    type = "Missable",
    title = "Aba-ba-chewy-chomp", points = 4,
    description = "Complete Episode 2 - Stage 1 with 0 tanks escaped (or remaining)",
    id = 115918, published = "6/28/2020 6:11:12 AM", modified = "6/2/2021 1:50:55 PM",
    trigger = currentlyActivatedCheats() == 0 && 
              currentEpisode() == 2 && 
              currentStage() == 1 && 
              triggerStageOver() &&
              tanksEscapedCount() == 0 
)

achievement(
    type = "Missable",
    title = "No, Shelly Bad. You Good", points = 4,
    description = "Complete Episode 2 - Stage 2 with 0 tanks escaped (or remaining)",
    id = 115919, published = "6/28/2020 6:11:14 AM", modified = "6/2/2021 1:51:01 PM",
    trigger = currentlyActivatedCheats() == 0 && 
              currentEpisode() == 2 && 
              currentStage() == 2 && 
              triggerStageOver() &&
              tanksEscapedCount() == 0 
)

achievement(
    type = "Progression",
    title = "Pig and Elephant Dna Just Won’t Splice!", points = 10,
    description = "Complete Episode 2 - Stage 3",
    id = 115920, published = "6/28/2020 6:11:15 AM", modified = "6/28/2020 8:23:04 AM",
    trigger = currentlyActivatedCheats() == 0 && 
              currentEpisode() == 2 && 
              currentStage() == 3 && 
              stageOver()
)

achievement(
    type = "Missable",
    title = "Greating Cows of Earth", points = 5,
    description = "Complete Episode 3 - Stage 1 with 0 tanks escaped (or remaining)",
    id = 115921, published = "6/28/2020 6:11:16 AM", modified = "6/2/2021 1:51:08 PM",
    trigger = currentlyActivatedCheats() == 0 && 
              currentEpisode() == 3 && 
              currentStage() == 1 && 
              triggerStageOver() &&
              tanksEscapedCount() == 0 
)

achievement(
    type = "Missable",
    title = "That's Carl's Fault. He's New", points = 5,
    description = "Complete Episode 3 - Stage 2 with 0 tanks escaped (or remaining)",
    id = 115922, published = "6/28/2020 6:11:18 AM", modified = "6/2/2021 1:51:14 PM",
    trigger = currentlyActivatedCheats() == 0 && 
              currentEpisode() == 3 && 
              currentStage() == 2 && 
              triggerStageOver() &&
              tanksEscapedCount() == 0 
)

achievement(
    type = "Progression",
    title = "That’s One Big Hoop-a-Joop", points = 5,
    description = "Complete Episode 3 - Stage 3",
    id = 115923, published = "6/28/2020 6:11:20 AM", modified = "6/2/2021 1:51:21 PM",
    trigger = currentlyActivatedCheats() == 0 && 
              currentEpisode() == 3 && 
              currentStage() == 3 && 
              stageOver()
)

achievement(
    type = "Progression",
    title = "Now You Suck on My Jagon", points = 10,
    description = "Complete Episode 3 - Stage 4",
    id = 115924, published = "6/28/2020 6:11:21 AM", modified = "4/6/2021 4:37:06 PM",
    trigger = currentlyActivatedCheats() == 0 && 
              trueLevelNumber() == 10 && // This one goes to a 0/0 stage at the end
              stageOver()
)

achievement(
    type = "Missable",
    title = "I Will Be Your New Best Friend", points = 5,
    description = "Complete Episode 4 - Stage 1 with 0 tanks escaped (or remaining)",
    id = 115925, published = "6/28/2020 6:11:23 AM", modified = "6/2/2021 1:51:27 PM",
    trigger = currentlyActivatedCheats() == 0 && 
              currentEpisode() == 4 && 
              currentStage() == 1 && 
              triggerStageOver() &&
              tanksEscapedCount() == 0 
)

achievement(
    type = "Missable",
    title = "A.W.E.S.O.M.E-O Does Not Understand", points = 5,
    description = "Complete Episode 4 - Stage 2 with 0 tanks escaped (or remaining)",
    id = 115926, published = "6/28/2020 6:11:24 AM", modified = "6/2/2021 1:51:33 PM",
    trigger = currentlyActivatedCheats() == 0 && 
              currentEpisode() == 4 && 
              currentStage() == 2 && 
              triggerStageOver() &&
              tanksEscapedCount() == 0 
)

achievement(
    type = "Progression",
    title = "Awkward", points = 10,
    description = "Complete Episode 4 - Stage 3",
    id = 115927, published = "6/28/2020 6:11:26 AM", modified = "6/28/2020 8:37:29 AM",
    trigger = currentlyActivatedCheats() == 0 && 
              currentEpisode() == 4 && 
              currentStage() == 3 && 
              stageOver()
)

achievement(
    type = "Missable",
    title = "S'up Homies", points = 5,
    description = "Complete Episode 5 - Stage 1 with 0 tanks escaped (or remaining)",
    id = 115928, published = "6/28/2020 6:11:27 AM", modified = "6/28/2020 8:29:57 AM",
    trigger = currentlyActivatedCheats() == 0 && 
              currentEpisode() == 5 && 
              currentStage() == 1 && 
              triggerStageOver() &&
              tanksEscapedCount() == 0 
)

achievement(
    type = "Missable",
    title = "I Thought I Was in America!", points = 5,
    description = "Complete Episode 5 - Stage 2 with 0 tanks escaped (or remaining)",
    id = 115929, published = "6/28/2020 6:11:29 AM", modified = "6/28/2020 8:32:47 AM",
    trigger = currentlyActivatedCheats() == 0 && 
              currentEpisode() == 5 && 
              currentStage() == 2 && 
              triggerStageOver() &&
              tanksEscapedCount() == 0 
)

achievement(
    title = "!@#$ing Mint Berry Crunch", points = 25, type="win_condition",
    description = "Complete Episode 5 - Stage 3 and beat the game",
    id = 115930, published = "6/28/2020 6:11:32 AM", modified = "6/28/2020 6:11:32 AM",
    trigger = currentlyActivatedCheats() == 0 && 
              currentEpisode() == 5 && 
              currentStage() == 3 && 
              stageOver()
)

achievement(
    title = "Gridiron Gear", points = 2,
    description = "Collect the Football Pads",
    id = 115931, published = "6/28/2020 6:11:41 AM", modified = "6/28/2020 6:48:17 AM",
    trigger = armorAmount() > prev(armorAmount()) && currentStage() != 0 && currentEpisode() != 0
)

achievement(
    title = "Burning Rubber", points = 1,
    description = "Collect the Dodge Ball",
    id = 115932, published = "6/28/2020 6:11:43 AM", modified = "6/28/2020 6:48:21 AM",
    trigger = prev(dodgeballAmmo()) == 0 && dodgeballAmmo() > 0 && dodgeballAmmo() != 100 && currentlyActivatedCheats() == 0 &&
              currentStage() != 0 && currentEpisode() != 0
)

achievement(
    title = "Taking the Plunge", points = 1,
    description = "Collect the Toilet Plunger Launcher",
    id = 115933, published = "6/28/2020 6:11:47 AM", modified = "6/28/2020 6:48:22 AM",
    trigger = prev(plungerAmmo()) == 0 && plungerAmmo() > 0 && plungerAmmo() != 100 && currentlyActivatedCheats() == 0 &&
              currentStage() != 0 && currentEpisode() != 0
)

achievement(
    title = "It's Nerf or Nothing!", points = 1,
    description = "Collect the Sponge Dart Launcher",
    id = 115934, published = "6/28/2020 6:11:50 AM", modified = "4/6/2021 5:24:45 PM",
    trigger = prev(spongeDartAmmo()) == 0 && spongeDartAmmo() > 0 && currentlyActivatedCheats() == 0 && currentStage() != 0 &&
              currentEpisode() != 0
)

achievement(
    title = "Poo-doo Dolls", points = 1,
    description = "Collect the Terrance & Phillip dolls",
    id = 115935, published = "6/28/2020 6:11:53 AM", modified = "6/28/2020 6:48:25 AM",
    trigger = prev(terranceAndPhillipDollAmmo()) == 0 && terranceAndPhillipDollAmmo() > 0 && terranceAndPhillipDollAmmo() != 100 && currentlyActivatedCheats() == 0 &&
              currentStage() != 0 && currentEpisode() != 0
)

achievement(
    title = "What the Cluck?!", points = 1,
    description = "Collect the Super Sniper Chicken",
    id = 115936, published = "6/28/2020 6:11:57 AM", modified = "6/28/2020 6:48:27 AM",
    trigger = prev(superSniperChickenAmmo()) == 0 && superSniperChickenAmmo() > 0 && superSniperChickenAmmo() != 100 && currentlyActivatedCheats() == 0 &&
              currentStage() != 0 && currentEpisode() != 0
)

achievement(
    title = "Rad Scientist", points = 2,
    description = "Collect Dr. Mephesto's Warpo Ray",
    id = 115937, published = "6/28/2020 6:12:00 AM", modified = "6/2/2021 1:52:02 PM",
    trigger = prev(warpoRayAmmo()) == 0 && warpoRayAmmo() > 0 && currentlyActivatedCheats() == 0 && currentStage() != 0 &&
              currentEpisode() != 0
)

achievement(
    title = "Udder Chaos", points = 3,
    description = "Collect the Cow Launcher",
    id = 115939, published = "6/28/2020 6:12:05 AM", modified = "6/2/2021 1:51:56 PM",
    trigger = prev(cowLauncherAmmo()) == 0 && cowLauncherAmmo() > 0 && cowLauncherAmmo() != 100 && currentlyActivatedCheats() == 0 &&
              currentStage() != 0 && currentEpisode() != 0
)

achievement(
    title = "Lob Rat", points = 3,
    description = "Stockpile 80 dodgeballs",
    id = 115944, published = "6/28/2020 6:12:21 AM", modified = "6/28/2020 6:21:24 AM",
    trigger = prev(dodgeballAmmo()) < 80 && dodgeballAmmo() == 80 && dodgeballAmmo() != 100 && currentlyActivatedCheats() == 0
)

achievement(
    title = "Ammo Absorber", points = 3,
    description = "Stockpile 200 darts",
    id = 115945, published = "6/28/2020 6:12:25 AM", modified = "6/28/2020 6:21:30 AM",
    trigger = prev(spongeDartAmmo()) < 200 && spongeDartAmmo() == 200 && spongeDartAmmo() != 100 && currentlyActivatedCheats() == 0
)

achievement(
    title = "Cloglike", points = 3,
    description = "Stockpile 40 toilet plungers",
    id = 115946, published = "6/28/2020 6:12:28 AM", modified = "6/28/2020 6:21:37 AM",
    trigger = prev(plungerAmmo()) < 40 && plungerAmmo() == 40 && plungerAmmo() != 100 && currentlyActivatedCheats() == 0
)

achievement(
    title = "10 Gallons of Gunfire", points = 5,
    description = "Stockpile 10 cows",
    id = 115947, published = "6/28/2020 6:12:32 AM", modified = "7/12/2020 10:12:02 PM",
    trigger = prev(cowLauncherAmmo()) < 10 && cowLauncherAmmo() == 10 && cowLauncherAmmo() != 100 && currentlyActivatedCheats() == 0
)

achievement(
    title = "Snack Break", points = 2,
    description = "Collect any power-up",
    id = 115948, published = "6/28/2020 6:12:37 AM", modified = "6/2/2021 1:53:52 PM",
    trigger = doubleFireRateTrigger() == 1 && prev(doubleFireRateTrigger()) == 0
)

achievement(
    title = "Howdy Ho!", points = 2,
    description = "Collect Mr. Hankey",
    id = 115949, published = "6/28/2020 6:12:39 AM", modified = "6/28/2020 10:00:59 AM",
    trigger = mrHankeyOne() == 24 && prev(mrHankeyOne()) == 0 && mrHankeyTwo() == 128 && prev(mrHankeyTwo()) == 0
)

achievement(
    type = "Missable",
    title = "Cold Score-age I", points = 5,
    description = "Score 50,000 points",
    id = 115940, published = "6/28/2020 6:12:07 AM", modified = "4/22/2023 6:38:23 PM",
    trigger = scoreDword() >= 50000 && prev(scoreDword()) < 50000 && (screenId() == 0x0D || screenId() == 0x0E)
)

achievement(
    type = "Missable",
    title = "Cold Score-age II", points = 5,
    description = "Score 100,000 points",
    id = 115941, published = "6/28/2020 6:12:11 AM", modified = "4/22/2023 6:38:24 PM",
    trigger = scoreDword() >= 100000 && prev(scoreDword()) < 100000 && (screenId() == 0x0D || screenId() == 0x0E)
)

achievement(
    type = "Missable",
    title = "Cold Score-age III", points = 10,
    description = "Score 300,000 points",
    id = 115942, published = "6/28/2020 6:12:13 AM", modified = "4/22/2023 6:38:24 PM",
    trigger = scoreDword() >= 300000 && prev(scoreDword()) < 300000 && (screenId() == 0x0D || screenId() == 0x0E)
)

achievement(
    type = "Missable",
    title = "Cold Score-age IV", points = 10,
    description = "Score 400,000 points",
    id = 115943, published = "6/28/2020 6:12:14 AM", modified = "4/22/2023 6:38:25 PM",
    trigger = scoreDword() >= 400000 && prev(scoreDword()) < 400000 && (screenId() == 0x0D || screenId() == 0x0E)
)

achievement(
    title = "SP-Max", points = 5, type="missable",
    description = "Crush 130 minions, KO 4 innocent creatures, and stockpile 60 dodgeballs in Episode 1 - Stage 1",
    id = 115950, published = "6/28/2020 6:12:48 AM", modified = "8/4/2020 11:53:36 AM",
    trigger = currentEpisode() == 1 && currentStage() == 1 && InnocentCreatures() == 4 && dodgeballAmmo() == 60 &&
              minionsKilled() >= 130 && currentlyActivatedCheats() == 0
)

achievement(
    title = "Harsh Reality", points = 10, type="missable",
    description = "Complete Episode 1 - Stage 1 without taking damage",
    id = 115951, published = "6/28/2020 6:12:53 AM", modified = "6/2/2021 1:54:22 PM",
    trigger = currentlyActivatedCheats() == 0 &&
              once(prev(currentStage()) == 0 && currentStage() == 1 && prev(currentEpisode()) == 0 && currentEpisode() == 1) &&
              never(playerHealth() < prev(playerHealth())) &&
              never(currentEpisode() != 1) && 
              never(currentStage() != 1) && 
              triggerStageOver() 
)


// This appears to be wrong. 
// Ticket 48023: Brown house had burnt down, tanks were still active. I quit to the title screen and this popped.
//               RetroAchievements Hash: 1730119B0455EF89C4E495DEC8E950A5
//               Emulator: RetroArch (Mupen64Plus-Next)
//               Emulator Version: 1.10.1
achievement(
    title = "Here You Go Turkeys", points = 10, type="missable",
    description = "Complete any Tank Rampage before the town reaches 60 percent damage",
    id = 115952, published = "6/28/2020 6:12:55 AM", modified = "12/7/2022 7:49:20 PM",
    trigger = trigger_when(tanksKillCount() >= 1) && currentStage() == 0 && currentEpisode() == 0 &&
              (currentlyActivatedCheats() == 0) && townDestroyed() >= 0.6 &&
              triggerStageOver() 
)

achievement(
    type = "Missable",
    title = "Back to the Food Chain", points = 5,
    description = "KO 14 innocent creatures in Episode 3 - Stage 1",
    id = 115956, published = "6/28/2020 6:20:57 AM", modified = "6/2/2021 1:52:33 PM",
    trigger = currentlyActivatedCheats() == 0 && measured(InnocentCreatures() == 14, when=(currentStage() == 1 && currentEpisode() == 3))
)

achievement(
    type = "Missable",
    title = "Huddle Up", points = 5,
    description = "Find the secret cave and collect the Football Pads in Episode 3 - Stage 1",
    id = 115954, published = "6/28/2020 6:13:02 AM", modified = "6/2/2021 1:54:39 PM",
    trigger = armorAmount() > prev(armorAmount()) && currentStage() == 1 && currentEpisode() == 3
)

achievement(
    title = "Anger Management I", points = 10, type="missable",
    description = "Complete Episode 1 - Stage 4 with 40 or more health",
    id = 115958, published = "6/28/2020 6:32:52 AM", modified = "12/7/2022 8:28:38 PM",
    trigger = currentlyActivatedCheats() == 0 && 
              trueLevelNumber() == 3 && 
              triggerStageOver() &&
              playerHealth() >= 40 &&
              trigger_when(tanksEscapedCount() == 0)
)

achievement(
    title = "Anger Management II", points = 10, type="missable",
    description = "Complete Episode 2 - Stage 3 with 40 or more health",
    id = 115960, published = "6/28/2020 6:37:33 AM", modified = "12/7/2022 8:47:53 PM",
    trigger = currentlyActivatedCheats() == 0 && 
              trueLevelNumber() == 6 && 
              triggerStageOver() &&
              playerHealth() >= 40 &&
              trigger_when(tanksEscapedCount() == 0)

)

// Ticket 72278: Completed twice and did not trigger have video I can show
//               RetroAchievements Hash: 1730119B0455EF89C4E495DEC8E950A5
//               Emulator: RetroArch (mupen64plus_next)
//               Emulator Version: 1.18.0
// Ticket 58789: Did not pop upon completion. Watched end scene and end credits all the way through.
//               RetroAchievements Hash: 1730119B0455EF89C4E495DEC8E950A5
//               Emulator: RetroArch (Parallel)
//               Emulator Version: 1.10.3
achievement(
    title = "Anger Management III", points = 25, type="missable",
    description = "Complete Episode 5 - Stage 3 with 40 or more health",
    id = 115953, published = "6/28/2020 6:12:59 AM", modified = "6/2/2021 1:53:10 PM",
    trigger = currentlyActivatedCheats() == 0 && 
              trueLevelNumber() == 16 && 
              triggerStageOver() &&
              playerHealth() >= 40 &&
              trigger_when(tanksEscapedCount() == 0)
    
    // Why is this weird. 
    // currentEpisode() == 5 && currentStage() == 3 && prev(finalBossHealth()) == 68 && finalBossHealth() == 167 &&
       //       currentlyActivatedCheats() == 0 && once(cutsceneIntros() == 1) && never(playerHealth() < 40)
)

achievement(
    title = "Have Yourself a Time", points = 1,
    description = "Watch the full South Park theme song",
    id = 115955, published = "6/28/2020 6:13:05 AM", modified = "3/28/2022 7:33:05 AM",
    trigger = repeated(1670, introScreens() == 8) && never(introScreens() != 8)
)

achievement(
    title = "[VOID]Homecoming (40%)", points = 10,
    description = "Completed boss battle with health above 40%",
    id = 115957, published = "6/28/2020 6:26:13 AM", modified = "6/28/2020 6:26:13 AM",
    trigger = prev(currentStage()) == 4 && prev(currentEpisode()) == 1 && introScreens() == 14 && tanksEscapedCount() == 0 &&
              once(cutsceneIntros() == 1) && never(playerHealth() < 40)
)

achievement(
    title = "[VOID]Mother Lovin' Spoonful (40%)", points = 10, type="missable",
    description = "Complete boss battle with health above 40%",
    id = 115959, published = "6/28/2020 6:35:24 AM", modified = "6/28/2020 6:35:24 AM",
    trigger = currentlyActivatedCheats() == 0 && prev(currentStage()) == 3 && prev(currentEpisode()) == 2 && introScreens() == 14 &&
              once(cutsceneIntros() == 1) && never(playerHealth() < 40)
)

achievement(
    title = "[VOID]Alien Dancing Gizmo", points = 2,
    description = "Find dancing gizmo for first time",
    id = 115938, published = "6/28/2020 6:12:03 AM", modified = "6/28/2020 6:48:29 AM",
    trigger = prev(alienDancingGizmoAmmo()) == 0 && alienDancingGizmoAmmo() > 0 && alienDancingGizmoAmmo() != 100 && currentlyActivatedCheats() == 0 &&
              currentStage() != 0 && currentEpisode() != 0
)


rich_presence_display("Destroying the enemies with a {0} in stage {1} with {2} health remaining ",
    rich_presence_lookup("Weapon", currentWeaponMaybe(), WeaponLookup),
    rich_presence_lookup("level", trueLevelNumber(), levelLookup),
    rich_presence_value("Health", playerHealth())
)