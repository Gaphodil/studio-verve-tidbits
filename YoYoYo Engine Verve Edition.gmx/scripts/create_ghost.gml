/// create_ghost(x, y, recording, [persist])
var xpos = argument[0], ypos = argument[1], recording = argument[2];
var persist; if (argument_count > 3) persist = argument[3]; else persist = false;

global._ghost_temp = recording;
var gp = instance_create(xpos, ypos, objGhostPlayer);
with (gp) with (inputHandler) {
    saved_states = global._ghost_temp;
    active = true;
}
gp.persistent = persist;
return gp;
