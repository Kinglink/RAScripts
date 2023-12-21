// Elevator Action Returns
// #ID = 11654

// Just some fast cobbled together test achievements to prove stuff is working. 

// $19FD24: (8-bit) Second player's Credits Remaining.
//          
//          0x04 = Normal gameplay.
//          0x08 = Cheating!!!
//          
//          All other values probably means second player is active.
function bit_second_player_s_credits_remaining() => byte(0x19FD24)

// $19FD25: (8-bit) First Player Credits Remaining
//          
//          Starts at 3 meaning 3 credits + the initial.
//          
//          NOTE! There is a cheat code to start with 7 Credits, which is really 7 + 1 starting credit.
function bit_first_player_credits_remaining() => byte(0x19FD25)

// $1A10F2: (8-bit) Current Level ID
//          
//          0x00 = Mission 1 Red After Image
//          0x01 = Mission 2 Cross The Breeze
//          0x02 = Mission 3 Colors of Night
//          0x03 = Mission 4 Under The Crack
//          0x04 = Mission 5 Crimson Line
//          0x05 = Mission 6 Vermillion Sun
function bit_current_level_id() => byte(0x1A10F2)

// $1A1162: (8-bit) Cheat mod option for Player Stock
//          
//          If this is set to any value other than 0x1 CHEATING!!!!!
function bit_cheat_mod_option_for_player_stock() => byte(0x1A1162)

// $1A1164: (8-bit) Cheat mod option for Bomb Stock
//          
//          If this is set to any value other than 0x14 CHEATING!!!!!
function bit_cheat_mod_option_for_bomb_stock() => byte(0x1A1164)

// $1A5122: (8-bit) Second player's Credits Remaining.
//          
//          0x04 = Normal gameplay.
//          0x08 = Cheating!!!
function bit_second_player_s_credits_remaining() => byte(0x1A5122)

// $1ADEA6: (16-bit) Time until Caution alarm.
//          
//          Starts at different times, but will trigger the caution when it hits 0x00.  Set 0x1adea8 to 0x13 and then resets self to 0x3b to create a cycle.
function bit_time_until_caution_alarm() => word(0x1ADEA6)

// $1ADEA8: (16-bit) Caution cycle
//          
//          Set to 0x13 to start a caution display from 0x1adea6
//          
//          This will display caution as it decrements (And a little bit after) Eventually this will reach 0xffff and go idle again.
//          
//          Decrements only when negative (bit 7 is not set)
function bit_caution_cycle() => word(0x1ADEA8)

// $1B0648: (8-bit) Player 1 Character
//          
//          0x02 = Kart Bradfield
//          0x01 = Edie Burrett
//          0x00 = Jad the Taff
function bit_player_1_character() => byte(0x1B0648)

// $1B064A: (8-bit) First player lives remaining
//          
//          (Always starts at 1 life, meaning two lives)
//          
//          0x0 = No lives left (Check health)
//          0x1 = Starting value (1 life remaining)
function bit_first_player_lives_remaining() => byte(0x1B064A)

// $1B064F: (4-bit Upper) First player's lower health bits
//          
//          See 0x1b0746
function bit_upper_first_player_s_lower_health_bits() => byte(0x1B064F)

// $1B0682: (16-bit) First player Alternate X Location
//          
//          The location in the game world of the player.  This appears to do a better job lining up with enemy characters.
function bit_first_player_alternate_x_location() => word(0x1B0682)

// $1B0684: (16-bit) First player Alternate Y Location
//          
//          The location in the game world of the player.  This appears to do a better job lining up with enemy characters.
function bit_first_player_alternate_y_location() => word(0x1B0684)

// $1B069C: (16-bit) First player X Location
//          
//          The location in the game world of the player.  This doesn't line up well with enemy characters though.
//          
//          Note: will be negative some times.  That's ok
//          
//          Changing this WILL move the player.
function bit_first_player_x_location() => word(0x1B069C)

