// Dolphin
// #ID = 25710

// $0000: (8-bit) Game mode (difficulty setting)  -1
//        0x0 = Difficulty 1 (One player)
//        0x1 = Difficulty 1 (Two players)
//        0x2 = Difficulty 2 (One player)
//        0x3 = Difficulty 2 (Two players)
//        0x4 = Difficulty 3 (One player)
//        0x5 = Difficulty 3 (Two players)
//        0x6 = Difficulty 4 (One player)
//        0x7 = Difficulty 4 (Two players)
function bit_game_mode_difficulty_setting_1() => byte(0x000000)

GameModeToDifficultyLookup = {
    0: "1",
    1: "1",
    2: "2",
    3: "2",
    4: "3",
    5: "3",
    6: "4",
    7: "4",
}

// $0023: (8-bit) Demo mode timer.
//        0x00 Game has started (play may not have) Demo is disabled.
//        Any other number, countdown to demo.  IF this hits 0x01 Demo starts, and Memory location 0x22 has 0x8 set high.
//        For all achievements this MUST be 0x00
function bit_demo_mode_timer() => byte(0x000023)

// $0024: (8-bit) Active Player's Low Score Decimal Values 0000xx
//        Each digit will be any number between 0 and 9. Remember this is a Hex value however.  But 0x50 = 50 on the display.
//        If this hits the special score, this becomes ef.
//        
//        Note: Takes two frames to update the screen buffer.
//        
//        Can also be read as
//        (24-bit) BCD representation of the score.
function bit_active_player_s_low_score_decimal_values_0000xx() => byte(0x000024)
function bit_active_player_s_low_score_decimal_values_0000xx() => tbyte(0x000024)
function bit_active_player_s_low_score_decimal_values_0000xx() => tbyte_be(0x000024)

// $0027: (8-bit) Bottom Left indicator (Decimal)
//        If 0x23 is 0x00 it indicates lives (0x11 is 11)
//        If 0x23 is not 0x00 it indicates difficulty.  This is not needed as the same value will be stored in 0x00 minus 1
//        0xaa means the game is over, and the player has run out of lives, or reached the secret score
function bit_bottom_left_indicator_decimal() => byte(0x000027)

// $002A: (8-bit) Non active player's Low Score Decimal Values 0000xx
//        Each digit will be any number between 0 and 9. Remember this is a Hex value however.  But 0x50 = 50 on the display.
//        If this hits the special score, this becomes ef.
//        
//        This is set to 0 if there is no other player.
//        
//        Can also be read as
//        (24-bit) BCD representation of the alternate player's score.
function bit_non_active_player_s_low_score_decimal_values_0000xx() => tbyte(0x00002A)
function bit_non_active_player_s_low_score_decimal_values_0000xx() => tbyte_be(0x00002A)

// $002D: (8-bit) Non Active Player's life indicator/Duplicate Bottom Left display(Decimal)
//        If 0x23 is 0x00 it indicates lives of the non active player(0x11 is 11)
//        If 0x23 is not 0x00 it indicates difficulty, in this case, it is a duplicate value of 0x27 and does not need to be used.
function bit_non_active_player_s_life_indicator_duplicate_bottom_left_display_decimal() => byte(0x00002D)

// $0031: (8-bit) Player Selector
//        0x00 if Player One is in control
//        0x01 if Player Two is in control.
//        
//        Instering bugs happen when you set this to 2 or 3.  Likely used for the controller offset
function bit_player_selector() => byte(0x000031)

// $0032: (8-bit) Distance in the game.
//        
//        Increments with each cycle of Seahorses  Will go up to 0x1f
//        
//        Consider it "Screens passed".
//        
//        Note: increments no matter which direction you travel.
function bit_distance_in_the_game() => byte(0x000032)

// $0034: (8-bit) Seahorse Passing Score (pre-score)
//        
//        Starts at 0x05, and decrements for "frames" where dolphin hits the seahorse.
//        
//        Doesn't happen every frame, but ultimately will decrement by 5 if player misses the gap.
//        
//        If 0x35 is not = 0x00 when the player passes the Seahorses, 0x35 won't be modified, and this will reset to 0x05
//        
//        Note: Not using for Perfect Echolocation for the moment, to show off a different strategy.
//        
//        Bug with the game.  If you get close to seahorses and turn around you can net a "perfect" pass with out going through the gate.
function bit_seahorse_passing_score_pre_score() => byte(0x000034)

// $0035: (8-bit) Score Multiplier for Accuracy in Passing Seahorses or points remaining for eating a seagull
//        0x00 for no score
//        0x01 to 0x05 for "total score" decrements by one for each score iteration. (5 becomes 4 becomes 3...)
//        0x05 only occurs on a "Perfect pass"
//        0x05 will equal 50 points.
//        
//        Seagull will start at more than 0x5 (depending on difficulty + length of game.)
//        
//        Note: sometimes the game will set 5 into this register, and then immediately decrement 1 for the score update, so a change from 0 to 4 should be considered a perfect pass IF 0x0024 has changed in the same frame.
function bit_score_multiplier_for_accuracy_in_passing_seahorses_or_points_remaining_for_eating_a_seagull() => byte(0x000035)

