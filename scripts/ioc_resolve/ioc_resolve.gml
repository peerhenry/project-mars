/// @arg ioc_container
/// @arg name
var container = argument0;
var name = argument1;
return call_unwrap(container, "resolve", name);