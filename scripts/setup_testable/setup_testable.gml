/// @arg class
function setup_testable(argument0) {
	var class = argument0;

	var info = void_static_unwrap(class, get_class_info);
	var inj_props = uvoid(info, "get_injected_props");
	var dummy_values = scr_from_select_morph(inj_props, "type_info", "create_dummy");
	var instance = fnew(class, dummy_values);
	destroy(info);
	return instance;


}
