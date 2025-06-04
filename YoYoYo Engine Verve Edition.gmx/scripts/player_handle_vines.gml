/// player_handle_vines

if (onVineL || onVineR)
{
    if (onVineR)
        { xScale = -1; }
    else
        { xScale = 1; }
    
    vspeed = 2 * global.grav;
    
    //Try to leave vine
    if (onVineL && input_check_pressed(KEY.RIGHT, inputHandler)) || (onVineR && input_check_pressed(KEY.LEFT, inputHandler))
    {
        if (input_check(KEY.JUMP, inputHandler))    //Jumping off
        {
            if (onVineR)
                { hspeed = -15; }
            else
                { hspeed = 15; }
            vspeed = -9 * global.grav;
            audio_play_sound(sndWallJump, 0, false);
        }
        else    //Falling off
        {
            if (onVineR)
                { hspeed = -3; }
            else
                { hspeed = 3; }
        }
    }
}
