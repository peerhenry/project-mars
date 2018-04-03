/// @descr Spawn enemies
var wave_size = power(20, wave_number/7); // 20 enemies on wave number 7
wave_size = min(wave_size, cancel_spawn_count);
if(instance_number(obj_astronaut) > 100) exit;

wave_size = 3; // DEBUG

repeat(wave_size)
{
	var spawn_x = x;
	var spawn_y = y;
	
	if(spawn_source != spawn_from.location)
	{
		var side = 0;
		var offset = -64;
		switch(spawn_source)
		{
			case spawn_from.all_borders:
				side = floor(random(4));
				break;
			case spawn_from.east:
				side = 0;
				break;
			case spawn_from.north:
				side = 1;
				break;
			case spawn_from.west:
				side = 2;
				break;
			case spawn_from.south:
				side = 3;
				break;
		}
	
		switch(side){ // ENWS
			case 0:
				spawn_x = room_width + offset;
				spawn_y = 32+random(room_height-64);
				break;
			case 1: 
				spawn_x = 32+random(room_width-64);
				spawn_y = -offset;
				break;
			case 2:
				spawn_x = -offset;
				spawn_y = 32+random(room_height-64);
				break;
			case 3:
				spawn_x = 32+random(room_width-64);
				spawn_y = room_height + offset;
				break;
		}
	}
	
	// spawn astronaut
	var enemy = scr_create_astronaut_safe(spawn_x, spawn_y, macro_enemy);
	if(enemy != noone)
	{
		enemy.is_rampaging = true;
		scr_attack_anything(enemy);
	}
}
wave_number++;

scr_alert_player("wave " + string(wave_number));
if(global.dev_env) show_debug_message("wave " + string(wave_number) + " spawned " + string(wave_size) + " astronauts.");