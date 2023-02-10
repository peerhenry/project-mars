/// @arg_energy
function scr_calculate_movement_speed(argument0) {
	return 0.5*(1 + sqrt(argument0/100))*global.astro_move_speed;


}
