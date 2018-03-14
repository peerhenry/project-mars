/*var container = global.script_container;
var create_instance = resolve(container, "create_instance");
script_execute(create_instance, x, y, obj_astronaut);*/

#region Setup spaceship, astros and mdus

// create player astronauts
var start_i = 30;
var start_j = 30;
init_skirmish_add_astronauts(start_i, start_j, 5, macro_player); // todo: rename this script to init_level_add_astronauts

// create player spaceship
var ship_x = scr_gi_to_rc(start_i);
var ship_y = scr_gi_to_rc(start_j-5);
var ship = instance_create_layer(ship_x, ship_y, macro_base_layer, obj_basic_spaceship);
scr_center_screen_on(ship);

// mdus
global.setup_mdu_pile_size = 8;
for(var i = 0; i < 4; i++)
{
	for(var j = 0; j < 4; j++)
	{
		var mx = scr_gi_to_rc(start_i + 6 + i);
		var my = scr_gi_to_rc(start_j + j);
		instance_create_layer(mx, my, macro_base_layer, obj_mdu_pile);
	}
}

#endregion

// create enemy spawner
var spawner_i = 80;
var spawner_j = 80;
instance_create_layer(scr_gi_to_rc(spawner_i), scr_gi_to_rc(spawner_j), macro_logic_layer, obj_skirmish_spawner);