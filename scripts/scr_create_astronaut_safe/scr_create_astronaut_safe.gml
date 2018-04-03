/// @arg x
/// @arg y
/// @arg owner
var arg_x = argument0;
var arg_y = argument1;
var arg_owner = argument2;

// do not create if outside room.
if(arg_x < 0 || arg_y < 0 || arg_x > room_width || arg_y > room_height) return noone;

// if not a valid spot, try one cell to the right.
var valid = scr_navgrid_cell_is_free_at_rc(arg_x, arg_y);
if(!valid)
{
	return scr_create_astronaut_safe(arg_x + 32, arg_y, arg_owner);
}

var container = global.script_container;
var get_layer_for = script_container_resolve(container, "get_layer_for");
var astro_layer = script_execute(get_layer_for, obj_astronaut);

var temp = global.default_owner;
global.default_owner = arg_owner;
var astro = instance_create_layer(arg_x, arg_y, astro_layer, obj_astronaut);
global.default_owner = temp;

return astro;