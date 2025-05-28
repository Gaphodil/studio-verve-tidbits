/// player_handle_slopes

if (instance_exists(objSlope) && hspeed != 0)
{
    var moveLimit = abs(hspeed);    //Sets how high/low the player can go to snap onto a slope, this can be increased to make the player able to run over steeper slopes (ie setting it to abs(hspeed)*2 allows the player to run over slopes twice as steep)
    
    var slopeCheck;
    var hTest;
    
    var ySlope;
    
    //falling onto a slope
    if (place_meeting(x+hspeed, y+vspeed+gravity, objSlope) && (vspeed+gravity)*global.grav > 0 && notOnBlock)
    {
        var xLast = x;
        var yLast = y;
        var hLast = hspeed;
        var vLast = vspeed;
        
        vspeed += gravity;
        
        x += hspeed;
        hspeed = 0;
        
        if(!place_free(x, y+vspeed))
        {
            if (global.grav == 1)    //Normal
                move_contact_solid(270, abs(vspeed));
            else    //Flipped
                move_contact_solid(90, abs(vspeed));
            vspeed = 0;
        }
        
        y += vspeed;            
        
        if (!place_free(x, y + global.grav) && place_free(x, y))  //Snapped onto the slope properly
        {
            airJumps = maxAirJumps;
            notOnBlock = false;
        }
        else    //Did not snap onto the slope, return to previous position
        {
            x = xLast;
            y = yLast;
            hspeed = hLast;
            vspeed = vLast;
        }
    }
    
    //Moving down a slope
    if (!notOnBlock)
    {                                              
        var onSlope = (place_meeting(x, y + global.grav, objSlope));    //Treat normal blocks the same as slopes if we're standing on a slope
        
        slopeCheck = true;
        hTest = hspeed;
        
        while (slopeCheck)
        {
            ySlope = 0;
            //Check how far we should move down
            while ((!place_meeting(x + hTest, y - ySlope + global.grav, objSlope) || (onSlope && place_free(x + hTest, y - ySlope + global.grav))) && (ySlope*global.grav > -floor(moveLimit * (hTest/hspeed))))
            {
                ySlope -= global.grav;
            }
            
            //Check if we actually need to move down
            if (place_meeting(x + hTest, y - ySlope + global.grav, objSlope) || (onSlope && place_free(x + hTest, y - ySlope + global.grav)))
            {
                if (ySlope != 0 && place_free(x + hTest, y - ySlope))
                {
                    y -= ySlope;
                    
                    x += hTest;
                    hspeed = 0;
                    
                    slopeCheck = false;
                }
                else
                {
                    if (hTest > 0)
                    {
                        hTest -= 1;
                        if (hTest <= 0)
                            slopeCheck = false;
                    }
                    else if (hTest < 0)
                    {
                        hTest += 1;
                        if (hTest >= 0)
                            slopeCheck = false;
                    }
                    else
                    {
                        slopeCheck = false;
                    }
                }
            }
            else
            {
                slopeCheck = false;
            }
        }
    }
    
    //Moving up a slope
    if (place_meeting(x + hspeed, y, objSlope))
    {                                           
        slopeCheck = true;
        hTest = hspeed;
        
        while (slopeCheck)
        {
            ySlope = 0;
            
            //Check how far we have to move up
            while ( place_meeting(x + hTest, y - ySlope, objSlope) && (ySlope*global.grav < floor(moveLimit * (hTest/hspeed))) )
            {
                ySlope += global.grav;
            }                                                 
            
            //Check if we actually need to move up
            if (place_free(x + hTest, y - ySlope))
            {            
                y -= ySlope;
                
                x += hTest;
                hspeed = 0;
                
                slopeCheck = false;
            }
            else
            {
                if (hTest > 0)
                {
                    hTest -= 1;
                    if (hTest <= 0)
                        slopeCheck = false;
                }
                else if (hTest < 0)
                {
                    hTest += 1;
                    if (hTest >= 0)
                        slopeCheck = false;
                }
                else
                {
                    slopeCheck = false;
                }
            }
        }
    }
    
    //Set xprevious/yprevious coordinates for future solid collisions
    xprevious = x;
    yprevious = y;
}
