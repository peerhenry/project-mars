/// @description Returns an RGB color from a given hexadecimal color code.
/// @arg hex_string in RRGGBB format
/// GMLscripts.com/license
function scr_hex_to_color(argument0) {
	var hex,dec,col;
	hex = argument0;
	dec = scr_hex_to_dec(hex);
	col = (dec & 16711680) >> 16 | (dec & 65280) | (dec & 255) << 16;
	return col;


}
