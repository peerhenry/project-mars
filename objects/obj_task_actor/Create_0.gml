// A task actor is something that can perform tasks and combat
event_inherited();

// inventory
inventory = instance_create_depth(3,3,0,dto_inventory);
equipped_item = noone;

// tasks
assigned_object = noone;
current_action = astronaut_action.idle;
construction = noone;

// combat stuff
target = noone;			// thing to pursue
auto_target = noone;	// thing to auto attack when in range
alarm[0] = 30*global.time_to_shoot + round(random_range(-5,5));
enemy = scr_get_enemy(owner);
shoot_path = path_add();

// draw/gui stuff
show_details = false;

auto_attack = false;
auto_construct = true;