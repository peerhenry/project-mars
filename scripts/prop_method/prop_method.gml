/// @arg name
/// @arg return_type_info
/// @arg parameters
function prop_method(argument0, argument1, argument2) {
	var name = argument0;
	var return_type_info = argument1;
	var params = argument2;
	var meth_info = fnew(c_method_info, [return_type_info, params]);
	return fnew(c_class_property, [name, meth_info]);


}
