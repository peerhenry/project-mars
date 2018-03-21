#macro macro_gui_event_update 0
#macro macro_gui_event_draw 1

enum gui_item_class
{
	none,
	container,
	label,
	button // hover and down behavior
}

class = gui_item_class.none;
hover = false;
container = noone;

tooltip_data = noone; // dto_tooltip
update_script = noone;
draw_script = scr_guit_item_draw_standard;

left = 0;
top = 0;
right = 0;
bottom = 0;
width = 0;
height = 0;

// 1. panel
// 2. rectangle
// 3. sprite
// 4. healthbar
// 5. text

should_draw_panel = false;
should_draw_rectangle = false;
should_draw_healthbar = false;

// rectangle
rectangle_color_top = c_black;
rectangle_color_bottom = c_black;

// sprite
sprite = noone;
subimg = 0;
sprite_x = 0;
sprite_y = 0;
sprite_color = c_white;
sprite_alpha = 1;

// text, label, text_button
font = noone;
halign = fa_left;
valign = fa_top;
text = "";
text_color = c_white;
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

// healthbar
bar_color = c_white;
bar_amount = 100;
bar_direction = 0; // left to right
bar_set_amount_script = noone;
bar_left = 0;
bar_right = 0;
bar_top = 0;
bar_bottom = 0;
bar_prop = noone; // enum unit_prop