/// @description This script performs the interaction the astronaut will have with the assignable.
/// @param assignable
var arg_assignable = argument0;
var assigned_astronaut = arg_assignable.assigned_astronaut;

// refactor option: use a custom object event
switch(arg_assignable.object_index)
{
	case obj_suit_closet:
		if(arg_assignable.holds_suit) scr_closet_take_suit(arg_assignable, assigned_astronaut);
		else scr_closet_put_suit(arg_assignable, assigned_astronaut);
		break;
	case obj_bed:
		arg_assignable.occupant = assigned_astronaut;
		arg_assignable.image_index++;
		instance_deactivate_object(assigned_astronaut);
		break;
	case obj_fridge:
		// Remove food from astronaut inventory.
		with(assigned_astronaut)
		{
			var food_x = ds_grid_value_x(inventory, 0, 0, 1, 1, macro_inventory_food);
			var food_y = ds_grid_value_y(inventory, 0, 0, 1, 1, macro_inventory_food);
			ds_grid_set_region(inventory, food_x, food_y, food_x + 1, food_y + 1, macro_inventory_empty);
		}
		// Add food to fridge inventory
		with(arg_assignable)
		{
			ds_grid_set_region(inventory, 0, 0, 1, 1, macro_inventory_occupied);
			ds_grid_set(inventory, 0, 0, macro_inventory_food);
		}
		break;
	case obj_hydroponics:
		arg_assignable.food_level = 0;
		with(assigned_astronaut)
		{
			ds_grid_set_region(inventory, 0, 0, 1, 1, macro_inventory_occupied);
			ds_grid_set(inventory, 0, 0, macro_inventory_food);
		}
		break;
}

assigned_astronaut.current_action = astronaut_action.idle;
scr_unassign_task(arg_assignable);