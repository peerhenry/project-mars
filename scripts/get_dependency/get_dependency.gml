/// @arg class
/// @arg dependency name
var arg_class = argument0;
var name = argument1; // name of the dependency

var dependency_map = global.dependency_map;

var dependencies = dependency_map[? arg_class]; // get dependencies for class
if(is_undefined(dependencies))
{
	in(arg_class, register_dependencies);
	dependencies = dependency_map[? arg_class];
	if(is_undefined(dependencies)) scr_panic("There are no registered dependencies for: " + script_get_name(arg_class));
}
var result = dependencies[? name];
if(is_undefined(dependencies)) scr_panic("Dependency " + name + " not found for: " + script_get_name(arg_class));
if(!instance_exists(result)) scr_panic("Dependency " + name + " for: " + script_get_name(arg_class) + " is not an existing instance!");
if(result.object_index != obj_interface) scr_panic("Dependency " + name + " for: " + script_get_name(arg_class) + " is not an obj_interface!");
return result;