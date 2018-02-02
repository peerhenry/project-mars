/// @arg owner
switch(argument0){
	case macro_player:
		return [0.1, 0.1, 0.95, 0.7]; //[0,0,0,0]; // transparent
	case macro_enemy:
		return [0.8, 0.2, 0.1, 0.5];
	case macro_china:
		return [0.8, 0.2, 0.1, 0.5]; // red
	case macro_nau:
		return [0.1, 0.2, 0.8, 0.5]; // blue
	case macro_japan:
		return [1, 1, 1, 0.5]; // white
	case macro_un:
		return [0.1, 0.8, 0.1, 0.5]; // green
}