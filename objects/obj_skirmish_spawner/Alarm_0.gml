var wave_size = power(20, wave_number/7); // 20 enemies on wave number 7
wave_size = min(wave_size, 20);
alarm[0] = 30*wave_time;

if(instance_number(obj_astronaut) > 100) exit;

var counter = 0;
repeat(wave_size)
{
	var enemy = scr_create_enemy_astronaut(x + 32*counter, y);
	var target = noone;
	with(obj_astronaut) // todo: attack construction if no astronaut can be attacked #225
	{
		if(owner == macro_player)
		{
			target = id;
			break;
		}
	}
	if(target != noone) scr_attack(enemy, target);
	
	counter++;
}
wave_number++;

scr_alert_player("wave " + string(wave_number));
show_debug_message("wave " + string(wave_number) + " spawned " + string(wave_size) + " astronauts.");