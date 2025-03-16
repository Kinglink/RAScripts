// Giana Sisters DS
// #ID = 7062

// $06508C: 1st lLETTER only NEW GAME
function st_lletter_only_new_game() => byte(0x06508C)

// $0A2EE8: P1 CONTROL
//          
//          Bit0=Front
//          Bit1=Back
//          Bit2=Up
//          Bit3=Down
function p1_control_front() => bit0(0x0A2EE8)
function p1_control_back() => bit1(0x0A2EE8)
function p1_control_bit7() => bit7(0x0A2EE8)
function p1_control() => byte(0x0A2EE8)

// $0A2F20: FLAG ACHIEVEMENTS
//          
//          Bit0=Fist Class!
//          Bit1=
//          Bit2=
//          Bit3=Monster Hunter
//          Bit4=Secret Agent
//          Bit5=Champion
//          Bit6=Perfect
function flag_achievements_bit2() => bit1(0x0A2F20)
function flag_achievements_monster_hunter() => bit3(0x0A2F20)
function flag_achievements_champion() => bit5(0x0A2F20)
function flag_achievements_perfect() => bit6(0x0A2F20)
function flag_achievements() => byte(0x0A2F20)

// $0A2F22: TOTAL DIAMONDS!
function total_diamonds() => byte(0x0A2F22)
function total_diamonds() => word(0x0A2F22)

// $0A2F25: TOTAL KILL MONSTER [16-bits]
function total_kill_monster() => word(0x0A2F25)

// $0A2F2C: LIVES
function lives() => byte(0x0A2F2C)

// $0A2F2D: FORMS GENI
//          
//          00=NORMAL
//          01=FIRE
function forms_geni() => byte(0x0A2F2D)

// $0A2F2E: BLUE CRISTAL [8-Bits]
function blue_cristal() => byte(0x0A2F2E)

// $0A2F30: SCORE - [16-Bits]
function score() => word(0x0A2F30)
function score() => dword(0x0A2F30)

// $0A2F38: LEVEL 9-1 [Flag Red]
//          91=All Cristal
function level_9_1_flag_red() => byte(0x0A2F38)

// $0A2F3A: LEVEL 8-9 [Flag Red]
//          91=All Cristal
function level_8_9_flag_red() => byte(0x0A2F3A)

// $0A2F3B: LEVEL 8-8 [Flag Red]
//          91=All Cristal
function level_8_8_flag_red() => byte(0x0A2F3B)

// $0A2F3C: LEVEL 8-7 [Flag Red]
//          91=All Cristal
function level_8_7_flag_red() => byte(0x0A2F3C)

// $0A2F3D: LEVEL 8-6 [Flag Red]
//          91=All Cristal
function level_8_6_flag_red() => byte(0x0A2F3D)

// $0A2F3E: LEVEL 8-5 [Flag Red]
//          91=All Cristal
function level_8_5_flag_red() => byte(0x0A2F3E)

// $0A2F3F: LEVEL 8-4 [Flag Red]
//          91=All Cristal
function level_8_4_flag_red() => byte(0x0A2F3F)

// $0A2F40: LEVEL 8-3 [Flag Red]
//          91=All Cristal
function level_8_3_flag_red() => byte(0x0A2F40)

// $0A2F41: LEVEL 8-2 [Flag Red]
//          91=All Cristal
function level_8_2_flag_red() => byte(0x0A2F41)

// $0A2F42: LEVEL 7-9 [Flag Red]
//          91=All Cristal
function level_7_9_flag_red() => byte(0x0A2F42)

// $0A2F43: LEVEL 7-7 [Flag Red]
//          91=All Cristal
function level_7_7_flag_red() => byte(0x0A2F43)

// $0A2F44: LEVEL 7-8 [Flag Red]
//          91=All Cristal
function level_7_8_flag_red() => byte(0x0A2F44)

// $0A2F45: LEVEL 7-6 [Flag Red]
//          91=All Cristal
function level_7_6_flag_red() => byte(0x0A2F45)

// $0A2F46: LEVEL 7-5 [Flag Red]
//          91=All Cristal
function level_7_5_flag_red() => byte(0x0A2F46)

// $0A2F47: LEVEL 7-4 [Flag Red]
//          91=All Cristal
function level_7_4_flag_red() => byte(0x0A2F47)

// $0A2F48: LEVEL 6-9 [Flag Red]
//          91=All Cristal
function level_6_9_flag_red() => byte(0x0A2F48)

// $0A2F49: LEVEL 8-1 [Flag Red]
//          91=All Cristal
function level_8_1_flag_red() => byte(0x0A2F49)

// $0A2F4B: LEVEL 7-3 [Flag Red]
//          91=All Cristal
function level_7_3_flag_red() => byte(0x0A2F4B)

// $0A2F4C: LEVEL 7-2 [Flag Red]
//          91=All Cristal
function level_7_2_flag_red() => byte(0x0A2F4C)

// $0A2F4D: LEVEL 7-1 [Flag Red]
//          91=All Cristal
function level_7_1_flag_red() => byte(0x0A2F4D)

// $0A2F4F: LEVEL 6-8 [Flag Red]
//          91=All Cristal
function level_6_8_flag_red() => byte(0x0A2F4F)

// $0A2F51: LEVEL 6-7 [Flag Red]
//          91=All Cristal
function level_6_7_flag_red() => byte(0x0A2F51)

// $0A2F52: LEVEL 6-6 [Flag Red]
//          91=All Cristal
function level_6_6_flag_red() => byte(0x0A2F52)

// $0A2F53: LEVEL 6-5 [Flag Red]
//          91=All Cristal
function level_6_5_flag_red() => byte(0x0A2F53)

// $0A2F54: LEVEL 6-4 [Flag Red]
//          91=All Cristal
function level_6_4_flag_red() => byte(0x0A2F54)

// $0A2F55: LEVEL 6-3 [Flag Red]
//          91=All Cristal
function level_6_3_flag_red() => byte(0x0A2F55)

// $0A2F56: LEVEL 6-2 [Flag Red]
//          91=All Cristal
function level_6_2_flag_red() => byte(0x0A2F56)

// $0A2F57: LEVEL 6-1 [Flag Red]
//          91=All Cristal
function level_6_1_flag_red() => byte(0x0A2F57)

