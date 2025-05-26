/// input_recording_load(filename)

// Imports a recorded series of inputs.
// Note that json_decode changes all keys to strings.

var filename = argument0;

var str, file;
file = file_text_open_read(filename);
str = file_text_read_string(file)
file_text_close(file);

// keys are changed from real to string
// handled elsewhere
return json_decode(str);
