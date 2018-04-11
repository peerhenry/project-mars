if(damage >= 100 && !is_broken)
{
	sprite_index = spr_base_tile_broken;
	is_broken = true;
	damage = 100;
	// scr_destroy_from_damage(id); // this is the standard for constructables
	
	// add leak to room
	var tile_leak = new(c_leak, 1); // drainage per step, todo: move to config global
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