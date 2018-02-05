/// @param constructable
var arg_constructable = argument0;

var c_x = arg_constructable.x;
var c_y = arg_constructable.y;
var explosion = instance_create_layer(c_x, c_y, macro_logic_layer, obj_explosion);
var rubble = instance_create_layer(c_x, c_y, macro_base_layer, obj_rubble);
arg_constructable.destroyed = true;

if(arg_constructable.object_index == obj_hatch)
{
	// add a leak to 
	var new_leak = instance_create_layer(0,0,macro_logic_layer, obj_leak);
	ds_list_add(arg_constructable.base_room.leaks, new_leak);
}
else if(arg_constructable.object_index == obj_wall && !position_meeting(c_x, c_y, obj_base_tile)) // outside wall is destroyed
{
	var adjacents = scr_get_adjacent_instances(arg_constructable, obj_base_tile);
	for(var n = 0; n < 4; n ++)
	{
		var next = adjacents[n];
		if(next != noone)
		{
			var base_room = scr_room_at(next.x, next.y);
			var new_leak = instance_create_layer(c_x, c_y, macro_logic_layer, obj_leak);
			ds_list_add(base_room.leaks, new_leak);
		}
	}
}

instance_destroy(arg_constructable);