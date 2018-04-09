enum OBJECT
{
	NEW = 9000,
	DESTROY = 9001,
	TEST = 9002
}

if(argument_count == 0) show_error("new must be called with at least the object definition script", true);

var script = argument[0];
var this = instance_create_depth(0, 0, 0, obj_empty);
this.script = script;

switch(argument_count)
{
	case 1:
		return script_execute(script, OBJECT.NEW, this);
	case 2:
		return script_execute(script, OBJECT.NEW, this, argument[1]);
	case 3:
		return script_execute(script, OBJECT.NEW, this, argument[1], argument[2]);
	case 4:
		return script_execute(script, OBJECT.NEW, this, argument[1], argument[2], argument[3]);
	case 5:
		return script_execute(script, OBJECT.NEW, this, argument[1], argument[2], argument[3], argument[4]);
	case 6:
		return script_execute(script, OBJECT.NEW, this, argument[1], argument[2], argument[3], argument[4], argument[5]);
	case 7:
		return script_execute(script, OBJECT.NEW, this, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6]);
	case 8:
		return script_execute(script, OBJECT.NEW, this, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]);
	default:
		show_error("script 'new' error: too many arguments", true);
}