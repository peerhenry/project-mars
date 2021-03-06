if( instance_number(object_index) > 1 ) instance_destroy();

hud_bar_h = 36;
hud_border_color = global.hud_border_color;
buttons = ds_list_create();
mouse_over_HUD = false;
hover_button = noone;
press_button = noone;

gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

global.hud_bar_button_width = 36;
var bw = global.hud_bar_button_width;

// left
scr_add_hud_bar_sprite_button(id, 0, 0, spr_objectives, 0, false, hud_action.toggle_objectives);
var in_campaign = false;
with(obj_level) in_campaign = scr_instance_inherits(id, obj_level_campaign);
if(in_campaign) scr_add_hud_bar_sprite_button(id, bw, 0, spr_mission_control, 0, false, hud_action.mission_control);

// right
scr_add_hud_bar_sprite_button(id, gui_w - bw, 0, spr_menu, 0, false, hud_action.toggle_menu);
scr_add_hud_bar_sprite_button(id, gui_w - bw*2, 0, spr_minimap_icon, 0, false, hud_action.toggle_minimap);
scr_add_hud_bar_sprite_button(id, gui_w - bw*3, 0, spr_outliner, 0, false, hud_action.toggle_outliner);
scr_add_hud_bar_sprite_button(id, gui_w - bw*4, 0, spr_high_walls, global.draw_tall_walls, true, hud_action.toggle_high_walls);
scr_add_hud_bar_sprite_button(id, gui_w - bw*5, 0, spr_zoom_button, 0, true, hud_action.toggle_zoom);


// minimap
minimap = instance_create_layer(0, hud_bar_h, macro_logic_layer, obj_HUD_minimap);
minimap.x = window_get_width() - minimap.width; //anchor to right
minimap_is_active = true;

// outliner: todo: remove obsolete stuff
outliner_button_margin = 12;
outliner_button_padding = 4;
outliner_sprite = spr_astro_panels;
outliner = instance_create_layer(0, 0, macro_logic_layer, obj_HUD_outliner);
/*outliner_button = scr_add_hud_button_sprite(
	id, 
	gui_w - sprite_get_width(outliner_sprite) - 2*outliner_button_padding - outliner_button_margin,
	hud_bar_h + minimap.height + outliner_button_margin, 
	outliner_sprite, 
	outliner_button_padding, 
	hud_action.toggle_outliner
);
outliner_button.draw_as_panel = true;*/

global.hovering_over_HUD = false; // write @ begin step, read @ step

// todo: is this relevant?
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
options_menu = instance_create_layer(-500, 500, macro_logic_layer, obj_gui_menu_options);
sound_menu = instance_create_layer(-500, 500, macro_logic_layer, obj_gui_menu_sound);
controls_menu = instance_create_layer(-500, 500, macro_logic_layer, obj_gui_menu_controls);
// confirm_dialog = instance_create_layer(-500, 500, macro_logic_layer, obj_gui_menu_confirm);

// -- Resource panel settings --
resources_left = 480;
resources_top = 4;
resources_right = 800;
resources_bottom = 32;
resources_center_x = (resources_left + resources_right)/2;
resources_center_y = (resources_top + resources_bottom)/2;

cursor_sprite = spr_cursor;

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
hover_astro = noone;
hover_part = hud_part.none;

var di = instance_create_depth(1, 1, 0, dto_inventory);
instance_destroy(di);