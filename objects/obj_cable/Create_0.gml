event_inherited();
occ_i = scr_rc_to_gi(x);
occ_j = scr_rc_to_gi(y);

electric_type = electric.carrier;

// begin === SET ADJACENCY NUMBER AND IMAGE INDEX ===
#macro east_number 1
#macro north_number 2
#macro west_number 4
#macro south_number 8

adjacency_number = 0;

var east_electric = instance_position(x+32, y, obj_electric_component);
var north_electric = instance_position(x, y-32, obj_electric_component);
var west_electric = instance_position(x-32, y, obj_electric_component);
var south_electric = instance_position(x, y+32, obj_electric_component);

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