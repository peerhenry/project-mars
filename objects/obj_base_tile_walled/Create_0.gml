// use this object to add base tiles at the beginning of the game
// as opposed to during gameplay.

i = (x - 16) div 32;
j = (y - 16) div 32;

scr_add_base_tile_with_walls(i, j);

instance_destroy();