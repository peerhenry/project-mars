/// @description Returns a decimal integer (real) representing the given hexadecimal string.
/// @arg hex_string in RRGGBB format
/// GMLscripts.com/license
function scr_hex_to_dec(argument0) {
	var hex, dec, h, p;
	hex = string_upper(argument0);
	dec = 0;
	h = "0123456789ABCDEF";
	for (p=1; p<=string_length(hex); p+=1)
	{
		dec = dec << 4 | (string_pos(string_char_at(hex, p), h) - 1);
	}
	return dec;


}
