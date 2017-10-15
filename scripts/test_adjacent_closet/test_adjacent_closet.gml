test_init(test_adjacent_closet);

// arrange
var astro = instance_create_depth(32,32,0,obj_astronaut);
var closet = instance_create_depth(64,32,0,obj_suit_closet);
astro.wears_suit = true;
closet.holds_suit = false;

// act
scr_assign(closet, astro);
// assert
assert_false(astro.wears_suit, "astro.wears_suit");
assert_true(closet.holds_suit, "closet.holds_suit");
// act
scr_assign(closet, astro);
// assert
assert_true(astro.wears_suit, "astro.wears_suit");
assert_false(closet.holds_suit, "closet.holds_suit");

// cleanup
instance_destroy(closet);
instance_destroy(astro);

test_result();