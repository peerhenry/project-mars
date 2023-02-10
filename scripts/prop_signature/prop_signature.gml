function prop_signature(argument0, argument1, argument2) {
	// Use this when parameter names are irrelevant
	/// @arg name
	/// @arg return_type_info
	/// @arg param_type_infos
	var name = argument0;
	var return_type_info = argument1;
	var p_types = argument2;
	if(!is_array(p_types)) p_types = [p_types];
	var params;
	for(var n = scr_length(p_types)-1; n >= 0; n--)
	{
		var ti = p_types[n];
		var p = fnew(c_parameter, ["p" + string(n), ti]);
		params[n] = p;
	}
	var meth_info = fnew(c_method_info, [return_type_info, params]);
	return fnew(c_class_property, [name, meth_info]);


}
