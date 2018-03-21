/// @description Format position as "x,y"
/// @arg x
/// @arg y
/// @arg [glue_override]
var glue = (argument_count > 2 && argument[2]) ? argument[2] : ",";
return string(argument0) + glue + string(argument1);