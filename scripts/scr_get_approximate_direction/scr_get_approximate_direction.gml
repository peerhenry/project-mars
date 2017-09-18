/// @arg dx
/// @arg dy
var arg_dx = argument0;
var arg_dy = argument1;

var bit1 = arg_dy > -2*arg_dx;
var bit2 = 2*arg_dy > -arg_dx;
var bit3 = 2*arg_dy > arg_dx;
var bit4 = arg_dy > 2*arg_dx;

var result = (bit1 << 3) + (bit2 << 2) + (bit3 << 1) + bit4;

switch(result){
	case 12:
		return macro_east;
	case 8:
		return macro_north_east;
	case 0:
		return macro_north;
	case 1:
		return macro_north_west;
	case 3:
		return macro_west;
	case 7:
		return macro_south_west;
	case 15:
		return macro_south;
	case 14:
		return macro_south_east;
}