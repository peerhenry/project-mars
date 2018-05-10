/// @arg name
var name = argument0;
var sig = argument1;

enum SIG
{
	VOID_TO_VOID,
	//ANY_TO_ANY,
	STRING_TO_STRING,
	//NUMBER_TO_NUMBER,
	//INTEGER_TO_INTEGER,
	
	VOID_TO_ANY,
	//ANY_TO_VOID,
	
	STRING_TO_VOID
	//VOID_TO_STRING
}

var return_type_info;
var params = [];

switch(sig)
{
	case SIG.VOID_TO_VOID:
		return_type_info = t_void();
		break;
	case SIG.STRING_TO_VOID:
		return_type_info = t_void();
		params = [p_string("a")];
		break;
	case SIG.STRING_TO_STRING:
		return_type_info = t_string();
		params = [p_string("a")];
		break;
	case SIG.VOID_TO_ANY:
		return_type_info = t_any();
		break;
}

var meth_info = (scr_length(params) > 0) ? new(c_method_info, [return_type_info, params]) : new(c_method_info, return_type_info);
return new(c_class_property, [name, meth_info]);