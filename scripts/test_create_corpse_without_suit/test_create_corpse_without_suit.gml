test_init(test_create_corpse_without_suit);

// arrange
var astro = instance_create_depth(0,0,0,obj_astronaut);
scr_set_suit(astro, false);

// act
var corpse = scr_create_corpse(astro);

// assert
assert_arrays_are_equal(astro.mask_color, corpse.mask_color);
assert_equal(spr_male_dead, corpse.sprite_index, "sprite_index");
assert_equal(spr_male_mask_dead, corpse.mask_sprite, "mask_sprite");

// cleanup
with(obj_astronaut) instance_destroy();
with(obj_corpse) instance_destroy();

test_result();