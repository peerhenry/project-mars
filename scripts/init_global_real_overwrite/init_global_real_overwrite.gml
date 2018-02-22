var arg_section = argument0;
var arg_key = argument1;
var arg_value = argument2;

// var exists = ini_key_exists(arg_section, arg_key);
var value = ini_read_real(arg_section, arg_key, arg_value);
ini_write_real(arg_section, arg_key, arg_value);

return value;