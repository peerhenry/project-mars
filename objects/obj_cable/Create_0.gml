event_inherited();
occ_i = scr_rc_to_gi(x);
occ_j = scr_rc_to_gi(y);

#macro east_number 1
#macro north_number 2
#macro west_number 4
#macro south_number 8

adjacency_number = 0;

var east_cable = instance_position(x+32, y, obj_cable);
var north_cable = instance_position(x, y-32, obj_cable);
var west_cable = instance_position(x-32, y, obj_cable);
var south_cable = instance_position(x, y+32, obj_cable);

if(east_cable != noone)
{
	adjacency_number += east_number;
	east_cable.adjacency_number += west_number;
	scr_set_cable_image(east_cable);
}

if(north_cable != noone)
{
	adjacency_number += north_number;
	north_cable.adjacency_number += south_number;
	scr_set_cable_image(north_cable);
}

if(west_cable != noone)
{
	adjacency_number += west_number;
	west_cable.adjacency_number += east_number;
	scr_set_cable_image(west_cable);
}

if(south_cable != noone)
{
	adjacency_number += south_number;
	south_cable.adjacency_number += north_number
	scr_set_cable_image(south_cable);
}

scr_set_cable_image(id);