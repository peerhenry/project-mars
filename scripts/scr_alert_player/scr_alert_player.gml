/// @description show message to the player
/// @param message
if(instance_exists(obj_player_message))
{
	with(obj_player_message)
	{
		instance_destroy();
	}
}

var inst = instance_create_depth(global.gui, 0, 0, obj_player_message);
inst.text = argument0;
with(obj_HUD_objectives)
{
	inst.top += height;
}