event_inherited();

// standard victory condition (inject level in x)
var vc = instance_create_depth(id, 0, 0, obj_trigger_standard_victory);
ds_list_add(trigger_list, vc);

// standard defeat
var defeat = instance_create_depth(id, 0, 0, obj_trigger_standard_defeat);
ds_list_add(trigger_list, defeat);