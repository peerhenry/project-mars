/// @param unit
/// @param inv_space
function scr_give_entity_new_item(argument0, argument1) {
	var arg_unit = argument0;
	var arg_item_type = argument1;

	var new_item = scr_create_item(arg_item_type);
	var succeeded = scr_inventory_insert(arg_unit.inventory, new_item);
	if(!succeeded)
	{
		instance_destroy(new_item);
		new_item = noone;
	}
	else
	{
		if(
			scr_instance_inherits(arg_unit, obj_task_actor) 
			&& arg_unit.equipped_item == noone 
			&& new_item.class == item_class.weapon
		)
		{
			arg_unit.equipped_item = new_item;
		}
	}

	return new_item;


}
