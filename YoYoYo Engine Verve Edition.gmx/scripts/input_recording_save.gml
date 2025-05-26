/// input_recording_save(saved_states, filename)

// Exports a recorded series of inputs.

var saved_states = argument0, filename = argument1;
var to_encode = json_encode(saved_states);
var file;
file = file_text_open_write(filename);
file_text_write_string(file, to_encode);
file_text_close(file);
