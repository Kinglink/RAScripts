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

// $0B6E: Current Car - Engine
function current_car_engine() => byte(0x000B6E)

// $0B6F: Current Car - Muffler
function current_car_muffler() => byte(0x000B6F)

// $0B70: Current Car - Transmission
function current_car_transmission() => byte(0x000B70)

// $0B71: Current Car - Clutch
function current_car_clutch() => byte(0x000B71)

// $0B72: Current Car - Suspension
function current_car_suspension() => byte(0x000B72)

// $0B73: Current Car - Tires + Wheels
function current_car_tires_wheels() => byte(0x000B73)

// $0B74: Current Car - Body Tune
function current_car_body_tune() => byte(0x000B74)

// $0B75: Current Car - F. Bumper
function current_car_f_bumper() => byte(0x000B75)

// $0B76: Current Car - R. Bumper
function current_car_r_bumper() => byte(0x000B76)

// $0B77: Current Car - Spoiler
function current_car_spoiler() => byte(0x000B77)

// $0B78: Current Car - Side Skirt
function current_car_side_skirt() => byte(0x000B78)

// $1B14: Current Gamemode
//        00=Quest
//        01=Quick Race
//        02=Time Attack
//        03=Free Run
function current_gamemode() => byte(0x001B14)

// $1E50: Current Track
//        00=Tokyo 1
//        01=Tokyo 2
//        02=Los Angeles 1
//        03=Los Angeles 2
//        04=London 1
//        05=London 2
function current_track() => byte(0x001E50)

// $4DD4: Rival Meter
function rival_meter() => byte(0x004DD4)

// $5790: Time Attack - x0.00.0
function time_attack_x0_00_0() => byte(0x005790)

// $5791: Time Attack - 0x.00.0
function time_attack_0x_00_0() => byte(0x005791)

// $5792: Time Attack - 00.x0.0
function time_attack_00_x0_0() => byte(0x005792)

// $5793: Time Attack - 00.0x.0
function time_attack_00_0x_0() => byte(0x005793)

// $5794: Time Attack - 00.00.x
function time_attack_00_00_x() => byte(0x005794)

// $5F50: Current Progress in Track
function current_progress_in_track() => dword(0x005F50)

// $66D0: Current Stage in Quick Race
function current_stage_in_quick_race() => byte(0x0066D0)


achievement(
    title = "Quick Race - Tokyo 1", points = 10,
    description = "Defeat 10 Rivals in Quick Race using a Stock Car without using retries. (Tokyo 1)",
    id = 200995, badge = "223270", published = "3/1/2022 11:03:08 PM", modified = "3/6/2022 6:36:38 AM",
    trigger = current_car_engine() == 1 && current_car_muffler() == 1 && current_car_transmission() == 1 &&
              current_car_clutch() == 1 && current_car_suspension() == 1 && current_car_tires_wheels() == 1 &&
              current_car_body_tune() == 1 && current_car_f_bumper() == 1 && current_car_r_bumper() == 1 &&
              current_car_spoiler() == 1 && current_car_side_skirt() == 1 && never(current_menu() != 52) &&
              trigger_when(prev(current_stage_in_quick_race()) == 9) &&
              trigger_when(current_stage_in_quick_race() == 10) && once(current_stage_in_quick_race() == 0) &&
              current_track() == 0 && never(rival_meter() == 54) &&
              ((current_gamemode() == 1) ||
               (measured(current_stage_in_quick_race() == 10, when=current_menu() == 52) && always_false()))
)

achievement(
    title = "Quick Race - Tokyo 2", points = 10,
    description = "Defeat 10 Rivals in Quick Race using a Stock Car without using retries. (Tokyo 2)",
    id = 200996, badge = "223271", published = "3/1/2022 11:03:09 PM", modified = "3/6/2022 6:36:38 AM",
    trigger = current_car_engine() == 1 && current_car_muffler() == 1 && current_car_transmission() == 1 &&
              current_car_clutch() == 1 && current_car_suspension() == 1 && current_car_tires_wheels() == 1 &&
              current_car_body_tune() == 1 && current_car_f_bumper() == 1 && current_car_r_bumper() == 1 &&
              current_car_spoiler() == 1 && current_car_side_skirt() == 1 && never(current_menu() != 52) &&
              trigger_when(prev(current_stage_in_quick_race()) == 9) &&
              trigger_when(current_stage_in_quick_race() == 10) && once(current_stage_in_quick_race() == 0) &&
              current_track() == 1 && never(rival_meter() == 54) &&
              ((current_gamemode() == 1) ||
               (measured(current_stage_in_quick_race() == 10, when=current_menu() == 52) && always_false()))
)

