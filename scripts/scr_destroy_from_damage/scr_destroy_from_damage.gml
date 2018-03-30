/// @param constructable
var arg_constructable = argument0;

var c_x = arg_constructable.x;
var c_y = arg_constructable.y;

var create_explosion_and_rubble = resolve(arg_constructable.script_container, "create_explosion_and_rubble");
script_execute(create_explosion_and_rubble, c_x, c_y);
arg_constructable.destroyed = true;

var get_layer_for = resolve(arg_constructable.script_container, "get_layer_for");
var leak_layer = script_execute(get_layer_for, obj_leak);

if(arg_constructable.object_index == obj_hatch)
{
	// add a leak room
	var new_leak = instance_create_layer(0,0,leak_layer, obj_leak);
	ds_list_add(arg_constructable.base_room.leaks, new_leak);
}
else if(arg_constructable.object_index == obj_wall && !position_meeting(c_x, c_y, obj_base_tile)) // outside wall is destroyed
{
	var adjacent_doors = scr_get_adjacent_instances(arg_constructable, obj_door);
	var adjacents = scr_get_adjacent_instances(arg_constructable, obj_base_tile);
	for(var n = 0; n < 4; n ++)
	{
		var next_door = adjacent_doors[n];
		var next = adjacents[n];
		if(next_door != noone)
		{
			var new_leak = instance_create_layer(c_x, c_y, leak_layer, obj_leak);
			ds_list_add(next_door.room1.leaks, new_leak);
			ds_list_add(next_door.room2.leaks, new_leak);
		}
		else if(next != noone)
		{
			var base_room = scr_room_at(next.x, next.y);
			var new_leak = instance_create_layer(c_x, c_y, leak_layer, obj_leak);
			ds_list_add(base_room.leaks, new_leak);
		}
	}
}

instance_destroy(arg_constructable);