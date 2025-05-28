/// player_handle_actions

if (!frozen)
{
    if (input_check_pressed(KEY.SHOOT, inputHandler))
        player_shoot();
    if (input_check_pressed(KEY.JUMP, inputHandler))
        player_try_jump();
    if (input_check_released(KEY.JUMP, inputHandler))
        player_release_jump();
    if (input_check_pressed(KEY.SUICIDE, inputHandler))
        player_kill();
}
