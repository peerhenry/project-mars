/// @arg unit
/// @arg sprite
/// @arg left
/// @arg top
function scr_draw_unit_inventory(argument0, argument1, argument2, argument3) {
	var arg_unit = argument0;
	var arg_sprite = argument1;
	var arg_left = argument2;
	var arg_top = argument3;

	var equip = noone;
	if(scr_instance_inherits(arg_unit, obj_task_actor)) equip = arg_unit.equipped_item;
	var inventory = arg_unit.inventory;
	var grid_w = inventory.width;
	var grid_h = inventory.height;

	var grid_x = arg_left;
	var grid_y = arg_top;
	draw_sprite(arg_sprite, 0, grid_x, grid_y);

	for (var i = 0; i < grid_w; i++)
	{
	    for (var j = 0; j < grid_h; j++)
	    {
	        var value = ds_grid_get(inventory.space, i, j);
			if(value != inv_space.empty && value != inv_space.occupied)
			{
				var sprite = scr_get_inventory_item_sprite(value);
				draw_sprite(sprite, 0, grid_x + 64*i, grid_y + 64*j);
				var item = ds_grid_get(inventory.ids, i, j);
				if(value == inv_space.pistol)
				{
					// draw small charge bar
					draw_healthbar(grid_x + 64*i + 8, grid_y + 64*j + 60, grid_x + 64*(i+1) - 8, grid_y + 64*j + 56, item.charge, c_black, c_aqua, c_aqua, 0, true, true);
				}
				else if(value == inv_space.rifle)
				{
					// draw wide charge bar
					draw_healthbar(grid_x + 64*i + 8, grid_y + 64*j + 60, grid_x + 64*(i+2) - 8, grid_y + 64*j + 56, item.charge, c_black, c_aqua, c_aqua, 0, true, true);
				}
				if(item == equip)
				{
					var left = grid_x + 64*i;
					var top = grid_y + 64*j;
					var right = left + 63;
					var bottom = top + 63;
					if(item.size > 1)
					{
						right += 64;
						if(item.size == 4) bottom += 64;
					}
					draw_set_color(c_aqua);
					draw_rectangle(left, top, right, bottom, true);
				}
			}
	    }
	}


}