// $0036: (8-bit) Squid Reward
//        0x00 = no squid reward.
//        Foir all other values, it is Points x 100 Points earned for killing a squid decrements by 1 every time the score updates.
//        
//        It's unclear how the score is set, but it will be set when 0x0076 Upper 4 is set to 08, and 0x003d is != 0x00
function bit_squid_reward() => byte(0x000036)

// $0038: (8-bit) Dolphin Y location
//        0x16 is "water edge" any higher is a leap (See 0x003c for leap animation info)
//        0x73 is bottom.
//        
//        Note: 0x17 is a good differenciator, No Gaps will occur at 0x17
function bit_dolphin_y_location() => byte(0x000038)

// $003D: (8-bit) Seagull Power Frames left
//        0x00 No Seagull Power
//        Once Seagull is hit, either 0xff or 0x7f, depending on the position of Left difficulty Switch. (A is supposed to be 2 seconds of invinicibility, 7F, B is FF which is 4 seconds)
//        Every frame, this decrements by 1 until it's 0x00 again.
function bit_seagull_power_frames_left() => byte(0x00003D)

// $0058: (8-bit) Direction of Dolphin
//        0x01 Towards the Right
//        0x00 Towards the Left
function bit_direction_of_dolphin() => byte(0x000058)

// $0079: (8-bit) Game Running
//        
//        Values:
//        0= Paused, or difficulty select
//        1= Early gameplay, or score updates
//        2= This may be a "difficulty" toggle, the higher, the faster the game runs.   Long tests do show this value,
//        Entirely possible that it goes higher.
//        Note: Game pauses (0) after each Squid Kill.
//        Note: Demo also sets 1. See Memory location 0x23 to figure out if in demo or no(
//        (When squid score is accumulating this flickers to 1 even though the game is paused.  This doesn't affect current achievements, but something to be aware of.)
function bit_game_running() => byte(0x000079)

achievement(
    title = "Threading the Underwater Needle", points = 1,
    description = "Get a perfect passes (50 pts) when going through a set of seahorse",
    id = 356396, badge = "401618", published = "9/18/2023 4:29:51 AM", modified = "10/30/2023 9:12:21 PM",
    trigger = bit_demo_mode_timer() == 0 && prev(bit_seahorse_passing_score_pre_score()) == 5 && bit_seahorse_passing_score_pre_score() == 0 && bit_score_multiplier_for_accuracy_in_passing_seahorses_or_points_remaining_for_eating_a_seagull() != 0 && 
              bit_dolphin_y_location() > 23
)

achievement(
    title = "Free Flipper", points = 1,
    description = "Get a perfect leap (50 pts) when going over a set of seahorse",
    id = 356397, badge = "401619", published = "9/18/2023 4:29:51 AM", modified = "10/30/2023 9:12:23 PM",
    trigger = bit_demo_mode_timer() == 0 && prev(bit_seahorse_passing_score_pre_score()) == 5 && bit_seahorse_passing_score_pre_score() == 0 && bit_score_multiplier_for_accuracy_in_passing_seahorses_or_points_remaining_for_eating_a_seagull() != 0 && 
              bit_dolphin_y_location() <= 23
)

achievement(
    title = "By the Power of SEA-GULLl!", points = 1,
    description = "Eat a Seagull to power up, now go get that cephlapod",
    id = 356383, badge = "401605", published = "9/18/2023 4:29:44 AM", modified = "10/30/2023 9:12:23 PM",
    trigger = bit_demo_mode_timer() == 0 && bit_seagull_power_frames_left() > prev(bit_seagull_power_frames_left())
)

achievement(
    title = "Captain Nemo Would Be Proud", points = 1,
    description = "Kill your first squid",
    id = 356384, badge = "401606", published = "9/18/2023 4:29:45 AM", modified = "10/30/2023 9:12:24 PM",
    trigger = bit_demo_mode_timer() == 0 && bit_squid_reward() > prev(bit_squid_reward())
)

achievement(
    title = "Dolphin Whisperer", points = 2,
    description = "Earn 5,000 points in any mode",
    id = 356386, badge = "401608", published = "9/18/2023 4:29:46 AM", modified = "10/30/2023 9:12:25 PM",
    trigger = bit_demo_mode_timer() == 0 && bcd(bit_active_player_s_low_score_decimal_values_0000xx()) >= 5000
)

achievement(
    title = "They're Multiplying!", points = 5,
    description = "Earn your first extra life at 20,000 points in any mode",
    id = 356387, badge = "401609", published = "9/18/2023 4:29:46 AM", modified = "10/30/2023 9:12:26 PM",
    trigger = bit_demo_mode_timer() == 0 && bcd(bit_active_player_s_low_score_decimal_values_0000xx()) >= 20000
)

