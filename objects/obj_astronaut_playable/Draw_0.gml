if(is_selected)
{
	draw_set_colour(c_black);
	var onlyOutline = true;
	//draw_rectangle(x-16, y-16, x+16, y+16, onlyOutline);	
	draw_sprite(spr_selection, 0, x, y);
}

if(current_action == astronaut_action.constructing)
{
	var completion = construction_instance[? construction_completion];
	draw_healthbar(x-16, y-24, x+16, y-20, completion, c_black, c_yellow, c_yellow, 0, true, true);
}

event_inherited();