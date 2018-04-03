/// @description Initialize
event_inherited();

var spawner = instance_create_depth(0 ,0, 0, obj_enemy_spawner);
spawner.spawn_source = spawn_from.all_borders;
init_skirmish_add_astronauts(32, 24, 5, macro_player); // todo: rename this script to init_level_add_astronauts