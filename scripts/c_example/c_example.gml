// Because we can't have OOP in GML, here is a hack...
// Define the object in a script like this
// Call object methods using call(instance, method, arguments...)

var method = argument[0]; // argument0 is method call
var this = (argument_count > 1) ? argument[1] : noone; // argument1 is the instance


switch(method)
{
	// CONSTRUCTOR
	case constructor:
		// initialize object with 'this'
		// overload constructor with a switch on argument_count (> 2 for constructor injection)
		return this;
	
	// destructor, call with 'destroy(instance)"
	case destructor:
		// destroy what needs destroying here
		instance_destroy(this);
		break;
	
	// METHODS
	// call with 'call(instance, EXAMPLE.my_method, arguments...)'
	case "my_method":
		// method body
		// can overload by using a switch here on argument_count
		break;
	
	// This method is necessary if you want to be able test:
	// 1. That the client calls its dependencies correctly (by using mock)
	// 2. That another class is able to serve this one.
	case register_dependencies:
		break;
	
	// call this usign 'test(c_example)'
	// all object unit tests should be called from here
	case test:
		// write object unit tests
		break;
	
	// default should return refused() for the purpose of inheritance
	// when the method is not defined the "call" script will get a refused result and can then try to call the parent
	// Naturally, you should always use "call" to make a method call.
	default:
		return refused();
}