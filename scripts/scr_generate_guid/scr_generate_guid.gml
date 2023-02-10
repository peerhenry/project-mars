function scr_generate_guid() {
	var hex_pool = "0123456789abcdef";

	var result = "";
	repeat(8) result += string_copy(hex_pool, irandom(15) + 1, 1);
	result += "-";
	repeat(4) result += string_copy(hex_pool, irandom(15) + 1, 1);
	result += "-";
	repeat(4) result += string_copy(hex_pool, irandom(15) + 1, 1);
	result += "-";
	repeat(4) result += string_copy(hex_pool, irandom(15) + 1, 1);
	result += "-";
	repeat(12) result += string_copy(hex_pool, irandom(15) + 1, 1);

	return result;


}