// $0A2F59: LEVEL 5-9 [Flag Red]
//          91=All Cristal
function level_5_9_flag_red() => byte(0x0A2F59)

// $0A2F5A: LEVEL 5-8 [Flag Red]
//          91=All Cristal
function level_5_8_flag_red() => byte(0x0A2F5A)

// $0A2F5B: LEVEL 5-7 [Flag Red]
//          91=All Cristal
function level_5_7_flag_red() => byte(0x0A2F5B)

// $0A2F5C: LEVEL 5-6 [Flag Red]
//          91=All Cristal
function level_5_6_flag_red() => byte(0x0A2F5C)

// $0A2F5D: LEVEL 5-5 [Flag Red]
//          91=All Cristal
function level_5_5_flag_red() => byte(0x0A2F5D)

// $0A2F5E: LEVEL 5-4 [Flag Red]
//          91=All Cristal
function level_5_4_flag_red() => byte(0x0A2F5E)

// $0A2F5F: LEVEL 5-3 [Flag Red]
//          91=All Cristal
function level_5_3_flag_red() => byte(0x0A2F5F)

// $0A2F60: LEVEL 5-2 [Flag Red]
//          91=All Cristal
function level_5_2_flag_red() => byte(0x0A2F60)

// $0A2F61: LEVEL 5-1 [Flag Red]
//          91=All Cristal
function level_5_1_flag_red() => byte(0x0A2F61)

// $0A2F62: LEVEL 4-9 [Flag Red]
//          91=All Cristal
function level_4_9_flag_red() => byte(0x0A2F62)

// $0A2F63: LEVEL 4-8 [Flag Red]
//          91=All Cristal
function level_4_8_flag_red() => byte(0x0A2F63)

// $0A2F64: LEVEL 4-7 [Flag Red]
//          91=All Cristal
function level_4_7_flag_red() => byte(0x0A2F64)

// $0A2F65: LEVEL 4-6 [Flag Red]
//          91=All Cristal
function level_4_6_flag_red() => byte(0x0A2F65)

// $0A2F66: LEVEL 4-5 [Flag Red]
//          91=All Cristal
function level_4_5_flag_red() => byte(0x0A2F66)

// $0A2F67: LEVEL 4-4 [Flag Red]
//          91=All Cristal
function level_4_4_flag_red() => byte(0x0A2F67)

// $0A2F68: LEVEL 4-3 [Flag Red]
//          91=All Cristal
function level_4_3_flag_red() => byte(0x0A2F68)

// $0A2F69: LEVEL 4-2 [Flag Red]
//          91=All Cristal
function level_4_2_flag_red() => byte(0x0A2F69)

// $0A2F6A: LEVEL 4-1 [Flag Red]
//          91=All Cristal
function level_4_1_flag_red() => byte(0x0A2F6A)

// $0A2F6D: LEVEL 3-9 [Flag Red]
//          91=All Cristal
function level_3_9_flag_red() => byte(0x0A2F6D)

// $0A2F6E: LEVEL 3-8 [Flag Red]
//          91=All Cristal
function level_3_8_flag_red() => byte(0x0A2F6E)

// $0A2F6F: LEVEL 3-7 [Flag Red]
//          91=All Cristal
function level_3_7_flag_red() => byte(0x0A2F6F)

// $0A2F70: LEVEL 3-6 [Flag Red]
//          91=All Cristal
function level_3_6_flag_red() => byte(0x0A2F70)

// $0A2F71: LEVEL 3-5 [Flag Red]
//          91=All Cristal
function level_3_5_flag_red() => byte(0x0A2F71)

// $0A2F73: LEVEL 2-9 [Flag Red]
//          91=All Cristal
function level_2_9_flag_red() => byte(0x0A2F73)

// $0A2F74: LEVEL 2-8 [Flag Red]
//          91=All Cristal
function level_2_8_flag_red() => byte(0x0A2F74)

// $0A2F75: LEVEL 2-7 [Flag Red]
//          91=All Cristal
function level_2_7_flag_red() => byte(0x0A2F75)

// $0A2F76: LEVEL 2-6 [Flag Red]
//          91=All Cristal
function level_2_6_flag_red() => byte(0x0A2F76)

// $0A2F77: LEVEL 2-5 [Flag Red]
//          91=All Cristal
function level_2_5_flag_red() => byte(0x0A2F77)

// $0A2F79: LEVEL 1-9 [Flag Red]
//          91=All Cristal
function level_1_9_flag_red() => byte(0x0A2F79)

// $0A2F7A: LEVEL 1-8 [Flag Red]
//          91=All Cristal
function level_1_8_flag_red() => byte(0x0A2F7A)

// $0A2F7B: LEVEL 1-7 [Flag Red]
//          93=All Cristal
function level_1_7_flag_red() => byte(0x0A2F7B)

// $0A2F7C: LEVEL 1-6 [Flag Red]
//          91=All Cristal
function level_1_6_flag_red() => byte(0x0A2F7C)

// $0A2F7D: LEVEL 3-4 [Flag Red]
//          91=All Cristal
function level_3_4_flag_red() => byte(0x0A2F7D)

// $0A2F7E: LEVEL 3-3 [Flag Red]
//          91=All Cristal
function level_3_3_flag_red() => byte(0x0A2F7E)

// $0A2F7F: LEVEL 3-2 [Flag Red]
//          91=All Cristal
function level_3_2_flag_red() => byte(0x0A2F7F)

// $0A2F80: LEVEL 3-1 [Flag Red]
//          91=All Cristal
function level_3_1_flag_red() => byte(0x0A2F80)

// $0A2F81: LEVEL 2-4 [Flag Red]
//          91=All Cristal
function level_2_4_flag_red() => byte(0x0A2F81)

// $0A2F82: LEVEL 2-3 [Flag Red]
//          91=All Cristal
function level_2_3_flag_red() => byte(0x0A2F82)

// $0A2F83: LEVEL 2-2 [Flag Red]
//          91=All Cristal
function level_2_2_flag_red() => byte(0x0A2F83)

// $0A2F84: LEVEL 2-1 [Flag Red]
//          91=All Cristal
function level_2_1_flag_red() => byte(0x0A2F84)

// $0A2F85: LEVEL 1-5 [Flag Red]
//          91=All Cristal
function level_1_5_flag_red() => byte(0x0A2F85)

