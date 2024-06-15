// South Park
// #ID = 10328

// $0B0D34: cut scenes intros = 01 -- 8-bit
function cutsceneIntros() => byte(0x0B0D34)

// $0C4200: Current Episode (Changes with level select in menu)
function currentEpisode() => byte(0x0C4200)

// $0C4204: Current Stage (Changes with level select in menu)
function currentStage() => byte(0x0C4204)

// $0C431C: [Float] Level 2-2 Town: Amount of Town Destroyed
//          Max = 1.0
function townDestroyed() => float(0x0C431C)

// $0CD220: Currently Activated Cheats
function currentlyActivatedCheats() => byte(0x0CD220)

// $0CD344: Screen ID:
//          0x0a = Main Menu
//          0x0b = Select Kid Screen
//          0x0c = Stage Information Screen
//          0x0d = Gameplay
//          0x0e = Result Screen
function screenIdDword() => dword(0x0CD344)

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
    title = "Faire Game - Tank Toppler", points = 4,
    description = "Complete Episode 1 - Stage 1 with 0 tanks escaped",
    id = 115914, badge = "126599", published = "6/28/2020 6:11:02 AM", modified = "6/2/2021 1:53:19 PM",
    trigger = currentlyActivatedCheats() == 0 && once(currentStage() == 0 && prev(currentStage()) == 1) &&
              once(currentEpisode() == 0 && prev(currentEpisode()) == 1) && byte(0x0CD340) == 14 && tanksEscapedCount() == 0 &&
              never(currentStage() > 1) && never(currentEpisode() > 1)
)

achievement(
    title = "Turkey Shoot - Tank Toppler", points = 4,
    description = "Complete Episode 1 - Stage 2 with 0 tanks escaped (watch the cutscene afterward)",
    id = 115915, badge = "126598", published = "6/28/2020 6:11:07 AM", modified = "6/2/2021 1:53:25 PM",
    trigger = never(currentlyActivatedCheats() != 0) && currentStage() == 2 && currentEpisode() == 1 && byte(0x0CD340) == 16 &&
              tanksEscapedCount() == 0 && once(cutsceneIntros() == 1) && never(currentStage() != 2)
)

// Ticket 58508: Didn't pop upon completion or viewing the scene.
//               RetroAchievements Hash: 1730119B0455EF89C4E495DEC8E950A5
//               Emulator: RetroArch (Parallel)
//               Emulator Version: 1.10.3
achievement(
    title = "Search and Destroy - Tank Toppler", points = 4,
    description = "Complete Episode 1 - Stage 3 with 0 tanks escaped (watch the cutscene afterward)",
    id = 115916, badge = "126600", published = "6/28/2020 6:11:09 AM", modified = "6/2/2021 1:53:31 PM",
    trigger = never(currentlyActivatedCheats() != 0) && currentStage() == 3 && currentEpisode() == 1 && byte(0x0CD340) == 16 &&
              tanksEscapedCount() == 0 && once(cutsceneIntros() == 1) && never(currentStage() != 3)
)

achievement(
    title = "Homecoming - Tank Toppler", points = 10,
    description = "Complete Episode 1 - Stage 4 with 0 tanks escaped",
    id = 115917, badge = "126591", published = "6/28/2020 6:11:11 AM", modified = "6/28/2020 8:22:48 AM",
    trigger = currentStage() == 4 && currentEpisode() == 1 && byte(0x0CD340) == 16 && tanksEscapedCount() == 0 &&
              once(cutsceneIntros() == 1) && never(currentlyActivatedCheats() != 0) && never(currentStage() != 4)
)

achievement(
    title = "There Goes the Neighborhood - Tank Toppler", points = 4,
    description = "Complete Episode 2 - Stage 1 with 0 tanks escaped",
    id = 115918, badge = "126579", published = "6/28/2020 6:11:12 AM", modified = "6/2/2021 1:50:55 PM",
    trigger = never(currentlyActivatedCheats() != 0) && currentStage() == 1 && currentEpisode() == 2 && byte(0x0CD340) == 16 &&
              tanksEscapedCount() == 0 && once(cutsceneIntros() == 1) && never(currentStage() != 1)
)

achievement(
    title = "Warehouse Run - Tank Toppler", points = 4,
    description = "Complete Episode 2 - Stage 2 with 0 tanks escaped",
    id = 115919, badge = "126580", published = "6/28/2020 6:11:14 AM", modified = "6/2/2021 1:51:01 PM",
    trigger = currentlyActivatedCheats() == 0 && currentStage() == 2 && currentEpisode() == 2 && byte(0x0CD340) == 16 &&
              tanksEscapedCount() == 0 && once(cutsceneIntros() == 1) && never(currentStage() != 2)
)

