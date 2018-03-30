if(damage >= 100 && !is_broken)
{
	sprite_index = spr_base_tile_broken;
	is_broken = true;
	damage = 100;
	// scr_destroy_from_damage(id); // this is the standard for constructables
	
	// add leak to room
	var get_layer_for = resolve(script_container, "get_layer_for");
	var leak_layer = script_execute(get_layer_for, obj_leak);
	tile_leak = instance_create_layer(0, 0, leak_layer, obj_leak);
	var base_room = scr_room_at(x,y);
	ds_list_add(base_room.leaks, tile_leak);
}

if(is_broken && damage <= 0)
{
	is_broken = false;
	sprite_index = spr_base_tile;
	damage = 0;
	
	// plug leak
	var base_room = scr_room_at(x,y);
	var leak_index = ds_list_find_index(base_room.leaks, tile_leak);
	ds_list_delete(base_room.leaks, leak_index);
	instance_destroy(tile_leak);
	if(ds_list_size(base_room.leaks) == 0) base_room.oxygen_is_leaking = false;
}