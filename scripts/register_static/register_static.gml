/// @arg client
/// @arg array_of_classes
var container = global.ioc_container;
var client = argument0;
var injection_classes = argument1;
var injections = map_script(injection_classes, resolver);
call_unwrap(container, "set_injections", client, injections);