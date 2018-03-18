/// @description

scr_draw_panel(left, top, left + 300, top + height); // todo: calculate width based on content

draw_set_font(font);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var has_objectives = false; // DEBUG

var line_left = left + pad;
var text_x = left + sprite_get_width(spr_checked) + 2*other.pad;
var counter = 0;

with(level)
{
	for(var n = 0; n < ds_list_size(trigger_list); n++)
	{
		var next_trigger = trigger_list[|n];
		if(next_trigger.type == trigger_type.objective)
		{
			var next_y = other.top + other.pad + counter*other.line_offset;
			if(next_trigger.accomplished) draw_sprite(spr_checked, 0, line_left, next_y);
			else draw_sprite(spr_unchecked, 0, line_left, next_y);
			var text_y = next_y + (other.line_height - other.font_height)/2;
			draw_text(text_x, text_y, next_trigger.name);
			counter++;
		}
	}
}

// rest is DEBUG
if(counter == 0)
{
	var n = 0;
	repeat(3)
	{
		var next_y = top + pad + n*line_offset;
		draw_sprite(spr_checked, 0, left + pad, next_y);
		var text = "level != noone: " + string(level != noone);
		if(n == 1 && level != noone) text = "ds_list_size(trigger_list): " + string(ds_list_size(level.trigger_list));
		
		draw_text(left + sprite_get_width(spr_checked) + 2*pad, next_y + (line_height - font_height)/2, text);
		n++;
	}
}