/// @descr Mock class 
var method = argument0;
var this = argument1;
var args = argument2;
var here = c_class_property;

switch(method)
{
	case constructor:
		this.name = args[0];
		this.type_info = args[1];
		this.is_borrowed = true;
		this.gets_injected = true;
		return this;

	case destructor:
		destroy(this.type_info);
		return ok();
	
	case test:
		break;
	
	default:
		return refused();
}