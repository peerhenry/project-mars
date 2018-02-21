if(current_action == astronaut_action.constructing)
{
	var completion = construction[? construction_completion];
	draw_healthbar(x-16, y-24, x+16, y-20, completion, c_black, c_yellow, c_yellow, 0, true, true);
}

event_inherited();