achievement(
    title = "Mother Lovin' Spoonful - Tank Toppler", points = 10,
    description = "Complete Episode 2 - Stage 3 with 0 tanks escaped",
    id = 115920, badge = "126590", published = "6/28/2020 6:11:15 AM", modified = "6/28/2020 8:23:04 AM",
    trigger = currentlyActivatedCheats() == 0 && currentStage() == 3 && currentEpisode() == 2 && byte(0x0CD340) == 16 &&
              tanksEscapedCount() == 0 && once(cutsceneIntros() == 1) && never(currentStage() != 3)
)

achievement(
    title = "The Visitors Return - Tank Toppler", points = 5,
    description = "Complete Episode 3 - Stage 1 with 0 tanks escaped",
    id = 115921, badge = "126586", published = "6/28/2020 6:11:16 AM", modified = "6/2/2021 1:51:08 PM",
    trigger = currentlyActivatedCheats() == 0 && currentStage() == 1 && currentEpisode() == 3 && byte(0x0CD340) == 16 &&
              tanksEscapedCount() == 0 && once(cutsceneIntros() == 1) && never(currentStage() != 1)
)

achievement(
    title = "Road to Craterville - Tank Toppler", points = 5,
    description = "Complete Episode 3 - Stage 2 with 0 tanks escaped (watch the cutscene afterward)",
    id = 115922, badge = "126587", published = "6/28/2020 6:11:18 AM", modified = "6/2/2021 1:51:14 PM",
    trigger = currentlyActivatedCheats() == 0 && currentStage() == 2 && currentEpisode() == 3 && byte(0x0CD340) == 16 &&
              tanksEscapedCount() == 0 && once(cutsceneIntros() == 1) && never(currentStage() != 2)
)

achievement(
    title = "One Mother of a Ship - Tank Toppler", points = 5,
    description = "Complete Episode 3 - Stage 3 with 0 tanks escaped",
    id = 115923, badge = "126588", published = "6/28/2020 6:11:20 AM", modified = "6/2/2021 1:51:21 PM",
    trigger = currentlyActivatedCheats() == 0 && currentStage() == 3 && currentEpisode() == 3 && byte(0x0CD340) == 16 &&
              tanksEscapedCount() == 0 && once(cutsceneIntros() == 1) && never(currentStage() != 3)
)

achievement(
    title = "Blow the Core - Tank Toppler", points = 10,
    description = "Complete Episode 3 - Stage 4 with 0 tanks escaped",
    id = 115924, badge = "126592", published = "6/28/2020 6:11:21 AM", modified = "4/6/2021 4:37:06 PM",
    trigger = once(currentEpisode() == 0 && prev(currentEpisode()) == 3) &&
              once(currentStage() == 0 && prev(currentStage()) == 4) &&
              once(currentEpisode() == 4 && prev(currentEpisode()) == 0) && prev(tanksEscapedCount()) == 0 && currentlyActivatedCheats() == 0
)

achievement(
    title = "Seismic Rumble - Tank Toppler", points = 5,
    description = "Complete Episode 4 - Stage 1 with 0 tanks escaped",
    id = 115925, badge = "126593", published = "6/28/2020 6:11:23 AM", modified = "6/2/2021 1:51:27 PM",
    trigger = currentlyActivatedCheats() == 0 && currentStage() == 1 && currentEpisode() == 4 && byte(0x0CD340) == 16 &&
              tanksEscapedCount() == 0 && once(cutsceneIntros() == 1) && never(currentStage() != 1)
)

achievement(
    title = "Militia Madness - Tank Toppler", points = 5,
    description = "Complete Episode 4 - Stage 2 with 0 tanks escaped (watch the cutscene afterward)",
    id = 115926, badge = "126594", published = "6/28/2020 6:11:24 AM", modified = "6/2/2021 1:51:33 PM",
    trigger = currentlyActivatedCheats() == 0 && currentStage() == 2 && currentEpisode() == 4 && byte(0x0CD340) == 16 &&
              tanksEscapedCount() == 0 && once(cutsceneIntros() == 1) && never(currentStage() != 2)
)

