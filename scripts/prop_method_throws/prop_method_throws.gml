function prop_method_throws(argument0, argument1, argument2) {
	// use this when the method throws an exception with default dummy arguments
	/// @arg name
	/// @arg return_type_info
	/// @arg parameters
	var name = argument0;
	var return_type_info = argument1;
	var params = argument2;
	var meth_info = fnew(c_method_info, [return_type_info, params]);
	meth_info.throws_exception = true;
	var prop = fnew(c_class_property, [name, meth_info]);
	return prop;


}
