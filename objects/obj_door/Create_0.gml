scr_trace("door create event");
event_inherited();

scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.wall_like);
scr_navgrid_clear_cell(occ_i, occ_j);

depth = -occ_j;	// set depth for tall structures
room1 = noone; // Either north or west
room2 = noone; // Either south or east

if(connects_horizontally)
{
	if(!global.draw_tall_walls) sprite_index = spr_door_vertical;
	else sprite_index = spr_door_tall_vertical;
}
else
{
	if(!global.draw_tall_walls) sprite_index = spr_door;
	else sprite_index = spr_door_tall;
}