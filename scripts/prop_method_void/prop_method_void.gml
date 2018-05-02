/// @arg name
/// @arg return_type_info
var name = argument0;
var return_type_info = argument1;
var meth_info = new(c_method_info, return_type_info);
return new(c_class_property, [name, meth_info]);