function scr_get_tooltip_text(argument0) {
	var arg_build = argument0;
	var cc = ds_map_find_value(global.construction_map, arg_build);
	return cc[macro_name];


}
