/// @arg return_type_info
/// @arg parameters
function t_method() {
	switch(argument_count)
	{
		case 0:
			return fnew(c_method_info);
		case 1:
			return fnew(c_method_info, argument[0]);
		case 2:
			return fnew(c_method_info, [ argument[0], argument[1] ]);
	}


}
