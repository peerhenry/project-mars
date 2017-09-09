test_init(test_register_new_construction);

// arrange
var constr = scr_create_dummy_construction();

// act
scr_register_new_construction(constr);

// assert
var cq = scr_get_construction_queue(constr[? construction_owner]);
assert_list_contains(cq, constr);

// cleanup
ds_list_clear(cq);

// return result
test_result();