achievement(
    title = "Perfect Echolocation", points = 5,
    description = "Get a perfect passes of the sea horses (50 points) 5 times in a row without dying, eating a seagull, eating a squid, jumping over the sea horses or turning around.",
    id = 360775, badge = "406294", published = "10/3/2023 6:31:40 AM", modified = "10/30/2023 9:12:27 PM",
    trigger = measured(tally(5, 
                  (bit_active_player_s_low_score_decimal_values_0000xx() != prev(bit_active_player_s_low_score_decimal_values_0000xx()) && ((bit_score_multiplier_for_accuracy_in_passing_seahorses_or_points_remaining_for_eating_a_seagull() - prev(bit_score_multiplier_for_accuracy_in_passing_seahorses_or_points_remaining_for_eating_a_seagull())) == 4) &&
                   bit_dolphin_y_location() > 23), 
                  ((bit_score_multiplier_for_accuracy_in_passing_seahorses_or_points_remaining_for_eating_a_seagull() - prev(bit_score_multiplier_for_accuracy_in_passing_seahorses_or_points_remaining_for_eating_a_seagull())) == 5) && bit_dolphin_y_location() > 23
              )) && never(repeated(2, bit_distance_in_the_game() != prev(bit_distance_in_the_game()) && never(((bit_active_player_s_low_score_decimal_values_0000xx() !=
               prev(bit_active_player_s_low_score_decimal_values_0000xx()) && ((bit_score_multiplier_for_accuracy_in_passing_seahorses_or_points_remaining_for_eating_a_seagull() - prev(bit_score_multiplier_for_accuracy_in_passing_seahorses_or_points_remaining_for_eating_a_seagull())) == 4)) || ((bit_score_multiplier_for_accuracy_in_passing_seahorses_or_points_remaining_for_eating_a_seagull() -
               prev(bit_score_multiplier_for_accuracy_in_passing_seahorses_or_points_remaining_for_eating_a_seagull())) == 5)) && bit_dolphin_y_location() > 23))) && never((prev(bit_score_multiplier_for_accuracy_in_passing_seahorses_or_points_remaining_for_eating_a_seagull()) == 0 &&
               bit_score_multiplier_for_accuracy_in_passing_seahorses_or_points_remaining_for_eating_a_seagull() > 0 && bit_score_multiplier_for_accuracy_in_passing_seahorses_or_points_remaining_for_eating_a_seagull() < 4)) && never(bit_game_running() == 0) && never(high4(0x000023) != 0) && 
              never(bit_direction_of_dolphin() != prev(bit_direction_of_dolphin())) && never(bit_seagull_power_frames_left() != 0)
)

achievement(
    title = "Dolphin Air", points = 5,
    description = "Get a perfect leap over the sea horses (50 points) 5 times in a row without dying, eating a seagull, eating a squid, swimming through the seahorses, or turning around.",
    id = 360776, badge = "406295", published = "10/3/2023 6:31:40 AM", modified = "10/30/2023 9:12:28 PM",
    trigger = measured(repeated(5, prev(bit_seahorse_passing_score_pre_score()) == 5 && bit_seahorse_passing_score_pre_score() == 0 && bit_score_multiplier_for_accuracy_in_passing_seahorses_or_points_remaining_for_eating_a_seagull() != 0 &&
               bit_dolphin_y_location() <= 23)) && never((prev(bit_seahorse_passing_score_pre_score()) == 5 && bit_seahorse_passing_score_pre_score() == 0 && bit_score_multiplier_for_accuracy_in_passing_seahorses_or_points_remaining_for_eating_a_seagull() ==
               0)) && never((prev(bit_seahorse_passing_score_pre_score()) == 5 && bit_seahorse_passing_score_pre_score() == 0 && bit_score_multiplier_for_accuracy_in_passing_seahorses_or_points_remaining_for_eating_a_seagull() != 0 && bit_dolphin_y_location() >
               23)) && never(repeated(2, bit_distance_in_the_game() != prev(bit_distance_in_the_game()) && never(prev(bit_seahorse_passing_score_pre_score()) == 5 &&
               bit_seahorse_passing_score_pre_score() == 0))) && never((prev(bit_seahorse_passing_score_pre_score()) != 5 && prev(bit_seahorse_passing_score_pre_score()) != 0 && bit_seahorse_passing_score_pre_score()
               == 0)) && never(bit_game_running() == 0) && never(high4(0x000023) != 0) && never(bit_direction_of_dolphin() !=
               prev(bit_direction_of_dolphin())) && never(bit_seagull_power_frames_left() != 0)
)

achievement(
    title = "Calimari for the Table Please", points = 10,
    description = "Kill five squids in one life",
    id = 356385, badge = "401607", published = "9/18/2023 4:29:45 AM", modified = "10/30/2023 9:12:28 PM",
    trigger = bit_demo_mode_timer() == 0 && measured(repeated(5, bit_squid_reward() > prev(bit_squid_reward()))) && 
              never(bit_bottom_left_indicator_decimal() < prev(bit_bottom_left_indicator_decimal())) && never(bcd(bit_active_player_s_low_score_decimal_values_0000xx()) == 0) && never(bit_player_selector()
               != prev(bit_player_selector()))
)

