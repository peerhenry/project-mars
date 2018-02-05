test_init(test_create_corpse_with_suit);

// arrange
var astro = instance_create_depth(0,0,0,obj_astronaut);
scr_set_suit(astro, true);

// act
var corpse = scr_create_corpse(astro);

// assert
assert_object_count(1, obj_corpse);
assert_object_count(1, obj_astronaut);
assert_arrays_are_equal(astro.mask_color, corpse.mask_color);
assert_equal(spr_character_death, corpse.sprite_index, "sprite_index");
assert_equal(spr_suit_mask_death, corpse.mask_sprite, "mask_sprite");

// cleanup
with(obj_astronaut) instance_destroy();
with(obj_corpse) instance_destroy();

test_result();