test_init(test_suit_yes_oxygen_yes);
// arrange
var astro = instance_create_depth(32,32,0,obj_astronaut);
astro.is_outside = false;
astro.suit_oxygen = 100;
astro.wears_suit = true;
var base_room = instance_create_depth(0,0,0,obj_room);
with(base_room)
{
	ds_list_add(tiles, scr_encode_grid_coord(astro.occ_i, astro.occ_j));
	bb_left = 0;
	bb_top = 0;
	bb_bottom = 100;
	bb_right = 100;
	oxygen_level = 100;
}
// act
scr_step_health_and_oxygen(astro);
// assert
with astro
{
	assert_equal(100, suit_oxygen, "suit_oxygen");
	assert_equal(100, astronaut_health, "astronaut_health");
}
//cleanup
instance_destroy(astro);
instance_destroy(base_room);
test_result();