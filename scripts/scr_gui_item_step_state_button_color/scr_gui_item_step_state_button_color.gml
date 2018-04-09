/// @arg button
with(argument0)
{	
	var state = script_execute(get_state, id);
	sprite_color = state ? c_aqua : c_black;
}