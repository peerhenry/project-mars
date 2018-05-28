var con = argument0;
scr_unregister_construction(con);
instance_destroy(con[? construction_object]);
ds_map_destroy(con);