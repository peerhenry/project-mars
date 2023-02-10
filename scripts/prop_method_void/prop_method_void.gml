/// @arg name
/// @arg return_type_info
function prop_method_void(argument0, argument1) {
	var name = argument0;
	var return_type_info = argument1;
	var meth_info = fnew(c_method_info, return_type_info);
	return fnew(c_class_property, [name, meth_info]);


}