achievement(
    title = "First Friend of the Dolphin", points = 10,
    description = "Earn your Friend of the Dolphin achievement by earning 80,000 pts in mode 1 or 2,  no photograph needed",
    id = 356388, badge = "401610", published = "9/18/2023 4:29:47 AM", modified = "10/30/2023 9:12:29 PM",
    trigger = bit_demo_mode_timer() == 0 && (bit_game_mode_difficulty_setting_1() == 0 || bit_game_mode_difficulty_setting_1() == 1) && bcd(bit_active_player_s_low_score_decimal_values_0000xx()) >= 80000
)

achievement(
    title = "Second Friend of the Dolphin", points = 10,
    description = "Earn your Friend of the Dolphin achievement by earning 80,000 pts in mode 3 or 4, no photograph needed",
    id = 356389, badge = "401611", published = "9/18/2023 4:29:47 AM", modified = "10/30/2023 9:12:30 PM",
    trigger = bit_demo_mode_timer() == 0 && (bit_game_mode_difficulty_setting_1() == 2 || bit_game_mode_difficulty_setting_1() == 3) && bcd(bit_active_player_s_low_score_decimal_values_0000xx()) >= 80000
)

achievement(
    title = "Third Friend of the Dolphin", points = 10,
    description = "Earn your Friend of the Dolphin achievement by earning 80,000 pts in mode 5 or 6, no photograph needed",
    id = 356390, badge = "401612", published = "9/18/2023 4:29:48 AM", modified = "10/30/2023 9:12:31 PM",
    trigger = bit_demo_mode_timer() == 0 && (bit_game_mode_difficulty_setting_1() == 4 || bit_game_mode_difficulty_setting_1() == 5) && bcd(bit_active_player_s_low_score_decimal_values_0000xx()) >= 80000
)

achievement(
    title = "Fourth Friend of the Dolphin", points = 10,
    description = "Earn your Friend of the Dolphin achievement by earning 80,000 pts in mode 7 or 8, no photograph needed",
    id = 356391, badge = "401613", published = "9/18/2023 4:29:48 AM", modified = "10/30/2023 9:12:32 PM",
    trigger = bit_demo_mode_timer() == 0 && (bit_game_mode_difficulty_setting_1() == 6 || bit_game_mode_difficulty_setting_1() == 7) && bcd(bit_active_player_s_low_score_decimal_values_0000xx()) >= 80000
)

achievement(
    title = "Master of the Waves Difficulty 1", points = 10,
    description = "Earn your 150,000 points in mode 1 or 2",
    id = 356392, badge = "401614", published = "9/18/2023 4:29:49 AM", modified = "10/30/2023 9:12:33 PM",
    trigger = bit_demo_mode_timer() == 0 && (bit_game_mode_difficulty_setting_1() == 0 || bit_game_mode_difficulty_setting_1() == 1) && bcd(bit_active_player_s_low_score_decimal_values_0000xx()) >= 150000
)

achievement(
    title = "Master of the Waves Difficulty 2", points = 10,
    description = "Earn your 150,000 points in mode 3 or 4",
    id = 356393, badge = "401615", published = "9/18/2023 4:29:49 AM", modified = "10/30/2023 9:12:34 PM",
    trigger = bit_demo_mode_timer() == 0 && (bit_game_mode_difficulty_setting_1() == 2 || bit_game_mode_difficulty_setting_1() == 3) && bcd(bit_active_player_s_low_score_decimal_values_0000xx()) >= 150000
)

achievement(
    title = "Master of the Waves Difficulty 3", points = 10,
    description = "Earn your 150,000 points in mode 5 or 6",
    id = 356394, badge = "401616", published = "9/18/2023 4:29:50 AM", modified = "10/30/2023 9:12:34 PM",
    trigger = bit_demo_mode_timer() == 0 && (bit_game_mode_difficulty_setting_1() == 4 || bit_game_mode_difficulty_setting_1() == 5) && bcd(bit_active_player_s_low_score_decimal_values_0000xx()) >= 150000
)

achievement(
    title = "Master of the Waves Difficulty 4", points = 10,
    description = "Earn your 150,000 points in mode 7 or 8",
    id = 356395, badge = "401617", published = "9/18/2023 4:29:50 AM", modified = "10/30/2023 9:12:35 PM",
    trigger = bit_demo_mode_timer() == 0 && (bit_game_mode_difficulty_setting_1() == 6 || bit_game_mode_difficulty_setting_1() == 7) && bcd(bit_active_player_s_low_score_decimal_values_0000xx()) >= 150000
)

achievement(
    title = "First Secret Society of Dolphins", points = 25,
    description = "Join the Secret Society of Dolphins in mode 1 or 2. See game manual for a hint",
    id = 356398, badge = "401620", published = "9/18/2023 4:29:51 AM", modified = "10/30/2023 9:12:36 PM",
    trigger = bit_demo_mode_timer() == 0 && (bit_game_mode_difficulty_setting_1() == 0 || bit_game_mode_difficulty_setting_1() == 1) && bit_active_player_s_low_score_decimal_values_0000xx() == 11259375 && 
              bit_bottom_left_indicator_decimal() == 170
)

