/// @description show message to the player
/// @param message
// show_debug_message(argument0);
if(instance_exists(obj_player_message))
{
	with(obj_player_message)
	{
		instance_destroy();
	}
}

var inst = instance_create_layer(0,0, macro_logic_layer, obj_player_message);
inst.text = argument0;