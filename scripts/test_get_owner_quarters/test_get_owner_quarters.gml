test_init(test_get_owner_quarters);

// Arrange
global.ownership_behavior = macro_ownership_map_quarters;
global.quarter_owners = [macro_player, macro_nau, macro_china, macro_japan];

var constr = scr_create_dummy_constructable();

// Act
constr.x = room_width/4;	// set to topleft
constr.y = room_height/4;
var tl = scr_get_owner(constr);
constr.x = 3*(room_width/4);	// set to right
var tr = scr_get_owner(constr);
constr.y = 3*(room_height/4);	// set to bottom
var br = scr_get_owner(constr);
constr.x = room_width/4;	// set to left again
var bl = scr_get_owner(constr);

// Assert
assert_arrays_are_equal(global.quarter_owners, [tl, tr, bl, br]);

// Cleanup
instance_destroy(constr);

// Return result
test_result();