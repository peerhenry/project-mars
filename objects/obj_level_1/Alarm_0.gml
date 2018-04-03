/// @description Initialize

init_create_spaceship_and_astros(30, 30);

// create enemy spawner
var spawner_i = 160;
var spawner_j = 160;
instance_create_layer(scr_gi_to_rc(spawner_i), scr_gi_to_rc(spawner_j), macro_logic_layer, obj_enemy_spawner);