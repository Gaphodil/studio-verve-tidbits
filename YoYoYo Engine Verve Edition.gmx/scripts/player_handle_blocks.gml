/// player_handle_blocks

// handle this last

vspeed += gravity;

if (!place_free(x + hspeed, y + vspeed))
{
    if (!place_free(x + hspeed, y) && hspeed != 0)
    {
        var maxDist = abs(hspeed);
        var dir = 180 * (hspeed < 0);
        move_contact_solid(dir, maxDist);
        
        hspeed = 0;
    }
     
    if (!place_free(x, y + vspeed) && vspeed != 0)
    {
        var maxDist = abs(vspeed);
        var dir = 270 - 180 * (vspeed < 0);
        move_contact_solid(dir, maxDist);
        
        if (dir == 180 + global.grav * 90) {
            airJumps = maxAirJumps;
        }
        vspeed = 0;
    }
    
    if (!place_free(x + hspeed, y + vspeed))
    {
        //hspeed = 0;
        //Traditional behavior when resolving corner collision is to stop hspeed. When on a platform, this can cause horizontal stutter, so we stop vspeed instead.
        var p = instance_place(x, y+vspeed, objPlatform);
        if (!p || place_meeting(x, y, p))
        {
            hspeed = 0;
        }
        else
        {
            vspeed = 0;
        }
    }
}

xsafe = x + hspeed;
ysafe = y + vspeed;

vspeed -= gravity;
