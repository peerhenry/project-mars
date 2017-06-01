// ### GLOBAL SETTINGS

global.hovering_over_HUD = false;

// COLORS
global.btn_bg_color = c_dkgray;
global.btn_color = c_white;
global.btn_bg_color_hover = c_gray;
global.btn_color_hover = c_white;

// active for toggle buttons
global.btn_active_bg_color = c_teal;
global.btn_active_color = c_white;
global.btn_active_bg_color_hover = c_teal;
global.btn_active_color_hover = c_white;

enum button_state
{
	none,
	hover,
	selected
}


// ### OBJECT SETTINGS

build_count = ds_list_size(global.construction_list);
props_per_build = 3;
build_button_buffer = buffer_create(build_count*props_per_build*4, buffer_fixed, 4);

for(var n = 0; n < build_count; n++)
{
	var next_build = ds_list_find_value(global.construction_list, n);
	var next_sprite = scr_hud_sprite_for_build(next_build);
	var next_image_index = scr_hud_image_for_build(next_build);
	var next_state = button_state.none;
	var second_u32 = (next_state << 8) + next_image_index;
	buffer_write(build_button_buffer, buffer_s32, next_sprite);	// b, t, v	
	buffer_write(build_button_buffer, buffer_u32, second_u32);
	buffer_write(build_button_buffer, buffer_s32, next_build);
}

y_offset = 128; // offset for build buttons
y_spacing = 0;
x_offset = 6;

// coords for menu button
menu_btn_left = 4;
menu_btn_top = 4;
menu_btn_right = 128;
menu_btn_bottom = 32;
menu_btn_center_x = (menu_btn_left + menu_btn_right)/2;
menu_btn_center_y = (menu_btn_top + menu_btn_bottom)/2;
mouse_over_menu = false;

// coords for resource panel
resources_left = 480;
resources_top = 4;
resources_right = 800;
resources_bottom = 32;
resources_center_x = (resources_left + resources_right)/2;
resources_center_y = (resources_top + resources_bottom)/2;

cursor_sprite = spr_cursor;