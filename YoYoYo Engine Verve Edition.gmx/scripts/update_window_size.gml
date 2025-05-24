/// update_window_size()

// Updates the size of the window to the globals,
// then centers it in the main display.

if (global.fullscreenMode) exit;
window_set_size(global.windowWidth, global.windowHeight);
var disp_w = display_get_width();
var disp_h = display_get_height();
var xpos = (disp_w div 2) - (global.windowWidth div 2);
var ypos = (disp_h div 2) - (global.windowHeight div 2);
window_set_position(xpos, ypos);
