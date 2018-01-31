test_init(test_pump_adjacent_to_useless_drill);

// arrange
var drill = instance_create_depth(64, 32, 0, obj_drill);
with(drill){ event_user(macro_event_finalize); }
var pump = instance_create_depth(32, 32, 0, obj_pump);

// act
with(pump){ event_user(macro_event_finalize); }
var grid = scr_get_grid_prop(pump, macro_grid_water, macro_grid_prop_grid);
scr_grid_update(grid);

// assert
assert_equal(0, grid.total_production, "water grid total production");
assert_equal(0, grid.total_demand, "water grid total demand");
assert_equal(0, grid.net_output, "water grid net output");
assert_false(scr_get_grid_prop(pump, macro_grid_water, macro_grid_prop_can_perform_role), "can perform role");

// cleanup
instance_destroy(pump);
instance_destroy(drill);

test_result();