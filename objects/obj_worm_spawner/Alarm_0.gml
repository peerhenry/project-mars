
// create one worm
var worm = instance_create_layer(32, 32, macro_astronaut_layer, obj_worm);

#region pick random tile to attack
var target_tile = noone;
var tiles = ds_list_create();
with(obj_base_tile)
{
	if(damage < 100 && owner == macro_player)
	{
		ds_list_add(tiles, id);
	}
}

if(ds_list_size(tiles) > 0)
{
	var r_index = floor(random(ds_list_size(tiles)));
	target_tile = tiles[| r_index];
}

if(target_tile == noone)
{
	instance_destroy(worm);
	exit;
}
#endregion

with(worm)
{
	current_action = worm_action.navigating_to_basetile;
	basetile_target = target_tile;
	mp_linear_path(path, basetile_target.x, basetile_target.y, global.worm_speed, false);
	path_start(path, global.worm_speed, path_action_stop, false);
}

alarm[0] = room_speed*10; // next attack in 10 seconds