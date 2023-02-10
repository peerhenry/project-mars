/// @param construction_id
function scr_hud_sprite_for_build(argument0) {
	var arg_construction_id = argument0;
	var construction = ds_map_find_value(global.construction_map, arg_construction_id);
	return construction[macro_hud_sprite];


}
