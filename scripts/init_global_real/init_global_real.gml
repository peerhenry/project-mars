/// @description Read/overwrite key in section
/// @arg section
/// @arg key
/// @arg value
function init_global_real(argument0, argument1, argument2) {

	var arg_section = argument0;
	var arg_key = argument1;
	var arg_value = argument2;

	var exists = ini_key_exists(arg_section, arg_key);
	var value = ini_read_real(arg_section, arg_key, arg_value);
	if(!exists) ini_write_real(arg_section, arg_key, arg_value);

	return value;


}
