/// @description Format width and height as "[width]x[height]"
/// @arg width
/// @arg height
/// @arg [glue_override]
function scr_format_size() {
	var glue = (argument_count > 2 && argument[2]) ? argument[2] : "x";
	return string(argument0) + glue + string(argument1);


}
