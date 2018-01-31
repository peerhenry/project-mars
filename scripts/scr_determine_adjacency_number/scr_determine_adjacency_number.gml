/// @arg cable
var arg_cable = argument0;

with(arg_cable)
{
	var adjacents = scr_get_adjacent_grid_components(id, macro_grid_electric);

	var east_electric = adjacents[0];
	var north_electric = adjacents[1];
	var west_electric = adjacents[2];
	var south_electric = adjacents[3];

	if(east_electric != noone && adjacency_number & east_number == 0)
	{
		adjacency_number += east_number;
	}
	if(north_electric != noone && adjacency_number & north_number == 0)
	{
		adjacency_number += north_number;
	}
	if(west_electric != noone && adjacency_number & west_number == 0)
	{
		adjacency_number += west_number;
	}
	if(south_electric != noone && adjacency_number & south_number == 0)
	{
		adjacency_number += south_number;
	}
}