/// @arg class
/// @arg arguments...
if(argument_count != 2) scr_panic("new_with_array must be called with the class definition script and an array of arguments");

var class = argument[0];
var arguments = argument[1];

var this = instance_create_depth(0, 0, 0, obj_empty);
this.class = class;

switch(array_length_1d(arguments))
{
	case 1:
		return script_execute(class, constructor, this);
	case 2:
		return script_execute(class, constructor, this, arguments[0]);
	case 3:
		return script_execute(class, constructor, this, arguments[0], arguments[1]);
	case 4:
		return script_execute(class, constructor, this, arguments[0], arguments[1], arguments[2]);
	case 5:
		return script_execute(class, constructor, this, arguments[0], arguments[1], arguments[2], arguments[3]);
	default:
		scr_panic("script 'new' error: too many arguments");
}