var w = argument0;
var h = argument1;

#macro key_inventory_space_grid 0
#macro key_inventory_id_grid 1

#macro macro_inv_space_free 0
#macro macro_inv_space_primary 1
#macro macro_inv_space_occupied 2

var inv = ds_map_create();

var inv_spaces = ds_grid_create(w,h);
var inv_ids = ds_grid_create(w,h);

inv[? key_inventory_space_grid] = inv_spaces;
inv[? key_inventory_id_grid] = inv_ids;

return inv;