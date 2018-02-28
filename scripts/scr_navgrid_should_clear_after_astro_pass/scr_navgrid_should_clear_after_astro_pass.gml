/// @arg entity
/// @arg arg_i
/// @arg arg_j
var arg_entity = argument0;
var result = true;
var xx = scr_gi_to_rc(argument1);
var yy = scr_gi_to_rc(argument2);
var entity = instance_position(xx, yy, obj_movable);
if(entity != noone && entity != arg_entity) result = false;

return result;