
var nr_of_objectives = 0; // 3 is DEBUG
with(level)
{
	for(var n = 0; n < ds_list_size(trigger_list); n++)
	{
		var next_trigger = trigger_list[|n];
		if(next_trigger.type == trigger_type.objective) nr_of_objectives++;
	}
}
if(nr_of_objectives != prev_nr_of_objectives)
{
	height = line_offset * nr_of_objectives - line_space + 2*pad;
	prev_nr_of_objectives = nr_of_objectives;
}