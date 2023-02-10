/// @arg section
/// @arg key
function scr_rules_get(argument0, argument1) {
	var arg_section = argument0;
	var arg_key = argument1;

	var section = global.rules[? arg_section];
	return section[? arg_key];


}
