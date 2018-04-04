// create one worm
var wx = 32;
var wy = 32;
var worm = instance_create_layer(wx, wy, macro_astronaut_layer, obj_worm);
worm.sprite_index = spr_worm_sensor_alert;

#region pick random tile to attack
var target_tile = noone;
var tiles = ds_list_create();
with(obj_base_tile)
{
	if(damage < 100 && owner == macro_player)
	{
		// todo: worm should find new target when player puts component on tile
		var is_free = !position_meeting(x, y, obj_base_component);
		if(is_free) ds_list_add(tiles, id);
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
	worm = noone;
}
#endregion

with(worm)
{
	current_action = worm_action.navigating_to_basetile;
	basetile_target = target_tile;
	if(!path_exists(path)) path = path_add();
	//mp_linear_path(path, basetile_target.x, basetile_target.y, worm_speed_underground, false); // does not go through solids
	path_add_point(path, x, y, 100);
	path_add_point(path, basetile_target.x, basetile_target.y, 100);
	path_set_closed(path, false); // so it doesnt go back
	//path_start(path, worm_speed_underground, path_action_stop, false);
	path_start(path, 10, path_action_stop, false); // DEBUG
}

return worm;