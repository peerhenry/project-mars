/// @arg return_type_info
/// @arg parameters
switch(argument_count)
{
	case 0:
		return new(c_method_info);
	case 1:
		return new(c_method_info, argument[0]);
	case 2:
		return new(c_method_info, [ argument[0], argument[1] ]);
}