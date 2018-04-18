/// @descr override the object to use on the class
/// @arg class_definition_script
/// @arg object_index
/// @arg arguments...
if(argument_count < 2) show_error("new_override expects a class definition script and an object_index", true);

var class = argument[0];
var obj_index = argument[1];
var this = instance_create_depth(0, 0, 0, obj_index);
this.class = class;
inherits(class, c_object); // default inherit object
var realthis = noone;
switch(argument_count)
{
	case 2:
		realthis = script_execute(class, constructor, this);
		break;
	case 3:
		realthis = script_execute(class, constructor, this, argument[2]);
		break;
	case 4:
		realthis = script_execute(class, constructor, this, argument[2], argument[3]);
		break;
	case 5:
		realthis = script_execute(class, constructor, this, argument[2], argument[3], argument[4]);
		break;
	case 6:
		realthis = script_execute(class, constructor, this, argument[2], argument[3], argument[4], argument[5]);
		break;
	case 7:
		realthis = script_execute(class, constructor, this, argument[2], argument[3], argument[4], argument[5], argument[6]);
		break;
	case 8:
		realthis = script_execute(class, constructor, this, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]);
		break;
	case 9:
		realthis = script_execute(class, constructor, this, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]);
		break;
	default:
		show_error("script 'new' error: too many arguments", true);
}

if(!instance_exists(realthis)) scr_panic("Constructor did not return an object.");
return realthis;