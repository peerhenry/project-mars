var arg_x = argument0;
var arg_y = argument1;
var object_type = argument2;

var has_basetile = instance_position(arg_x, arg_y, obj_base_tile) != noone;

switch(object_type)
{
	case global.basetile:	// no basetile && no outside obstructions
		if(has_basetile) return false;
		return scr_validate_basetile(arg_x, arg_y);
	case global.outer_wall:	// no basetile && no obstructions
		// assuming outside nav grid is the same as construction freedom
		return !has_basetile && scr_grid_cell_at_rc(arg_x, arg_y) == 0;
	case global.wall:	// basetile && no obstructions
		return has_basetile && scr_validate_wall(arg_x, arg_y);
	case global.door:	// basetile && straight wall
		var w_type = scr_get_wall_type(arg_x, arg_y);
		var wall_is_straight = w_type == wall_type.horizontal || w_type == wall_type.vertical; // or vertical
		return (has_basetile && wall_is_straight);
	case global.hatch:	// no basetile && one side outside && straight wall
		if(has_basetile) return false;
		return scr_validate_hatch(arg_x, arg_y);
	case global.suit_closet:
		return has_basetile && scr_can_attach_to_wall(arg_x, arg_y);
}

return false;