function scr_create_dummy_construction() {
	return scr_new_construction(
		ds_list_create(),	// cell list
		noone,	// prerequisite
		32,		// bounding box
		0,		// "
		0,		// "
		32,		// "
		macro_player,		// owner
		0		// metal
	);


}