// $0A2F86: LEVEL 1-4 [Flag Red]
//          91=All Cristal
function level_1_4_flag_red() => byte(0x0A2F86)

// $0A2F87: LEVEL 1-3 [Flag Red]
//          91=All Cristal
function level_1_3_flag_red() => byte(0x0A2F87)

// $0A2F88: LEVEL 1-2 [Flag Red]
//          91=All Cristal
function level_1_2_flag_red() => byte(0x0A2F88)

// $0A2F89: LEVEL 1-1 [Flag Red]
//          91=All Cristal
function level_1_1_flag_red() => byte(0x0A2F89)

// $0A2FA2: STAGE LEVEL
function stage_level() => low4(0x0A2FA2)
function stage_level() => byte(0x0A2FA2)
function stage_level() => word(0x0A2FA2)

// $0A2FA3: WORLD ID
function world_id() => low4(0x0A2FA3)
function world_id() => byte(0x0A2FA3)

// $0A3012: RED CRISTAL IN LEVEL
function red_cristal_in_level() => byte(0x0A3012)

// $0A3023: [16-bit] Seconds
function seconds() => word(0x0A3023)

// $0A3030: ITEM SODA
function item_soda() => bit0(0x0A3030)
function item_soda() => byte(0x0A3030)

// $0A3031: ITEM CHICLE
function item_chicle() => bit0(0x0A3031)
function item_chicle() => byte(0x0A3031)

// $0A3032: FLAG CHAR STOP (AFK)
function flag_char_stop_afk() => low4(0x0A3032)
function flag_char_stop_afk() => byte(0x0A3032)

// $0A3062: FLAG CHEKNGPOINT
function flag_chekngpoint() => bit1(0x0A3062)
function flag_chekngpoint() => byte(0x0A3062)

// $0A3CE8: SCREEN ID
//          
//          05=Main Menu
//          01=Blue Screen
//          02=CG Animations/Result
//          03=In game
//          07=World Map
function screen_id() => byte(0x0A3CE8)

// $0A5124: [24-bit] Pointer for name currently being entered
//          +0x87e - 1st letter
//          +0x880 - 2nd letter
function pointer_for_name_currently_being_entered() => tbyte(0x0A5124)

// $1C69AD: SAVE SLOT [New Player]
//          
//          00=Slot 1
//          01=Slot 2
//          02=Slot 3
function save_slot_new_player() => byte(0x1C69AD)

// $1C6A5C: 1st LETTER NAME [Slot 01]
function st_letter_name_slot_01() => byte(0x1C6A5C)

// $1C6A5D: 2st LETTER NAME [Slot 01]
function st_letter_name_slot_01() => byte(0x1C6A5D)

// $1C6A5E: 3st LETTER NAME [Slot 01]
function st_letter_name_slot_01() => byte(0x1C6A5E)

// $1C6A5F: 4st LETTER NAME [Slot 01]
function st_letter_name_slot_01() => byte(0x1C6A5F)

// $1C6A60: 5st LETTER NAME [Slot 01]
function st_letter_name_slot_01() => byte(0x1C6A60)

// $1C6A61: 6st LETTER NAME [Slot 01]
function st_letter_name_slot_01() => byte(0x1C6A61)

// $1C6A62: 7st LETTER NAME [Slot 01]
function st_letter_name_slot_01() => byte(0x1C6A62)

// $1C6A63: 8st LETTER NAME [Slot 01]
function st_letter_name_slot_01() => byte(0x1C6A63)

// $1C6A64: 9st LETTER NAME [Slot 01]
function st_letter_name_slot_01() => byte(0x1C6A64)

// $1C6A65: 10st LETTER NAME [Slot 01]
function st_letter_name_slot_01() => byte(0x1C6A65)

// $1C6B1C: 1st LETTER NAME [Slot 02]
function st_letter_name_slot_02() => byte(0x1C6B1C)

// $1C6B1D: 2st LETTER NAME [Slot 02]
function st_letter_name_slot_02() => byte(0x1C6B1D)

// $1C6B1E: 3st LETTER NAME [Slot 02]
function st_letter_name_slot_02() => byte(0x1C6B1E)

// $1C6B1F: 4st LETTER NAME [Slot 02]
function st_letter_name_slot_02() => byte(0x1C6B1F)

// $1C6B20: 5st LETTER NAME [Slot 02]
function st_letter_name_slot_02() => byte(0x1C6B20)

// $1C6B21: 6st LETTER NAME [Slot 02]
function st_letter_name_slot_02() => byte(0x1C6B21)

// $1C6B22: 7st LETTER NAME [Slot 02]
function st_letter_name_slot_02() => byte(0x1C6B22)

// $1C6B23: 8st LETTER NAME [Slot 02]
function st_letter_name_slot_02() => byte(0x1C6B23)

// $1C6B24: 9st LETTER NAME [Slot 02]
function st_letter_name_slot_02() => byte(0x1C6B24)

// $1C6B25: 10st LETTER NAME [Slot 02]
function st_letter_name_slot_02() => byte(0x1C6B25)

// $1C6BDC: 1st LETTER NAME [Slot 03]
function st_letter_name_slot_03() => byte(0x1C6BDC)

// $1C6BDD: 2st LETTER NAME [Slot 03]
function st_letter_name_slot_03() => byte(0x1C6BDD)

// $1C6BDE: 3st LETTER NAME [Slot 03]
function st_letter_name_slot_03() => byte(0x1C6BDE)

// $1C6BDF: 4st LETTER NAME [Slot 03]
function st_letter_name_slot_03() => byte(0x1C6BDF)

// $1C6BE0: 5st LETTER NAME [Slot 03]
function st_letter_name_slot_03() => byte(0x1C6BE0)

// $1C6BE1: 6st LETTER NAME [Slot 03]
function st_letter_name_slot_03() => byte(0x1C6BE1)

// $1C6BE2: 7st LETTER NAME [Slot 03]
function st_letter_name_slot_03() => byte(0x1C6BE2)

// $1C6BE3: 8st LETTER NAME [Slot 03]
function st_letter_name_slot_03() => byte(0x1C6BE3)

// $1C6BE4: 9st LETTER NAME [Slot 03]
function st_letter_name_slot_03() => byte(0x1C6BE4)

