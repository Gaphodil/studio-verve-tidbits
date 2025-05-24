This repository is for features that I personally enjoy having, as well as experimentation.

### Window Scale

This provides an in-game option for adjusting the scale of the window, by increments of 0.5x.

<details>
<summary>Changes</summary>

- Scripts:
    - New:
        - World - `update_window_size`
        - Options - `opt_windowscale`
    - Edited:
        - World - `initialize_globals`
        - World - `reset_window_size`
        - Save/Load - `config_save`
        - Save/Load - `config_load`
        - Options - `options_list`
- Objects:
    - Edited:
        - World - `objWorld`
</details>

### Music Volume

This adds an option for adjusting music volume separately from overall volume. This also adjusts the default volume on both settings to 50%. This does not allow for adjusting only the volume of sounds as a whole.

<details>
<summary>Changes</summary>

- Scripts:
    - New:
        - Options - `opt_musicvolume`
        - Music - `music_gain`
    - Edited:
        - Save/Load - `config_save`
        - Save/Load - `config_load`
        - Options - `options_list`
        - Music - `music_play`
- Objects:
    - Edited:
        - World - `objWorld`
</details>

### Debug: Shift `room_speed`

This adds the debug keys of F7/F8 as a means of incrementing or decrementing the target speed of the game, clamped between 1 and the default (moved to a `gameSpeed` attribute). The value is adjusted by 5, or 1 if Alt is held.

Changes:

- Objects - World - `objWorld`

### Experiment: Input Handling Module

This seperates out all input handling into a single persistent object, which checks all keys exactly once at Begin Step and caches the result.

<details>
<summary>Changes</summary>

- Scripts:
    - New:
        - Input - `input_check`
        - Input - `input_check_pressed`
        - Input - `input_check_released`
    - Renamed:
        - Controls - `input_check` -> `raw_input_check`
        - Controls - `input_check_pressed` -> `raw_input_check_pressed`
        - Controls - `input_check_released` -> `raw_input_check_released`
    - Edited:
        - World - `check_and_pause`
- Objects:
    - New:
        - Input - `objInputHandlerTemplate`
        - Input - `objManualInputHandler`
        - Player - `objRawPlayer`
    - Edited:
        - World - `objWorld`
        - Player - `objPlayerStart`
- For testing purposes:
    - Objects:
        - New:
            - Player - `objRawPlayer`
        - Edited:
            - Player - `objPlayerStart`
    - Rooms:
        - New:
            - Sample - `rInputTest`
</details>

### Other small changes

- Add `instance_count` to debug overlay
    - Objects - World - `objWorld`
- Add `print_list` for debug output
    - Scripts - Utility - `print_list`
- Remove some memory leaks on F2
    - Scripts - World - `initialize_globals`
    - Scripts - World - `restart_game`
