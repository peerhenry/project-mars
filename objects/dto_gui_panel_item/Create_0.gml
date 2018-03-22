#region enums

enum details_panel_component_class
{
	text,		// pure text
	label,		// text in a square
	bar,		// need bar or health bar
	sprite,		// pure sprite
	avatar,		// sprite in square
	sprite_button,
	text_button,
	inventory
}

enum details_panel_action
{
	none,
	center,
	deselect,
	deploy,
	show_grid_details
}

enum unit_prop
{
	none,
	health_integrity, // todo: this is to become obsolete
	entity_health,
	integrity,
	sleep,
	food,
	battery_charge,
	suit_oxygen
}

#endregion

hover = false;
prop_value = 0; // used if the component represents a property

class = details_panel_component_class.text;
unit = noone;

top = 0;
left = 0;
right = 0;
down = 0;
width = 0;
height = 0;

tooltip_text = ""; // todo: refactor to dto_tooltip

// for: text, label & text_button
font = font_small;
text = "";
valign = fa_top;
halign = fa_left;
text_color = c_white;
text_x = 0;
text_y = 0;

// for: sprite_button, avatar, sprite
sprite = noone;
subimg = 0;
sprite_x = 0;
sprite_y = 0;
sprite_color = c_white;

// for: label, avatar, sprite_button, text_button
rectangle_color_top = c_black;
rectangle_color_bottom = c_black;

// for: sprite_button, text_button
color_hover_top = c_gray;
color_hover_bottom = c_dkgray;
color_down_top = c_black;
color_down_bottom = c_black;
draw_as_panel = false;
action = details_panel_action.none;

// for: bar
bar_color = c_white;
unit_property = unit_prop.none;