/// @Description Clears the script container
/// @arg container
function script_container_reset(argument0) {
	var keys = script_container_get_keys(argument0);
	var script_map = script_container_get_map(argument0);

	for(var n = 0; n < ds_list_size(keys); n++)
	{
		var next_key = keys[| n];
		ds_map_delete(script_map, next_key);
	}
	ds_list_clear(keys);


}
