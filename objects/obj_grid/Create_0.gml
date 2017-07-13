grid_type = noone;
components_map = ds_map_create();
for(var role = 0; role < (macro_grid_role_count); role++)
{
	ds_map_add(components_map, role, ds_list_create());
}

total_production = 0;
total_storage = 0;
total_demand = 0;
net_output = 0;