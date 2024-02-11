// Tokyo Xtreme Racer 3
// #ID = 20776

// $3394AB: (8-bit) Part of a pointer for driving.
//          
//          However if this is not set to 01, it likely will crash the game.
function drivingPointerIndicator() => byte(0x3394AB)

// $3461E0: (8-bit) Visibility Value
//          
//          If set to 0 The screen goes to almost black.   Set to 2 when driving
function cityBackgroundIndicator() => byte(0x3461E0)

// $3565B4: (32-bit likely larger) A timer for the current battle.
//          
//          Note, can't find the one who controls the UI, this however keeps in step with that (one frame ahead)
function timerForQuestBattle() => dword(0x3565B4)

// $3AEBBA: (8-bit) Garage Index of current car in game
//          
//          This moves to 0x008153ba when going back to the front end
//          
//          0x00-0x04 for Indexes
//          0x05 for Default Car.
function garageIndexInGame() => byte(0x3AEBBA)

// $3AF39E: (8-bit) Rolling Guy #1 Beat Indicator
//          
//          0x01 Marks opponent beaten, 0x00 not beat.  See 600 bytes before this for Met value.
//          
//          This is the source of truth in game
function tokoyStartingBeat() => byte(0x3AF39E)

// $3AF4D3: (8-bit) Final Boss Beat Indicator
//          
//          0x01 Marks opponent beaten, 0x00 not beat.  See 600 bytes before this for Met value.
//          
//          This is the source of truth in game
function finalBossBeatIndicator() => byte(0x3AF4D3)

// $3AF4D4: (8-bit) In game value for if Big Deal is beaten (Begining of Nagoya)
//          
//          In Game Source of Truth
function nagoyaStartingBeat() => byte(0x3AF4D4)

// $3AF556: (8-bit) In Game value for if Humanoid Precision is beaten
//          
//          (First of Osaka)
function osakaStartingBeat() => byte(0x3AF556)

// $41E90C: (8-bit) Race Result
//          
//          0x01 = Win
//          0x02 = Lose
//          0x03 = Draw
//          0x0d= Goal (For Time Attack)
function raceResult() => byte(0x41E90C)

// $41E959: (16-bit) Player's SP
//          
//          Starts at 4c4b
function playerHealth() => word(0x41E959)

// $41E9A9: (16-bit) Enemy's SP
function enemyHealth() => word(0x41E9A9)

// $41EAAA: (16-bit) Win Combo
function currentWinCombo() => word(0x41EAAA)

// $41EAE4: (Float) Today's Max Speed in KPH
//          
//          Only works in Quest Mode
function todayMaxSpeedKPH() => float(0x41EAE4)

// $41EB4C: (32-bit) Total time in Time Attack mode
//          
//          Displayed as Lap Time but not a control
function timeTimeAttackMode() => dword(0x41EB4C)

// $41EEF0: (8-bit) Max Win Combo Today
function todayMaxWinCombo() => byte(0x41EEF0)

// $8052D2: (8-bit) Game Mode
//          
//          0x00 = Quest Mode Or Main Menu
//          0x01 = Time attack
//          0x02 = Free Run
//          0x03 = Versus
//          0x08 = Replay Theater
function gameMode() => byte(0x8052D2)

// $806AD0: (8-bit) Vehicle Name ID
//          
//          Exact values are not available at this time
//          
//          0x01 = Nissan Skyline GT-R
//          0x0d = Nissan 180SX
//          0x13 = Mitsubishi Lancer Evolution V
//          0x15 = Mitsubishi GTO
//          0x18 = Mazda RX-7 Type RZ.0
//          0x1a = Mazda MX-5  Miata RS
//          0x30 = Suburu Impreza WRX STi TypeRA SpecC
//          If wrong check 0x8082d0
function vehicleNameID() => byte(0x806AD0)

// $8153B0: (32-bit) Player's Money in Quest mode.
//          
//          Money in 10s (0x10 = 160)
//          
//          
//          Also "cash" for searching code notes purpose.
function playerMoney() => dword(0x8153B0)

// $82D8A8: (Float) Quest Mode Current speed in KPH
function questModeCurrentSpeedKPH() => float(0x82D8A8)

// $82D8AC: (Float) Quest Mode Current speed in MPH
function questModeCurrentSpeedMPH() => float(0x82D8AC)

// $17F595E: (8-bit) UI element for Course Select for Time Attack Mode
//           Note there's duplicates here, so it can't be used.
function courseSelectedForTimeAttackMode() => byte(0x17F595E)

