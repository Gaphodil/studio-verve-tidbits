/// player_resolve_screen_border

if ((bbox_right < 0
        || bbox_left > room_width
        || bbox_bottom < 0
        || bbox_top > room_height)
    && global.edgeDeath)
{
    player_kill();
}
