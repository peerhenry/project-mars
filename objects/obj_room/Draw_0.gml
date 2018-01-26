/// @description Insert description here
// You can write your code in this editor

if(global.draw_room_bb)
{
	draw_set_alpha(0.5);
	draw_set_color(c_purple);
	draw_rectangle(bb_left, bb_top, bb_right, bb_bottom, false);
	draw_set_alpha(1);
	draw_set_color(c_red);
	draw_rectangle(bb_left, bb_top, bb_right, bb_bottom, true);
	
	var tile_count = ds_list_size(tiles);
	for(n=0; n<tile_count; n++){
		//var xx = (ds_list_find_value(tiles, n*2)+1)*32;
		//var yy = (ds_list_find_value(tiles, n*2+1)+1)*32;
		var xx = (scr_room_get_i_at(n) + 1)*32;
		var yy = (scr_room_get_j_at(n) + 1)*32;
		draw_sprite(spr_test, false, xx, yy);
	}
	
	var hatch_count = ds_list_size(hatches);
	var next_hatch = noone;
	for(n=0; n<hatch_count; n++){
		next_hatch = ds_list_find_value(hatches, n);
		var xx = next_hatch.x;
		var yy = next_hatch.y;
		draw_sprite(spr_test, false, xx, yy);
	}
	
}

if(oxygen_level < 100){

	var o2_alpha = ((100-oxygen_level)/100)*global.oxygen_max_alpha;
	var tile_count = ds_list_size(tiles);
	for(n=0; n<tile_count; n++){
		//var xx = (ds_list_find_value(tiles, n*2)+1)*32;
		//var yy = (ds_list_find_value(tiles, n*2+1)+1)*32;
		var xx = (scr_room_get_i_at(n)+1)*32;
		var yy = (scr_room_get_j_at(n)+1)*32;
		draw_set_alpha(o2_alpha);
		draw_set_color(c_red);
		draw_rectangle(xx-16, yy-16, xx+15, yy+15, false);
		if(oxygen_level < global.oxygen_empty_level)
		{
			draw_sprite(spr_oxygen_depleted, -1, xx, yy);
		}
	}
	
}
//if(temperature < 20){}

// reset drawing parameters
draw_set_alpha(1);