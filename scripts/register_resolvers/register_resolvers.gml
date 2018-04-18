/// @arg ioc_container
/// @arg client
/// @arg array_of_classes
var container = argument0;
var client = argument1;
var injection_classes = argument2;
var injections = map_script(injection_classes, resolver);
call_unwrap(container, "set_injections", client, injections);