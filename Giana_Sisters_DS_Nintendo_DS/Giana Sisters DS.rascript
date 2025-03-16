// Giana Sisters DS
// #ID = 7062

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

// $0A2f30: SCORE - [32-Bits]
function score() => dword(0x0a2f30)

// $0A7F15: (32-bit) Main Menu check
// 
//          There's a few of these but this looks acceptable
//          
//          0x00000000  in game
//          0x00020f3d on main menu. 
function main_menu_check() => dword(0x0A7F15)
MAIN_MENU_VALUE = 0x00020F3D
function onMainMenu() => main_menu_check() == MAIN_MENU_VALUE


// Note World 1 also has a level 10, we ignore it. 
world1Array = [
    level_1_1_flag_red(), level_1_2_flag_red(), level_1_3_flag_red(),
    level_1_4_flag_red(), level_1_5_flag_red(), level_1_6_flag_red(),
    level_1_7_flag_red(), level_1_8_flag_red(), level_1_9_flag_red()
]

world2Array = [
    level_2_1_flag_red(), level_2_2_flag_red(), level_2_3_flag_red(),
    level_2_4_flag_red(), level_2_5_flag_red(), level_2_6_flag_red(),
    level_2_7_flag_red(), level_2_8_flag_red(), level_2_9_flag_red()
]
world3Array = [
    level_3_1_flag_red(), level_3_2_flag_red(), level_3_3_flag_red(),
    level_3_4_flag_red(), level_3_5_flag_red(), level_3_6_flag_red(),
    level_3_7_flag_red(), level_3_8_flag_red(), level_3_9_flag_red()
]
world4Array = [
    level_4_1_flag_red(), level_4_2_flag_red(), level_4_3_flag_red(),
    level_4_4_flag_red(), level_4_5_flag_red(), level_4_6_flag_red(),
    level_4_7_flag_red(), level_4_8_flag_red(), level_4_9_flag_red()
]
world5Array = [
    level_5_1_flag_red(), level_5_2_flag_red(), level_5_3_flag_red(),
    level_5_4_flag_red(), level_5_5_flag_red(), level_5_6_flag_red(),
    level_5_7_flag_red(), level_5_8_flag_red(), level_5_9_flag_red()
]
world6Array = [
    level_6_1_flag_red(), level_6_2_flag_red(), level_6_3_flag_red(),
    level_6_4_flag_red(), level_6_5_flag_red(), level_6_6_flag_red(),
    level_6_7_flag_red(), level_6_8_flag_red(), level_6_9_flag_red()
]
world7Array = [
    level_7_1_flag_red(), level_7_2_flag_red(), level_7_3_flag_red(),
    level_7_4_flag_red(), level_7_5_flag_red(), level_7_6_flag_red(),
    level_7_7_flag_red(), level_7_8_flag_red(), level_7_9_flag_red()
]
world8Array = [
    level_8_1_flag_red(), level_8_2_flag_red(), level_8_3_flag_red(),
    level_8_4_flag_red(), level_8_5_flag_red(), level_8_6_flag_red(),
    level_8_7_flag_red(), level_8_8_flag_red(), level_8_9_flag_red()
]



// $0A2FA2: STAGE LEVEL
function stage_level() => byte(0x0A2FA2)

// $0A2FA3: WORLD ID
function world_id() => byte(0x0A2FA3)

// $0A3023: [16-bit] Seconds
function seconds() => word(0x0A3023)


// $0A3CE8: SCREEN ID
//          
//          05=Main Menu
//          01=Blue Screen
//          02=CG Animations/Result
//          03=In game
//          07=World Map
function screen_id() => byte(0x0A3CE8)

WORLD_MAP_ID = 7
function onWorldMap() => screen_id() == WORLD_MAP_ID

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


// $1CA2E6: CONTAGE POINT
function contage_point() => byte(0x1CA2E6)

function justUnlockedLevelComplete(array) => any_of(array, value => value > 0 && prev(value) == 0)


function levelCompleteCheck(arraylevels) {
    // I believe this should be >81 but the original was this, so let's do it. 
    return  measured( tally_of(arraylevels, length(arraylevels), value => once(value > 0)), when=!onMainMenu()) && 
            tally_of(arraylevels, length(arraylevels)-1, value => prev(value) >0)  &&  // One Less
            justUnlockedLevelComplete(arraylevels) &&
            never(onMainMenu())
}

achievement(
    title = "Adventures in a Floral World", points = 10, type="progression",
    description = "Complete the world 1",
    id = 130916, badge = "143705", published = "10/27/2020 7:11:08 PM", modified = "10/27/2020 7:11:08 PM",
    trigger = levelCompleteCheck(world1Array)
)

