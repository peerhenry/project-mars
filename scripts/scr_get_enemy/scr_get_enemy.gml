/// @arg owner
function scr_get_enemy(argument0) {
	switch(argument0){
		case macro_player:
			return macro_enemy;
		case macro_enemy:
			return macro_player;
		case macro_china:
			return macro_player; // red
		case macro_nau:
			return macro_player; // blue
		case macro_japan:
			return macro_player; // white
		case macro_un:
			return macro_player; // green
	}


}
