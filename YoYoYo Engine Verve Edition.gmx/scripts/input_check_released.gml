///input_check_released(button, [handler])

// Checks whether a button is being released this frame.

var button = argument[0];
var handler; if (argument_count > 1) handler = argument[1]; else handler = objWorld.manualInput;

return input_check_base(handler.state, button * 10000);
