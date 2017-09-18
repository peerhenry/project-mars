test_init(test_get_shooting_range);

var result = scr_get_shooting_range(noone);
assert_equal(global.shooting_range, result, "shooting range");

test_result();