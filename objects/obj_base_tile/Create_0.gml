/// @description Insert description here
// You can write your code in this editor

i = (x - 16) div 32;
j = (y - 16) div 32;
mp_grid_clear_cell( global.grid_inside, i, j );
mp_grid_add_cell( global.grid_map, i, j );

wall_bottom = !instance_position(x, y + 32, obj_base_tile);
wall_right = !instance_position(x + 32, y, obj_base_tile);
wall_top = !instance_position(x, y - 32, obj_base_tile);
wall_left = !instance_position(x - 32, y, obj_base_tile);