var arg_gate = argument0;

with(arg_gate)
{
	locked = !locked;
	if(locked)
	{
		mp_grid_add_cell(global.nav_grid, occ_i, occ_j);
	} 
	else
	{
		mp_grid_clear_cell(global.nav_grid, occ_i, occ_j);
	}
}

// play lock sound
scr_play_sound(sound_fx_lock);
scr_recalculate_paths();