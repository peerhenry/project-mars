/// @arg name
/// @arg (opt)NOT_INJECTED
function owned_list() {
	var name = argument[0];
	var state = argument_count == 2 ? OWNED | argument[1] : OWNED;
	return prop_list(name, OWNED);


}