// $1B06A0: (16-bit) First player Y Location
//          
//          The location in the game world of the player.  This doesn't line up well with enemy characters though.
//          
//          Note: will be negative some times.  That's ok
//          
//          Changing this WILL move the player.
function bit_first_player_y_location() => word(0x1B06A0)

// $1B06B0: (8-bit) Special Ammo type
//          
//          0x00 = None
//          0x01 = Machine gun (Fast fire)
//          0x02 = Launcher (Rockets)
//          
//          Note setting to 0x03 warps the player out of the level?  WUTTTTT
function bit_special_ammo_type() => byte(0x1B06B0)

// $1B06B2: (8-bit) Special ammo remaining
//          
//          0x1b06b0 will be the type of ammo.
//          
//          0x00 = Out of ammo.
//          0x14 = Launcher starting ammo (20)
//          0x64 = Value when picking up Machine guns (100 bullets)
function bit_special_ammo_remaining() => byte(0x1B06B2)

// $1B06F2: (8-bit) Jumping indicator
//          
//          0x2f = On the ground
//          Any other number = in the air. Appears to decrement to 0x1c and then increments to 0x2f.
function bit_jumping_indicator() => byte(0x1b0680)

// $1B0746: (8-bit) First player combined health total
//          
//          Comes from 0x1b064c's lower, and 0x1b064f upper.  But 0x1b064c is the upper and 0x1b064f is the lowers, Strange.
//          
//          Kurt starts at 30 points.
//          Edie starts at 28 points
//          Jad starts at 38 points
function bit_first_player_combined_health_total() => byte(0x1B0746)

// $1B0748: (8-bit) First player Secondary weapon (Duplicate)
//          
//          0x1b0792
function bit_first_player_secondary_weapon_duplicate() => byte(0x1B0748)

// $1B0792: (8-bit) First player secondary weapon uses left
//          
//          0x00 = Out of uses.
//          0x14 = Starting count
//          
//          Note this can increase above the starting count.
function bit_first_player_secondary_weapon_uses_left() => byte(0x1B0792)

// $1B089C: (8-bit) Bullets fired.
//          
//          Mirrors 0x1b089e but each is uniquely changable.
function bit_bullets_fired() => byte(0x1B089C)

// $1B089E: (8-bit) Bullets fired.
//          
//          Likely for some bullet tracking or vfx.
//          
//          Resets to 0x0 after 0xf
function bit_bullets_fired() => byte(0x1B089E)

// $1B0EF4: (4-bits lower) Second Player's health upper bits
//          
//          See 0x1b0fee
function bits_lower_second_player_s_health_upper_bits() => byte(0x1B0EF4)

// $1B0EF7: (4-bits upper) Second Player's health lower bits
//          
//          See 0x1b0fee
function bits_upper_second_player_s_health_lower_bits() => byte(0x1B0EF7)

// $1B0FEE: (8-bit) Second Player's combined health
//          
//          Takes the lower 4-bit from 0x1b0ef4 for the upper bits here, and the upper bits from the 0x1b0ef7 for the lower bits here.
function bit_second_player_s_combined_health() => byte(0x1B0FEE)

// $1C9A08: (bitfield) Additional First Player controller input.
//          
//          As always set is "Off"  Not set is "pressed"
//          
//          Note: None of these are used in this game.
//          
//          bit0 = Unused?
//          bit1 = Unused?
//          bit2 = Unused?
//          bit3 = L button
//          bit4 = Z button
//          bit5 = Y Button
//          bit6 = X Button
//          bit7 = R button
function bitfield_additional_first_player_controller_input() => byte(0x1C9A08)

// $1C9A09: (bitfield) First Player controller input.
//          
//          As always set is "Off"  Not set is "pressed"
//          
//          bit0 = B Button (Right button)
//          bit1 = C Button (Right Bumper)
//          bit2 = A Button (Low button)
//          bit3 = Start button
//          bit4 = Up
//          bit5 = Down
//          bit6 = Left
//          bit7 = Right
function bitfield_first_player_controller_input() => byte(0x1C9A09)

