/// @param water_reservoir_instance
var arg_water = argument0;

with(arg_water)
{
	left_x = scr_gi_to_rc(occ_i - 1);
	right_x = scr_gi_to_rc(occ_i + 1);
	top_y  = scr_gi_to_rc(occ_j - 1);
	bottom_y  = scr_gi_to_rc(occ_j + 1);

	var left_water = instance_position(left_x, y, obj_water_reservoir);
	var right_water = instance_position(right_x, y, obj_water_reservoir);
	var top_water = instance_position(x, top_y, obj_water_reservoir);
	var bottom_water = instance_position(x, bottom_y, obj_water_reservoir);

	var adjacency_number = 0;
	image_speed = 0;

	if(left_water != noone){
		image_index += 1;
		left_water.image_index += 4;
	}
	if(top_water != noone){
		image_index += 2;
		top_water.image_index += 8;
	}
	if(right_water != noone){
		image_index += 4;
		right_water.image_index += 1;
	}
	if(bottom_water != noone){
		image_index += 8;
		bottom_water.image_index += 2;
	}
}