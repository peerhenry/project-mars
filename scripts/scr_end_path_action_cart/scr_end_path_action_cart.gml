/// @descr performs and updates the current action
/// @arg task_actor
var arg_cart = argument0;
debug_instance_inherits(arg_cart, obj_cart);

with(arg_cart)
{
	switch(action)
	{
		case cart_action.idle:
			// show_debug_message("cart end path action idle"); // debug
			break;
		case cart_action.move:
			// show_debug_message("cart end path action move"); // debug
			break;
		case cart_action.pickup:
			// show_debug_message("cart end path action pickup"); // debug
			if(assigned_instance != noone)
			{
				scr_navgrid_clear_cell( assigned_instance.occ_i, assigned_instance.occ_j );
				// disconnect instance from grid and destroy icon
				scr_decouple_from_grid(assigned_instance);
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
			// show_debug_message("cart end path action deploy"); // debug
			if(deploy_ghost != noone)
			{
				carrying_instance.x = deploy_ghost.x;
				carrying_instance.y = deploy_ghost.y;
				carrying_instance.occ_i = deploy_ghost.occ_i;
				carrying_instance.occ_j = deploy_ghost.occ_j;
				carrying_instance.visible = true;
				instance_destroy(deploy_ghost);
				scr_grid_logic(carrying_instance);
				assigned_instance = noone;
				carrying_instance = noone;
				if(global.cart_deploy_mode) scr_ghost_reset();
				deploy = false;
				global.cart_deploy_mode = false;
			}
			break;
	}
	action = cart_action.idle;
}