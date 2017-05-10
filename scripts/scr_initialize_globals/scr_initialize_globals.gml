// global.selection = noone; // I think this is obsolete

// constructions
global.basetile = 1;
global.outer_wall = 2;
global.wall = 3;
global.door = 4;
global.hatch = 5;
global.suit_closet = 6;

// selected handle for construction
global.construct = noone;

enum wall_type {
	horizontal,
	vertical,
	other,
	none
}

// oxygen stuff
global.gate_drainage_speed = 25; // percentage of oxygen of 1 tile being drained by an open hatch per step.
global.oxygen_empty_level = 1; // if oxygen_level falls below this number, red stripes are drawn.
global.oxygen_max_alpha = 0.33; // for rendering low oxygen levels

// DEBUG settings
global.draw_room_bb = false;