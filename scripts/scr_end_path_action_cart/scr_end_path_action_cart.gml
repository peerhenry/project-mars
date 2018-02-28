/// @descr performs and updates the current action
/// @arg task_actor
var arg_cart = argument0;
debug_instance_inherits(arg_cart, obj_cart);

with(arg_cart)
{
	switch(action)
	{
		case cart_action.move:
			break;
		case cart_action.pickup:
			if(assigned_instance != noone)
			{
				// disconnect instance from grid and destroy icon
				scr_destroy_instance_grid_logic(assigned_instance);
				if(variable_instance_exists(assigned_instance, "icon") && assigned_instance.icon != noone) instance_destroy(assigned_instance.icon);
				// set carrying instance and update position
				carrying_instance = assigned_instance;
				carrying_instance.visible = false; // drawn in cart draw event
				carrying_instance.x = x;
				carrying_instance.y = y;
				carrying_instance.occ_i = occ_i;
				carrying_instance.occ_j = occ_j;
			}
			break;
		case cart_action.deploy:
			// place instance on location
			if(ghost != noone)
			{
				carrying_instance.x = ghost.x;
				carrying_instance.y = ghost.y;
				carrying_instance.occ_i = ghost.occ_i;
				carrying_instance.occ_j = ghost.occ_j;
				carrying_instance.visible = true;
				instance_destroy(ghost);
				scr_grid_logic(carrying_instance);
				assigned_instance = noone;
				carrying_instance = noone;	
			}
			break;
	}
	action = cart_action.idle;
}