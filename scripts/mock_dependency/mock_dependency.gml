/// @arg class
/// @arg dependency_name
var class = argument0;
var name = argument1;
var deps = call_unwrap(class, get_dependencies, name);
var interface = call_unwrap(deps, "extract_interface", name);
destroy(deps);
return mock(interface);