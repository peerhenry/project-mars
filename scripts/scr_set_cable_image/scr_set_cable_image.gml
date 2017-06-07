var arg_cable = argument0;

with(arg_cable)
{
	switch(adjacency_number)
	{
		case 0:
		case 1:
		case 4:
		case 5:
			image_index = 0;
			break;
		case 2:
		case 8:
		case 10:
			image_index = 2;
			break;
		case 3:
			image_index = 4;
			break;
		case 6:
			image_index = 6;
			break;
		case 12:
			image_index = 8;
			break;
		case 9:
			image_index = 10;
			break;
		case 11:
			image_index = 12;
			break;
		case 7:
			image_index = 14;
			break;
		case 14:
			image_index = 16;
			break;
		case 13:
			image_index = 18;
			break;
		case 15:
			image_index = 20;
			break;
	}
	if(is_array(electric_grid))
	{
		if(
			electric_grid[e_grid_net_power] > 0 
			|| (electric_grid[e_grid_net_power] == 0 && ds_list_size(electric_grid[e_grid_source_list]) > 0))
		{
			image_index += 1;
		}
	}
}