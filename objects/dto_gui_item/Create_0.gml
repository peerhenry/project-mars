#macro macro_gui_event_update 0
#macro macro_gui_event_draw 1
#macro macro_gui_event_update_geomtery 5

enum gui_item_class
{
	none,
	container,
	label,
	button // hover and down behavior
}
enum align_h { left, center, right }
enum align_v { top, mid, bottom }
halign = align_h.left;
valign = align_v.top;

class = gui_item_class.none;
hover = false;
container = x; // inject container in x
ds_list_add(container.gui_item_list, id);


tooltip_title = "";
tooltip_description = "";
step_script = scr_gui_item_step_set_hover;
draw_script = scr_guit_item_draw_standard;
mouse_enter_script = noone;
mouse_leave_script = noone;

origin_x = 0;
origin_y = 0;
left = 0;
top = 0;
right = 0;
bottom = 0;
width = 0;
height = 0;

should_draw_panel = false;
should_draw_rectangle = false;
should_draw_healthbar = false;

// rectangle
rectangle_color_top = c_black;
rectangle_color_bottom = c_black;

// sprite
sprite = noone;
subimg = 0;
sprite_offset_x = 0; // relative to origin
sprite_offset_y = 0;
sprite_x = 0;
sprite_y = 0;
sprite_color = c_white;
sprite_alpha = 1;

// text, label, text_button
font = noone;
text_halign = fa_left;
text_valign = fa_top;
text = "";
text_color = c_white;
text_offset_x = 0;
text_offset_y = 0;
text_x = 0;
text_y = 0;

// button
sprite_button_color = c_white;
sprite_hover_color = c_white;
sprite_down_color = c_white;
rectangle_button_color_top = c_white;
rectangle_button_color_bottom = c_white;
rectangle_hover_color_top = c_black;
rectangle_hover_color_bottom = c_black;
rectangle_down_color_top = c_black;
rectangle_down_color_bottom = c_black;
click_script = noone;
pressed = false;

// healthbar
bar_color = c_white;
bar_amount = 100;
bar_direction = 0; // left to right
bar_set_amount_script = noone;
bar_offset_x = 0;
bar_offset_y = 0;
bar_left = 0;
bar_right = 0;
bar_top = 0;
bar_bottom = 0;
bar_prop = noone; // enum unit_prop