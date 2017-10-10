test_init(test_get_adjacent_grid_components);

// arrange
var s1 = instance_create_depth(80,80,0,obj_sensor);
var sW = instance_create_depth(48,80,0,obj_sensor);
var sN = instance_create_depth(80,48,0,obj_sensor);
var sS = instance_create_depth(80,112,0,obj_sensor);
var sE = instance_create_depth(112,80,0,obj_sensor);
// act
var adj = scr_get_adjacent_grid_components(s1, macro_grid_electric); // ENWS
// assert
assert_equal(4, array_length_1d(adj), "adjacent components array length");
assert_equal(adj[0], sE, "east component");
assert_equal(adj[1], sN, "north component");
assert_equal(adj[2], sW, "west component");
assert_equal(adj[3], sS, "south component");
// cleanup
instance_destroy(s1);
instance_destroy(sW);
instance_destroy(sN);
instance_destroy(sS);
instance_destroy(sE);
adj = 0;

test_result();