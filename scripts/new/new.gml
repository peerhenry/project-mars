/// @arg class
/// @arg arguments...
if(argument_count == 0) scr_panic("new must be called with at least the class definition script");

#macro constructor "constructor"

var class = argument[0];
var this = instance_create_depth(0, 0, 0, obj_empty);
this.class = class;
inherits(class, c_object); // default inherit object

switch(argument_count)
{
	case 1:
		return script_execute(class, constructor, this);
	case 2:
		return script_execute(class, constructor, this, argument[1]);
	case 3:
		return script_execute(class, constructor, this, argument[1], argument[2]);
	case 4:
		return script_execute(class, constructor, this, argument[1], argument[2], argument[3]);
	case 5:
		return script_execute(class, constructor, this, argument[1], argument[2], argument[3], argument[4]);
	case 6:
		return script_execute(class, constructor, this, argument[1], argument[2], argument[3], argument[4], argument[5]);
	case 7:
		return script_execute(class, constructor, this, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6]);
	case 8:
		return script_execute(class, constructor, this, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]);
	default:
		scr_panic("script 'new' error: too many arguments");
}