scr_trace("wall create event");
event_inherited();

// Occupy navgrid and map buffer
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.wall);

depth = -occ_j;	// set depth for tall structures
image_speed = 0;
if(!global.draw_tall_walls) sprite_index = spr_wall;
else sprite_index = spr_wall_tall;

// carrier of all grids
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_carrier, 0);
scr_set_new_grid_props(id, macro_grid_water, macro_grid_role_carrier, 0);
scr_set_new_grid_props(id, macro_grid_oxygen, macro_grid_role_carrier, 0);
scr_set_new_grid_props(id, macro_grid_hydrogen, macro_grid_role_carrier, 0);

if(!global.init_stage)
{
	scr_connect_to_cables(id);
	scr_connect_to_pipes(id);
	
	scr_set_basetile_lights(id);
	scr_connect_wall(id);
}