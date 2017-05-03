/// @description Insert description here
// You can write your code in this editor

i = (x - 16) div 32;
j = (y - 16) div 32;
if(i >= 0 && j >= 0){
	mp_grid_add_cell(global.grid_map, i, j);
}