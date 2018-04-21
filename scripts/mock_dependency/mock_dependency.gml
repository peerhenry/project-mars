/// @arg class
/// @arg dependency_name
var class = argument0;
var name = argument1;
var interface = in(class, get_dependency, name);
return mock(interface);