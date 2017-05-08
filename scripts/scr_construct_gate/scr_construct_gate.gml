/// Either a door or a hatch
var target_x = argument0;
var target_y = argument1;
var gate_type = argument2;

var target_i = scr_rc_to_gi(target_x);
var target_j = scr_rc_to_gi(target_y);
var clamped_x = scr_gi_to_rc(target_i);
var clamped_y = scr_gi_to_rc(target_j);

var can_build = scr_validate(clamped_x, clamped_y, gate_type);
if(!can_build) return noone;

// if there is a wall, remove the wall
wall_id = instance_position(argument0, argument1, obj_wall);
var is_vertical = false;
with(wall_id){
	is_vertical = adjacentcy_numer == 10;
}
with(wall_id) instance_destroy();

var blid = layer_get_id("base");
var gate_object = obj_door;
if(gate_type == global.hatch) gate_object = obj_hatch;
var new_gate = instance_create_layer(clamped_x, clamped_y, blid, gate_object);
with(new_gate){
	if(is_vertical) image_angle = 270;
}
return new_gate;