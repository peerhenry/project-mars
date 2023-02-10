/// @description Insert items in array at insert_index
/// @arg subject
/// @arg insert_index
/// @arg ... items
function scr_array_insert() {
	var subject = argument[0];
	var insert_index = argument[1];
	var result = [];

	//copy left of insert_index
	array_copy(result, 0, subject, 0, insert_index);

	//push arguments
	var o = array_length_1d(result) - 1;
	var i = argument_count;
	while (--i > 1) result[@(o + i - insert_index)] = argument[i];

	//copy right of insert_index
	array_copy(result, array_length_1d(result), subject, insert_index, array_length_1d(subject) - insert_index);

	return result;


}
