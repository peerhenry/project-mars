var arg_item_type = argument0;

var new_item = instance_create_depth(0, 0, 0, obj_item);
new_item.type = arg_item_type;
new_item.size = scr_item_type_size(arg_item_type);
switch(arg_item_type)
{
	case inv_space.pistol:
		new_item.name = "Pistol";
		new_item.charge = 100;
		new_item.class = item_class.weapon;
		break;
	case inv_space.rifle:
		new_item.name = "Rifle";
		new_item.charge = 100;
		new_item.class = item_class.weapon;
		break;
	case inv_space.food:
		new_item.name = "Food";
		new_item.class = item_class.food;
		break;
	case inv_space.mdu:
		new_item.name = "MDU";
		new_item.class = item_class.construction;
		break;
}
return new_item;