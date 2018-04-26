/// @arg class
/// @arg arguments...
if(argument_count == 0) scr_panic("new must be called with at least the class definition script");

var class = argument[0];
var this = instance_create_depth(0, 0, 0, obj_empty);
this.class = class;
var realthis = noone;
switch(argument_count)
{
	case 1:
		realthis = script_execute(class, constructor, this);
		break;
	case 2:
		realthis = script_execute(class, constructor, this, argument[1]);
		break;
	case 3:
		realthis = script_execute(class, constructor, this, argument[1], argument[2]);
		break;
	case 4:
		realthis = script_execute(class, constructor, this, argument[1], argument[2], argument[3]);
		break;
	case 5:
		realthis = script_execute(class, constructor, this, argument[1], argument[2], argument[3], argument[4]);
		break;
	case 6:
		realthis = script_execute(class, constructor, this, argument[1], argument[2], argument[3], argument[4], argument[5]);
		break;
	case 7:
		realthis = script_execute(class, constructor, this, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6]);
		break;
	case 8:
		realthis = script_execute(class, constructor, this, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]);
		break;
	default:
		scr_panic("script 'new' error: too many arguments");
}

if(!instance_exists(realthis)) scr_panic("Constructor did not return an object.");
return realthis;