// $1C9A0E: (8-bit) Second player joined game
//          
//          (Basically treated as two player mode started, however players can use only the second controller.
//          
//          Appears to be set the minute player hit start, and remain set.  May need more investigation.
function bit_second_player_joined_game() => byte(0x1C9A0E)

// $1C9A0F: (8-bit) First player joined game
//          
//          (Basically treated as not demo mode started, but need to check second player as well at 0x01c9a0e
//          
//          Appears to be set the minute player hit start, and remain set.  May need more investigation.
function bit_first_player_joined_game() => byte(0x1C9A0F)

// $1C9A1A: (bitfield) Duplicate first player button inputs.
//          
//          See 0x1c9a08
function bitfield_duplicate_first_player_button_inputs() => byte(0x1C9A1A)

// $1C9A1B: (bitfield) Duplicate first player button inputs.
//          
//          See 0x1c9a09
function bitfield_duplicate_first_player_button_inputs() => byte(0x1C9A1B)

// $1CB570: (16-bit) Initial Enemy's X position on the screen.
//          
//          Character will fall if this isn't on the ground.
function bit_initial_enemy_s_x_position_on_the_screen() => word(0x1CB570)
function offset_initial_enemy_s_x_position_on_the_screen(offset) => word(0x1CB570 + offsetMath(offset))

// $1CB574: (16-bit) Initial Enemy's Y position on the screen.
//          
//          Character will fall if this isn't on the ground.
function bit_initial_enemy_s_y_position_on_the_screen() => word(0x1CB574)
function offset_initial_enemy_s_y_position_on_the_screen(offset) => word(0x1CB574 + offsetMath(offset))

// $1CB57C: (16-bit) Initial Enemy's update delay.
//          
//          Decrements per frame and then goes back to 3 when walking.
//          
//          Other actions may have more delay, but appears to be animation delay as well.
function bit_initial_enemy_s_update_delay() => word(0x1CB57C)

// $1CB580: (8-bit) Initial Enemy's height offset
//          
//          Likely just to place the character's feet on the ground.
//          (Likely 16-bit)
function bit_initial_enemy_s_height_offset() => word(0x1CB580)

// $1CB582: (8-bit) Initial Enemy's hp on the first level of the game.
//          
//          Likely reused, but an example of a NPC
function bit_initial_enemy_s_hp_on_the_first_level_of_the_game() => byte(0x1CB582)
function offset_initial_enemy_s_hp_on_the_first_level_of_the_game(offset) => byte(0x1CB582 + offsetMath(offset))

// $1CB582: (8-bit) Initial Enemy's hp on the first level of the game.
//          
//          Likely reused, but an example of a NPC
function bit_initial_enemy_s_animation_index() => word(0x1cb537)
function offset_initial_enemy_s_animation_index(offset) => word(0x1cb537 + offsetMath(offset))

function lessabs(a, b, c) => c + a - b <= 2 * c


function offsetMath(index)
{
    if (index < 16)
    {
        return index * 0x100
    }
    else
    {
        return 0x1ae4a2-0x1CB582 + ((index-16) * 0x100)
    }
}
achievement("Jump Kick Palooza",
             "Jump kick that mo fo right off the building!", 
             2,
             trigger = measured(tally_of(range(0,32), 100, index => offset_initial_enemy_s_hp_on_the_first_level_of_the_game(index) == 0xff &&
                                                          prev(offset_initial_enemy_s_hp_on_the_first_level_of_the_game(index)) != 0xff &&
                                                          lessabs(offset_initial_enemy_s_x_position_on_the_screen(index), bit_first_player_alternate_x_location(), 0x30) &&
                                                          lessabs(offset_initial_enemy_s_y_position_on_the_screen(index), bit_first_player_alternate_y_location(), 0x30) &&
                                                          bit_jumping_indicator() == 0xff))
)

achievement("That's gotta hurt",
             "Squish an enemy!", 
             2,
             trigger = any_of(range(0,32), index => offset_initial_enemy_s_hp_on_the_first_level_of_the_game(index) != 0xff &&
                                                   offset_initial_enemy_s_animation_index(index) == 0x0317)

)