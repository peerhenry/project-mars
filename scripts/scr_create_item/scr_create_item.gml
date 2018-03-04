var arg_item_type = argument0;

enum item_type
{
	pistol,
	rifle, 
	food,
	mdu
}

// todo: new rule: macros used as map keys are prefixed with key_
#macro key_item_type 1
#macro key_item_width 2
#macro key_item_height 3
#macro key_item_charge 4
#macro key_item_capacity 5

var new_item = ds_map_create();
new_item[? key_item_width] = 1;
new_item[? key_item_height] = 1;
new_item[? key_item_type] = arg_item_type;

switch(arg_item_type)
{
	case item_type.rifle:
		new_item[? key_item_width] = 2;
	case item_type.pistol:
		new_item[? key_item_charge] = 100;
		new_item[? key_item_capacity] = 100;
		break;
	case item_type.food:
	case item_type.mdu:
		new_item[? key_item_width] = 2;
		new_item[? key_item_height] = 2;
		break;
}

return new_item;