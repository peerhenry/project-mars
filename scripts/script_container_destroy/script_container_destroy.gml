/// @arg container
function script_container_destroy(argument0) {
	var container = argument0;
	ds_list_destroy(container[0]);
	ds_map_destroy(container[1]);
	container = 0;


}
