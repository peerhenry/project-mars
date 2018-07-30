// arrange
scr_setup_room(1,1,10,10);
var x_tl = scr_gi_to_rc(3);
var y_tl = x_tl;
var x_br = x_tl;
var y_br = x_tl;
scr_update_ghost(x_tl, y_tl, x_br, y_br, macro_suit_closet, 0, false);
var new_construction = scr_build_new();

var astro = test_setup_astro();
scr_give_entity_new_item(astro, inv_space.mdu);
astro.auto_construct = true;

// assert setup
assert_true(new_construction != noone, "new construction is not noone");
assert_true(scr_inventory_has_item_type(astro.inventory, inv_space.mdu), "astro should have mdu");

// act 1
scr_autotask(astro);
scr_end_path_action(astro); // should get him to construction and start constructing

// assert 1
assert_equal(astronaut_action.constructing, astro.current_action, "astro is constructing");

// act 2
scr_build_complete(new_construction);

// assert 2
assert_equal(astronaut_action.idle, astro.current_action, "astro is idle");
assert_object_count(1, obj_suit_closet);
var free = true;
with(obj_suit_closet)
{
	free = scr_navgrid_cell_is_free(occ_i, occ_j);
}
assert_false(free, "free");

// cleanup
with(obj_suit_closet) instance_destroy();
with(obj_base_tile) instance_destroy();
with(obj_wall) instance_destroy();
with(obj_room) instance_destroy();
with(obj_astronaut) instance_destroy();