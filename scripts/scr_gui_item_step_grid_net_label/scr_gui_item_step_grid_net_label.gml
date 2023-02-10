function scr_gui_item_step_grid_net_label(argument0) {
	with(argument0)
	{
		var net_output = grid.net_output;
		text = string(net_output);
		text_color = net_output > 0 ? c_lime : c_red;
		with(grid_part_sprite)
		{
			sprite = net_output > 0 ? spr_grid_electric_storage_fill : spr_grid_electric_storage_drain;	
		}
	}


}
