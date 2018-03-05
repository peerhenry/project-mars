/// @description Finalize construction
event_inherited();
if(!global.draw_tall_walls) sprite_index = spr_wall;
if(position_meeting(x, y, obj_base_tile))
{
	var room_remove_tile_and_part = resolve(script_container, "room_remove_tile_and_part");
	script_execute(room_remove_tile_and_part, x, y);
}
solid = true;