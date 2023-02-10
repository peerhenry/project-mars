function scr_deselect_all() {
	with(obj_movable){
		is_selected = false;
		if(object_index == obj_cart)
		{
			if(deploy) scr_ghost_reset();
			deploy = false;
		}
	}
	with(obj_constructable) is_selected = false;


}
