/// @description use x and y to specify width and height
space = ds_grid_create(x, y);
ids = ds_grid_create(x, y);
if(x < 1) show_error("Game tried to create an inventory with width < 1", true);
if(y < 1) show_error("Game tried to create an inventory with height < 1", true);
width = x;
height = y;