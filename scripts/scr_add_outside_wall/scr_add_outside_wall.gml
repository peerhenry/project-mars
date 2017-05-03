///Adds wall and returns id, or returns id of existing wall.

var i = argument0;
var j = argument1;

var target_x = scr_gi_to_rc(i);
var target_y = scr_gi_to_rc(j);

var base_tile_id = instance_position(target_x, target_y, obj_base_tile);
var wall_id = instance_position(target_x, target_y, obj_wall);

if(wall_id != noone)
{
	return wall_id;
}

if(base_tile_id  == noone){
	var blid = layer_get_id("base");
	return instance_create_layer(target_x, target_y, blid, obj_wall);
}