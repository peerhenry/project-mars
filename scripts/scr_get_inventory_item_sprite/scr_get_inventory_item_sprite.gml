/// @param item_type
function scr_get_inventory_item_sprite(argument0) {
	var arg_item_type = argument0;

	switch(arg_item_type)
	{
		case inv_space.pistol:
			return spr_inv_pistol;
		case inv_space.food:
			return spr_inv_food;
		case inv_space.mdu:
			return spr_inv_module;
		case inv_space.rifle:
			return spr_inv_rifle;
	}


}
