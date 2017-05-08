// global.selection = noone; // I think this is obsolete

// constructions
global.basetile = 1;
global.outer_wall = 2;
global.wall = 3;
global.door = 4;
global.hatch = 5;

// selected handle for construction
global.construct = noone;

enum wall_type {
	horizontal,
	vertical,
	other,
	none
}

// DEBUG
global.draw_room_bb = true;