/// @arg class
/// @arg arguments_array
function fnew() {
	var class = argument[0];
	var args = [];
	if(argument_count == 2) args = argument[1];
	if(argument_count > 2) scr_panic("Cannot call new with more than 2 arguments!");
	var obj_indx = cs_get_object_index(class);
	return new_override(class, obj_indx, args);


}