achievement(
    title = "Second Secret Society of Dolphins", points = 25,
    description = "Join the Secret Society of Dolphins in mode 3 or 4. See the game manual for a hint",
    id = 356399, badge = "401621", published = "9/18/2023 4:29:52 AM", modified = "10/30/2023 9:12:37 PM",
    trigger = bit_demo_mode_timer() == 0 && (bit_game_mode_difficulty_setting_1() == 2 || bit_game_mode_difficulty_setting_1() == 3) && bit_active_player_s_low_score_decimal_values_0000xx() == 11259375 && 
              bit_bottom_left_indicator_decimal() == 170
)

achievement(
    title = "Third Secret Society of Dolphins", points = 25,
    description = "Join the Secret Society of Dolphins in mode 5 or 6. See the game manual for a hint",
    id = 356400, badge = "401622", published = "9/18/2023 4:29:52 AM", modified = "10/30/2023 9:12:38 PM",
    trigger = bit_demo_mode_timer() == 0 && (bit_game_mode_difficulty_setting_1() == 4 || bit_game_mode_difficulty_setting_1() == 5) && bit_active_player_s_low_score_decimal_values_0000xx() == 11259375 && 
              bit_bottom_left_indicator_decimal() == 170
)

achievement(
    title = "Fourth Secret Society of Dolphins", points = 25,
    description = "Join the Secret Society of Dolphins in mode 7 or 8. See the game manual for a hint",
    id = 356401, badge = "401623", published = "9/18/2023 4:29:53 AM", modified = "10/30/2023 9:12:39 PM",
    trigger = bit_demo_mode_timer() == 0 && (bit_game_mode_difficulty_setting_1() == 6 || bit_game_mode_difficulty_setting_1() == 7) && bit_active_player_s_low_score_decimal_values_0000xx() == 11259375 && 
              bit_bottom_left_indicator_decimal() == 170
)

achievement(
    title = "The First Elite Secret Society of Dolphins", points = 25,
    description = "Join the Secret Society of Dolphins in game mode 1 or 2 with the Left Difficulty set to A (2 second seagull power)",
    id = 356402, badge = "401624", published = "9/18/2023 4:29:53 AM", modified = "10/30/2023 9:12:39 PM",
    trigger = bit_demo_mode_timer() == 0 && (bit_game_mode_difficulty_setting_1() == 0 || bit_game_mode_difficulty_setting_1() == 1) && never(bit_seagull_power_frames_left() > 127) && 
              once(bcd(bit_active_player_s_low_score_decimal_values_0000xx()) == 0 && bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()) == 0) && trigger_when(bit_active_player_s_low_score_decimal_values_0000xx() == 11259375) && 
              trigger_when(bit_bottom_left_indicator_decimal() == 170)
)

achievement(
    title = "The Second Elite Secret Society of Dolphins", points = 25,
    description = "Join the Secret Society of Dolphins in game mode 3 or 4 with the Left Difficulty set to A (2 second seagull power)",
    id = 356403, badge = "401625", published = "9/18/2023 4:29:54 AM", modified = "10/30/2023 9:12:40 PM",
    trigger = bit_demo_mode_timer() == 0 && (bit_game_mode_difficulty_setting_1() == 2 || bit_game_mode_difficulty_setting_1() == 3) && never(bit_seagull_power_frames_left() > 127) && 
              once(bcd(bit_active_player_s_low_score_decimal_values_0000xx()) == 0 && bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()) == 0) && trigger_when(bit_active_player_s_low_score_decimal_values_0000xx() == 11259375) && 
              trigger_when(bit_bottom_left_indicator_decimal() == 170)
)

achievement(
    title = "The Third Elite Secret Society of Dolphins", points = 25,
    description = "Join the Secret Society of Dolphins in game mode 5 or 6 with the Left Difficulty set to A (2 second seagull power)",
    id = 356404, badge = "401626", published = "9/18/2023 4:29:54 AM", modified = "10/30/2023 9:12:41 PM",
    trigger = bit_demo_mode_timer() == 0 && (bit_game_mode_difficulty_setting_1() == 4 || bit_game_mode_difficulty_setting_1() == 5) && never(bit_seagull_power_frames_left() > 127) && 
              once(bcd(bit_active_player_s_low_score_decimal_values_0000xx()) == 0 && bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()) == 0) && trigger_when(bit_active_player_s_low_score_decimal_values_0000xx() == 11259375) && 
              trigger_when(bit_bottom_left_indicator_decimal() == 170)
)

achievement(
    title = "The Fourth Elite Secret Society of Dolphins", points = 25,
    description = "Join the Secret Society of Dolphins in game mode 7 or 8 with the Left Difficulty set to A (2 second seagull power)",
    id = 356405, badge = "401627", published = "9/18/2023 4:29:54 AM", modified = "10/30/2023 9:12:41 PM",
    trigger = bit_demo_mode_timer() == 0 && (bit_game_mode_difficulty_setting_1() == 6 || bit_game_mode_difficulty_setting_1() == 7) && never(bit_seagull_power_frames_left() > 127) && 
              once(bcd(bit_active_player_s_low_score_decimal_values_0000xx()) == 0 && bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()) == 0) && trigger_when(bit_active_player_s_low_score_decimal_values_0000xx() == 11259375) && 
              trigger_when(bit_bottom_left_indicator_decimal() == 170)
)

