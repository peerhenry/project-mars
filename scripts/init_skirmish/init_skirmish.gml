// get skirmish settings
var skirmish_settings = global.skirmish_settings;
var astro_count = skirmish_settings[? macro_skirmish_astro_count];

// create astronauts...
for(var n = 0; n < astro_count; n++)
{
	instance_create_layer(32*32 + 32*n, 32*32, macro_astronaut_layer, obj_astronaut_playable);
	instance_create_layer((room_width - 32*32) + 32*n, room_height - 32*32,macro_astronaut_layer, obj_astronaut_enemy);
}

// create constructions
scr_update_ghost(24*32, 24*32, 26*32, 26*32, macro_basetile, 0, true);
scr_build_new();
debug_finish_all_constructions();

// TODO: create enemy constructions...

// create mdu piles...
global.setup_mdu_pile_size = 8;
var pile_count = skirmish_settings[? macro_skirmish_mdu_pile_count];
var pile_counter = 0;
for(var n = 0; n < 3; n++)
{
	if(pile_counter == pile_count) break;
	for(var m = 0; m < 3; m++)
	{
		if(pile_counter == pile_count) break;
		
		var player_pile = instance_create_layer(32*32 + 32*n, 24*32 + 32*m, macro_astronaut_layer, obj_mdu_pile);
		player_pile.owner = macro_player;
		
		var enemy_pile = instance_create_layer(room_width - 24*32 - 32*n, room_height - 24*32 - 32*m,macro_astronaut_layer, obj_mdu_pile);
		enemy_pile.owner = macro_enemy;
		
		pile_counter++;
	}
}
global.setup_mdu_pile_size = 1;

// center camera on starting position
camera_set_view_pos(view_camera[0], 32*32 - view_wport[0]/2, 32*32 - view_hport[0]/2);