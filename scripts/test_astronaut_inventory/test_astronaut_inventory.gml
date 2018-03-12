test_init(test_astronaut_inventory);

// arrange
var astro = instance_create_depth(0,0,0,obj_astronaut);
var astro_inv = astro.inventory;
scr_clear_inventory(astro_inv);

// act
var new_item = scr_give_entity_new_item(astro, inv_space.mdu);
assert_true(new_item > 0, "insert new succeeded");

// assert
assert_true(scr_inventory_has_item_type(astro_inv, inv_space.mdu), "astro has mdu");
assert_true(scr_ds_grid_has(astro_inv.space, inv_space.occupied), "astro has occupied space in inventory");

// act 2
var item = scr_inventory_extract(astro_inv, inv_space.mdu);
instance_destroy(item);

// assert
assert_false(scr_inventory_has_item_type(astro_inv, inv_space.mdu), "astro has mdu");
assert_false(scr_ds_grid_has(astro_inv.space, inv_space.occupied), "astro has occupied space in inventory");

// cleanup
instance_destroy(astro);

test_result();