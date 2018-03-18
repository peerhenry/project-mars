event_inherited();
stage_complete = false;
init_tutorial();

// todo: move initial entities here

// objective oxygen tank
var objective = instance_create_depth(id, scr_condition_stage_complete, 0, obj_trigger_objective);
objective.name = "Move the view.";
objective.description = "Use WASD or arrow keys to move the view around.";
ds_list_add(trigger_list, objective);