
var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();
var clicked = mouse_check_button_released(mb_left);
var right_clicked = mouse_check_button_released(mb_right);

global.hovering_over_HUD = false;

// 1. menu button

mouse_over_menu = 
	window_mouse_x > menu_btn_left && 
	window_mouse_x < menu_btn_right && 
	window_mouse_y > menu_btn_top && 
	window_mouse_y < menu_btn_bottom;
	
if(mouse_over_menu)
{
	global.hovering_over_HUD = true;
	if(clicked)
	{
		var l = layer_get_id("logic");
		instance_create_layer(0, 0, l, obj_fade_to_menu);
	}
	return;
}

// 2. build buttons

for(var n = 0; n < build_count; n++)
{
	var offset = (n*props_per_build + 1)*4;
	buffer_seek(build_button_buffer, buffer_seek_start, offset);
	var next_u32 = buffer_read(build_button_buffer, buffer_u32);
	var next_image_index = next_u32 & 255;
	var b_state = (next_u32 >> 8) & 255; // second byte is state
	
	var mouse_over = window_mouse_x > x_offset && 
		window_mouse_x < x_offset + 32 && 
		window_mouse_y > y_offset + n*(32 + y_spacing) && 
		window_mouse_y < y_offset + (n+1)*(32 + y_spacing);
	
	if(mouse_over)
	{
		global.hovering_over_HUD = true;
		if(b_state != button_state.selected)
		{
			var new_state = button_state.hover;
			if(clicked)
			{
				new_state = button_state.selected;
				global.construct = ds_list_find_value(global.construction_list, n);
				global.construction_is_valid = false;
				global.rotated_was_checked = false;	// for auto rotate hatches and doors
			}
			var new_val = (new_state<<8) + next_image_index;
			buffer_seek(build_button_buffer, buffer_seek_start, offset);
			buffer_write(build_button_buffer, buffer_u32, new_val);
		}
	}
	else
	{
		if(b_state == button_state.hover){
			var new_val = (button_state.none<<8) + next_image_index;
			buffer_seek(build_button_buffer, buffer_seek_start, offset);
			buffer_write(build_button_buffer, buffer_u32, new_val);
		}
		else if((clicked || right_clicked) && b_state == button_state.selected){
			var new_val = (button_state.none<<8) + next_image_index;
			buffer_seek(build_button_buffer, buffer_seek_start, offset);
			buffer_write(build_button_buffer, buffer_u32, new_val);
		}
	}
}

if(global.hovering_over_HUD)
{
	return;
}

var hovers_over_enemy = instance_position(mouse_x, mouse_y, obj_astronaut_enemy) != noone;
if(cursor_sprite != spr_cursor_attack)
{
	if(hovers_over_enemy)
	{
		cursor_sprite = spr_cursor_attack;
	}	
}
else
{
	if(!hovers_over_enemy)
	{
		cursor_sprite = spr_cursor;
	}
}