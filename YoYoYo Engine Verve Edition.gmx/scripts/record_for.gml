/// record_for(frames, [handler])
var frames = argument[0];
var handler; if (argument_count > 1) handler = argument[1]; else handler = objWorld.manualInput;

var r = instance_create(0,0,objInputRecorder);
r.handler = handler;
r.active = true;

var j = instance_create(0,0,objInputRecorderJob);
j.recorder = r;
j.len = frames;

return r;