leaderboard(
    id = 77617, title = "Highest Score in Difficulty 1",
    description = "Get the highest score in mode 1 or 2 (Difficulty 1)",
    start  = (bit_game_mode_difficulty_setting_1() == 0 || bit_game_mode_difficulty_setting_1() == 1) && prev(bit_bottom_left_indicator_decimal()) != 170 && bit_bottom_left_indicator_decimal() == 170 && 
             (bcd(bit_active_player_s_low_score_decimal_values_0000xx()) != 0 || bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()) != 0),
    cancel = always_false(),
    submit = bit_bottom_left_indicator_decimal() == 170,
    value = max_of(
                measured(bcd(bit_active_player_s_low_score_decimal_values_0000xx())),
                measured(bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()))
            ),
    format = "VALUE"
)

leaderboard(
    id = 77618, title = "Highest Score in Difficulty 2",
    description = "Get the highest score in mode 3 or 4 (Difficulty 2)",
    start  = (bit_game_mode_difficulty_setting_1() == 2 || bit_game_mode_difficulty_setting_1() == 3) && prev(bit_bottom_left_indicator_decimal()) != 170 && bit_bottom_left_indicator_decimal() == 170 && 
             (bcd(bit_active_player_s_low_score_decimal_values_0000xx()) != 0 || bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()) != 0),
    cancel = always_false(),
    submit = bit_bottom_left_indicator_decimal() == 170,
    value = max_of(
                measured(bcd(bit_active_player_s_low_score_decimal_values_0000xx())),
                measured(bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()))
            ),
    format = "VALUE"
)

leaderboard(
    id = 77619, title = "Highest Score in Difficulty 3",
    description = "Get the highest score in mode 5 or 6 (Difficulty 3)",
    start  = (bit_game_mode_difficulty_setting_1() == 4 || bit_game_mode_difficulty_setting_1() == 5) && prev(bit_bottom_left_indicator_decimal()) != 170 && bit_bottom_left_indicator_decimal() == 170 && 
             (bcd(bit_active_player_s_low_score_decimal_values_0000xx()) != 0 || bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()) != 0),
    cancel = always_false(),
    submit = bit_bottom_left_indicator_decimal() == 170,
    value = max_of(
                measured(bcd(bit_active_player_s_low_score_decimal_values_0000xx())),
                measured(bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()))
            ),
    format = "VALUE"
)

leaderboard(
    id = 77620, title = "Highest Score in Difficulty 4",
    description = "Get the highest score in mode 7 or 8 (Difficulty 3)",
    start  = (bit_game_mode_difficulty_setting_1() == 6 || bit_game_mode_difficulty_setting_1() == 7) && prev(bit_bottom_left_indicator_decimal()) != 170 && bit_bottom_left_indicator_decimal() == 170 && 
             (bcd(bit_active_player_s_low_score_decimal_values_0000xx()) != 0 || bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()) != 0),
    cancel = always_false(),
    submit = bit_bottom_left_indicator_decimal() == 170,
    value = max_of(
                measured(bcd(bit_active_player_s_low_score_decimal_values_0000xx())),
                measured(bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()))
            ),
    format = "VALUE"
)

leaderboard(
    id = 77621, title = "Fastest to join the Secret Society Difficulty 1",
    description = "Reach the secret society as fast as possible on mode 1 or mode 2",
    start  = bit_demo_mode_timer() == 0 && (bit_game_mode_difficulty_setting_1() == 0 || bit_game_mode_difficulty_setting_1() == 1) && (bcd(bit_active_player_s_low_score_decimal_values_0000xx()) == 0 &&
              bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()) == 0) && bit_game_running() == 1,
    cancel = ((bit_game_running() == 0 && bit_bottom_left_indicator_decimal() == 4 && bcd(bit_active_player_s_low_score_decimal_values_0000xx()) == 0 && bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()) == 0) ||
              (prev(bit_game_mode_difficulty_setting_1()) != bit_game_mode_difficulty_setting_1()) ||
              ((bit_demo_mode_timer() != 0 && bit_active_player_s_low_score_decimal_values_0000xx() != 11259375))),
    submit = bit_active_player_s_low_score_decimal_values_0000xx() == 11259375,
    value = max_of(
                measured(always_true(), when=bit_player_selector() == 0) && unless((bit_player_selector() != 0 || bit_game_running() ==
                   0)),
                measured(always_true(), when=bit_player_selector() == 1) && unless((bit_player_selector() != 1 || bit_game_running() ==
                   0))
            ),
    format = "FRAMES"
)

