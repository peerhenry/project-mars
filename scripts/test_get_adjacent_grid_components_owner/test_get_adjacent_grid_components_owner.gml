test_init(test_get_adjacent_grid_components_owner);

// arrange
global.ownership_behavior = macro_ownership_default;
var s1 = instance_create_depth(80,80,0,obj_sensor);
s1.owner = macro_enemy;
var s2 = instance_create_depth(48,80,0,obj_sensor);
s2.owner = macro_player;
var s3 = instance_create_depth(80,48,0,obj_sensor);
s3.owner = macro_player;
var s4 = instance_create_depth(80,112,0,obj_sensor);
s4.owner = macro_player;
var s5 = instance_create_depth(112,80,0,obj_sensor);
s5.owner = macro_player;
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
instance_destroy(s2);
instance_destroy(s3);
instance_destroy(s4);
instance_destroy(s5);
adj = 0;

test_result();