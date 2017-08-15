// hardcoded constructable logic, because its not inherited
if(under_construction)
{
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, c_aqua, 0.4);
	draw_set_alpha(1);
	exit;
}

draw_self();

// Draw zzz
if(occupant != noone)
{
	show_debug_message("occupant != noone");//DEBUG
	draw_sprite(spr_zzz, zzz_index, x, y);
	zzz_counter++;
	if(zzz_counter > 15){
		zzz_counter = 0;
		zzz_index++;
		if(zzz_index > 3){
			zzz_index = 0;
		}
	}
}

event_inherited(); // May draw the assigned icon