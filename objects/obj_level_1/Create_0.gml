event_inherited();

// objective oxygen tank
var objective = instance_create_depth(id, scr_condition_one_full_oxygen_tank, 0, obj_trigger_objective);
objective.continue_after_trigger = true;
objective.name = "Setup O2 production";
objective.description = "Get at least one full oxygen tank.";
ds_list_add(trigger_list, objective);

// standard victory condition (inject level in x)
var vc = instance_create_depth(id, noone, 0, obj_trigger_standard_victory);
ds_list_add(trigger_list, vc);

// standard defeat
var defeat = instance_create_depth(id, noone, 0, obj_trigger_standard_defeat);
ds_list_add(trigger_list, defeat);