achievement(
    title = "Nuts and Boltz - Tank Toppler", points = 10,
    description = "Complete Episode 4 - Stage 3 with 0 tanks escaped",
    id = 115927, badge = "126595", published = "6/28/2020 6:11:26 AM", modified = "6/28/2020 8:37:29 AM",
    trigger = currentlyActivatedCheats() == 0 && currentStage() == 3 && currentEpisode() == 4 && byte(0x0CD340) == 16 &&
              tanksEscapedCount() == 0 && once(cutsceneIntros() == 1) && never(currentStage() != 3)
)

achievement(
    title = "Toy Rampage - Tank Toppler", points = 5,
    description = "Complete Episode 5 - Stage 1 with 0 tanks escaped",
    id = 115928, badge = "126596", published = "6/28/2020 6:11:27 AM", modified = "6/28/2020 8:29:57 AM",
    trigger = currentlyActivatedCheats() == 0 && currentStage() == 1 && currentEpisode() == 5 && byte(0x0CD340) == 16 &&
              tanksEscapedCount() == 0 && once(cutsceneIntros() == 1) && never(currentStage() != 1)
)

// Ticket 69895: Destroyed all the tanks and passed the level. The achievement did not fall out
//               RetroAchievements Hash: 1730119B0455EF89C4E495DEC8E950A5
//               Emulator: RetroArch (ParaLLEI N64)
//               Emulator Version: 1.17.0
achievement(
    title = "Parking Problem - Tank Toppler", points = 5,
    description = "Complete Episode 5 - Stage 2 with 0 tanks escaped",
    id = 115929, badge = "126597", published = "6/28/2020 6:11:29 AM", modified = "6/28/2020 8:32:47 AM",
    trigger = currentlyActivatedCheats() == 0 && currentStage() == 2 && currentEpisode() == 5 && byte(0x0CD340) == 16 &&
              tanksEscapedCount() == 0 && once(cutsceneIntros() == 1) && never(currentStage() != 2)
)

// Ticket 72277: Completed twice and did not trigger
//               RetroAchievements Hash: 1730119B0455EF89C4E495DEC8E950A5
//               Emulator: RetroArch (mupen64plus_next)
//               Emulator Version: 1.18.0
// Ticket 58790: Did not pop upon completion. Watched end scene and end credits. Save state available.
//               RetroAchievements Hash: 1730119B0455EF89C4E495DEC8E950A5
//               Emulator: RetroArch (Parallel)
//               Emulator Version: 1.10.3
achievement(
    title = "Batteries Included", points = 25, type="win_condition",
    description = "Complete Episode 5 - Stage 3 and beat the game",
    id = 115930, badge = "126560", published = "6/28/2020 6:11:32 AM", modified = "6/28/2020 6:11:32 AM",
    trigger = currentEpisode() == 5 && currentStage() == 3 && prev(finalBossHealth()) == 68 && finalBossHealth() == 167 &&
              currentlyActivatedCheats() == 0
)

achievement(
    title = "Gridiron Gear", points = 2,
    description = "Collect the Football Pads",
    id = 115931, badge = "126561", published = "6/28/2020 6:11:41 AM", modified = "6/28/2020 6:48:17 AM",
    trigger = armorAmount() > prev(armorAmount()) && currentStage() != 0 && currentEpisode() != 0
)

achievement(
    title = "Burning Rubber", points = 1,
    description = "Collect the Dodge Ball",
    id = 115932, badge = "126562", published = "6/28/2020 6:11:43 AM", modified = "6/28/2020 6:48:21 AM",
    trigger = prev(dodgeballAmmo()) == 0 && dodgeballAmmo() > 0 && dodgeballAmmo() != 100 && currentlyActivatedCheats() == 0 &&
              currentStage() != 0 && currentEpisode() != 0
)

achievement(
    title = "Taking the Plunge", points = 1,
    description = "Collect the Toilet Plunger Launcher",
    id = 115933, badge = "126564", published = "6/28/2020 6:11:47 AM", modified = "6/28/2020 6:48:22 AM",
    trigger = prev(plungerAmmo()) == 0 && plungerAmmo() > 0 && plungerAmmo() != 100 && currentlyActivatedCheats() == 0 &&
              currentStage() != 0 && currentEpisode() != 0
)

achievement(
    title = "It's Nerf or Nothing!", points = 1,
    description = "Collect the Sponge Dart Launcher",
    id = 115934, badge = "126563", published = "6/28/2020 6:11:50 AM", modified = "4/6/2021 5:24:45 PM",
    trigger = prev(spongeDartAmmo()) == 0 && spongeDartAmmo() > 0 && currentlyActivatedCheats() == 0 && currentStage() != 0 &&
              currentEpisode() != 0
)

