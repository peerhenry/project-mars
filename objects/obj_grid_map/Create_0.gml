/// @description Insert description here
// You can write your code in this editor

//xstart, ystart, hor cells, vert cells, cell width, cell height
show_grid = false;
var cell_size = 32;
var half_cell_size = cell_size/2;
global.grid_map = mp_grid_create(half_cell_size, half_cell_size, floor(room_width/cell_size)-1, floor(room_height/cell_size)-1, cell_size, cell_size);