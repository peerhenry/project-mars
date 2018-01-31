event_inherited();
scr_trace("obj_drill create");
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);
depth = -occ_j;
image_speed = 0;
//noise_scale_x = 2;

resource_instance = instance_position(x, y, obj_resource);
has_resource = resource_instance != noone;

#macro macro_alarm_mine_metal 0

if(has_resource && resource_instance.object_index == obj_resource_metal) alarm_set(macro_alarm_mine_metal, 30); // mine event

// electric grid
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_consumer, global.drill_energy_consumption);

draw_cables = true;

if(!global.init_stage)
{
	scr_connect_to_cables(id);
	scr_drill_pump_connection(id);
}