// $1C6BE5: 10st LETTER NAME [Slot 03]
function st_letter_name_slot_03() => byte(0x1C6BE5)

// $1C76E3: FLAG FINISH
function flag_finish() => bit1(0x1C76E3)
function flag_finish() => byte(0x1C76E3)

// $1CA2E6: CONTAGE POINT
function contage_point() => byte(0x1CA2E6)

achievement(
    title = "Adventures in a Floral World", points = 10, type="progression",
    description = "Complete the world 1",
    id = 130916, badge = "143705", published = "10/27/2020 7:11:08 PM", modified = "10/27/2020 7:11:08 PM",
    trigger = level_1_9_flag_red() > 0 && once(stage_level() == 9 && screen_id() == 3) && low4(0x0A3CE8) == 7
)

achievement(
    title = "Where the Middle Ages", points = 10, type="progression",
    description = "Complete the world 2",
    id = 130917, badge = "143707", published = "10/27/2020 7:11:12 PM", modified = "10/27/2020 7:11:12 PM",
    trigger = level_2_9_flag_red() > 0 && once(stage_level() == 521 && screen_id() == 3) && low4(0x0A3CE8) == 7
)

achievement(
    title = "Home of Rain", points = 10, type="progression",
    description = "Complete the world 3",
    id = 130918, badge = "143816", published = "10/27/2020 7:11:16 PM", modified = "10/27/2020 7:11:16 PM",
    trigger = level_3_9_flag_red() > 0 && once(stage_level() == 777 && screen_id() == 3) && low4(0x0A3CE8) == 7
)

achievement(
    title = "High Pressure Waterfall", points = 10, type="progression",
    description = "Complete the world 4",
    id = 130919, badge = "143817", published = "10/27/2020 7:11:21 PM", modified = "10/27/2020 7:11:21 PM",
    trigger = level_4_9_flag_red() > 0 && once(stage_level() == 1033 && screen_id() == 3) && low4(0x0A3CE8) == 7
)

achievement(
    title = "Soft Drinks and Chewing Gum", points = 10, type="progression",
    description = "Complete the world 5",
    id = 130920, badge = "143820", published = "10/27/2020 7:11:24 PM", modified = "10/27/2020 7:11:24 PM",
    trigger = level_5_9_flag_red() > 0 && once(stage_level() == 1289 && screen_id() == 3) && low4(0x0A3CE8) == 7
)

achievement(
    title = "The Place Where It Freezes", points = 10, type="progression",
    description = "Complete the world 6",
    id = 130921, badge = "143821", published = "10/27/2020 7:11:26 PM", modified = "10/27/2020 7:11:26 PM",
    trigger = level_6_9_flag_red() > 0 && once(stage_level() == 1545 && screen_id() == 3) && low4(0x0A3CE8) == 7
)

achievement(
    title = "The Peak of Diverting From Thorns", points = 10, type="progression",
    description = "Complete the world 7",
    id = 130922, badge = "143973", published = "10/27/2020 7:11:32 PM", modified = "10/27/2020 7:11:32 PM",
    trigger = level_7_9_flag_red() > 0 && once(stage_level() == 1801 && screen_id() == 3) && low4(0x0A3CE8) == 7
)

achievement(
    title = "Fleeing the Eruption", points = 10, type="win_condition",
    description = "Complete the world 8",
    id = 130924, badge = "143979", published = "10/27/2020 7:11:41 PM", modified = "10/27/2020 7:11:41 PM",
    trigger = flag_achievements_champion() > 0 && level_8_9_flag_red() > 0 && never(low4(0x0A3CE8) != 7)
)

achievement(
    title = "How About a Little Farm?", points = 5,
    description = "Collect blue jewels at levels in the world 1 | [Track a progress bar in the description]",
    id = 130938, badge = "143823", published = "10/27/2020 7:13:51 PM", modified = "10/27/2020 7:13:51 PM",
    trigger = unless(world_id() != 1) && unless(low4(0x0A3CE8) != 3) &&
              measured(repeated(550, blue_cristal() > prev(blue_cristal())))
)

achievement(
    title = "I Hope You're Not Tired", points = 5,
    description = "Collect blue jewels at levels in the world 2 | [Track a progress bar in the description]",
    id = 130939, badge = "143824", published = "10/27/2020 7:13:54 PM", modified = "10/27/2020 7:13:54 PM",
    trigger = unless(world_id() != 2) && unless(low4(0x0A3CE8) != 3) &&
              measured(repeated(550, blue_cristal() > prev(blue_cristal())))
)

achievement(
    title = "Hold on a Little More Friend", points = 5,
    description = "Collect blue jewels at levels in the world 3 | [Track a progress bar in the description]",
    id = 130940, badge = "143825", published = "10/27/2020 7:13:56 PM", modified = "10/27/2020 7:13:56 PM",
    trigger = unless(world_id() != 3) && unless(low4(0x0A3CE8) != 3) &&
              measured(repeated(550, blue_cristal() > prev(blue_cristal())))
)

achievement(
    title = "Do Not Be Angry", points = 5,
    description = "Collect blue jewels at levels in the world 4 | [Track a progress bar in the description]",
    id = 130933, badge = "144049", published = "10/27/2020 7:13:01 PM", modified = "10/27/2020 7:13:01 PM",
    trigger = unless(world_id() != 4) && unless(low4(0x0A3CE8) != 3) &&
              measured(repeated(550, blue_cristal() > prev(blue_cristal())))
)

achievement(
    title = "One Day You Will Thank Me", points = 5,
    description = "Collect blue jewels at levels in the world 5 | [Track a progress bar in the description]",
    id = 130934, badge = "144050", published = "10/27/2020 7:13:05 PM", modified = "10/27/2020 7:13:05 PM",
    trigger = unless(world_id() != 5) && unless(low4(0x0A3CE8) != 3) &&
              measured(repeated(550, blue_cristal() > prev(blue_cristal())))
)

achievement(
    title = "It Won't Be Today or Tomorrow, but It Will Happen", points = 5,
    description = "Collect blue jewels at levels in the world 6 | [Track a progress bar in the description]",
    id = 130935, badge = "144051", published = "10/27/2020 7:13:07 PM", modified = "10/27/2020 7:13:07 PM",
    trigger = unless(world_id() != 6) && unless(low4(0x0A3CE8) != 3) &&
              measured(repeated(550, blue_cristal() > prev(blue_cristal())))
)

