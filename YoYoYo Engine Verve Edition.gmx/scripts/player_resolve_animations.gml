/// player_resolve_animations

notOnBlock = (place_free(x, y + global.grav));
onVineR = (place_meeting(x + 1, y, objVineR) && notOnBlock);
onVineL = (place_meeting(x - 1, y, objVineL) && notOnBlock);

if (!onVineR && !onVineL)   //Not touching any vines
{
    if (onPlatform || !notOnBlock)  //Standing on something
    {
        //Check if moving left/right
        var L = (input_check(KEY.LEFT, inputHandler) || (global.directionalTapFix && input_check_pressed(KEY.LEFT, inputHandler)));
        var R = (input_check(KEY.RIGHT, inputHandler) || (global.directionalTapFix && input_check_pressed(KEY.RIGHT, inputHandler)));
        
        if ((L || R) && !frozen)
        {
            sprite_index = sprPlayerRun;
            image_speed = 1/2;
        }
        else
        {
            sprite_index = sprPlayerIdle;
            image_speed = 1/5;
        }
    }
    else    //In the air
    { 
        if ((vspeed * global.grav) < 0)
        {
            sprite_index = sprPlayerJump;
            image_speed = 1/2;
        }
        else
        {
            sprite_index = sprPlayerFall;
            image_speed = 1/2;
        }
    }
}
else    //Touching a vine
{
    sprite_index = sprPlayerSlide;
    image_speed = 1/2;
}
