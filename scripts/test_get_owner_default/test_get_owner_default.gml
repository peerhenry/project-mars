test_init(test_get_owner_default);

// Arrange
global.ownership_behavior = macro_ownership_default;
global.default_owner = macro_china;
var constr = scr_create_dummy_constructable();

// Act
var owner = scr_get_owner(constr);

// Assert
assert_equal(global.default_owner, owner, "owner");

// Cleanup
instance_destroy(constr);
global.default_owner = macro_player;

// Return result
test_result();