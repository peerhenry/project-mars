// get skirmish settings
var skirmish_settings = global.skirmish_settings;
var astro_count = skirmish_settings[? macro_skirmish_astro_count];
global.ownership_behavior = macro_ownership_default;

// 1. player base
global.default_owner = macro_player;
var base_or_i = 20;
var base_or_j = 10;
var room_w = 5;
var room_h = 5;
scr_setup_six_rooms(base_or_i, base_or_j, room_w, room_h, 2);
// player astronauts...
init_skirmish_add_astronauts(80, 70, astro_count, macro_player); // attack check
with(obj_astronaut){
	var rifle = scr_give_entity_new_item(id, inv_space.rifle);
	equipped_item = rifle;
}
init_skirmish_add_astronauts(base_or_i + 1, base_or_j + 3, astro_count, macro_player); 

// 2. enemy base
global.default_owner = macro_enemy;
base_or_i = 80;
base_or_j = 80;
scr_setup_six_rooms(base_or_i, base_or_j, room_w, room_h, 2);
// enemy astronauts...
init_skirmish_add_astronauts(base_or_i + 1, base_or_j + 3, astro_count, macro_enemy);

global.default_owner = macro_player;
// enemy spawner
instance_create_layer(scr_gi_to_rc(base_or_i), scr_gi_to_rc(base_or_j) + 32*20, macro_logic_layer, obj_skirmish_spawner);

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
//camera_set_view_pos(view_camera[0], 32*80 - view_wport[0]/2, 32*70 - view_hport[0]/2); // attack check