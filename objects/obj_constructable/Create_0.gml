scr_trace("constructable create event");
name = "constructable";
description = "";
script_container = global.script_container;
construction_instance = noone;
under_construction = true;
damage = 0;
destroyed = false;
occ_i = scr_rc_to_gi(x);
occ_j = scr_rc_to_gi(y);
encoded_ij = scr_encode_grid_coord(occ_i, occ_j);
grid_props_map = ds_map_create();	// contains grid props per grid type
owner = scr_get_owner(id);
is_selected = false;

cable_adjacency = 0;
pipe_adjacency = 0;
draw_cables = false;
draw_pipes = false;

if(occupy_navgrid) scr_navgrid_occupy(occ_i, occ_j);
if(!global.init_stage) scr_connect_to_cables(id);