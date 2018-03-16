event_inherited();

// objective oxygen tank
var objective = instance_create_depth(scr_condition_one_full_oxygen_tank, 0, 0, obj_trigger_objective);
objective.continue_after_trigger = true;
objective.name = "Setup O2 production";
objective.description = "Get at least one full oxygen tank.";
ds_list_add(trigger_list, objective);

// standard victory condition
var vc = instance_create_depth(0, 0, 0, obj_trigger_standard_victory);
vc.level = id;
ds_list_add(trigger_list, vc);

// standard defeat
var defeat = instance_create_depth(0, 0, 0, obj_trigger_standard_defeat);
defeat.level = id;
ds_list_add(trigger_list, defeat);