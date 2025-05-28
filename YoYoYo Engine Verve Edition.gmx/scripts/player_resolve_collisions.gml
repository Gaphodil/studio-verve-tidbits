/// player_resolve_collisions

if (!place_free(x, y))
{
    var dirX = sign(x-xsafe);
    var dirY = sign(y-ysafe);
    var epsilon = 0.001; //Appease the floating point gods
    
    //If something moved the player into a block since Step, move back towards where we were until we're out of a block.
    while(!place_free(x, y))
    {
        if (dirX * (x - xsafe) >= epsilon)
        {
            x -= sign(x-xsafe) * min( abs(x-xsafe), 1 );
        }
        else if (dirY * (y - ysafe) >= epsilon)
        {
            y -= sign(y-ysafe) * min( abs(y-ysafe), 1 );
        }
        else break;
    }
}

if (global.blocksCrush)
{
    do_dynamic_collision(false, player_kill);
}
else
{
    do_dynamic_collision(false);
}
