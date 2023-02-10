function scr_validate_i(argument0, argument1) {
	// validate inside/outside
	var arg_validation_i = argument0;
	var arg_map_i = argument1;

	if(arg_validation_i == build_validation_i.inside) return arg_map_i == 1;
	if(arg_validation_i == build_validation_i.outside) return arg_map_i == 0;

	return true; // validation_i == build_validation_i.any


}