achievement(
    title = "Where the Middle Ages", points = 10, type="progression",
    description = "Complete the world 2",
    id = 130917, badge = "143707", published = "10/27/2020 7:11:12 PM", modified = "10/27/2020 7:11:12 PM",
    trigger = levelCompleteCheck(world2Array)
)

achievement(
    title = "Home of Rain", points = 10, type="progression",
    description = "Complete the world 3",
    id = 130918, badge = "143816", published = "10/27/2020 7:11:16 PM", modified = "10/27/2020 7:11:16 PM",
    trigger = levelCompleteCheck(world3Array)
)

achievement(
    title = "High Pressure Waterfall", points = 10, type="progression",
    description = "Complete the world 4",
    id = 130919, badge = "143817", published = "10/27/2020 7:11:21 PM", modified = "10/27/2020 7:11:21 PM",
    trigger = levelCompleteCheck(world4Array)
)

achievement(
    title = "Soft Drinks and Chewing Gum", points = 10, type="progression",
    description = "Complete the world 5",
    id = 130920, badge = "143820", published = "10/27/2020 7:11:24 PM", modified = "10/27/2020 7:11:24 PM",
    trigger = levelCompleteCheck(world5Array)
)

achievement(
    title = "The Place Where It Freezes", points = 10, type="progression",
    description = "Complete the world 6",
    id = 130921, badge = "143821", published = "10/27/2020 7:11:26 PM", modified = "10/27/2020 7:11:26 PM",
    trigger = levelCompleteCheck(world6Array)
)

achievement(
    title = "The Peak of Diverting From Thorns", points = 10, type="progression",
    description = "Complete the world 7",
    id = 130922, badge = "143973", published = "10/27/2020 7:11:32 PM", modified = "10/27/2020 7:11:32 PM",
    trigger = levelCompleteCheck(world7Array)
)

achievement(
    title = "Fleeing the Eruption", points = 10, type="win_condition",
    description = "Complete the world 8",
    id = 130924, badge = "143979", published = "10/27/2020 7:11:41 PM", modified = "10/27/2020 7:11:41 PM",
    trigger = levelCompleteCheck(world8Array) && flag_achievements_champion() > 0
)

achievement(
    title = "How About a Little Farm?", points = 5,
    description = "Collect 550 blue jewels at levels in the world 1",
    id = 130938, badge = "143823", published = "10/27/2020 7:13:51 PM", modified = "10/27/2020 7:13:51 PM",
    trigger = unless(world_id() != 1) && unless(low4(0x0A3CE8) != 3) &&
              measured(repeated(550, blue_cristal() > prev(blue_cristal())))
)

achievement(
    title = "I Hope You're Not Tired", points = 5,
    description = "Collect 550 blue jewels at levels in the world 2",
    id = 130939, badge = "143824", published = "10/27/2020 7:13:54 PM", modified = "10/27/2020 7:13:54 PM",
    trigger = unless(world_id() != 2) && unless(low4(0x0A3CE8) != 3) &&
              measured(repeated(550, blue_cristal() > prev(blue_cristal())))
)

achievement(
    title = "Hold on a Little More Friend", points = 5,
    description = "Collect 550 blue jewels at levels in the world 3",
    id = 130940, badge = "143825", published = "10/27/2020 7:13:56 PM", modified = "10/27/2020 7:13:56 PM",
    trigger = unless(world_id() != 3) && unless(low4(0x0A3CE8) != 3) &&
              measured(repeated(550, blue_cristal() > prev(blue_cristal())))
)

achievement(
    title = "Do Not Be Angry", points = 5,
    description = "Collect 550 blue jewels at levels in the world 4",
    id = 130933, badge = "144049", published = "10/27/2020 7:13:01 PM", modified = "10/27/2020 7:13:01 PM",
    trigger = unless(world_id() != 4) && unless(low4(0x0A3CE8) != 3) &&
              measured(repeated(550, blue_cristal() > prev(blue_cristal())))
)

achievement(
    title = "One Day You Will Thank Me", points = 5,
    description = "Collect 550 blue jewels at levels in the world 5",
    id = 130934, badge = "144050", published = "10/27/2020 7:13:05 PM", modified = "10/27/2020 7:13:05 PM",
    trigger = unless(world_id() != 5) && unless(low4(0x0A3CE8) != 3) &&
              measured(repeated(550, blue_cristal() > prev(blue_cristal())))
)

achievement(
    title = "It Won't Be Today or Tomorrow, but It Will Happen", points = 5,
    description = "Collect 550 blue jewels at levels in the world 6",
    id = 130935, badge = "144051", published = "10/27/2020 7:13:07 PM", modified = "10/27/2020 7:13:07 PM",
    trigger = unless(world_id() != 6) && unless(low4(0x0A3CE8) != 3) &&
              measured(repeated(550, blue_cristal() > prev(blue_cristal())))
)

