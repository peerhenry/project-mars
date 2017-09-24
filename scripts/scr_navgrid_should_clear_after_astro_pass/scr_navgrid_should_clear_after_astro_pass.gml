/// @arg arg_i
/// @arg arg_j

var result = true;

var xx = scr_gi_to_rc(argument0);
var yy = scr_gi_to_rc(argument1);

if(instance_position(xx, yy, obj_astronaut)) result = false;

return result;