leaderboard(
    id = 77622, title = "Fastest to join the Secret Society Difficulty 2",
    description = "Reach the secret society as fast as possible on mode 3 or mode 4",
    start  = bit_demo_mode_timer() == 0 && (bit_game_mode_difficulty_setting_1() == 2 || bit_game_mode_difficulty_setting_1() == 3) && (bcd(bit_active_player_s_low_score_decimal_values_0000xx()) == 0 &&
              bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()) == 0) && bit_game_running() == 1,
    cancel = ((bit_game_running() == 0 && bit_bottom_left_indicator_decimal() == 4 && bcd(bit_active_player_s_low_score_decimal_values_0000xx()) == 0 && bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()) == 0) ||
              (prev(bit_game_mode_difficulty_setting_1()) != bit_game_mode_difficulty_setting_1()) ||
              ((bit_demo_mode_timer() != 0 && bit_active_player_s_low_score_decimal_values_0000xx() != 11259375))),
    submit = bit_active_player_s_low_score_decimal_values_0000xx() == 11259375,
    value = max_of(
                measured(always_true(), when=bit_player_selector() == 0) && unless((bit_player_selector() != 0 || bit_game_running() ==
                   0)),
                measured(always_true(), when=bit_player_selector() == 1) && unless((bit_player_selector() != 1 || bit_game_running() ==
                   0))
            ),
    format = "FRAMES"
)

leaderboard(
    id = 77623, title = "Fastest to join the Secret Society Difficulty 3",
    description = "Reach the secret society as fast as possible on mode 5 or mode 6",
    start  = bit_demo_mode_timer() == 0 && (bit_game_mode_difficulty_setting_1() == 4 || bit_game_mode_difficulty_setting_1() == 5) && (bcd(bit_active_player_s_low_score_decimal_values_0000xx()) == 0 &&
              bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()) == 0) && bit_game_running() == 1,
    cancel = ((bit_game_running() == 0 && bit_bottom_left_indicator_decimal() == 4 && bcd(bit_active_player_s_low_score_decimal_values_0000xx()) == 0 && bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()) == 0) ||
              (prev(bit_game_mode_difficulty_setting_1()) != bit_game_mode_difficulty_setting_1()) ||
              ((bit_demo_mode_timer() != 0 && bit_active_player_s_low_score_decimal_values_0000xx() != 11259375))),
    submit = bit_active_player_s_low_score_decimal_values_0000xx() == 11259375,
    value = max_of(
                measured(always_true(), when=bit_player_selector() == 0) && unless((bit_player_selector() != 0 || bit_game_running() ==
                   0)),
                measured(always_true(), when=bit_player_selector() == 1) && unless((bit_player_selector() != 1 || bit_game_running() ==
                   0))
            ),
    format = "FRAMES"
)

leaderboard(
    id = 77624, title = "Fastest to join the Secret Society Difficulty 4",
    description = "Reach the secret society as fast as possible on mode 7 or mode 8",
    start  = bit_demo_mode_timer() == 0 && (bit_game_mode_difficulty_setting_1() == 6 || bit_game_mode_difficulty_setting_1() == 7) && (bcd(bit_active_player_s_low_score_decimal_values_0000xx()) == 0 &&
              bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()) == 0) && bit_game_running() == 1,
    cancel = ((bit_game_running() == 0 && bit_bottom_left_indicator_decimal() == 4 && bcd(bit_active_player_s_low_score_decimal_values_0000xx()) == 0 && bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()) == 0) ||
              (prev(bit_game_mode_difficulty_setting_1()) != bit_game_mode_difficulty_setting_1()) ||
              ((bit_demo_mode_timer() != 0 && bit_active_player_s_low_score_decimal_values_0000xx() != 11259375))),
    submit = bit_active_player_s_low_score_decimal_values_0000xx() == 11259375,
    value = max_of(
                measured(always_true(), when=bit_player_selector() == 0) && unless((bit_player_selector() != 0 || bit_game_running() ==
                   0)),
                measured(always_true(), when=bit_player_selector() == 1) && unless((bit_player_selector() != 1 || bit_game_running() ==
                   0))
            ),
    format = "FRAMES"
)

rich_presence_conditional_display(bit0(0x000000) == 1 && bit_active_player_s_low_score_decimal_values_0000xx() == 15715755 && bit_non_active_player_s_low_score_decimal_values_0000xx() == 15715755, "Both Player have finished the game with perfect scores on difficulty {0} AMAZING!",
    rich_presence_lookup("GameModeToDifficulty", bit_game_mode_difficulty_setting_1(), GameModeToDifficultyLookup)
)

rich_presence_conditional_display(bit0(0x000000) == 1 && bit_player_selector() == 0 && bit_non_active_player_s_low_score_decimal_values_0000xx() == 15715755, "Player 2 finished the game with a perfect score on difficulty {0} with {1} lives remaining  P1 Score: {2} P1 Lives: {3} ",
    rich_presence_lookup("GameModeToDifficulty", bit_game_mode_difficulty_setting_1(), GameModeToDifficultyLookup),
    rich_presence_value("Number", bcd(bit_bottom_left_indicator_decimal())),
    rich_presence_value("Score", bcd(bit_active_player_s_low_score_decimal_values_0000xx()), format="SCORE"),
    rich_presence_value("Number", bcd(bit_bottom_left_indicator_decimal()))
)