achievement(
    title = "Quick Race - Los Angeles 1", points = 10,
    description = "Defeat 10 Rivals in Quick Race using a Stock Car without using retries. (Los Angeles 1)",
    id = 200997, badge = "223272", published = "3/1/2022 11:03:09 PM", modified = "3/6/2022 6:36:39 AM",
    trigger = current_car_engine() == 1 && current_car_muffler() == 1 && current_car_transmission() == 1 &&
              current_car_clutch() == 1 && current_car_suspension() == 1 && current_car_tires_wheels() == 1 &&
              current_car_body_tune() == 1 && current_car_f_bumper() == 1 && current_car_r_bumper() == 1 &&
              current_car_spoiler() == 1 && current_car_side_skirt() == 1 && never(current_menu() != 52) &&
              trigger_when(prev(current_stage_in_quick_race()) == 9) &&
              trigger_when(current_stage_in_quick_race() == 10) && once(current_stage_in_quick_race() == 0) &&
              current_track() == 2 && never(rival_meter() == 54) &&
              ((current_gamemode() == 1) ||
               (measured(current_stage_in_quick_race() == 10, when=current_menu() == 52) && always_false()))
)

achievement(
    title = "Quick Race - Los Angeles 2", points = 10,
    description = "Defeat 10 Rivals in Quick Race using a Stock Car without using retries. (Los Angeles 2)",
    id = 200998, badge = "223273", published = "3/1/2022 11:03:10 PM", modified = "3/6/2022 6:36:39 AM",
    trigger = current_car_engine() == 1 && current_car_muffler() == 1 && current_car_transmission() == 1 &&
              current_car_clutch() == 1 && current_car_suspension() == 1 && current_car_tires_wheels() == 1 &&
              current_car_body_tune() == 1 && current_car_f_bumper() == 1 && current_car_r_bumper() == 1 &&
              current_car_spoiler() == 1 && current_car_side_skirt() == 1 && never(current_menu() != 52) &&
              trigger_when(prev(current_stage_in_quick_race()) == 9) &&
              trigger_when(current_stage_in_quick_race() == 10) && once(current_stage_in_quick_race() == 0) &&
              current_track() == 3 && never(rival_meter() == 54) &&
              ((current_gamemode() == 1) ||
               (measured(current_stage_in_quick_race() == 10, when=current_menu() == 52) && always_false()))
)

achievement(
    title = "Quick Race - London 1", points = 10,
    description = "Defeat 10 Rivals in Quick Race using a Stock Car without using retries. (London 1)",
    id = 200999, badge = "223274", published = "3/1/2022 11:03:10 PM", modified = "3/6/2022 6:36:39 AM",
    trigger = current_car_engine() == 1 && current_car_muffler() == 1 && current_car_transmission() == 1 &&
              current_car_clutch() == 1 && current_car_suspension() == 1 && current_car_tires_wheels() == 1 &&
              current_car_body_tune() == 1 && current_car_f_bumper() == 1 && current_car_r_bumper() == 1 &&
              current_car_spoiler() == 1 && current_car_side_skirt() == 1 && never(current_menu() != 52) &&
              trigger_when(prev(current_stage_in_quick_race()) == 9) &&
              trigger_when(current_stage_in_quick_race() == 10) && once(current_stage_in_quick_race() == 0) &&
              current_track() == 4 && never(rival_meter() == 54) &&
              ((current_gamemode() == 1) ||
               (measured(current_stage_in_quick_race() == 10, when=current_menu() == 52) && always_false()))
)

achievement(
    title = "Quick Race - London 2", points = 10,
    description = "Defeat 10 Rivals in Quick Race using a Stock Car without using retries. (London 2)",
    id = 201000, badge = "224482", published = "3/1/2022 11:03:11 PM", modified = "3/6/2022 6:38:31 AM",
    trigger = current_car_engine() == 1 && current_car_muffler() == 1 && current_car_transmission() == 1 &&
              current_car_clutch() == 1 && current_car_suspension() == 1 && current_car_tires_wheels() == 1 &&
              current_car_body_tune() == 1 && current_car_f_bumper() == 1 && current_car_r_bumper() == 1 &&
              current_car_spoiler() == 1 && current_car_side_skirt() == 1 && never(current_menu() != 52) &&
              trigger_when(prev(current_stage_in_quick_race()) == 9) &&
              trigger_when(current_stage_in_quick_race() == 10) && once(current_stage_in_quick_race() == 0) &&
              current_track() == 5 && never(rival_meter() == 54) &&
              ((current_gamemode() == 1) ||
               (measured(current_stage_in_quick_race() == 10, when=current_menu() == 52) && always_false()))
)

achievement(
    title = "Time Attack - Tokyo 1", points = 10,
    description = "Complete Tokyo 1 Time Attack in 09.20.0 or less.",
    id = 201001, badge = "223275", published = "3/1/2022 11:03:19 PM", modified = "4/9/2025 4:03:19 AM",
    trigger = never(current_track() != 0) && never(current_menu() != 78) &&
              once(once(once(once(once(once(once(once(once(current_progress_in_track() == 256) &&
                  current_progress_in_track() == 512) && current_progress_in_track() == 768) &&
                  current_progress_in_track() == 1024) && current_progress_in_track() == 1280) &&
                  current_progress_in_track() == 1536) && current_progress_in_track() == 1792) &&
                  current_progress_in_track() == 2048) && current_progress_in_track() == 2559
              ) && prev(current_progress_in_track()) == 0 && current_progress_in_track() == 1 &&
              (time_attack_x0_00_0() * 60000 + time_attack_0x_00_0() * 6000 + time_attack_00_x0_0() * 1000 +
              time_attack_00_0x_0() * 100 + time_attack_00_00_x() * 10) <= 56000
)

