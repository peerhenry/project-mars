event_inherited();

scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.cable);

// electric grid
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_carrier, 0);

// begin === SET ADJACENCY NUMBER AND IMAGE INDEX ===

var adjacents = scr_get_adjacent_grid_components(id, macro_grid_electric);

var east_electric = adjacents[0];
var north_electric = adjacents[1];
var west_electric = adjacents[2];
var south_electric = adjacents[3];

if(east_electric != noone)
{
	adjacency_number += east_number;
}
if(north_electric != noone)
{
	adjacency_number += north_number;
}
if(west_electric != noone)
{
	adjacency_number += west_number;
}
if(south_electric != noone)
{
	adjacency_number += south_number;
}

scr_set_cable_image(id);
scr_connect_to_cables(id);