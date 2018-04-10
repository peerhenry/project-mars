/// @description creates astronauts, basic shapeship and mdus
// create player astronauts
var start_i = argument0;
var start_j = argument1;;
init_skirmish_add_astronauts(start_i, start_j, 5, macro_player); // todo: rename this script to init_level_add_astronauts

// create player spaceship
var ship_x = scr_gi_to_rc(start_i);
var ship_y = scr_gi_to_rc(start_j-5);
var ship = instance_create_layer(ship_x, ship_y, macro_base_layer, obj_atm_small);
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