/// @arg x
/// @arg y
var container = global.script_container;
var get_layer_for = script_container_resolve(container, "get_layer_for");
var astro_layer = script_execute(get_layer_for, obj_astronaut);
var temp = global.default_owner;
global.default_owner = macro_enemy;
var astro = instance_create_layer(argument0, argument1, astro_layer, obj_astronaut);
global.default_owner = temp;
return astro;