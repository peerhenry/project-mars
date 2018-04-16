/// @descr unwraps a result object, returns the value and destroys the result object itself.
/// @arg result
var result = argument0;
var value = script_execute(result.class, "unwrap", result);
destroy(result);
return value;