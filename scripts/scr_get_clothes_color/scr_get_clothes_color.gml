/// @arg owner
switch(argument0){
	case macro_player:
		return [0.4, 0.2, 0.75, 0.5]; // purple
	case macro_enemy:
		return [1, 0.5, 0.25, 0.6]; // orange
	case macro_china:
		return [0.9, 0.1, 0.05, 0.7]; // red
	case macro_nau:
		return [0.1, 0.2, 0.8, 0.5]; // blue
	case macro_japan:
		return [1, 1, 1, 0.5]; // white
	case macro_un:
		return [0.1, 0.8, 0.1, 0.5]; // green
}