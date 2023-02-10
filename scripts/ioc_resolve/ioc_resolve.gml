/// @arg ioc_container
/// @arg name
function ioc_resolve(argument0, argument1) {
	var container = argument0;
	var name = argument1;
	return call_unwrap(container, "resolve", name);


}
