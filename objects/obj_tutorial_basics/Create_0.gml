event_inherited();
init_tutorial();
instance_create_depth(-1000,-1000, 0, obj_wasd);

// objective move view
var objective = instance_create_depth(id, scr_condition_stage_complete, 0, obj_trigger_objective);
objective.name = "Move the view.";
objective.description = "Use WASD or arrow keys to move the view around.";
objective.continue_after_trigger = false;
ds_list_add(trigger_list, objective);