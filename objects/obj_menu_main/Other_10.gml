/// @description Menu Select Event
switch(menu_focus_index)
{
	case menu_index.game_continue:
		break;
	case menu_index.new_game:
		var fader = instance_create_layer(0, 0, "layer_fade", obj_menu_fade);
		fader.target_room = mission_control;
		break;
	case menu_index.tutorial:
		room_goto(room_tutorial_select);
		break;
	case menu_index.skirmish:
		room_goto(room_skirmish); // skirmish setup menu
		break;
	case menu_index.survival:
		global.level_object_index = obj_survival;
		room_goto(mars_survival);
		break;
	case menu_index.settings:
		room_goto(room_settings);
		break;
	case menu_index.debug:
		var fader = instance_create_layer(0, 0, "layer_fade", obj_menu_fade);
		fader.target_room = room_test_map;
		break;
	/*case menu_index.test:
		room_goto(room_tests);*/
	case menu_index.quit:
		audio_stop_all();
		game_end();
		break;
}