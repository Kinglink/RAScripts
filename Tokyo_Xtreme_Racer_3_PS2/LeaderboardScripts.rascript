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
GOAL_VALUE = 0x04
function finishedTimeAttack() => raceResult() == GOAL_VALUE && prev(raceResult() == RACING_VALUE)

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
//          0x1a = Mazda MX-5  Miata RS
//          0x0d = Nissan 180SX
//          0x13 = Mitsubishi Lancer Evolution V
//          0x15 = Mitsubishi GTO
//          0x18 = Mazda RX-7 Type RZ.0
//          
//          If wrong check 0x8082d0
function vehicleID() => byte(0x806AD0)

NISSAN_180SX = 0x0d
MITSUBISHI_LANCER_EVO_V = 0x13
MITSUBISHI_GTO = 0x15
MAZDA_RX_7 = 0x18

function nissan180Sx() => vehicleID() == NISSAN_180SX
function lancerEvoV() => vehicleID() == MITSUBISHI_LANCER_EVO_V
function mitsubishiGTO() => vehicleID() == MITSUBISHI_GTO
function mazdaRX7() => vehicleID() == MAZDA_RX_7

// $8153BA: (8-bit) Garage Index of current car
//          
//          0x00-0x04 for Indexes
//          0x05 for Default Ca r.
function garageIndex() => byte(0x8153BA)

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
KANDABASHI_C1_INNER_LOOP = 0X4360BB24
SHIBAKOUEN_C1_OUTER_LOOP = 0X434C2DB9 
ARIAKE_SHINKANJOU_CCL = 0X45B8E60F
DAIBA_SHINKANJOU_CWL = 0X4509F5B0
ROUTE_13_ARE_WANGAN_OUT = 0X44F75D21 
DAIKOKU_FUTOU_WANGAN_IN = 0XC4CAA43A 
SHIBAURA_YOKOHANE_OUT = 0XC3948282 
SHIOIRI_YOKOHANE_IN = 0XC4525469 
ASADA_YOKOHAMA_CCL = 0XC61F8292 
ASADA_YOKOHAMA_CWL = 0XC5D83333 
         
// Nagoya
MEIEKI_NAGOYA_KANJOU = 0X450E7226 
KUROKAWA_W_HIGASHIMEIHAN = 0X43E8A24F
KASUMORI_E_HIGASHIMEIHAN = 0XC5E2566E
         
// Osaka
SHINANOBASHI_KANJOU_SHORTCUT = 0X4613DD92
YOTSUHASHI_KANJOU_LONG = 0X461BFC99
SHIOMIBASHI_SAKAI_OUT = 0X45F5E83C 
SAKAI_IN = 0X45EAD4DF
W_NAGAHORI_WANGAN_OUT = 0X4585EAFC
OOHAMA_WANGAN_IN = 0X456FE94C

