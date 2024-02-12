// Tokyo Xtreme Racer 3
// #ID = 20776

// $3461E0: (8-bit) Visibility Value
//          
//          If set to 0 The screen goes to almost black.   Set to 2 when driving
function visibilityValue() => byte(0x3461E0)

NOT_RACING_VISIBILITY_VALUE = 0
function actuallyRacing() => visibilityValue() != NOT_RACING_VISIBILITY_VALUE 

// $3565B4: (32-bit likely larger) A timer for the current battle.
//          
//          Note, can't find the one who controls the UI, this however keeps in step with that (one frame ahead)
function timeForCurrentBattle() => dword(0x3565B4)

// $41E90C: (8-bit) Race Result
//          
//          0x01 = Win
//          0x02 = Lose
//          0x03 = Draw
//          0x0d= Goal (For Time Attack)
function raceResult() => byte(0x41E90C)

RACING_VALUE = 0x00
GOAL_VALUE = 0x0d
function finishedTimeAttack() => raceResult() == GOAL_VALUE && prev(raceResult()) == RACING_VALUE

// $41EB4C: (32-bit) Total time in Time Attack mode
//          
//          Displayed as Lap Time but not a control
function timeAttackTotalTime() => dword(0x41EB4C)

// $8052D2: (8-bit) Game Mode
//          
//          0x00 = Quest Mode Or Main Menu
//          0x01 = Time attack
//          0x02 = Free Run
//          0x03 = Versus
//          0x08 = Replay Theater
function gameMode() => byte(0x8052D2)

TIME_ATTACK_ID = 0x01
function timeAttackID() => gameMode() == TIME_ATTACK_ID

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
//          
//          If wrong check 0x8082d0
function vehicleID() => byte(0x806AD0)

NISSAN_GTR = 0x01   
NISSAN_180SX = 0x0d
MITSUBISHI_LANCER_EVO_V = 0x13
MITSUBISHI_GTO = 0x15
MAZDA_RX_7 = 0x18
SUBURU_IMPREZA_WRX = 0x30

function carCheck(vehicleId) => vehicleID() == vehicleId
function nissanGTR() => vehicleID() == NISSAN_GTR
function nissan180Sx() => vehicleID() == NISSAN_180SX
function lancerEvoV() => vehicleID() == MITSUBISHI_LANCER_EVO_V
function mitsubishiGTO() => vehicleID() == MITSUBISHI_GTO
function mazdaRX7() => vehicleID() == MAZDA_RX_7
function suburaWRX() => vehicleID() == SUBURU_IMPREZA_WRX

// $3aebba: (8-bit) Garage Index of current car in game. 
//          
//          0x00-0x04 for Indexes
//          0x05 for Default Car.
function garageIndex() => byte(0x003aebba)

DEFAULT_CAR_VALUE = 0x05
function defaultCar() => garageIndex() == DEFAULT_CAR_VALUE

// $82BD90: (32-bit) Unique identifier for Time Attack
//          
//          Tokyo
//          0x4360bb24 = Kandabashi C1 Inner Loop
//          0x434c2db9 = Shibakouen C1 Outer Loop
//          0x45b8e60f = Ariake ShinKanjou CCL
//          0x4509f5b0 = Daiba ShinKanjou CWL
//          0x44f75d21 = Route 13 Are Wangan Out
//          0xc4caa43a = Daikoku Futou Wangan In
//          0xc3948282 = Shibaura Yokohane Out
//          0xc4525469 = Shioiri Yokohane In
//          0xc61f8292 = Asada Yokohama CCL
//          0xc5d83333 = Asada Yokohama CWL
//          
//          Nagoya
//          0x450e7226 = Meieki Nagoya Kanjou
//          0x43e8a24f = Kurokawa W. Higashimeihan
//          0xc5e2566eKasumori E. Higashimeihan
//          
//          Osaka
//          0x4613dd92 = Shinanobashi Kanjou Shortcut
//          0x461bfc99 = Yotsuhashi Kanjou Long
//          0x45f5e83c = Shiomibashi Sakai Out
//          0x45ead4df = Sakai Sakai In
//          0x4585eafc = W. Nagahori Wangan Out
//          0x456fe94c = Oohama Wangan In
function timeAttackTrackId() => dword(0x82BD90)

// Tokyo
KANDABASHI_C1_INNER_LOOP = 0x4360BB24
SHIBAKOUEN_C1_OUTER_LOOP = 0x434C2DB9 
ARIAKE_SHINKANJOU_CCL = 0x45B8E60F
DAIBA_SHINKANJOU_CWL = 0x4509F5B0
ROUTE_13_AREA_WANGAN_OUT = 0x44F75D21 
DAIKOKU_FUTOU_WANGAN_IN = 0xC4CAA43A 
SHIBAURA_YOKOHANE_OUT = 0xC3948282 
SHIOIRI_YOKOHANE_IN = 0xC4525469 
ASADA_YOKOHAMA_CCL = 0xC61F8292 
ASADA_YOKOHAMA_CWL = 0xC5D83333 
         
// Nagoya
MEIEKI_NAGOYA_KANJOU = 0x450E7226 
KUROKAWA_W_HIGASHIMEIHAN = 0x43E8A24F
KASUMORI_E_HIGASHIMEIHAN = 0xC5E2566E
         