achievement(
    title = "And When That Day Comes ...", points = 5,
    description = "Collect blue jewels at levels in the world 7 | [Track a progress bar in the description]",
    id = 130936, badge = "144052", published = "10/27/2020 7:13:10 PM", modified = "10/27/2020 7:13:10 PM",
    trigger = unless(world_id() != 7) && unless(low4(0x0A3CE8) != 3) &&
              measured(repeated(550, blue_cristal() > prev(blue_cristal())))
)

achievement(
    title = "You Will Be the King of Farms", points = 5,
    description = "Collect blue jewels at levels in the world 8 | [Track a progress bar in the description]",
    id = 130937, badge = "144053", published = "10/27/2020 7:13:12 PM", modified = "10/27/2020 7:13:12 PM",
    trigger = unless(world_id() != 8) && unless(low4(0x0A3CE8) != 3) &&
              measured(repeated(550, blue_cristal() > prev(blue_cristal())))
)

achievement(
    title = "Red Flags I - Precious Jewels", points = 25,
    description = "Get all the red flags in the world 1",
    id = 130926, badge = "143706", published = "10/27/2020 7:12:39 PM", modified = "10/27/2020 7:12:39 PM",
    trigger = level_1_1_flag_red() >= 145 && level_1_2_flag_red() >= 145 && level_1_3_flag_red() >= 145 &&
              level_1_4_flag_red() >= 145 && level_1_5_flag_red() >= 145 && level_1_6_flag_red() >= 145 &&
              level_1_7_flag_red() >= 145 && level_1_8_flag_red() >= 145 && level_1_9_flag_red() >= 145 &&
              once(low4(0x0A3CE8) == 3) && once(low4(0x0A3CE8) == 2) && low4(0x0A3CE8) == 7 && never(screen_id() == 5)
)

achievement(
    title = "Red Flags II - The Tales Were True", points = 25,
    description = "Get all the red flags in the world 2",
    id = 130927, badge = "143708", published = "10/27/2020 7:12:42 PM", modified = "10/27/2020 7:12:42 PM",
    trigger = level_2_1_flag_red() >= 145 && level_2_2_flag_red() >= 145 && level_2_3_flag_red() >= 145 &&
              level_2_4_flag_red() >= 145 && level_2_5_flag_red() >= 145 && level_2_6_flag_red() >= 145 &&
              level_2_7_flag_red() >= 145 && level_2_8_flag_red() >= 145 && level_2_9_flag_red() >= 145 &&
              once(low4(0x0A3CE8) == 3) && once(low4(0x0A3CE8) == 2) && low4(0x0A3CE8) == 7 && never(screen_id() == 5)
)

achievement(
    title = "Red Flags III - Breeze Forwards", points = 25,
    description = "Get all the red flags in the world 3",
    id = 130928, badge = "143810", published = "10/27/2020 7:12:44 PM", modified = "10/27/2020 7:12:44 PM",
    trigger = level_3_1_flag_red() >= 145 && level_3_2_flag_red() >= 145 && level_3_3_flag_red() >= 145 &&
              level_3_4_flag_red() >= 145 && level_3_5_flag_red() >= 145 && level_3_6_flag_red() >= 145 &&
              level_3_7_flag_red() >= 145 && level_3_8_flag_red() >= 145 && level_3_9_flag_red() >= 145 &&
              once(low4(0x0A3CE8) == 3) && once(low4(0x0A3CE8) == 2) && low4(0x0A3CE8) == 7 && never(screen_id() == 5)
)

achievement(
    title = "Red Flags IV - Where Are They All", points = 25,
    description = "Get all the red flags in the world 4",
    id = 130925, badge = "143818", published = "10/27/2020 7:12:36 PM", modified = "10/27/2020 7:12:36 PM",
    trigger = level_4_1_flag_red() >= 145 && level_4_2_flag_red() >= 145 && level_4_3_flag_red() >= 145 &&
              level_4_4_flag_red() >= 145 && level_4_5_flag_red() >= 145 && level_4_6_flag_red() >= 145 &&
              level_4_7_flag_red() >= 145 && level_4_8_flag_red() >= 145 && level_4_9_flag_red() >= 145 &&
              once(low4(0x0A3CE8) == 3) && once(low4(0x0A3CE8) == 2) && low4(0x0A3CE8) == 7 && never(screen_id() == 5)
)

achievement(
    title = "Red Flags V - Carefully", points = 25,
    description = "Get all the red flags in the world 5",
    id = 130930, badge = "143819", published = "10/27/2020 7:12:48 PM", modified = "10/27/2020 7:12:48 PM",
    trigger = level_5_1_flag_red() >= 145 && level_5_2_flag_red() >= 145 && level_5_3_flag_red() >= 145 &&
              level_5_4_flag_red() >= 145 && level_5_5_flag_red() >= 145 && level_5_6_flag_red() >= 145 &&
              level_5_7_flag_red() >= 145 && level_5_8_flag_red() >= 145 && level_5_9_flag_red() >= 145 &&
              once(low4(0x0A3CE8) == 3) && once(low4(0x0A3CE8) == 2) && low4(0x0A3CE8) == 7 && never(screen_id() == 5)
)

achievement(
    title = "Red Flags VI - Cold Everywhere", points = 25,
    description = "Get all the red flags in the world 6",
    id = 130931, badge = "143822", published = "10/27/2020 7:12:50 PM", modified = "10/27/2020 7:12:50 PM",
    trigger = level_6_1_flag_red() >= 145 && level_6_2_flag_red() >= 145 && level_6_3_flag_red() >= 145 &&
              level_6_4_flag_red() >= 145 && level_6_5_flag_red() >= 145 && level_6_6_flag_red() >= 145 &&
              level_6_7_flag_red() >= 145 && level_6_8_flag_red() >= 145 && level_6_9_flag_red() >= 145 &&
              once(low4(0x0A3CE8) == 3) && once(low4(0x0A3CE8) == 2) && low4(0x0A3CE8) == 7 && never(screen_id() == 5)
)

