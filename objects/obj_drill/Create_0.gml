event_inherited();
scr_trace("obj_drill create");
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);
scr_navgrid_occupy(occ_i, occ_j);
depth = -occ_j;
image_speed = 0;
//noise_scale_x = 2;

resource_instance = instance_position(x, y, obj_resource);
has_resource = resource_instance != noone;

#macro macro_alarm_mine_metal 0

if(has_resource && resource_instance.object_index == obj_resource_metal) alarm_set(macro_alarm_mine_metal, 30); // mine event

// electric grid
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_consumer, global.drill_energy_consumption);
scr_connect_to_cables(id);

scr_drill_pump_connection(id);

// debug:
var uvs = sprite_get_uvs(sprite_index, 0);
show_debug_message("drill uvs: " + 
	string(uvs[0]) + ", " +
	string(uvs[1]) + ", " +
	string(uvs[2]) + ", " +
	string(uvs[3]) + ", " +
	string(uvs[4]) + ", " +
	string(uvs[5]) + ", " +
	string(uvs[6]) + ", " +
	string(uvs[7])
);
var uvs2 = sprite_get_uvs(spr_pump, 0);
show_debug_message("pump uvs: " + 
	string(uvs2[0]) + ", " +
	string(uvs2[1]) + ", " +
	string(uvs2[2]) + ", " +
	string(uvs2[3]) + ", " +
	string(uvs2[4]) + ", " +
	string(uvs2[5]) + ", " +
	string(uvs2[6]) + ", " +
	string(uvs2[7])
);
show_debug_message("test: " + string(0.0039252456));
