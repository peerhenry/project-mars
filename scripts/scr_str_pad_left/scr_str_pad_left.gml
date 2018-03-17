/// @description Pad string to left
/// @arg string
/// @arg padding char
/// @arg length

var arg_txt = argument0;
var arg_padding_char = argument1;
var arg_length = argument2;

var pad_length = arg_length - string_length(arg_txt);

return pad_length*arg_padding_char + arg_txt;