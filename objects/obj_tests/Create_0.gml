msg = "Running tests...";
color = c_yellow;
done = false;
passed = false;
alarm[0] = 10;
x = -500;

failed_test_list = ds_list_create();
passed_test_list = ds_list_create();
assertion_map = ds_map_create();
global.failed_test_list = failed_test_list;
global.passed_test_list = passed_test_list;
global.assertion_map = assertion_map;