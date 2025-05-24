///input_check(button, [handler])

// Checks whether a button is currently being pressed.

var button = argument[0];
var handler; if (argument_count > 1) handler = argument[1]; else handler = objWorld.manualInput;

return handler.state[button, 0];
