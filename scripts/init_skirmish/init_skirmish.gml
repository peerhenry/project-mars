// get skirmish settings
var skirmish_settings = global.skirmish_settings;
var astro_count = skirmish_settings[? macro_skirmish_astro_count];

// create astronauts...
for(var n = 0; n < astro_count; n++)
{
	instance_create_layer(32*32 + 32*n, 32*32, macro_astronaut_layer, obj_astronaut_playable);
	
	instance_create_layer((room_width - 32*32) + 32*n, room_height - 32*32,macro_astronaut_layer, obj_astronaut_enemy);
}

// create constructions...
// create mdu piles...

// center camera on starting position
camera_set_view_pos(view_camera[0], 32*32 - view_wport[0]/2, 32*32 - view_hport[0]/2);