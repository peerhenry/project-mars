/// @description Insert description here
// You can write your code in this editor
var cell_size = 32;
var half_cell_size = cell_size/2;
global.grid_inside = mp_grid_create(half_cell_size, half_cell_size, floor(room_width/cell_size)-1, floor(room_height/cell_size)-1, cell_size, cell_size);


mp_grid_add_rectangle(global.grid_inside, 0, 0, room_width, room_height);