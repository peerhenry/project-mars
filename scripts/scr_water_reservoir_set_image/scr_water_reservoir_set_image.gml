/// @param water_reservoir_instance
function scr_water_reservoir_set_image(argument0) {
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
			water_rectangle_left = x - 16;
			left_water.water_rectangle_right = left_water.x+15;
		}
		if(top_water != noone){
			image_index += 2;
			top_water.image_index += 8;
			water_rectangle_top = y - 16;
			top_water.water_rectangle_bottom = top_water.y+15;
		}
		if(right_water != noone){
			image_index += 4;
			right_water.image_index += 1;
			water_rectangle_right = x + 15;
			right_water.water_rectangle_left = right_water.x-16;
		}
		if(bottom_water != noone){
			image_index += 8;
			bottom_water.image_index += 2;
			water_rectangle_bottom = y + 15;
			bottom_water.water_rectangle_top = bottom_water.y-16;
		}
	}


}
