var class = c_result;

switch(argument_count)
{
	case 0:
		return new(class, STATUS.OK);
	case 1:
		return new(class, STATUS.OK, argument[0]);
	default:
		show_error("Invalid argument count: " + string(argument_count), true);
}