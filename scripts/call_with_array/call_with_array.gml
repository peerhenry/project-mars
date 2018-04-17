/// @arg instance
/// @arg method
/// @arg arg_array
var arg_instance = argument0;
var method = argument1;
var dummies = argument2;
var result;
switch(array_length_1d(dummies))
{
	case 0:
		result = call(arg_instance, method);
		break;
	case 1:
		result = call(arg_instance, method, dummies[0]);
		break;
	case 2:
		result = call(arg_instance, method, dummies[0], dummies[1]);
		break;
	case 3:
		result = call(arg_instance, method, dummies[0], dummies[1], dummies[2]);
		break;
	case 4:
		result = call(arg_instance, method, dummies[0], dummies[1], dummies[2], dummies[3]);
		break;
	case 5:
		result = call(arg_instance, method, dummies[0], dummies[1], dummies[2], dummies[3], dummies[4]);
		break;
}
return result;