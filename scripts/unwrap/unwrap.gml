/// @descr unwraps a result object, returns the value and destroys the result object itself.
/// @arg result
function unwrap(argument0) {
	var result = argument0;
	var value = script_execute(result.class, "unwrap", result);
	instance_destroy(result);
	return value;


}
