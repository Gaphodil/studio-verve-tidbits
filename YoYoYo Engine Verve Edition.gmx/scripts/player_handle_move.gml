/// player_handle_move

//Left-right input
var L = (input_check(KEY.LEFT, inputHandler) || (global.directionalTapFix && input_check_pressed(KEY.LEFT, inputHandler)));
var R = (input_check(KEY.RIGHT, inputHandler) || (global.directionalTapFix && input_check_pressed(KEY.RIGHT, inputHandler)));
var h = 0;
if (!frozen)
    { h = -(L || R) + (2 * R); }

var ice = instance_place(x, y + global.grav, objIceBlock);
notOnBlock = place_free(x, y + global.grav);
onVineL = (place_meeting(x - 1, y, objVineL) && notOnBlock);
onVineR = (place_meeting(x + 1, y, objVineR) && notOnBlock);

//Horizontal movement
if (h != 0)    //Moving
{
    xScale = h;
    if ((h == -1 && !onVineR) || (h == 1 && !onVineL))
    {
        if (ice == noone)    //Normal movement
            { hspeed = runSpeed * h; }
        else    //Ice movement
        {
            hspeed += (ice.slip) * h;
            
            if (abs(hspeed) > runSpeed)
                hspeed = runSpeed * h;
        }
    }
}
else    //Not moving
{
    if (ice == noone)    //Normal movement
        hspeed = 0;
    else    //Ice movement
    {
        if (hspeed > 0)
            { hspeed -= min(ice.slip, abs(hspeed)); }
        else if (hspeed < 0)
            { hspeed += min(ice.slip, abs(hspeed)); }
    }
}

onPlatform = false;
with(objPlatform)
{
    if (place_meeting(x, y-global.grav, other))
    {
        if ((global.grav == 1 && other.bbox_bottom <= bbox_top && other.vspeed >= vspeed) || (global.grav == -1 && other.bbox_top >= bbox_bottom && other.vspeed <= vspeed))
        {
            other.onPlatform = true;
        }
    }
}

var conveyor = instance_place(x,y + (global.grav), objConveyor);
if (conveyor != noone)
{
    hspeed += conveyor.h;
}

if (global.grav * vspeed > maxVspeed)
{
    vspeed = global.grav * maxVspeed;
}
