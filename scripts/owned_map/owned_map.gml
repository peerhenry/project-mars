/// @arg name
/// @arg (opt)NOT_INJECTED
var name = argument[0];
var state = argument_count == 1 ? OWNED | argument[1] : OWNED;
return prop_map(name, OWNED);