achievement(
    title = "Poo-doo Dolls", points = 1,
    description = "Collect the Terrance & Phillip dolls",
    id = 115935, badge = "126566", published = "6/28/2020 6:11:53 AM", modified = "6/28/2020 6:48:25 AM",
    trigger = prev(terranceAndPhillipDollAmmo()) == 0 && terranceAndPhillipDollAmmo() > 0 && terranceAndPhillipDollAmmo() != 100 && currentlyActivatedCheats() == 0 &&
              currentStage() != 0 && currentEpisode() != 0
)

achievement(
    title = "What the Cluck?!", points = 1,
    description = "Collect the Super Sniper Chicken",
    id = 115936, badge = "126568", published = "6/28/2020 6:11:57 AM", modified = "6/28/2020 6:48:27 AM",
    trigger = prev(superSniperChickenAmmo()) == 0 && superSniperChickenAmmo() > 0 && superSniperChickenAmmo() != 100 && currentlyActivatedCheats() == 0 &&
              currentStage() != 0 && currentEpisode() != 0
)

achievement(
    title = "Rad Scientist", points = 2,
    description = "Collect Dr. Mephesto's Warpo Ray",
    id = 115937, badge = "126565", published = "6/28/2020 6:12:00 AM", modified = "6/2/2021 1:52:02 PM",
    trigger = prev(warpoRayAmmo()) == 0 && warpoRayAmmo() > 0 && currentlyActivatedCheats() == 0 && currentStage() != 0 &&
              currentEpisode() != 0
)

achievement(
    title = "Udder Chaos", points = 3,
    description = "Collect the Cow Launcher",
    id = 115939, badge = "126569", published = "6/28/2020 6:12:05 AM", modified = "6/2/2021 1:51:56 PM",
    trigger = prev(cowLauncherAmmo()) == 0 && cowLauncherAmmo() > 0 && cowLauncherAmmo() != 100 && currentlyActivatedCheats() == 0 &&
              currentStage() != 0 && currentEpisode() != 0
)

achievement(
    title = "Lob Rat", points = 3,
    description = "Stockpile 80 dodgeballs",
    id = 115944, badge = "126635", published = "6/28/2020 6:12:21 AM", modified = "6/28/2020 6:21:24 AM",
    trigger = prev(dodgeballAmmo()) < 80 && dodgeballAmmo() == 80 && dodgeballAmmo() != 100 && currentlyActivatedCheats() == 0
)

achievement(
    title = "Ammo Absorber", points = 3,
    description = "Stockpile 200 darts",
    id = 115945, badge = "126642", published = "6/28/2020 6:12:25 AM", modified = "6/28/2020 6:21:30 AM",
    trigger = prev(spongeDartAmmo()) < 200 && spongeDartAmmo() == 200 && spongeDartAmmo() != 100 && currentlyActivatedCheats() == 0
)

achievement(
    title = "Cloglike", points = 3,
    description = "Stockpile 40 toilet plungers",
    id = 115946, badge = "126645", published = "6/28/2020 6:12:28 AM", modified = "6/28/2020 6:21:37 AM",
    trigger = prev(plungerAmmo()) < 40 && plungerAmmo() == 40 && plungerAmmo() != 100 && currentlyActivatedCheats() == 0
)

achievement(
    title = "10 Gallons of Gunfire", points = 5,
    description = "Stockpile 10 cows",
    id = 115947, badge = "126675", published = "6/28/2020 6:12:32 AM", modified = "7/12/2020 10:12:02 PM",
    trigger = prev(cowLauncherAmmo()) < 10 && cowLauncherAmmo() == 10 && cowLauncherAmmo() != 100 && currentlyActivatedCheats() == 0
)

achievement(
    title = "Snack Break", points = 2,
    description = "Collect any power-up",
    id = 115948, badge = "126646", published = "6/28/2020 6:12:37 AM", modified = "6/2/2021 1:53:52 PM",
    trigger = doubleFireRateTrigger() == 1 && prev(doubleFireRateTrigger()) == 0
)

achievement(
    title = "Howdy Ho!", points = 2,
    description = "Collect Mr. Hankey",
    id = 115949, badge = "126649", published = "6/28/2020 6:12:39 AM", modified = "6/28/2020 10:00:59 AM",
    trigger = mrHankeyOne() == 24 && prev(mrHankeyOne()) == 0 && mrHankeyTwo() == 128 && prev(mrHankeyTwo()) == 0
)

