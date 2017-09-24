test_init(test_update_constructing);
//arrange
var astro = instance_create_depth(0,0,0,obj_astronaut);
var construction = scr_create_dummy_construction();
ds_map_replace(construction, construction_time, 50);
astro.current_action = astronaut_action.constructing;
astro.construction = construction;
var expect = 100/(30*construction[? construction_time]); // todo: put this calculation in a script
// act
scr_update_action(astro);
// assert
assert_equal(expect, construction[? construction_completion], "completion");
//cleanup
instance_destroy(astro);
ds_map_destroy(construction);

test_result();