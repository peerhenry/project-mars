test_init(test_suit_no_oxygen_yes);
// arrange
var astro = instance_create_depth(32,32,0,obj_astronaut);
astro.is_outside = false;
var base_room = instance_create_depth(0,0,0,obj_room);
with(base_room)
{
	bb_left = 0;
	bb_top = 0;
	bb_bottom = 100;
	bb_right = 100;
	oxygen_level = 100;
}
ds_list_add(base_room.tiles, scr_encode_grid_coord(astro.occ_i, astro.occ_j));
// act
scr_step_oxygen_and_health(astro);
// assert
with astro
{
	assert_equal(100, entity_health, "astronaut health");
}
//cleanup
instance_destroy(astro);
instance_destroy(base_room);
test_result();