achievement(
    title = "Cold Score-age I", points = 5,
    description = "Score 50,000 points",
    id = 115940, badge = "126570", published = "6/28/2020 6:12:07 AM", modified = "4/22/2023 6:38:23 PM",
    trigger = scoreDword() >= 50000 && prev(scoreDword()) < 50000 && currentStage() != 0 && currentEpisode() != 0
)

achievement(
    title = "Cold Score-age II", points = 5,
    description = "Score 100,000 points",
    id = 115941, badge = "126571", published = "6/28/2020 6:12:11 AM", modified = "4/22/2023 6:38:24 PM",
    trigger = scoreDword() >= 100000 && prev(scoreDword()) < 100000 && currentStage() != 0 && currentEpisode() != 0
)

// Ticket 58562: Didn't pop upon getting 300k points
//               RetroAchievements Hash: 1730119B0455EF89C4E495DEC8E950A5
//               Emulator: RetroArch (Parallel)
//               Emulator Version: 1.10.3
achievement(
    title = "Cold Score-age III", points = 10,
    description = "Score 300,000 points",
    id = 115942, badge = "126572", published = "6/28/2020 6:12:13 AM", modified = "4/22/2023 6:38:24 PM",
    trigger = scoreDword() >= 300000 && prev(scoreDword()) < 300000 && currentStage() != 0 && currentEpisode() != 0
)

achievement(
    title = "Cold Score-age IV", points = 10,
    description = "Score 400,000 points",
    id = 115943, badge = "126574", published = "6/28/2020 6:12:14 AM", modified = "4/22/2023 6:38:25 PM",
    trigger = scoreDword() >= 400000 && prev(scoreDword()) < 400000 && currentStage() != 0 && currentEpisode() != 0
)

achievement(
    title = "SP-Max", points = 5, type="missable",
    description = "Crush 130 minions, KO 4 innocent creatures, and stockpile 60 dodgeballs in Episode 1 - Stage 1",
    id = 115950, badge = "126601", published = "6/28/2020 6:12:48 AM", modified = "8/4/2020 11:53:36 AM",
    trigger = currentEpisode() == 1 && currentStage() == 1 && InnocentCreatures() == 4 && dodgeballAmmo() == 60 &&
              minionsKilled() >= 130 && currentlyActivatedCheats() == 0
)

achievement(
    title = "Harsh Reality", points = 10, type="missable",
    description = "Complete Episode 1 - Stage 1 without taking damage",
    id = 115951, badge = "126602", published = "6/28/2020 6:12:53 AM", modified = "6/2/2021 1:54:22 PM",
    trigger = currentlyActivatedCheats() == 0 &&
              once(prev(currentStage()) == 0 && currentStage() == 1 && prev(currentEpisode()) == 0 && currentEpisode() == 1) &&
              never(playerHealth() < prev(playerHealth())) &&
              once(currentStage() == 0 && prev(currentStage()) == 1 && currentEpisode() == 0 &&
                  prev(currentEpisode()) == 1 && byte(0x0CD340) == 14
              )
)

// Ticket 48023: Brown house had burnt down, tanks were still active. I quit to the title screen and this popped.
//               RetroAchievements Hash: 1730119B0455EF89C4E495DEC8E950A5
//               Emulator: RetroArch (Mupen64Plus-Next)
//               Emulator Version: 1.10.1
achievement(
    title = "Fire Marshall", points = 10, type="missable",
    description = "Complete Episode 2 - Stage 1 before the brown house burns down",
    id = 115952, badge = "126559", published = "6/28/2020 6:12:55 AM", modified = "12/7/2022 7:49:20 PM",
    trigger = trigger_when(tanksKillCount() >= 1) && currentStage() == 0 && currentEpisode() == 0 &&
              (currentlyActivatedCheats() == 0 || currentlyActivatedCheats() == 128) && townDestroyed() >= 0.6 &&
              trigger_when(prev(screenIdDword()) == 13) && trigger_when(screenIdDword() == 14)
)

achievement(
    title = "Back to the Food Chain", points = 5,
    description = "KO 14 innocent creatures in Episode 3 - Stage 1",
    id = 115956, badge = "128507", published = "6/28/2020 6:20:57 AM", modified = "6/2/2021 1:52:33 PM",
    trigger = currentlyActivatedCheats() == 0 && currentStage() == 1 && currentEpisode() == 3 && InnocentCreatures() == 14
)

