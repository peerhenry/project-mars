/// @description Init
show_debug_message("drill init"); // DEBUG
event_inherited();
name = "drill";
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);
depth = -occ_j;
image_speed = 0;
//noise_scale_x = 2;

active_bucket = noone;

#macro macro_alarm_mine_metal 0
resource_instance = instance_position(x, y, obj_resource);
has_resource = resource_instance != noone;
if(has_resource && scr_instance_inherits(resource_instance, obj_resource_solid)) alarm_set(macro_alarm_mine_metal, room_speed); // mine event

// electric grid
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_consumer, global.drill_energy_consumption);

draw_cables = true;