/// @arg section
/// @arg key
var arg_section = argument0;
var arg_key = argument1;

var section = global.rules[? arg_section];
return section[? arg_key];