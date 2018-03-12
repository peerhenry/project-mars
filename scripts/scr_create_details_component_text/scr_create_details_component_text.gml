/// @arg unit
/// @arg x
/// @arg y
/// @arg font
/// @arg text
/// @arg valing
/// @arg halign
var arg_unit = argument0;
var arg_x = argument1;
var arg_y = argument2;
var arg_font = argument3;
var arg_text = argument4;
var arg_valign = argument5;
var arg_halign = argument6;

var dto = instance_create_depth(0, 0, 0, dto_details_panel_component);

with(dto)
{
	unit = arg_unit;
	class = details_panel_component_class.text;
	font = arg_font;
	text_color = c_white;
	text_x = arg_x;
	text_y = arg_y;
	text = arg_text;
	valign = arg_valign;
	halign = arg_halign;
	
	draw_set_font(font);
	var sw = string_width(text);
	var sh = string_height(text);
	left = text_x;
	top = text_y;
	width = sw;
	height = sh;
	right = left + width;
	bottom = top + height;
}

return dto;