///print_list(str, ...)

// Like print, but comma-seperated.

var out = "";

for (var i = 0; i < argument_count-1; i += 1) {
    out += string(argument[i]) + ",";
}
out += string(argument[i]);

show_debug_message(out);
