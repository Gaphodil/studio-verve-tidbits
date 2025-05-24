///opt_musicvolume(type)

switch(argument0)
{
    case "include":
        return true;
    
    case "inPause":
        //Whether or not to include this option on the pause screen
        return false;
        
    case "init":
        musVolumeTimer = 0;
        musVolumeDelay = 10;
        break;
        
    case "step":
        //Called every frame the option is selected
        var hPress = input_check_pressed(KEY.MENU_RIGHT) - input_check_pressed(KEY.MENU_LEFT);
        var h = input_check(KEY.MENU_RIGHT) - input_check(KEY.MENU_LEFT);
        if (hPress != 0)
        {
            global.musVolumeLevel += hPress;
            musVolumeTimer = musVolumeDelay;
        }
        if (h != 0)
        {
            if (musVolumeTimer <= 0)
            {
                global.musVolumeLevel += h;
            }
            musVolumeTimer--;
        }
        global.musVolumeLevel = clamp(global.musVolumeLevel, 0, 100);
        music_gain(global.musVolumeLevel/100);
        break;
        
    case "name":
        return "Music Volume";
        
    case "value":
        return string(global.musVolumeLevel) + "%";
}
