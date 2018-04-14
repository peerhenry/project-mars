/// @descr override the object to use on the class
/// @arg class_definition_script
/// @arg object_index
if(argument_count < 2) show_error("new_override expects a class definition script and an object_index", true);

var script = argument[0];
var this = instance_create_depth(0, 0, 0, argument[1]);
this.class = script;
inherits(class, c_object); // default inherit object

switch(argument_count)
{
	case 2:
		return script_execute(script, constructor, this);
	case 3:
		return script_execute(script, constructor, this, argument[2]);
	case 4:
		return script_execute(script, constructor, this, argument[2], argument[3]);
	case 5:
		return script_execute(script, constructor, this, argument[2], argument[3], argument[4]);
	case 6:
		return script_execute(script, constructor, this, argument[2], argument[3], argument[4], argument[5]);
	case 7:
		return script_execute(script, constructor, this, argument[2], argument[3], argument[4], argument[5], argument[6]);
	case 8:
		return script_execute(script, constructor, this, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]);
	case 9:
		return script_execute(script, constructor, this, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]);
	default:
		show_error("script 'new' error: too many arguments", true);
}