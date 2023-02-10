/// @arg class_definition_script
function test_class(argument0) {
	var class = argument0;
	in(fs_test_class_standards, "run", [class])
	script_execute(class, test);


}
