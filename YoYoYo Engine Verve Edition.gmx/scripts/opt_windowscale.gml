///opt_windowscale(type)

switch(argument0)
{
    case "include":
        return true;
    
    case "inPause":
        //Whether or not to include this option on the pause screen
        return true;

    case "init":
        //Called when the menu gets created
        break;
        
    case "step":
        //Called every frame the option is selected
        var hPress = input_check_pressed(KEY.MENU_RIGHT) - input_check_pressed(KEY.MENU_LEFT);
        if (hPress != 0)
        {
            //Adjust option
            global.windowScale += hPress / 2;
            global.windowScale = clamp(global.windowScale, 0.5, 4.0);
            global.windowWidth  = global.defaultWindowWidth * global.windowScale;
            global.windowHeight = global.defaultWindowHeight * global.windowScale;
            update_window_size();
        }
        break;
        
    case "name":
        return "Window scale";
        
    case "value":
        return string_format(global.windowScale, 1, 1) + "x";
    
    case "end":
        //Called when the option is deselected
        break;
}
