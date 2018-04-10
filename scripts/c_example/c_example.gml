// Because we can't have OOP in GML, here is a hack...
// Define the object in a script like this
// Call object methods using call(instance, method, arguments...)

var method = argument[0]; // argument0 is method call
var this = (argument_count > 1) ? argument[1] : noone; // argument1 is the instance

// Define method names
enum EXAMPLE // enum should be in caps, resembling the script name without the prefix 'c_' (stands for class)
{
	my_method
}

switch(method)
{
	// CONSTRUCTOR
	case OBJECT.NEW:
		// initialize object with 'this'
		// overload constructor with a switch on argument_count (> 2 for constructor injection)
		return this;
	
	// METHODS
	// call with 'call(instance, EXAMPLE.my_method, arguments...)'
	case EXAMPLE.my_method:
		// method body
		// can overload by using a switch here on argument_count
		break;
	
	// destructor, call with 'destroy(instance)"
	case OBJECT.DESTROY:
		// destroy what needs destroying here
		instance_destroy(this);
		break;
	
	// call this usign 'test(c_example)'
	// all object unit tests should be called from here
	case OBJECT.TEST:
		// write object unit tests
		break;
	
	// default should throw an error: trying to call a method that is not defined.
	default:
		show_error("Refused request: function not defined", true);
}