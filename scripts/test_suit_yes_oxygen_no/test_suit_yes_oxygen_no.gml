test_init(test_suit_yes_oxygen_no);

// arrange
var astro = instance_create_depth(0,0,0,obj_astronaut);
with(astro)
{
	wears_suit = true;
	suit_oxygen = 100;
}
var expected_health = 100;
var expect_o2 = 100 - global.suit_o2_depletion_speed;

// act
scr_step_health_and_oxygen(astro);
// assert
with astro
{
	assert_equal(expect_o2, suit_oxygen, "suit_oxygen");
	assert_equal(expected_health, astronaut_health, "astronaut_health");
}
//cleanup
instance_destroy(astro);

test_result();