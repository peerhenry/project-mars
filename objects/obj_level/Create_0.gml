global.mission_accomplished_return_room = mission_control;
global.mission_failed_return_room = room_menu;
site = global.mission_control_site;
alarm[0] = 1;
objective_list = ds_list_create();
objective = instance_create_depth(0, 0, 0, obj_objective_get_one_full_o2_tank);
ds_list_add(objective_list, objective);