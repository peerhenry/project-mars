/// @description Finalize construction
event_inherited();
if(position_meeting(x, y, obj_base_tile))
{
	scr_room_remove_tile_and_part(x, y);
}