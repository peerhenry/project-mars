for(var n = 0; n < ds_list_size(failed_test_list); n++)
{
	var nt = failed_test_list[| n];
	var al = assertion_map[? nt];
	ds_list_destroy(al);
}
for(var n = 0; n < ds_list_size(passed_test_list); n++)
{
	var nt = failed_test_list[| n];
	var al = assertion_map[? nt];
	ds_list_destroy(al);
}
ds_map_destroy(assertion_map);
ds_list_destroy(failed_test_list);
ds_list_destroy(passed_test_list);
global.assertion_map = 0;
global.passed_test_list = 0;
global.failed_test_list = 0;