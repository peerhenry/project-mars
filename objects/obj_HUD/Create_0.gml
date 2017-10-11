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

// -- Construction panel settings --

padding = 8;
global.hud_padding = padding;
y_offset = 64; // offset for build buttons
y_spacing = 0;
x_offset = padding;

// -- zoom button --
var bottom = window_get_height() - 32 - padding;
show_debug_message("zoom button @: " + string(bottom));
instance_create_layer(8, bottom, macro_logic_layer, obj_HUD_zoom_button);

// -- Construction panel --

item_count = 0;
var left = x_offset;
var top = y_offset + (32 + y_spacing)*item_count;

var deconstruction_item = instance_create_layer(left, top, macro_logic_layer, obj_HUD_category_select_button);
with(deconstruction_item){
	tooltip_text = "Deconstruction";
	sprite_index = spr_destruct;
	category = macro_category_deconstruction;
}
item_count++

var top = y_offset + (32 + y_spacing)*item_count;
var foundation_item = instance_create_layer(left, top, macro_logic_layer, obj_HUD_category_select_button);
with(foundation_item){
	tooltip_text = "Base Foundation";
	sprite_index = spr_category_foundation;
	category = macro_category_foundation;
}
item_count++;

var top = y_offset + (32 + y_spacing)*item_count;
var inside_item = instance_create_layer(left, top, macro_logic_layer, obj_HUD_category_select_button);
with(inside_item){
	tooltip_text = "Inside constructions";
	sprite_index = spr_category_inside;
	category = macro_category_inside;
}
item_count++;

var top = y_offset + (32 + y_spacing)*item_count;
var outside_item = instance_create_layer(left, top, macro_logic_layer, obj_HUD_category_select_button);
with(outside_item){
	tooltip_text = "Outside constructions";
	sprite_index = spr_category_outside;
	category = macro_category_outside;
}
item_count++;

// -- Menu button settings --
menu_btn_left = 4;
menu_btn_top = 4;
menu_btn_right = 128;
menu_btn_bottom = 32;
menu_btn_center_x = (menu_btn_left + menu_btn_right)/2;
menu_btn_center_y = (menu_btn_top + menu_btn_bottom)/2;
mouse_over_menu = false;

hud_menu = instance_create_layer(-500, 500, macro_logic_layer, obj_HUD_menu);

// -- Resource panel settings --
resources_left = 480;
resources_top = 4;
resources_right = 800;
resources_bottom = 32;
resources_center_x = (resources_left + resources_right)/2;
resources_center_y = (resources_top + resources_bottom)/2;

cursor_sprite = spr_cursor;