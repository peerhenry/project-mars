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

var construction_list = global.active_constructions;
build_count = ds_list_size(construction_list);
props_per_build = 3;
build_button_buffer = buffer_create(build_count*props_per_build*4, buffer_fixed, 4);

var hud_layer = layer_get_id("logic");

y_offset = 64; // offset for build buttons
y_spacing = 0;
x_offset = 6;

// Create HUD construction buttons
for(var n = 0; n < build_count; n++)
{
	var next_build = ds_list_find_value(construction_list, n);
	var next_sprite = scr_hud_sprite_for_build(next_build);
	var next_image_index = scr_hud_image_for_build(next_build);
	
	var left = x_offset;
	var top = y_offset + (32 + y_spacing)*n;
	var new_item = instance_create_layer(left, top, hud_layer, obj_HUD_construction_button);
	with(new_item)
	{
		construction = next_build;
		tooltip_text = scr_get_tooltip_text(next_build);
		sprite_index = next_sprite;
		image_index = next_image_index;
	}
}

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