var enemy = instance_create_layer(100,100,macro_astronaut_layer, obj_astronaut_enemy);
var target = noone;
with(obj_astronaut_playable)
{
	target = id;
	break;
}
scr_attack(enemy, target);
show_debug_message("enemy spawned!!");
