function scr_create_dummy_constructable() {
	var constr = instance_create_depth(32, 32, 0, obj_constructable);
	scr_set_new_grid_props(constr, macro_grid_electric, macro_grid_role_consumer, 5);
	constr.under_construction = false;
	return constr;


}
