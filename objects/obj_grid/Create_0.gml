grid_type = noone;

// A map of lists of components based on role: for grid logic
logic_map = ds_map_create();
for(var role = 0; role < (macro_grid_role_count); role++)
{
	ds_map_add(logic_map, role, ds_list_create());
}

// A map of components by encoded grid index coordinate: for floodfill
tile_map = ds_map_create();
tile_key_list = ds_list_create();

total_production = 0;
total_demand = 0;
net_output = 0;
storage = 0;
storage_capacity = 0;