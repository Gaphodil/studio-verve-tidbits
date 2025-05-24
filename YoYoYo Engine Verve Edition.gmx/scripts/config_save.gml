///config_save()
// Saves current config settings

ini_open("config.ini");

//Settings
ini_write_real("Settings", "Mute_music",        global.muteMusic);
ini_write_real("Settings", "Volume_level",      global.volumeLevel);
ini_write_real("Settings", "Music_level",       global.musVolumeLevel);
ini_write_real("Settings", "Fullscreen_mode",   global.fullscreenMode);
ini_write_real("Settings", "Smoothing_mode",    global.smoothingMode);
ini_write_real("Settings", "Vsync_mode",        global.vsyncMode);
ini_write_real("Settings", "Window_scale",      round(global.windowScale * 2));

input_define("saveKeyboardConfig");

if (global.controllerEnabled)
{                        
    input_define("saveControllerConfig");
}

ini_close();
