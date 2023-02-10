/// @param x_left
/// @param y_top
/// @param x_right
/// @param y_bottom
/// @param object_index
function scr_create_ltbr_object(argument0, argument1, argument2, argument3, argument4) {

	var inst = instance_create_layer(-500,-500, macro_logic_layer, argument4);
	with(inst){
		left = argument0;
		top = argument1;
		right = argument2;
		bottom = argument3;
	}
	return inst;


}
