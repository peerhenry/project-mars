var wall_id = argument0;

with(wall_id)
{
var wall_north_id = instance_position(x, y-32, obj_wall);
var wall_east_id = instance_position(x+32, y, obj_wall);
var wall_south_id = instance_position(x, y+32, obj_wall);
var wall_west_id = instance_position(x-32, y, obj_wall);

// 1. calculate adjacency number

if(wall_west_id != noone){
	scr_wall_update_state(wall_west_id);
}

if(wall_north_id != noone){
	scr_wall_update_state(wall_north_id);
}

if(wall_east_id != noone){
	scr_wall_update_state(wall_east_id);
}

if(wall_south_id != noone){
	scr_wall_update_state(wall_south_id);
}


}