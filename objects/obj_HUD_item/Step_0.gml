var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();

/*
buffer_seek(build_button_buffer, buffer_seek_start, offset);
var next_u32 = buffer_read(build_button_buffer, buffer_u32);
var construct = buffer_read(build_button_buffer, buffer_s32);
var next_image_index = next_u32 & 255;
var b_state = (next_u32 >> 8) & 255; // second byte is state
*/
	
var mouse_over = window_mouse_x > x && 
	window_mouse_x < x + 32 && 
	window_mouse_y > y && 
	window_mouse_y < y + 32;

var clicked = mouse_check_button_released(mb_left);
var right_clicked = mouse_check_button_released(mb_right);

if(mouse_over)
{
	global.hovering_over_HUD = true;
	if(state != button_state.selected)
	{
		var new_state = button_state.hover;
		if(clicked)
		{
			new_state = button_state.selected;
			global.construct = construction;
			global.construction_is_valid = false;
			global.rotated_was_checked = false;	// for auto rotate hatches and doors
		}
		state = new_state;
	}
}
else
{
	if(state == button_state.hover)
	{
		// set state to none
		state = button_state.none;
	}
	else if((clicked || right_clicked) && state == button_state.selected)
	{
		// set state to none
		state = button_state.none;
	}
}