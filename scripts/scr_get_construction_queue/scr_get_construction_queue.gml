/// @param astronaut
var arg_astronaut = argument0;

if(arg_astronaut.owner == macro_player)
{
	return global.construction_queue;
}
return noone;