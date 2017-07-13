event_inherited();

scr_set_new_grid_props(id, macro_grid_water, macro_grid_role_carrier, 0);

// determine adjacency number and set image index

adjacency_number = 0;

var east_pipe = instance_position(x+32, y, obj_pipe);
var east_pump = instance_position(x+32, y, obj_pump);
var north_pipe = instance_position(x, y-32, obj_pipe);
var north_pump = instance_position(x, y-32, obj_pump);
var west_pipe = instance_position(x-32, y, obj_pipe);
var west_pump = instance_position(x-32, y, obj_pump);
var south_pipe = instance_position(x, y+32, obj_pipe);
var south_pump = instance_position(x, y+32, obj_pump);

if(east_pipe != noone || east_pump != noone)
{
	adjacency_number += east_number;
	if(east_pipe != noone && east_pipe.object_index == obj_pipe)
	{
		east_pipe.adjacency_number += west_number;
		scr_set_pipe_image(east_pipe);
	}
}

if(north_pipe != noone || north_pump != noone)
{
	adjacency_number += north_number;
	if(north_pipe != noone && north_pipe.object_index == obj_pipe)
	{
		north_pipe.adjacency_number += south_number;
		scr_set_pipe_image(north_pipe);
	}
}

if(west_pipe != noone || west_pump != noone)
{
	adjacency_number += west_number;
	if(west_pipe != noone && west_pipe.object_index == obj_pipe)
	{
		west_pipe.adjacency_number += east_number;
		scr_set_pipe_image(west_pipe);
	}
}

if(south_pipe != noone || south_pump != noone)
{
	adjacency_number += south_number;
	if(south_pipe != noone && south_pipe.object_index == obj_pipe)
	{
		south_pipe.adjacency_number += north_number;
		scr_set_pipe_image(south_pipe);
	}
}

scr_set_pipe_image(id);