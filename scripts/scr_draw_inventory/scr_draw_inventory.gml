/// @arg inventory
/// @arg sprite
/// @arg left
/// @arg top
var arg_inventory = argument0;
var arg_sprite = argument1;
var arg_left = argument2;
var arg_top = argument3;

var grid_w = arg_inventory.width;
var grid_h = arg_inventory.height;

var grid_x = arg_left;
var grid_y = arg_top;
draw_sprite(arg_sprite, 0, grid_x, grid_y);

for (var i = 0; i < grid_w; i++)
{
    for (var j = 0; j < grid_h; j++)
    {
        var value = ds_grid_get(arg_inventory.space, i, j);
		if(value != inv_space.empty && value != inv_space.occupied)
		{
			var sprite = scr_get_inventory_item_sprite(value);
			draw_sprite(sprite, 0, grid_x + 64*i, grid_y + 64*j);
			var item = ds_grid_get(arg_inventory.ids, i, j);
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
		}
    }
}