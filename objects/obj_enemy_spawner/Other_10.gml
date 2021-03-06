var wave_size = power(20, wave_number/7); // 20 enemies on wave number 7
wave_size = min(wave_size, 50);
if(instance_number(obj_astronaut) > 100) exit;

repeat(wave_size)
{
	var spawn_x = 0;
	var spawn_y = 0;
	
	var side = floor(random(4));
	var offset = -64;
	
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
	
	var enemy = scr_create_enemy_astronaut(spawn_x, spawn_y);
	scr_set_suit(enemy, true);
	
	var target = noone;
	with(obj_astronaut)
	{
		if(owner == macro_player){
			target = id;
			break;
		}
	}
	if(target != noone) scr_attack(enemy, target);
}
wave_number++;

scr_alert_player("wave " + string(wave_number));
show_debug_message("wave " + string(wave_number) + " spawned " + string(wave_size) + " astronauts.");
