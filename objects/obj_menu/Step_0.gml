/// @description Check for menu events

if(global.room_is_transitioning) exit;

var move = 0;
move -= max(keyboard_check_pressed(vk_up), keyboard_check_pressed(ord("W")), 0);
move += max(keyboard_check_pressed(vk_down), keyboard_check_pressed(ord("S")), 0);

// set menu_focus_index
if(move != 0){
	menu_focus_index += move;
	if(menu_focus_index < 0 ) menu_focus_index = menu_index_max;
	else if(menu_focus_index > menu_index_max ) menu_focus_index = 0;
}

if(!mark_for_go)
{
	mark_for_go = max(keyboard_check_pressed(vk_enter), keyboard_check_pressed(vk_space), mouse_check_button_pressed(mb_left), 0);
}
else
{
	var keys_clear = !(max(keyboard_check(vk_enter), keyboard_check(vk_space), mouse_check_button(mb_left), 0));
	if(keys_clear)
	{
		mark_for_go = false;
		
		switch(menu_focus_index)
		{
			case menu_index.game_continue:
				break;
			case menu_index.new_game:
				break;
			case menu_index.tutorial:
				room_goto(tutorial);
				break;
			case menu_index.survival:
				room_goto(mars_survival);
				break;
			case menu_index.settings:
				room_goto(room_settings);
				break;
			case menu_index.debug:
				var lid = layer_get_id("layer_fade");
				instance_create_layer(0, 0, lid, obj_fade);
				obj_fade.target_room = room_map;
				break;
			/*case menu_index.test:
				room_goto(room_tests);*/
			case menu_index.quit:
				game_end();
				break;
		}
		
	}
}

if(keyboard_check_pressed(vk_escape)) game_end();