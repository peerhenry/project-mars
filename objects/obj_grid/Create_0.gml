grid_type = noone;

// A map of lists of components based on role: for grid logic
logic_map = ds_map_create();
for(var role = 0; role < macro_grid_role_count; role++)
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

counter = 0;
limit = 30; // update display levels once every thirty steps

display_total_production = 0;
display_total_demand = 0;
display_net_output = 0;
display_storage = 0;
display_storage_capacity = 0;

// cumulative variables
cum_tp = 0;
cum_td = 0;
cum_no = 0;
cum_s = 0;

// gui panel
width = 384;
height = 160;
ap_offset = 0;
with(obj_HUD) other.ap_offset = ap_w + ap_margin;