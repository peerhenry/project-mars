/// @description Finalize construction
event_inherited();
if(position_meeting(x, y, obj_base_tile))
{
	scr_room_remove_tile_and_part(x, y);
}

var free = scr_navgrid_cell_is_free(occ_i, occ_j);
show_debug_message("i,j : " + string(occ_i) + ", " + string(occ_j));
show_debug_message("at wall finalization cell is free: " + string(free));