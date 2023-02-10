/// @Description gets a construction that requires 1 mdu
function scr_create_dummy_mdu_construction() {
	var script_container = global.script_container;
	var temp_reg = script_container_resolve(script_container, "calculate_required_mdu_count");
	script_container_register(script_container, "calculate_required_mdu_count", scr_mock_return_1);
	var constr = scr_new_construction(
		ds_list_create(), // cell list
		noone,	// prerequisite
		32,		// bounding box
		0,		// "
		0,		// "
		32,		// "
		macro_player,		// owner
		0		// metal
	);

	// restore registered script
	script_container_register(script_container, "calculate_required_mdu_count", temp_reg);
	return constr;


}
