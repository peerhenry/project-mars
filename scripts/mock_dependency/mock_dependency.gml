/// @arg class
/// @arg dependency_name
var class = argument0;
var name = argument1;
var deps = in(class, get_dependencies, name);
var interface = call(deps, "extract_interface", name);
destroy(deps);
return mock(interface);