rich_presence_conditional_display(bit0(0x000000) == 1 && bit_player_selector() == 1 && bit_non_active_player_s_low_score_decimal_values_0000xx() == 15715755, "Player 1 finished the game with a perfect score on difficulty {0} with {1} lives remaining  P2 Score: {2} P2 Lives: {3} ",
    rich_presence_lookup("GameModeToDifficulty", bit_game_mode_difficulty_setting_1(), GameModeToDifficultyLookup),
    rich_presence_value("Number", bcd(bit_bottom_left_indicator_decimal())),
    rich_presence_value("Score", bcd(bit_active_player_s_low_score_decimal_values_0000xx()), format="SCORE"),
    rich_presence_value("Number", bcd(bit_bottom_left_indicator_decimal()))
)

rich_presence_conditional_display(bit0(0x000000) == 1 && bit_player_selector() == 0 && bit_bottom_left_indicator_decimal() == 170, "Has finished their game P1 Score: {0} P2 Score: {1} Difficulty: {2}",
    rich_presence_value("Score", bcd(bit_active_player_s_low_score_decimal_values_0000xx()), format="SCORE"),
    rich_presence_value("Score", bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()), format="SCORE"),
    rich_presence_lookup("GameModeToDifficulty", bit_game_mode_difficulty_setting_1(), GameModeToDifficultyLookup)
)

rich_presence_conditional_display(bit0(0x000000) == 1 && bit_player_selector() == 1 && bit_bottom_left_indicator_decimal() == 170, "Has finished their game P1 Score: {0} P2 Score: {1} Difficulty: {2}",
    rich_presence_value("Score", bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()), format="SCORE"),
    rich_presence_value("Score", bcd(bit_active_player_s_low_score_decimal_values_0000xx()), format="SCORE"),
    rich_presence_lookup("GameModeToDifficulty", bit_game_mode_difficulty_setting_1(), GameModeToDifficultyLookup)
)

rich_presence_conditional_display(bit_active_player_s_low_score_decimal_values_0000xx() == 15715755, "Finished the game with a perfect score on difficulty {0}",
    rich_presence_lookup("GameModeToDifficulty", bit_game_mode_difficulty_setting_1(), GameModeToDifficultyLookup)
)

rich_presence_conditional_display(bit_bottom_left_indicator_decimal() == 170, "Finished their game on difficulty {0} with a score of {1} ",
    rich_presence_value("Number", bit_game_mode_difficulty_setting_1() + 1),
    rich_presence_value("Score", bcd(bit_active_player_s_low_score_decimal_values_0000xx()), format="SCORE")
)

rich_presence_conditional_display(high4(0x000022) == 8, "Watching the demo")

rich_presence_conditional_display(bit_demo_mode_timer() != 0, "Considering game mode {0}",
    rich_presence_value("Number", bit_game_mode_difficulty_setting_1() + 1)
)

rich_presence_conditional_display(bit0(0x000000) == 1 && bit_player_selector() == 0, "P1 Score: {0} P2 Score: {1} Difficulty: {2} P1 Lives: {3} P2 Lives: {4} ",
    rich_presence_value("Score", bcd(bit_active_player_s_low_score_decimal_values_0000xx()), format="SCORE"),
    rich_presence_value("Score", bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()), format="SCORE"),
    rich_presence_lookup("GameModeToDifficulty", bit_game_mode_difficulty_setting_1(), GameModeToDifficultyLookup),
    rich_presence_value("Number", bcd(bit_bottom_left_indicator_decimal())),
    rich_presence_value("Number", bcd(bit_non_active_player_s_life_indicator_duplicate_bottom_left_display_decimal()))
)

rich_presence_conditional_display(bit0(0x000000) == 1 && bit_player_selector() == 1, "P1 Score: {0} P2 Score: {1} Difficulty: {2} P1 Lives: {3} P2 Lives: {4} ",
    rich_presence_value("Score", bcd(bit_non_active_player_s_low_score_decimal_values_0000xx()), format="SCORE"),
    rich_presence_value("Score", bcd(bit_active_player_s_low_score_decimal_values_0000xx()), format="SCORE"),
    rich_presence_lookup("GameModeToDifficulty", bit_game_mode_difficulty_setting_1(), GameModeToDifficultyLookup),
    rich_presence_value("Number", bcd(bit_non_active_player_s_life_indicator_duplicate_bottom_left_display_decimal())),
    rich_presence_value("Number", bcd(bit_bottom_left_indicator_decimal()))
)

rich_presence_display("Score: {0} Difficulty: {1} Lives Remaining: {2}",
    rich_presence_value("Score", bcd(bit_active_player_s_low_score_decimal_values_0000xx()), format="SCORE"),
    rich_presence_lookup("GameModeToDifficulty", bit_game_mode_difficulty_setting_1(), GameModeToDifficultyLookup),
    rich_presence_value("Number", bcd(bit_bottom_left_indicator_decimal()))
)
