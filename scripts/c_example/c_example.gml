// Because we can't have OOP in GML, here is a hack...
// Define the object in a script like this
// Call object methods using call(instance, method, arguments...)

var method = argument0;
var this = argument1;
var args = argument2;

switch(method)
{
	// CONSTRUCTOR
	case constructor:
		// initialize object with 'this'
		// overload constructor with a switch on argument_count (> 2 for constructor injection)
		return this;
	
	// destructor, call with 'destroy(instance)"
	case destructor:
		// cleanup related resources
		return ok();
	
	// METHODS
	// call methods with the script call if it needs arguments, or void if it takes no arguments
	case "my_method":
		// method body
		// can overload by using a switch here on argument_count
		break;
	
	// This method is necessary to enable:
	// 1. Testing that the client calls its dependencies correctly (by using mock)
	// 2. Testing that another class is able to serve this one.
	// 3. Resolving dependencies in the ioc container
	case get_dependencies:
		return ok(noone);
	
	// todo: write explanation here about dependency registration, and standard class testing
	case get_clients:
		return ok(noone);
	
	// call this using 'test_class(c_example)'
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