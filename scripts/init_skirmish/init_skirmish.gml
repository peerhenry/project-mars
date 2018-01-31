// get skirmish settings
var skirmish_settings = global.skirmish_settings;
var astro_count = skirmish_settings[? macro_skirmish_astro_count];
global.ownership_behavior = macro_ownership_default;

// 1. player startup base
global.default_owner = macro_player;
var base_or_i = 20;
var base_or_j = 10;
var room_w = 5;
var room_h = 5;
scr_setup_six_rooms(base_or_i, base_or_j, room_w, room_h, 2);
// player astronauts...
var astro_or_i = base_or_i + 1;
var astro_or_j = base_or_j + 3;
for(var n = 0; n < astro_count; n++)
{
	var astro = instance_create_layer(scr_gi_to_rc(astro_or_i) + 32*n, scr_gi_to_rc(astro_or_j), macro_astronaut_layer, obj_astronaut_playable);
	scr_set_suit(astro, true);
	astro.is_outside = false;
}

// 2. enemy base
global.default_owner = macro_enemy;
base_or_i = 80;
base_or_j = 80;
scr_setup_six_rooms(base_or_i, base_or_j, room_w, room_h, 2);
// enemy astronauts...
var astro_or_i = base_or_i + 1;
var astro_or_j = base_or_j + 3;
for(var n = 0; n < astro_count; n++)
{
	var astro = instance_create_layer(scr_gi_to_rc(astro_or_i) + 32*n, scr_gi_to_rc(astro_or_j), macro_astronaut_layer, obj_astronaut_enemy);
	scr_set_suit(astro, false);
	astro.is_outside = false;
}

global.default_owner = macro_player;
// enemy spawner
instance_create_layer(scr_gi_to_rc(astro_or_i) + 32*n, scr_gi_to_rc(astro_or_j) + 32*20, macro_logic_layer, obj_skirmish_spawner);

// 3. create mdu piles...
global.setup_mdu_pile_size = 8;
var pile_count = skirmish_settings[? macro_skirmish_mdu_pile_count];
var pile_counter = 0;
for(var n = 0; n < 3; n++)
{
	if(pile_counter == pile_count) break;
	for(var m = 0; m < 3; m++)
	{
		if(pile_counter == pile_count) break;
		var po_x = scr_gi_to_rc(20);
		var po_y = scr_gi_to_rc(10 + 17);
		instance_create_layer(po_x + 32*n, po_y + 32*m, macro_base_layer, obj_mdu_pile);
		pile_counter++;
	}
}
global.setup_mdu_pile_size = 1;


// center camera on starting position
camera_set_view_pos(view_camera[0], 32*32 - view_wport[0]/2, 32*32 - view_hport[0]/2);