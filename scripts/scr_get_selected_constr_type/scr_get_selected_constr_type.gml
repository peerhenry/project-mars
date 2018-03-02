var c_type = global.construction_ghost[? macro_ghost_constr_type];

// check if a cart with a thing is selected
/*
if(c_type == noone)
{
	var selected_cart = noone;
	var multi_select = false;
	with(obj_movable)
	{
		if( is_selected )
		{
			if(object_index == obj_cart)
			{
				if(selected_cart == noone) selected_cart = id;
				else
				{
					multi_select = true;
					break;
				}
			}
			else 
			{
				multi_select = true;
				break;
			}
		}
	}
	if( !multi_select )
	{
		with( selected_cart )
		{
			if( owner == macro_player && carrying_instance != noone )
			{
				c_type = scr_get_construction_type(carrying_instance);
			}
		}
	}
}
*/

return c_type;