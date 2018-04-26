/// @arg tuple
var tup = argument0;
var testable = tup.item0;
var mocks = tup.item1;
destroy(testable);
map_script(mocks, destroy);
destroy(tup);