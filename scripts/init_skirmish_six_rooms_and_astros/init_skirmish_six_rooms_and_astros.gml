/// @arg owner
/// @arg i
/// @arg j
/// @arg astro_count
global.default_owner = argument0;
var base_or_i = argument1;
var base_or_j = argument2;
var room_w = 5;
var room_h = 5;
scr_setup_six_rooms(base_or_i, base_or_j, room_w, room_h, 2);
init_skirmish_add_astronauts(base_or_i + 1, base_or_j + 3, argument3, argument0); 