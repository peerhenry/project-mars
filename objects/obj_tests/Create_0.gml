msg = "Running tests.";
color = c_yellow;
done = false;
passed = false;
alarm[0] = 10;
x = -500;

failed_test_list = ds_list_create();
passed_test_list = ds_list_create();
global.failed_test_list = failed_test_list;
global.passed_test_list = passed_test_list;