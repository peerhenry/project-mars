test_init(test_suit_no_oxygen_no);
// arrange
var astro = instance_create_depth(0,0,0,obj_astronaut);
var expect_health = astro.astronaut_health - global.suffocation_speed;
astro.wears_suit = false;
// act
scr_step_health_and_oxygen(astro);
// assert
with astro
{
	assert_equal(expect_health, astronaut_health, "astronaut_health");
}
//cleanup
instance_destroy(astro);
test_result();