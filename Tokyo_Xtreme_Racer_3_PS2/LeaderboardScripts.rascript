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

