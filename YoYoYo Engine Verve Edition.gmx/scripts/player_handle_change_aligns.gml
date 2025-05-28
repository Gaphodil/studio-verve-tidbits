/// player_handle_change_aligns

if (global.adAlign && !place_free(x, y + (global.grav)) && !frozen)
{
    if (input_check_pressed(KEY.ALIGN_LEFT, inputHandler)) {hspeed -= 1;}
    if (input_check_pressed(KEY.ALIGN_RIGHT, inputHandler)) {hspeed += 1;}
}
