test_init(test_fridge_interact);

// arrange
var fridge = instance_create_depth(0,0,0,obj_fridge);
var astro = instance_create_depth(0,0,0,obj_astronaut);
scr_give_entity_new_item(fridge, inv_space.food);
scr_assign(fridge, astro);

// assert setup
assert_false(scr_inventory_has_item_type(astro.inventory, inv_space.food), "fridge has food");
assert_true(scr_inventory_has_item_type(fridge.inventory, inv_space.food), "astro has food");

// act
scr_end_path_action(astro);

// with(fridge) event_user(macro_event_interact);

// assert
assert_false(scr_inventory_has_item_type(fridge.inventory, inv_space.food), "fridge has food");
assert_true(scr_inventory_has_item_type(astro.inventory, inv_space.food), "astro has food");

// cleanup
instance_destroy(fridge);
instance_destroy(astro);

test_result();