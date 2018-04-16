/// @arg class
/// @arg dependency name
/// @arg interface
var arg_class = argument0;
var arg_name = argument1; // name of the dependency
var arg_interface = argument2;

var dependency_map = global.dependency_map;

var dependencies = dependency_map[? arg_class]; // get dependencies for class
if(is_undefined(dependencies))
{
	// make new dependencies
	dependencies = ds_map_create();
	dependency_map[? arg_class] = dependencies;
}

var existing_interface = dependencies[? arg_name];
if(is_undefined(existing_interface))
{
	dependencies[? arg_name] = arg_interface;
}
else destroy(arg_interface);