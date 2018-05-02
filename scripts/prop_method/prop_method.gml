/// @arg name
/// @arg return_type_info
/// @arg parameters
var name = argument0;
var return_type_info = argument1;
var params = argument2;
var meth_info = new(c_method_info, [return_type_info, params]);
return new(c_class_property, [name, meth_info]);