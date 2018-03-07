if( instance_number(object_index) > 1 ) instance_destroy();

hud_bar_h = 36;
buttons = ds_list_create();
mouse_over_HUD = false;

gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

global.hud_bar_button_width = 148;
var bw = global.hud_bar_button_width;
scr_add_hud_bar_button(id, 0, 0, font_hud_bar, "menu", hud_action.toggle_menu); // debug
scr_add_hud_bar_button(id, bw, 0, font_hud_bar, "objectives", hud_action.none); // debug
scr_add_hud_bar_button(id, bw*2, 0, font_hud_bar, "mission control", hud_action.none); // debug

scr_add_hud_button_sprite(id, gui_w - 20-16-8, 40, spr_robot_panels, 4, hud_action.toggle_robot_panels);
scr_add_hud_button_sprite(id, gui_w - 20-16-8-16-8-8, 40, spr_astro_panels, 4, hud_action.toggle_astro_panels);

global.hovering_over_HUD = false; // write @ begin step, read @ step
global.hovering_over_hud_panel = false; // read & reset @ begin step, write @ step

enum button_state
{
	none,
	hover,
	selected
}

// -- Construction panel settings --

padding = 8;
global.hud_padding = padding; // used in obj_HUD_category_select_button
y_offset = 64; // offset for build buttons
y_spacing = 0;
x_offset = padding;

// -- zoom button --
instance_create_layer(gui_w - 40, 2, macro_logic_layer, obj_HUD_zoom_button);

// -- Construction panel --

item_count = 0;
// var left = x_offset;
// var top = y_offset + (32 + y_spacing)*item_count;
var gui_half_w = gui_w/2;
var top = gui_h - 32 - 8;
var left = gui_half_w - 1.5*32;
deconstruction_item = instance_create_layer(left, top, macro_logic_layer, obj_HUD_category_select_button);
with(deconstruction_item){
	tooltip_text = "Deconstruction";
	sprite_index = spr_destruct;
	category = macro_category_deconstruction;
}
item_count++;

// var top = y_offset + (32 + y_spacing)*item_count;
var left = gui_half_w - 0.5*32;
foundation_item = instance_create_layer(left, top, macro_logic_layer, obj_HUD_category_select_button);
with(foundation_item){
	tooltip_text = "Base Foundation";
	sprite_index = spr_category_foundation;
	category = macro_category_foundation;
}
item_count++;

var left = gui_half_w + 0.5*32;
inside_item = instance_create_layer(left, top, macro_logic_layer, obj_HUD_category_select_button);
with(inside_item){
	tooltip_text = "Inside constructions";
	sprite_index = spr_category_inside;
	category = macro_category_inside;
}
item_count++;

var left = gui_half_w + 1.5*32;
outside_item = instance_create_layer(left, top, macro_logic_layer, obj_HUD_category_select_button);
with(outside_item){
	tooltip_text = "Outside constructions";
	sprite_index = spr_category_outside;
	category = macro_category_outside;
}
item_count++;

// -- gui menu --
gui_menu = instance_create_layer(-500, 500, macro_logic_layer, obj_gui_menu_main);
sound_menu = instance_create_layer(-500, 500, macro_logic_layer, obj_gui_menu_sound);

// -- Resource panel settings --
resources_left = 480;
resources_top = 4;
resources_right = 800;
resources_bottom = 32;
resources_center_x = (resources_left + resources_right)/2;
resources_center_y = (resources_top + resources_bottom)/2;

cursor_sprite = spr_cursor;

// -- details panel --

oxygen_bar_color = global.oxygen_bar_color;
food_bar_color= global.food_bar_color;
sleep_bar_color = global.sleep_bar_color;
health_bar_color = global.health_bar_color;

// -- Astronaut panel --

global.hud_entity_panel_offset = 40;

// the rest is to become obsolete... todo: remove

ap_margin = 20;
ap_padding = 4;
ap_name_w = 126;
ap_w = ap_name_w + ap_padding + 4*(ap_padding+16);
ap_h = 28;
ap_offset = ap_h + 4;
ap_origin_left = gui_w - (ap_w + ap_margin);
ap_origin_top = 40;
health_bar_color = global.health_bar_color;
double_click_timer = 0;
double_click_astro = noone;
hover_astro = noone;
hover_part = hud_part.none;