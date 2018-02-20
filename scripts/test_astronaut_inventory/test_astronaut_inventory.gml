test_init(test_astronaut_inventory);

// arrange
var astro = instance_create_depth(0,0,0,obj_astronaut);
ds_grid_set_region(astro.inventory, 0, 0, ds_grid_width(astro.inventory) - 1, ds_grid_height(astro.inventory) - 1, macro_inventory_empty);

// act & assert
scr_inventory_insert(astro.inventory, macro_inventory_module);
assert_true(scr_inventory_has_item(astro.inventory, macro_inventory_module), "astro has mdu");
assert_true(scr_inventory_has_item(astro.inventory, macro_inventory_occupied), "astro has occupied space in inventory");
scr_inventory_extract(astro.inventory, macro_inventory_module);
assert_false(scr_inventory_has_item(astro.inventory, macro_inventory_module), "astro has mdu");
assert_false(scr_inventory_has_item(astro.inventory, macro_inventory_occupied), "astro has occupied space in inventory");

// cleanup
instance_destroy(astro);

test_result();