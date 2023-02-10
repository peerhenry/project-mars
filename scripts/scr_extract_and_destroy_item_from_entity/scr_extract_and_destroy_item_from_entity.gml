/// @param unit
/// @param inv_space
function scr_extract_and_destroy_item_from_entity(argument0, argument1) {
	var arg_unit = argument0;
	var arg_item_type = argument1;

	var item = scr_inventory_extract( arg_unit.inventory, arg_item_type );
	if( item != noone )
	{
		with(arg_unit)
		{
			if(equipped_item == item) equipped_item = noone;
		}
		instance_destroy( item );
		return true;
	}
	else return false;


}
