var width = 256 + 16;
var height = 384 + 16;
var ap_offset = 0;
with(obj_HUD) ap_offset = ap_w + ap_margin;
var tl_x = display_get_gui_width() - width - ap_offset;
var tl_y = 0;

if(is_selected)
{
	// panel
	var tl_x2 = tl_x + width;
	var tl_y2 = tl_y + height;
	scr_draw_panel(tl_x, tl_y, tl_x2, tl_y2);
	
	var x_or = tl_x + 8;
	var y_or = tl_y + 8;
	
	// inventory
	draw_sprite(spr_fridge_inventory_grid, 0, x_or, y_or);
	for (var i=0; i < inv_w; i++)
    {
        for (var j=0; j < inv_h; j++)
        {
            var value = ds_grid_get(inventory, i, j);
			if(value != macro_inventory_empty && value != macro_inventory_occupied)
			{
				var sprite = scr_get_inventory_item_sprite(value);
				draw_sprite(sprite, 0, x_or + 64*i, y_or + 64*j);
			}
        }
    }
}