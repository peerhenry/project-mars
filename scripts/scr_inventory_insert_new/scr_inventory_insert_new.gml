/// @param inventory
/// @param inv_space
var arg_inventory = argument0;
var arg_item_type = argument1;

var new_item = instance_create_depth(0, 0, 0, obj_item);
new_item.type = arg_item_type;
new_item.size = scr_item_type_size(arg_item_type);
switch(arg_item_type)
{
	case inv_space.pistol:
	case inv_space.rifle:
		new_item.charge = 100;
		break;
}

var succeeded = scr_inventory_insert(arg_inventory, new_item);
if(!succeeded) instance_destroy(new_item);

return succeeded;