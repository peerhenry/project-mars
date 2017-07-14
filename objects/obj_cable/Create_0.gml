event_inherited();

// electric grid
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_carrier, 0);

// begin === SET ADJACENCY NUMBER AND IMAGE INDEX ===

adjacency_number = 0;

var adjacents = scr_get_adjacent_grid_components(id, macro_grid_electric);

var east_electric = adjacents[0];
var north_electric = adjacents[1];
var west_electric = adjacents[2];
var south_electric = adjacents[3];

if(east_electric != noone)
{
	adjacency_number += east_number;
	if(east_electric.object_index == obj_cable)
	{
		east_electric.adjacency_number += west_number;
		scr_set_cable_image(east_electric);
	}
}

if(north_electric != noone)
{
	adjacency_number += north_number;
	if(north_electric.object_index == obj_cable)
	{
		north_electric.adjacency_number += south_number;
		scr_set_cable_image(north_electric);
	}
}

if(west_electric != noone)
{
	adjacency_number += west_number;
	if(west_electric.object_index == obj_cable)
	{
		west_electric.adjacency_number += east_number;
		scr_set_cable_image(west_electric);
	}
}

if(south_electric != noone)
{
	adjacency_number += south_number;
	if(south_electric.object_index == obj_cable)
	{
		south_electric.adjacency_number += north_number;
		scr_set_cable_image(south_electric);
	}
}

scr_set_cable_image(id);
// end === SET ADJACENCY NUMBER AND IMAGE INDEX ===