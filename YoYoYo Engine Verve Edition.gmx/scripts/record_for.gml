/// record_for(frames, [handler], [only_rebinds])
var frames = argument[0];
var handler; if (argument_count > 1) handler = argument[1]; else handler = objWorld.manualInput;
var only_rebinds; if (argument_count > 2) only_rebinds = argument[2]; else only_rebinds = false;

var r = instance_create(0,0,objInputRecorder);
r.only_rebinds = only_rebinds;
r.handler = handler;
r.active = true;

var j = instance_create(0,0,objInputRecorderJob);
j.recorder = r;
j.len = frames;

return r;
