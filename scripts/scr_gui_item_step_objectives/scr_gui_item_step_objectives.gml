/// @arg item
var arg_item = argument0;

with(arg_item)
{
	var nr_of_objectives = 0;
	var max_w = 0;
	with(level)
	{
		for(var n = 0; n < ds_list_size(trigger_list); n++)
		{
			var next_trigger = trigger_list[|n];
			if(next_trigger.type == trigger_type.objective) nr_of_objectives++;
			
			draw_set_font(other.font);
			var line_w = string_width(next_trigger.name);
			if(line_w > max_w) max_w = line_w;
		}
	}
	if(max_w != current_max_string_w)
	{
		current_max_string_w = max_w;
		width = max_w + 3*padding + sprite_get_width(spr_checked); // 2 paddings left and right + 1 in between sprite and text
	}
	if(nr_of_objectives != prev_nr_of_objectives)
	{
		height = line_offset * nr_of_objectives - line_space + 2*padding;
		prev_nr_of_objectives = nr_of_objectives;
	}
}