achievement(
    title = "Time Attack - Tokyo 2", points = 10,
    description = "Complete Tokyo 2 Time Attack in 15.10.0 or less.",
    id = 201002, badge = "223276", published = "3/1/2022 11:03:19 PM", modified = "4/9/2025 4:03:20 AM",
    trigger = never(current_track() != 1) && never(current_menu() != 78) &&
              once(once(once(once(once(once(once(once(once(current_progress_in_track() == 256) &&
                  current_progress_in_track() == 512) && current_progress_in_track() == 768) &&
                  current_progress_in_track() == 1024) && current_progress_in_track() == 1280) &&
                  current_progress_in_track() == 3072) && current_progress_in_track() == 3328) &&
                  current_progress_in_track() == 3584) && current_progress_in_track() == 4032
              ) && prev(current_progress_in_track()) == 0 && current_progress_in_track() == 1 &&
              (time_attack_x0_00_0() * 60000 + time_attack_0x_00_0() * 6000 + time_attack_00_x0_0() * 1000 +
              time_attack_00_0x_0() * 100 + time_attack_00_00_x() * 10) <= 91000
)

achievement(
    title = "Time Attack - Los Angeles 1", points = 10,
    description = "Complete Los Angeles 1 Time Attack in 16.10.0 or less.",
    id = 201003, badge = "223277", published = "3/1/2022 11:03:19 PM", modified = "4/9/2025 4:03:20 AM",
    trigger = never(current_track() != 2) && never(current_menu() != 78) &&
              once(once(once(once(once(once(once(once(once(current_progress_in_track() == 256) &&
                  current_progress_in_track() == 512) && current_progress_in_track() == 768) &&
                  current_progress_in_track() == 1024) && current_progress_in_track() == 1280) &&
                  current_progress_in_track() == 3584) && current_progress_in_track() == 3840) &&
                  current_progress_in_track() == 4096) && current_progress_in_track() == 4380
              ) && prev(current_progress_in_track()) == 0 && current_progress_in_track() == 1 &&
              (time_attack_x0_00_0() * 60000 + time_attack_0x_00_0() * 6000 + time_attack_00_x0_0() * 1000 +
              time_attack_00_0x_0() * 100 + time_attack_00_00_x() * 10) <= 97000
)

achievement(
    title = "Time Attack - Los Angeles 2", points = 10,
    description = "Complete Los Angeles 2 Time Attack in 23.40.0 or less.",
    id = 201004, badge = "223278", published = "3/1/2022 11:03:20 PM", modified = "4/9/2025 4:03:20 AM",
    trigger = never(current_track() != 3) && never(current_menu() != 78) &&
              once(once(once(once(once(once(once(once(once(current_progress_in_track() == 256) &&
                  current_progress_in_track() == 512) && current_progress_in_track() == 768) &&
                  current_progress_in_track() == 1024) && current_progress_in_track() == 1280) &&
                  current_progress_in_track() == 3584) && current_progress_in_track() == 3840) &&
                  current_progress_in_track() == 4096) && current_progress_in_track() == 6564
              ) && prev(current_progress_in_track()) == 0 && current_progress_in_track() == 1 &&
              (time_attack_x0_00_0() * 60000 + time_attack_0x_00_0() * 6000 + time_attack_00_x0_0() * 1000 +
              time_attack_00_0x_0() * 100 + time_attack_00_00_x() * 10) <= 142000
)

achievement(
    title = "Time Attack - London 1", points = 10,
    description = "Complete London 1 Time Attack in 11.50.0 or less.",
    id = 201005, badge = "223279", published = "3/1/2022 11:03:20 PM", modified = "4/9/2025 4:03:21 AM",
    trigger = never(current_track() != 4) && never(current_menu() != 78) &&
              once(once(once(once(once(once(once(once(once(current_progress_in_track() == 256) &&
                  current_progress_in_track() == 512) && current_progress_in_track() == 768) &&
                  current_progress_in_track() == 1024) && current_progress_in_track() == 1280) &&
                  current_progress_in_track() == 2304) && current_progress_in_track() == 2560) &&
                  current_progress_in_track() == 2816) && current_progress_in_track() == 3190
              ) && prev(current_progress_in_track()) == 0 && current_progress_in_track() == 1 &&
              (time_attack_x0_00_0() * 60000 + time_attack_0x_00_0() * 6000 + time_attack_00_x0_0() * 1000 +
              time_attack_00_0x_0() * 100 + time_attack_00_00_x() * 10) <= 71000
)
