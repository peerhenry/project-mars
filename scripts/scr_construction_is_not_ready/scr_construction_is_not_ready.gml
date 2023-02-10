/// ready to begin construction
/// @param construction
function scr_construction_is_not_ready(argument0) {
	return ds_map_find_value(argument0, construction_build_state) == construction_state.not_ready;


}
