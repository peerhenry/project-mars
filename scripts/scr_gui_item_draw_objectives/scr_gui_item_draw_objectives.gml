/// @arg item
var arg_item = argument0;
with(arg_item)
{
	scr_draw_panel(left, top, left + width, top + height);

	draw_set_font(font);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	var line_left = left + padding;
	var text_x = left + sprite_get_width(spr_checked) + 2*padding;
	var counter = 0;

	with(level)
	{
		for(var n = 0; n < ds_list_size(trigger_list); n++)
		{
			var next_trigger = trigger_list[|n];
			if(next_trigger.type == trigger_type.objective)
			{
				var next_y = other.top + other.padding + counter*other.line_offset;
				
				if(next_trigger.accomplished) draw_sprite(spr_checked, 0, line_left, next_y);
				else draw_sprite(spr_unchecked, 0, line_left, next_y);
				
				var text_y = next_y + (other.line_height - other.font_height)/2;
				draw_text(text_x, text_y, next_trigger.name);
				counter++;
			}
		}
	}
}