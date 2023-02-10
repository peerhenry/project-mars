/// @arg trigger
function scr_condition_no_enemy_astronauts(argument0) {
	var arg_trigger = argument0;

	return scr_count_live_astronauts(macro_enemy) == 0; // todo: once other owners come in, this should be fixed


}
