// A task actor is something that can perform tasks and combat
event_inherited();

// inventory
inventory = instance_create_depth(3,3,0,dto_inventory);
equipped_item = noone;

// tasks
assigned_object = noone;
current_action = astronaut_action.idle;
construction = noone;
repair_target = noone;
repair_speed = 1; // todo: move to settings

// combat stuff
target = noone;			// thing to pursue
auto_target = noone;	// thing to auto attack when in range
alarm[0] = 30*global.time_to_shoot + round(random_range(-5,5));
enemy = scr_get_enemy(owner);
shoot_path = path_add();

// draw/gui stuff
show_details = false;

auto_attack = (owner == macro_player) ? global.auto_attack_player : global.auto_attack_nonplayer;
auto_construct = (owner == macro_player) ? global.auto_construct_player : global.auto_construct_nonplayer;