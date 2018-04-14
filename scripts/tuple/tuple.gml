if(argument_count == 0) show_error("Tuple must get at least one value", true);

var class = c_tuple;
switch(argument_count)
{
	case 1:
		return new(class, argument[0]);
	case 2:
		return new(class, argument[0], argument[1]);
	case 3:
		return new(class, argument[0], argument[1], argument[2]);
	case 4:
		return new(class, argument[0], argument[1], argument[2], argument[3]);
	case 5:
		return new(class, argument[0], argument[1], argument[2], argument[3], argument[4]);
	case 6:
		return new(class, argument[0], argument[1], argument[2], argument[3], argument[4], argument[5]);
	case 7:
		return new(class, argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6]);
	case 8:
		return new(class, argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]);
	default:
		show_error("script 'new' error: too many arguments", true);
}