// Osaka
SHINANOBASHI_KANJOU_SHORTCUT = 0x4613DD92
YOTSUHASHI_KANJOU_LONG = 0x461BFC99
SHIOMIBASHI_SAKAI_OUT = 0x45F5E83C 
SAKAI_IN = 0x45EAD4DF
W_NAGAHORI_WANGAN_OUT = 0x4585EAFC
OOHAMA_WANGAN_IN = 0x456FE94C


TrackLookup =
{
    KANDABASHI_C1_INNER_LOOP: "Kandabashi C1 Inner Loop",
    SHIBAKOUEN_C1_OUTER_LOOP: "Shibakouen C1 Outer Loop",
    ARIAKE_SHINKANJOU_CCL: "Ariake ShinKanjou CCL",
    DAIBA_SHINKANJOU_CWL: "Daiba ShinKanjou CWL",
    ROUTE_13_AREA_WANGAN_OUT: "Route 13 Area Wangan Out",
    DAIKOKU_FUTOU_WANGAN_IN: "Daikoku Futou Wangan In",
    SHIBAURA_YOKOHANE_OUT: "Shibaura Yokohane Out",
    SHIOIRI_YOKOHANE_IN: "Shioiri Yokohane In",
    ASADA_YOKOHAMA_CCL: "Asada Yokohame CCL",
    ASADA_YOKOHAMA_CWL: "Asada Yokohame CWL",
    MEIEKI_NAGOYA_KANJOU: "Meieki Nagoya Kanjou",
    KUROKAWA_W_HIGASHIMEIHAN: "Kurokawa W Higashimeihan",
    KASUMORI_E_HIGASHIMEIHAN: "Kasumori E Higashimeihan",
    SHINANOBASHI_KANJOU_SHORTCUT: "Shinanobashi Kanjou Shortcut",
    YOTSUHASHI_KANJOU_LONG: "Yotsuhashi Kanjou Long",
    SHIOMIBASHI_SAKAI_OUT: "Shiomibashi Sakai Out",
    SAKAI_IN: "Sakai Sakai In",
    W_NAGAHORI_WANGAN_OUT: "W Nagahori Wangan Out",
    OOHAMA_WANGAN_IN: "Oohama Wangan In",
}

for key in TrackLookup
{
    leaderboard(
        title = format("Fastest time on {0}",  TrackLookup[key]),
        description = format("Record the fastest time on {0} in Time Trial Mode", TrackLookup[key]),
        start = 
        (
            actuallyRacing() && 
            finishedTimeAttack() && 
            timeAttackID() && 
            timeAttackTotalTime() > 0 &&
            timeAttackTrackId() == key
    
        ),
        cancel = always_false(),
        submit = always_true(),
        value = timeAttackTotalTime(),
        lower_is_better = true,
        format = "FRAMES"
    )
}

ShortCarName = 
{
    NISSAN_GTR: "GT-R",
    NISSAN_180SX: "180SX",
    MITSUBISHI_LANCER_EVO_V: "Evo V",
    MITSUBISHI_GTO: "GTO",
    MAZDA_RX_7: "RX-7 ",
    SUBURU_IMPREZA_WRX: "WRX STi",
}

CarName = 
{
    NISSAN_GTR: "Nissan Skyline GT-R",
    NISSAN_180SX: "Nissan 180SX",
    MITSUBISHI_LANCER_EVO_V: "Mitsubishi Lancer Evolution V",
    MITSUBISHI_GTO: "Mitsubishi GTO",
    MAZDA_RX_7: "Mazda RX-7 Type RZ.0",
    SUBURU_IMPREZA_WRX: "Suburu Impreza WRX STi TypeRA SpecC",
}

CAR = "Car"
TRACK = "Track"
CREATOR = "Creator"
SpecificLeaderboard =
[
    { TRACK: SHIBAKOUEN_C1_OUTER_LOOP,
      CAR: MITSUBISHI_LANCER_EVO_V,
      CREATOR: "Borysewicz"
    },
    { TRACK: DAIBA_SHINKANJOU_CWL,
      CAR: NISSAN_180SX,
      CREATOR: "jintei"
    },    
    { TRACK: SHINANOBASHI_KANJOU_SHORTCUT,
      CAR: MITSUBISHI_GTO,
      CREATOR: "WeerDough"
    },    
    { TRACK: MEIEKI_NAGOYA_KANJOU,
      CAR: NISSAN_GTR,
      CREATOR: "letdowNN"
    },
    
]


for data in SpecificLeaderboard
{
    leaderboard(
        title = format("Fastest {1} on {0}",  TrackLookup[data[TRACK]],  ShortCarName[data[CAR]]),
        description = format("Record the fastest time on {0} while driving the Default Car of {1} in Time Trial Mode. Thanks to {2} For the suggestion", TrackLookup[data[TRACK]], CarName[data[CAR]], data[CREATOR]),
        start = 
        (
            actuallyRacing() && 
            finishedTimeAttack() && 
            timeAttackID() && 
            timeAttackTotalTime() > 0 &&
            timeAttackTrackId() == data[TRACK] &&
            carCheck(data[CAR]) &&
            defaultCar()
        ),
        cancel = always_false(),
        submit = always_true(),
        value = timeAttackTotalTime(),
        lower_is_better = true,
        format = "FRAMES"
    )
}


