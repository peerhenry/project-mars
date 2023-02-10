/// @arg class_definition_script
function test_nyi(argument0) {
	var class = argument0;
	test_init("Test not yet implemented for class: " + script_get_name(class));
	fail("Test not yet implemented for class: " + script_get_name(class));
	test_result();


}