achievement(
    title = "Red Flags VII - Extreme Blizzard, Partner!", points = 25,
    description = "Get all the red flags in the world 7",
    id = 130923, badge = "143974", published = "10/27/2020 7:11:36 PM", modified = "10/27/2020 7:11:36 PM",
    trigger = level_7_1_flag_red() >= 145 && level_7_2_flag_red() >= 145 && level_7_3_flag_red() >= 145 &&
              level_7_4_flag_red() >= 145 && level_7_5_flag_red() >= 145 && level_7_6_flag_red() >= 145 &&
              level_7_7_flag_red() >= 145 && level_7_8_flag_red() >= 145 && level_7_9_flag_red() >= 145 &&
              once(low4(0x0A3CE8) == 3) && once(low4(0x0A3CE8) == 2) && low4(0x0A3CE8) == 7 && never(screen_id() == 5)
)

achievement(
    title = "Red Flags VIII - Hot Brand", points = 25,
    description = "Get all the red flags in the world 8",
    id = 130932, badge = "143980", published = "10/27/2020 7:12:56 PM", modified = "10/27/2020 7:12:56 PM",
    trigger = level_8_1_flag_red() >= 145 && level_8_2_flag_red() >= 145 && level_8_3_flag_red() >= 145 &&
              level_8_4_flag_red() >= 145 && level_8_5_flag_red() >= 145 && level_8_6_flag_red() >= 145 &&
              level_8_7_flag_red() >= 145 && level_8_8_flag_red() >= 145 && level_8_9_flag_red() >= 145 &&
              never(low4(0x0A3CE8) != 7) && flag_achievements_champion() > 0
)

achievement(
    title = "Adventures in the Kingdom of Heaven", points = 3,
    description = "Finish secret level 1-10 ",
    id = 130941, badge = "144054", published = "10/27/2020 7:18:41 PM", modified = "10/27/2020 7:18:41 PM",
    trigger = never(world_id() != 1) && never(stage_level() != 10) && once(screen_id() == 3) && screen_id() == 2 &&
              flag_finish() > 0
)

achievement(
    title = "In the Fall of Starry Night", points = 3,
    description = "Finish secret level 2-10 ",
    id = 130942, badge = "144056", published = "10/27/2020 7:18:46 PM", modified = "10/27/2020 7:18:46 PM",
    trigger = never(world_id() != 2) && never(stage_level() != 10) && once(screen_id() == 3) && screen_id() == 2 &&
              flag_finish() > 0
)

achievement(
    title = "Fire Torches Areas", points = 3,
    description = "Finish secret level 3-10 ",
    id = 130943, badge = "144061", published = "10/27/2020 7:18:49 PM", modified = "10/27/2020 7:18:49 PM",
    trigger = never(world_id() != 3) && never(stage_level() != 10) && once(screen_id() == 3) && screen_id() == 2 &&
              flag_finish() > 0
)

achievement(
    title = "The Rainbow Path", points = 3,
    description = "Finish secret level 4-10 ",
    id = 130944, badge = "144068", published = "10/27/2020 7:18:52 PM", modified = "10/27/2020 7:18:52 PM",
    trigger = never(world_id() != 4) && never(stage_level() != 10) && once(screen_id() == 3) && screen_id() == 2 &&
              flag_finish() > 0
)

achievement(
    title = "Endless Abyss", points = 3,
    description = "Finish secret level 5-10 ",
    id = 130945, badge = "144070", published = "10/27/2020 7:18:55 PM", modified = "10/27/2020 7:18:55 PM",
    trigger = never(world_id() != 5) && never(stage_level() != 10) && once(screen_id() == 3) && screen_id() == 2 &&
              flag_finish() > 0
)

achievement(
    title = "Magic Enchanted Dust", points = 3,
    description = "Finish secret level 6-10 ",
    id = 130946, badge = "144071", published = "10/27/2020 7:18:59 PM", modified = "10/27/2020 7:18:59 PM",
    trigger = never(world_id() != 6) && never(stage_level() != 10) && once(screen_id() == 3) && screen_id() == 2 &&
              flag_finish() > 0
)

achievement(
    title = "High Jumping Precision", points = 3,
    description = "Finish secret level 7-10 ",
    id = 130947, badge = "144072", published = "10/27/2020 7:19:04 PM", modified = "10/27/2020 7:19:04 PM",
    trigger = never(world_id() != 7) && never(stage_level() != 10) && once(screen_id() == 3) && screen_id() == 2 &&
              flag_finish() > 0
)

achievement(
    title = "Reviewing the Classic Game", points = 10,
    description = "Finish secret level 8-10 ",
    id = 130948, badge = "144074", published = "10/27/2020 7:19:09 PM", modified = "10/27/2020 7:19:09 PM",
    trigger = never(world_id() != 8) && never(stage_level() != 10) && once(screen_id() == 3) && screen_id() == 2 &&
              flag_finish() > 0 && red_cristal_in_level() == 1
)

achievement(
    title = "Playing Digging", points = 5,
    description = "Clear level 9-1 with all red gems",
    id = 130967, badge = "144198", published = "10/27/2020 7:23:42 PM", modified = "10/27/2020 7:23:42 PM",
    trigger = level_9_1_flag_red() >= 145 && never(screen_id() != 7) && red_cristal_in_level() == 12
)

achievement(
    title = "The Search for a Way Out", points = 5,
    description = "Clear level 9-2",
    id = 130968, badge = "144201", published = "10/27/2020 7:23:44 PM", modified = "10/27/2020 7:23:44 PM",
    trigger = never(world_id() != 9) && never(stage_level() != 2) && once(screen_id() == 3) && screen_id() == 2 &&
              flag_finish() > 0
)

achievement(
    title = "The Title of the Game", points = 3,
    description = "Discover and finish level X-1",
    id = 130969, badge = "144212", published = "10/27/2020 7:23:46 PM", modified = "10/27/2020 7:23:46 PM",
    trigger = never(world_id() != 10) && never(stage_level() != 1) && once(screen_id() == 3) && screen_id() == 2 &&
              flag_finish() > 0
)

