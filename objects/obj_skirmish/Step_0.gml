/// @description Insert description here
// You can write your code in this editor
if(game_over) exit;

switch(victory_contition)
{
	case victory.domination:
		// check if all enemy units are destroyed
		var live_enemy_count = scr_count_live_astronauts(macro_enemy);
		if(live_enemy_count == 0)
		{
			// VICTORY
			instance_create_layer(display_get_gui_width()/2, display_get_gui_height()/2, macro_logic_layer, obj_mission_accomplished);
			game_over = true;
			exit;
		}
		break;
	case victory.sandbox:
		break;
}

var live_player_astro_count = scr_count_live_astronauts(macro_player);
if(live_player_astro_count == 0)
{
	// GAME OVER
	instance_create_layer(display_get_gui_width()/2, display_get_gui_height()/2, macro_logic_layer, obj_mission_failed);
	game_over = true;
	exit;
}