/// @description Finalize construction
event_inherited();

// Set sprite
if(connects_horizontally)
{
	if(!global.draw_tall_walls) sprite_index = spr_door_vertical;
}
else
{
	if(!global.draw_tall_walls) sprite_index = spr_door;
}

scr_room_remove_tile_and_part(x, y);	// Part room
scr_door_connect(id); // Connects door to rooms