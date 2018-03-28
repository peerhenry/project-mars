/// @arg inventory
var arg_inventory = argument0;

var q_width = arg_inventory.width;
var q_height = arg_inventory.height;
var quad_count = q_width * q_height;	// the amount of quads in grid

for(var j = 0; j < q_height; j++)
{
	for(var i = 0; i < q_width; i++)
	{
		var type = ds_grid_get(arg_inventory.space, i, j);
		if(type != inv_space.empty && type != inv_space.occupied)
		{
			var item = ds_grid_get(arg_inventory.ids, i, j);
			// show_debug_message("destroying item: id=" + string(item) + ", name=" + object_get_name(item.object_index)); // DEBUG
			instance_destroy(item);
		}
	}
}

ds_grid_set_region(arg_inventory.space, 0, 0, arg_inventory.width - 1, arg_inventory.height - 1, inv_space.empty);
ds_grid_set_region(arg_inventory.ids, 0, 0, arg_inventory.width - 1, arg_inventory.height - 1, 0);