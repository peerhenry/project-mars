/// @description Insert description here
// You can write your code in this editor
build_count = ds_list_size(global.construction_list);
props_per_build = 2;
build_button_buffer = buffer_create(build_count*props_per_build*4, buffer_fixed, 4);

enum button_state
{
	none,
	hover,
	selected
}

for(var n = 0; n < build_count; n++)
{
	var next_build = ds_list_find_value(global.construction_list, n);
	var next_sprite = scr_hud_sprite_for_build(next_build);
	var next_image_index = scr_hud_image_for_build(next_build);
	var next_state = button_state.none;
	var second_u32 = (next_state << 8) + next_image_index;
	buffer_write(build_button_buffer, buffer_s32, next_sprite);	// b, t, v	
	buffer_write(build_button_buffer, buffer_u32, second_u32);
}

y_offset = 128; // offset for build buttons
y_spacing = 0;
x_offset = 6;

// coords for menu button
btn_left = 4;
btn_top = 4;
btn_right = 128;
btn_bottom = 32;
btn_center_x = (btn_left + btn_right)/2;
btn_center_y = (btn_top + btn_bottom)/2;

// coords for resource panel
resources_left = 480;
resources_top = 4;
resources_right = 800;
resources_bottom = 32;
resources_center_x = (resources_left + resources_right)/2;
resources_center_y = (resources_top + resources_bottom)/2;