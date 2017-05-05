i = scr_rc_to_gi(x);
j = scr_rc_to_gi(y);

mp_grid_add_cell( global.grid_map, i, j );
var blid = layer_get_id("base");
instance_create_layer(x, y, blid, obj_base_tile);

adjacentcy_numer = 0;