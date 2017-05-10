var arg_x = argument0;
var arg_y = argument1;

var target_i = scr_rc_to_gi(arg_x);
var target_j = scr_rc_to_gi(arg_y);
var clamped_x = scr_gi_to_rc(target_i);
var clamped_y = scr_gi_to_rc(target_j);

var can_build = scr_validate(clamped_x, clamped_y, global.suit_closet);
if(!can_build) return noone;

var blid = layer_get_id("base");
var new_closet = instance_create_layer(clamped_x, clamped_y, blid, obj_suit_closet);

// set closet orientation
with(new_closet)
{
	if(instance_position(arg_x - 32, arg_y, obj_wall) != noone)
	{
		image_index = 0;
	}
	else if(instance_position(arg_x, arg_y - 32, obj_wall) != noone)
	{
		image_index = 1;
	}
	else if(instance_position(arg_x + 32, arg_y, obj_wall) != noone)
	{
		image_index = 2;
	}
	else if(instance_position(arg_x, arg_y + 32, obj_wall) != noone)
	{
		image_index = 3;
	}
}