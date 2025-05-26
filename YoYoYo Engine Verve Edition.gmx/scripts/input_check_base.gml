/// input_check_base(map, key)
var map = argument0, key = argument1;

return (ds_map_exists(map, key)
    or ds_map_exists(map, string(key)));
