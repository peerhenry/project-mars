event_inherited();

// Draw zzz
if(occupant != noone)
{
	//show_debug_message("occupant != noone");//DEBUG
	draw_sprite(spr_zzz, zzz_index, x, y);
	zzz_counter++;
	if(zzz_counter > 15){
		zzz_counter = 0;
		zzz_index++;
		if(zzz_index > 3){
			zzz_index = 0;
		}
	}
	draw_healthbar(x-16, y-24, x+16, y-20, occupant.sleep_level, c_black, c_yellow, c_yellow, 0, true, true);
}