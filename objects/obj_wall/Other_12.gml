/// @description Finalize construction
event_inherited();
if(!global.draw_tall_walls) sprite_index = spr_wall;
if(position_meeting(x, y, obj_base_tile))
{
	scr_room_remove_tile_and_part(x, y);
}