achievement(
    title = "Huddle Up", points = 5,
    description = "Find the secret cave and collect the Football Pads in Episode 3 - Stage 1",
    id = 115954, badge = "126651", published = "6/28/2020 6:13:02 AM", modified = "6/2/2021 1:54:39 PM",
    trigger = armorAmount() > prev(armorAmount()) && currentStage() == 1 && currentEpisode() == 3
)

// Ticket 55692: i defeated the first boss without getting hit, with kenny, but the chevoo didn't appeared, the
//               unnoficial one did tho.
//               RetroAchievements Hash: 1730119B0455EF89C4E495DEC8E950A5
//               Emulator: RetroArch (Mupen64Plus-Next)
//               Emulator Version: 1.14.0
achievement(
    title = "Anger Management I", points = 10, type="missable",
    description = "Complete Episode 1 - Stage 4 with 40 or more health",
    id = 115958, badge = "126655", published = "6/28/2020 6:32:52 AM", modified = "12/7/2022 8:28:38 PM",
    trigger = currentStage() == 4 && currentEpisode() == 1 && playerHealth() >= 40 && byte(0x0CD344) == 14 &&
              prev(byte(0x0CD344)) == 13 && (currentlyActivatedCheats() == 0 || currentlyActivatedCheats() == 128)
)

// Ticket 48024: Unlocked at the New Multiplayer Character Available screen (Mephisto) after completing 2-2
//               RetroAchievements Hash: 1730119B0455EF89C4E495DEC8E950A5
//               Emulator: RetroArch (Mupen64Plus-Next)
//               Emulator Version: 1.10.1
achievement(
    title = "Anger Management II", points = 10, type="missable",
    description = "Complete Episode 2 - Stage 3 with 40 or more health",
    id = 115960, badge = "126657", published = "6/28/2020 6:37:33 AM", modified = "12/7/2022 8:47:53 PM",
    trigger = currentlyActivatedCheats() == 0 && currentStage() == 3 && currentEpisode() == 2 && prev(byte(0x0CD344)) == 13 &&
              byte(0x0CD344) == 14 && playerHealth() >= 40
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
    id = 115953, badge = "126603", published = "6/28/2020 6:12:59 AM", modified = "6/2/2021 1:53:10 PM",
    trigger = currentEpisode() == 5 && currentStage() == 3 && prev(finalBossHealth()) == 68 && finalBossHealth() == 167 &&
              currentlyActivatedCheats() == 0 && once(cutsceneIntros() == 1) && never(playerHealth() < 40)
)

achievement(
    title = "Have Yourself a Time", points = 1,
    description = "Watch the full South Park theme song",
    id = 115955, badge = "126543", published = "6/28/2020 6:13:05 AM", modified = "3/28/2022 7:33:05 AM",
    trigger = repeated(1670, byte(0x0CD340) == 8) && never(byte(0x0CD340) != 8)
)

achievement(
    title = "Homecoming (40%)", points = 10,
    description = "Completed boss battle with health above 40%",
    id = 115957, badge = "126655", published = "6/28/2020 6:26:13 AM", modified = "6/28/2020 6:26:13 AM",
    trigger = prev(currentStage()) == 4 && prev(currentEpisode()) == 1 && byte(0x0CD340) == 14 && tanksEscapedCount() == 0 &&
              once(cutsceneIntros() == 1) && never(playerHealth() < 40)
)

achievement(
    title = "Mother Lovin' Spoonful (40%)", points = 10, type="missable",
    description = "Complete boss battle with health above 40%",
    id = 115959, badge = "126590", published = "6/28/2020 6:35:24 AM", modified = "6/28/2020 6:35:24 AM",
    trigger = currentlyActivatedCheats() == 0 && prev(currentStage()) == 3 && prev(currentEpisode()) == 2 && byte(0x0CD340) == 14 &&
              once(cutsceneIntros() == 1) && never(playerHealth() < 40)
)

achievement(
    title = "Alien Dancing Gizmo", points = 2,
    description = "Find dancing gizmo for first time",
    id = 115938, badge = "126567", published = "6/28/2020 6:12:03 AM", modified = "6/28/2020 6:48:29 AM",
    trigger = prev(alienDancingGizmoAmmo()) == 0 && alienDancingGizmoAmmo() > 0 && alienDancingGizmoAmmo() != 100 && currentlyActivatedCheats() == 0 &&
              currentStage() != 0 && currentEpisode() != 0
)
