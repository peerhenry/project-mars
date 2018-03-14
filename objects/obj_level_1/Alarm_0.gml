/*var container = global.script_container;
var create_instance = resolve(container, "create_instance");
script_execute(create_instance, x, y, obj_astronaut);*/

init_create_spaceship_and_astros(30, 30);

// create enemy spawner
var spawner_i = 160;
var spawner_j = 160;
instance_create_layer(scr_gi_to_rc(spawner_i), scr_gi_to_rc(spawner_j), macro_logic_layer, obj_skirmish_spawner);