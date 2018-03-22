/// @description Check for menu events

if(global.room_is_transitioning) exit;

// init menu focus index
if(menu_focus_index < 0)
{
	with(obj_list_button)
	{
		if(focussed)
		{
			other.menu_focus_index = index;
			break;
		}
	}
}

// set menu_focus_index via mouse hover
if(last_mouse_x != mouse_x || last_mouse_y != mouse_y) //mouse has moved
{
	last_mouse_x = mouse_x;
	last_mouse_y = mouse_y;
	
	for(var i = 0; i < ds_list_size(list_buttons); i++)
	{
		var list_button = list_buttons[|i];
		if(!list_button.enabled) continue;
		if(mouse_y >= list_button.y && mouse_y < list_button.y + list_button.text_height) //check only y-coordinate hover
		{
			with(obj_list_button) focussed = false;
			list_button.focussed = true;
			menu_focus_index = i;
			break;
		}
	}
}

// set menu_focus_index via keyboard arrows //todo: refactor hardcoded bindings?
var move = 0;
move -= max(keyboard_check_pressed(vk_up), keyboard_check_pressed(ord("W")), 0);
move += max(keyboard_check_pressed(vk_down), keyboard_check_pressed(ord("S")), 0);
if(move != 0)
{
	var next_index = menu_focus_index;
	var list_size = ds_list_size(list_buttons);
	for(var i = 0; i < list_size; i++) //apply move until next enabled item is found (skipping disabled items)
	{
		next_index += move;
		if(next_index < 0 ) next_index = list_size - 1; //reset to last
		else if(next_index >= list_size) next_index = 0; //reset to first
		
		var list_button = list_buttons[|next_index]; //todo: list_buttons index needs to match it's .index member (enum deprecated/overhead?)
		if(list_button.enabled)
		{
			with(obj_list_button) focussed = false;
			list_button.focussed = true;
			menu_focus_index = list_button.index;
			break;
		}
	}
}

// Select focussed menu item with keyboard
if(keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))
{
	event_user(0);
}

// Escape current menu
if(keyboard_check_pressed(vk_escape)) event_user(1);