leaderboard(
    id = 87743, title = "Fastest time on Asada Yokohame CWL",
    description = "Record the fastest time on Asada Yokohame CWL in Time Trial Mode",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 3319280435,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87744, title = "Fastest time on Kasumori E Higashimeihan",
    description = "Record the fastest time on Kasumori E Higashimeihan in Time Trial Mode",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 3319944814,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87745, title = "Fastest time on Asada Yokohame CCL",
    description = "Record the fastest time on Asada Yokohame CCL in Time Trial Mode",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 3323953810,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87746, title = "Fastest time on Shibakouen C1 Outer Loop",
    description = "Record the fastest time on Shibakouen C1 Outer Loop in Time Trial Mode",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 1129065913,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87747, title = "Fastest time on Kandabashi C1 Inner Loop",
    description = "Record the fastest time on Kandabashi C1 Inner Loop in Time Trial Mode",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 1130412836,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87748, title = "Fastest time on Kurokawa W Higashimeihan",
    description = "Record the fastest time on Kurokawa W Higashimeihan in Time Trial Mode",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 1139319375,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87749, title = "Fastest time on Route 13 Area Wangan Out",
    description = "Record the fastest time on Route 13 Area Wangan Out in Time Trial Mode",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 1157061921,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87750, title = "Fastest time on Daiba ShinKanjou CWL",
    description = "Record the fastest time on Daiba ShinKanjou CWL in Time Trial Mode",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 1158280624,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87751, title = "Fastest time on Meieki Nagoya Kanjou",
    description = "Record the fastest time on Meieki Nagoya Kanjou in Time Trial Mode",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 1158574630,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87752, title = "Fastest time on Oohama Wangan In",
    description = "Record the fastest time on Oohama Wangan In in Time Trial Mode",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 1164962124,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87753, title = "Fastest time on W Nagahori Wangan Out",
    description = "Record the fastest time on W Nagahori Wangan Out in Time Trial Mode",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 1166404348,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87754, title = "Fastest time on Ariake ShinKanjou CCL",
    description = "Record the fastest time on Ariake ShinKanjou CCL in Time Trial Mode",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 1169745423,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87755, title = "Fastest time on Sakai Sakai In",
    description = "Record the fastest time on Sakai Sakai In in Time Trial Mode",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 1173017823,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87756, title = "Fastest time on Shiomibashi Sakai Out",
    description = "Record the fastest time on Shiomibashi Sakai Out in Time Trial Mode",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 1173743676,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87757, title = "Fastest time on Shinanobashi Kanjou Shortcut",
    description = "Record the fastest time on Shinanobashi Kanjou Shortcut in Time Trial Mode",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 1175707026,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87758, title = "Fastest time on Yotsuhashi Kanjou Long",
    description = "Record the fastest time on Yotsuhashi Kanjou Long in Time Trial Mode",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 1176239257,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87759, title = "Fastest time on Shibaura Yokohane Out",
    description = "Record the fastest time on Shibaura Yokohane Out in Time Trial Mode",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 3281289858,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87760, title = "Fastest time on Shioiri Yokohane In",
    description = "Record the fastest time on Shioiri Yokohane In in Time Trial Mode",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 3293729897,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87761, title = "Fastest time on Daikoku Futou Wangan In",
    description = "Record the fastest time on Daikoku Futou Wangan In in Time Trial Mode",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 3301614650,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87762, title = "Fastest Evo V on Shibakouen C1 Outer Loop",
    description = "Record the fastest time on Shibakouen C1 Outer Loop while driving the Default Car of Mitsubishi Lancer Evolution V in Time Trial Mode. Thanks to Borysewicz For the suggestion",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 1129065913 && vehicleNameID() == 19 && garageIndexInGame() == 5,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87763, title = "Fastest 180SX on Daiba ShinKanjou CWL",
    description = "Record the fastest time on Daiba ShinKanjou CWL while driving the Default Car of Nissan 180SX in Time Trial Mode. Thanks to jintei For the suggestion",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 1158280624 && vehicleNameID() == 13 && garageIndexInGame() == 5,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87764, title = "Fastest GTO on Shinanobashi Kanjou Shortcut",
    description = "Record the fastest time on Shinanobashi Kanjou Shortcut while driving the Default Car of Mitsubishi GTO in Time Trial Mode. Thanks to WeerDough For the suggestion",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 1175707026 && vehicleNameID() == 21 && garageIndexInGame() == 5,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)

leaderboard(
    id = 87765, title = "Fastest GT-R on Meieki Nagoya Kanjou",
    description = "Record the fastest time on Meieki Nagoya Kanjou while driving the Default Car of Nissan Skyline GT-R in Time Trial Mode. Thanks to letdowNN For the suggestion",
    start  = cityBackgroundIndicator() != 0 && raceResult() == 13 && prev(raceResult()) == 0 && gameMode() == 1 && 
             timeTimeAttackMode() != 0 && dword(0x82BD90) == 1158574630 && vehicleNameID() == 1 && garageIndexInGame() == 5,
    cancel = always_false(),
    submit = always_true(),
    value = timeTimeAttackMode(),
    format = "FRAMES"
)
