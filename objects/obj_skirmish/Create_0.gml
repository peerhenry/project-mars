event_inherited();
var skirmish_settings = global.skirmish_settings;
var victory_contition = skirmish_settings[? macro_skirmish_victory_condition];
init_skirmish();

if(victory_contition == victory.domination)
{
	// objective kill enemies
	var kill = instance_create_depth(id, scr_condition_no_enemy_astronauts, 0, obj_trigger_objective);
	kill.name = "Defeat the enemy";
	kill.description = "Kill all enemy astronauts.";
	ds_list_add(trigger_list, kill);
	
	// standard victory condition
	var vc = instance_create_depth(id, 0, 0, obj_trigger_standard_victory);
	ds_list_add(trigger_list, vc);	
}

// standard defeat
var defeat = instance_create_depth(id, 0, 0, obj_trigger_standard_defeat);
ds_list_add(trigger_list, defeat);