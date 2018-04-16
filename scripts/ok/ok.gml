var class = c_result;

switch(argument_count)
{
	case 0:
		return new_override(class, obj_result, STATUS.OK);
	case 1:
		return new_override(class, obj_result, STATUS.OK, argument[0]);
	default:
		scr_panic("Invalid argument count: " + string(argument_count));
}