achievement(
    title = "Stone and Ice Alleys", points = 3,
    description = "Collect all blue crystals and destroy the blocks of level X-2 | [Track a progress bar in the description and finish level]",
    id = 130970, badge = "144214", published = "10/27/2020 7:23:48 PM", modified = "10/27/2020 7:23:48 PM",
    trigger = never(world_id() != 10) && never(stage_level() != 2) && once(screen_id() == 3) && screen_id() == 2 &&
              flag_finish() > 0 && measured(repeated(75, dscore() > prev(dscore())))
)

achievement(
    title = "The Quick and Calculating", points = 3,
    description = "Finish level 1-7 with time at 271 or more [Without picking up or using checkpoint]",
    id = 130949, badge = "144085", published = "10/27/2020 7:20:24 PM", modified = "7/1/2023 9:45:04 AM",
    trigger = never(prev(seconds()) < 271) && never(world_id() != 1) && never(stage_level() != 7) &&
              once(screen_id() == 3) && never(lives() < prev(lives())) && never(flag_chekngpoint() > 0) &&
              screen_id() == 2 && flag_finish() > 0
)

achievement(
    title = "Be Careful Where You Step", points = 3,
    description = "Finish level 2-1 with time at 270 or more [Without picking up or using checkpoint]",
    id = 130950, badge = "144086", published = "10/27/2020 7:20:27 PM", modified = "7/1/2023 9:45:04 AM",
    trigger = never(prev(seconds()) < 270) && never(world_id() != 2) && never(stage_level() != 1) &&
              once(screen_id() == 3) && never(lives() < prev(lives())) && never(flag_chekngpoint() > 0) &&
              screen_id() == 2 && flag_finish() > 0
)

achievement(
    title = "Tomb Speed", points = 3,
    description = "Finish level 3-4 with time at 276 or more [Without picking up or using checkpoint]",
    id = 130951, badge = "144088", published = "10/27/2020 7:20:29 PM", modified = "7/1/2023 9:45:05 AM",
    trigger = never(prev(seconds()) < 276) && never(world_id() != 3) && never(stage_level() != 4) &&
              once(screen_id() == 3) && never(lives() < prev(lives())) && never(flag_chekngpoint() > 0) &&
              screen_id() == 2 && flag_finish() > 0
)

achievement(
    title = "By a Thread", points = 3,
    description = "Finish level 4-5 with time at 276 or more [Without picking up or using checkpoint]",
    id = 130952, badge = "144089", published = "10/27/2020 7:20:31 PM", modified = "7/1/2023 9:45:05 AM",
    trigger = never(prev(seconds()) < 276) && never(world_id() != 4) && never(stage_level() != 5) &&
              once(screen_id() == 3) && never(lives() < prev(lives())) && never(flag_chekngpoint() > 0) &&
              screen_id() == 2 && flag_finish() > 0
)

achievement(
    title = "The Glittering Acrobat", points = 3,
    description = "Finish level 5-6 with time at 274 or more [Without picking up or using checkpoint]",
    id = 130953, badge = "144091", published = "10/27/2020 7:20:33 PM", modified = "7/1/2023 9:45:08 AM",
    trigger = never(prev(seconds()) < 274) && never(world_id() != 5) && never(stage_level() != 6) &&
              once(screen_id() == 3) && never(lives() < prev(lives())) && never(flag_chekngpoint() > 0) &&
              screen_id() == 2 && flag_finish() > 0
)

achievement(
    title = "Separation Zone", points = 3,
    description = "Finish level 6-1 with time at 277 or more [Without picking up or using checkpoint]",
    id = 130954, badge = "144092", published = "10/27/2020 7:20:36 PM", modified = "7/1/2023 9:45:09 AM",
    trigger = never(prev(seconds()) < 277) && never(world_id() != 6) && never(stage_level() != 1) &&
              once(screen_id() == 3) && never(lives() < prev(lives())) && never(flag_chekngpoint() > 0) &&
              screen_id() == 2 && flag_finish() > 0
)

achievement(
    title = "Don't Touch Anything", points = 3,
    description = "Finish level 7-4 with time at 271 or more [Without picking up or using checkpoint]",
    id = 130955, badge = "144093", published = "10/27/2020 7:20:38 PM", modified = "7/1/2023 9:45:10 AM",
    trigger = never(prev(seconds()) < 271) && never(world_id() != 7) && never(stage_level() != 4) &&
              once(screen_id() == 3) && never(lives() < prev(lives())) && never(flag_chekngpoint() > 0) &&
              screen_id() == 2 && flag_finish() > 0
)

achievement(
    title = "Flying Fast", points = 3,
    description = "Finish level 8-2 with time at 268 or more [Without picking up or using checkpoint]",
    id = 130956, badge = "144094", published = "10/27/2020 7:20:41 PM", modified = "7/1/2023 9:45:10 AM",
    trigger = never(prev(seconds()) < 268) && never(world_id() != 8) && never(stage_level() != 2) &&
              once(screen_id() == 3) && never(lives() < prev(lives())) && never(flag_chekngpoint() > 0) &&
              screen_id() == 2 && flag_finish() > 0
)

achievement(
    title = "An Original Total Battle", points = 2,
    description = "Defeat the 2-9 Boss using Gina's original form",
    id = 130960, badge = "144202", published = "10/27/2020 7:22:03 PM", modified = "10/27/2020 7:22:03 PM",
    trigger = never(stage_level() != 9) && never(world_id() != 2) && flag_finish() > 0 && screen_id() == 2 &&
              once(screen_id() == 3) && never(forms_geni() == 1)
)

achievement(
    title = "Confrontation of Origins", points = 3,
    description = "Defeat the 3-9 Boss using Gina's original form",
    id = 130961, badge = "144203", published = "10/27/2020 7:22:07 PM", modified = "10/27/2020 7:22:07 PM",
    trigger = never(stage_level() != 9) && never(world_id() != 3) && flag_finish() > 0 && screen_id() == 2 &&
              once(screen_id() == 3) && never(forms_geni() == 1)
)

achievement(
    title = "Without Letting Morale Drop", points = 3,
    description = "Defeat the 4-9 Boss using Gina's original form",
    id = 130962, badge = "144204", published = "10/27/2020 7:22:10 PM", modified = "10/27/2020 7:22:10 PM",
    trigger = never(stage_level() != 9) && never(world_id() != 4) && flag_finish() > 0 && screen_id() == 2 &&
              once(screen_id() == 3) && never(forms_geni() == 1)
)

