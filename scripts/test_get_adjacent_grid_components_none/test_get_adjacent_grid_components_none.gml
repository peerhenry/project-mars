test_init(test_get_adjacent_grid_components_none);

// arrange
var s1 = instance_create_depth(80,80,0,obj_sensor);
// act
var adj = scr_get_adjacent_grid_components(s1, macro_grid_electric);
// assert
assert_equal(4, array_length_1d(adj), "adjacent components array length");
assert_equal(noone, adj[0], "adj[0]");
assert_equal(noone, adj[1], "adj[1]");
assert_equal(noone, adj[2], "adj[2]");
assert_equal(noone, adj[3], "adj[3]");
// cleanup
instance_destroy(s1);
adj = 0;

test_result();