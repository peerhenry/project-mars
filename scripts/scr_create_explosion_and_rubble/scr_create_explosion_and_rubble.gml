/// @arg x
/// @arg y
function scr_create_explosion_and_rubble(argument0, argument1) {
	// todo: rename this script
	var c_x = argument0;
	var c_y = argument1;
	instance_create_layer(c_x, c_y, macro_logic_layer, obj_destroy);
	instance_create_layer(c_x, c_y, macro_base_layer, obj_rubble);


}