achievement(
    title = "And When That Day Comes ...", points = 5,
    description = "Collect 550 blue jewels at levels in the world 7",
    id = 130936, badge = "144052", published = "10/27/2020 7:13:10 PM", modified = "10/27/2020 7:13:10 PM",
    trigger = unless(world_id() != 7) && unless(low4(0x0A3CE8) != 3) &&
              measured(repeated(550, blue_cristal() > prev(blue_cristal())))
)

achievement(
    title = "You Will Be the King of Farms", points = 5,
    description = "Collect 550 blue jewels at levels in the world 8",
    id = 130937, badge = "144053", published = "10/27/2020 7:13:12 PM", modified = "10/27/2020 7:13:12 PM",
    trigger = unless(world_id() != 8) && unless(low4(0x0A3CE8) != 3) &&
              measured(repeated(550, blue_cristal() > prev(blue_cristal())))
)


function justGotRedFlagComplete(array) => any_of(array, value => value == 0x91 && prev(value) != 0x91)

function redFlagCollectionCheck(arrayRedFlags) {
    return  measured( tally_of(arrayRedFlags, length(arrayRedFlags), value => once(value == 0x91)), when=!onMainMenu()) && 
            tally_of(arrayRedFlags, length(arrayRedFlags)-1, value => prev(value) == 0x91)  && // One less
            justGotRedFlagComplete(arrayRedFlags) &&
            never(onMainMenu())
}



achievement(
    title = "Red Flags I - Precious Jewels", points = 25,
    description = "Get all the red flags in the world 1",
    id = 130926, badge = "143706", published = "10/27/2020 7:12:39 PM", modified = "10/27/2020 7:12:39 PM",
    trigger = redFlagCollectionCheck(world1Array)
)

achievement(
    title = "Red Flags II - The Tales Were True", points = 25,
    description = "Get all the red flags in the world 2",
    id = 130927, badge = "143708", published = "10/27/2020 7:12:42 PM", modified = "10/27/2020 7:12:42 PM",
    trigger = redFlagCollectionCheck(world2Array)
)

achievement(
    title = "Red Flags III - Breeze Forwards", points = 25,
    description = "Get all the red flags in the world 3",
    id = 130928, badge = "143810", published = "10/27/2020 7:12:44 PM", modified = "10/27/2020 7:12:44 PM",
    trigger = redFlagCollectionCheck(world3Array)
)

achievement(
    title = "Red Flags IV - Where Are They All", points = 25,
    description = "Get all the red flags in the world 4",
    id = 130925, badge = "143818", published = "10/27/2020 7:12:36 PM", modified = "10/27/2020 7:12:36 PM",
    trigger = redFlagCollectionCheck(world4Array)
)

achievement(
    title = "Red Flags V - Carefully", points = 25,
    description = "Get all the red flags in the world 5",
    id = 130930, badge = "143819", published = "10/27/2020 7:12:48 PM", modified = "10/27/2020 7:12:48 PM",
    trigger = redFlagCollectionCheck(world5Array)
)

achievement(
    title = "Red Flags VI - Cold Everywhere", points = 25,
    description = "Get all the red flags in the world 6",
    id = 130931, badge = "143822", published = "10/27/2020 7:12:50 PM", modified = "10/27/2020 7:12:50 PM",
    trigger = redFlagCollectionCheck(world6Array)
)

achievement(
    title = "Red Flags VII - Extreme Blizzard, Partner!", points = 25,
    description = "Get all the red flags in the world 7",
    id = 130923, badge = "143974", published = "10/27/2020 7:11:36 PM", modified = "10/27/2020 7:11:36 PM",
    trigger = redFlagCollectionCheck(world7Array)
)

achievement(
    title = "Red Flags VIII - Hot Brand", points = 25,
    description = "Get all the red flags in the world 8",
    id = 130932, badge = "143980", published = "10/27/2020 7:12:56 PM", modified = "10/27/2020 7:12:56 PM",
    trigger = redFlagCollectionCheck(world8Array) && flag_achievements_champion() > 0
)


achievement(
    title = "A Great Arrival to the Score", points = 5,
    description = "Score 250.000 points",
    id = 130957, badge = "143977", published = "10/27/2020 7:21:37 PM", modified = "10/27/2020 7:21:37 PM",
    trigger = score() >= 250000 && unless(low4(0x0A3CE8) != 3) && unless(stage_level() == 0) &&
              unless(world_id() == 0)
)

achievement(
    title = "Breaking All Parameters", points = 10,
    description = "Score 500.000 points",
    id = 130958, badge = "143976", published = "10/27/2020 7:21:39 PM", modified = "10/27/2020 7:21:39 PM",
    trigger = score() >= 500000 && unless(low4(0x0A3CE8) != 3) && unless(stage_level() == 0) &&
              unless(world_id() == 0)
)


// Also added some Triggers to other achievemetns manually. 