var arg_data = argument0;
var arg_types = argument1;

if(!debug_mode) exit;

for(var n = 0; n < array_length_1d(arg_data); n++){
	var element = arg_data[n];
	switch(arg_types[n]){
		case macro_type_string:
		if(!is_string(element)) show_error("Error: expected string, actual: " + string(typeof(element)), true);
		break;
		case macro_type_real:
		if(!is_real(element)) show_error("Error: expected real, actual: " + string(typeof(element)), true);
		break;
		case macro_type_bool:
		if(!is_bool(element)) show_error("Error: expected bool, actual: " + string(typeof(element)), true);
		break;
		case macro_type_array:
		if(!is_array(element)) show_error("Error: expected array, actual: " + string(typeof(element)), true);
		break;
		case macro_type_list:
		if(!ds_exists(element, ds_type_list)) show_error("Error: expected list, actual: " + string(typeof(element)), true);
		break;
		case macro_type_map:
		if(!ds_exists(element, ds_type_map)) show_error("Error: expected map, actual: " + string(typeof(element)), true);
		break;
	}
}