event_inherited();

// objective oxygen tank
var O2 = instance_create_depth(scr_condition_one_full_oxygen_tank, 0, 0, obj_trigger_objective);
O2.continue_after_trigger = true;
O2.name = "Setup O2 production";
O2.description = "Get at least one full oxygen tank.";
ds_list_add(trigger_list, O2);

// objective kill enemies
var kill = instance_create_depth(scr_condition_no_enemy_astronauts, 0, 0, obj_trigger_objective);
kill.name = "Defeat the enemy";
kill.description = "Kill all enemy astronauts.";
ds_list_add(trigger_list, kill);

// standard victory condition
var vc = instance_create_depth(0, 0, 0, obj_trigger_standard_victory);
vc.level = id;
ds_list_add(trigger_list, vc);

// standard defeat
var defeat = instance_create_depth(0, 0, 0, obj_trigger_standard_defeat);
defeat.level = id;
ds_list_add(trigger_list, defeat);