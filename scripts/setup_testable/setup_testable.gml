/// @arg class
// todo: update this
var class = argument0;
var mocks = create_mocks(class);
var mock_vals = morph(mocks, "get_value");
var instance = new(class, mock_vals);
if(instance == noone) scr_panic("Could not setup testable");
return tuple(instance, mocks);