// Tokyo Xtreme Racer Advance
// #ID = 5119

// $01CC: Current Menu
//        07=Race Mode
//        2d=Load File
//        27-29=Sell Car
//        2a-2c=Change Car
//        34=Quick Race
//        4e=Time Attack
//        68=Free Run
function current_menu() => byte(0x0001CC)

// $1B14: Current Gamemode
//        00=Quest
//        01=Quick Race
//        02=Time Attack
//        03=Free Run
function current_gamemode() => byte(0x001B14)

// $4DD4: Rival Meter
function rival_meter() => byte(0x004DD4)

// $66D0: Current Stage in Quick Race
function current_stage_in_quick_race() => byte(0x0066D0)
function current_stage_in_quick_race() => dword(0x0066D0)

achievement(
    title = "Champion", points = 25,
    description = "Defeat all 50 Rivals in Quick Race mode without using retries. (Any Map)",
    id = 200885, badge = "223152", published = "3/1/2022 4:51:22 AM", modified = "3/8/2022 5:18:42 AM",
    trigger = never(current_menu() != 52) && trigger_when(prev(current_stage_in_quick_race()) == 49) &&
              trigger_when(current_stage_in_quick_race() == 50) && once(current_stage_in_quick_race() == 0) &&
              never(rival_meter() == 54) &&
              ((current_gamemode() == 1) ||
               (measured(current_stage_in_quick_race() == 50, when=current_menu() == 52 && once(current_stage_in_quick_race() == 0)) && always_false()))
               // When using this you'll have to delete Always_false, and add it in RALibRetro Manually. 
)