achievement(
    title = "That's a Burst of Flavor", points = 1,
    description = "Get a bubble gum",
    id = 130963, badge = "144207", published = "10/27/2020 7:22:13 PM", modified = "10/27/2020 7:22:13 PM",
    trigger = never(screen_id() != 3) && never(stage_level() == 0) && never(world_id() == 0) && item_chicle() > 0
)

achievement(
    title = "Unfortunately You Will Not Drink This", points = 1,
    description = "Get a Soda",
    id = 130964, badge = "144206", published = "10/27/2020 7:22:15 PM", modified = "10/27/2020 7:22:15 PM",
    trigger = never(screen_id() != 3) && never(stage_level() == 0) && never(world_id() == 0) && item_soda() > 0
)

achievement(
    title = "The Great Collector of Lives", points = 5,
    description = "Get a total of 20 lives",
    id = 130929, badge = "143814", published = "10/27/2020 7:12:46 PM", modified = "10/27/2020 7:12:46 PM",
    trigger = lives() > prev(lives()) && lives() >= 20 && never(screen_id() != 3) && never(stage_level() == 0)
)

achievement(
    title = "The Small Challenge 7 - Run Friend Run !!!", points = 5,
    description = "Defeat all monsters in first and second rooms in 7-6 without stopping running [without taking damage, without energy balls]",
    id = 130959, badge = "143978", published = "10/27/2020 7:21:45 PM", modified = "10/27/2021 5:26:02 PM",
    trigger = never(screen_id() != 3) && never(stage_level() != 1798) &&
              measured(repeated(28, p1_control_front() > 0 && dscore() > prev(dscore()))) &&
              never(p1_control_back() > 0) && never(flag_char_stop_afk() == 1) &&
              never(forms_geni() < prev(forms_geni())) && never((forms_geni() == 1 && p1_control_bit7() > 0))
)

achievement(
    title = "A Great Arrival to the Score", points = 5,
    description = "Score 250.000 points",
    id = 130957, badge = "143977", published = "10/27/2020 7:21:37 PM", modified = "10/27/2020 7:21:37 PM",
    trigger = measured(dscore() >= 250000) && unless(low4(0x0A3CE8) != 3) && unless(stage_level() == 0) &&
              unless(world_id() == 0)
)

achievement(
    title = "Breaking All Parameters", points = 10,
    description = "Score 500.000 points",
    id = 130958, badge = "143976", published = "10/27/2020 7:21:39 PM", modified = "10/27/2020 7:21:39 PM",
    trigger = measured(dscore() >= 500000) && unless(low4(0x0A3CE8) != 3) && unless(stage_level() == 0) &&
              unless(world_id() == 0)
)

achievement(
    title = "Extermination of Creatures", points = 10,
    description = "Unlock the achievement [Monster Hunter]",
    id = 130971, badge = "143971", published = "10/27/2020 7:23:52 PM", modified = "10/27/2020 7:23:52 PM",
    trigger = unless(low4(0x0A3CE8) != 3) && unless(stage_level() == 0) && unless(world_id() == 0) &&
              word(0x0A2F24) >= 51200 && flag_achievements_monster_hunter() > 0
)

achievement(
    title = "Cunning Pirate", points = 10,
    description = "Unlock the achievement [Diamond Fever]",
    id = 130972, badge = "143975", published = "10/27/2020 7:23:54 PM", modified = "10/27/2020 7:23:54 PM",
    trigger = unless(low4(0x0A3CE8) != 3) && unless(stage_level() == 0) && unless(world_id() == 0) &&
              flag_achievements_bit2() > 0 && total_diamonds() >= 5000
)

achievement(
    title = "Great Achievement", points = 50, type="missable",
    description = "Unlock the achievement [Perfect]",
    id = 130973, badge = "144075", published = "10/27/2020 7:23:56 PM", modified = "10/27/2020 7:23:56 PM",
    trigger = flag_achievements_champion() > 0 && flag_achievements_perfect() > 0 && never(low4(0x0A3CE8) != 7) &&
              stage_level() == 0 && world_id() == 0
)

achievement(
    title = "DEMOTED AS UNWELCOME CONCEPT - ???", points = 1,
    description = "What is the name of the character that this game was inspired by? [Write in one of the Save Slots]",
    id = 130966, badge = "144216", published = "10/27/2020 7:23:33 PM", modified = "1/9/2025 10:48:48 PM",
    trigger = screen_id() == 1 && stage_level() == 0 && world_id() == 0 &&
              ((byte(pointer_for_name_currently_being_entered() + 0x00087E) == 109 &&
                byte(pointer_for_name_currently_being_entered() + 0x000880) == 97 &&
                byte(pointer_for_name_currently_being_entered() + 0x000882) == 114 &&
                byte(pointer_for_name_currently_being_entered() + 0x000884) == 105 &&
                byte(pointer_for_name_currently_being_entered() + 0x000886) == 111) ||
               (byte(pointer_for_name_currently_being_entered() + 0x00087E) == 77 &&
                byte(pointer_for_name_currently_being_entered() + 0x000880) == 97 &&
                byte(pointer_for_name_currently_being_entered() + 0x000882) == 114 &&
                byte(pointer_for_name_currently_being_entered() + 0x000884) == 105 &&
                byte(pointer_for_name_currently_being_entered() + 0x000886) == 111) ||
               (byte(pointer_for_name_currently_being_entered() + 0x00087E) == 77 &&
                byte(pointer_for_name_currently_being_entered() + 0x000880) == 65 &&
                byte(pointer_for_name_currently_being_entered() + 0x000882) == 82 &&
                byte(pointer_for_name_currently_being_entered() + 0x000884) == 73 &&
                byte(pointer_for_name_currently_being_entered() + 0x000886) == 79))
)

achievement(
    title = "DEMOTED AS UNWELCOME CONCEPT - Hello! That's My Crazy Form", points = 3,
    description = "Shoot 150 energy balls",
    id = 130965, badge = "144208", published = "10/27/2020 7:22:21 PM", modified = "1/9/2025 10:47:18 PM",
    trigger = unless(screen_id() != 3) && unless(stage_level() == 0) && unless(world_id() == 0) &&
              measured(repeated(150, forms_geni() == 1 && p1_control_bit7() > prev(p1_control_bit7())))
)
