/// @description show message to the player
/// @param message
var replacing_notification = false;
if(instance_exists(obj_player_message))
{
	with(obj_player_message)
	{
		replacing_notification = true;
		instance_destroy();
	}
}
var topleft_container = global.gui_topleft;
var inst = instance_create_depth(topleft_container, 0, 0, obj_player_message);
inst.text = argument0;
if(replacing_notification) topleft_container.reset = true; // container should update geometry