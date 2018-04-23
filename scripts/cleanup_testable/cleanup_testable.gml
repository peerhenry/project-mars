/// @arg tuple
var tup = argument0;
var testable = tup.item0;
var mocks = tup.item1;
map_script(mocks, cleanup_generic);
destroy(testable);