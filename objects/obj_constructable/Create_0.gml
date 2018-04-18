#macro macro_init 3
#macro macro_post_init 4

script_container = global.script_container;
ioc_container = global.ioc_container;
occ_i = scr_rc_to_gi(x);
occ_j = scr_rc_to_gi(y);
encoded_ij = scr_encode_grid_coord(occ_i, occ_j);
grid_props_map = ds_map_create();	// contains grid props per grid type
owner = scr_get_owner(id);
under_construction = true;

event_user(macro_init);

if(!global.init_stage) event_user(macro_post_init);