// use this object to add base tiles at the beginning of the game
// as opposed to during gameplay.

var i = scr_rc_to_gi(x);
var j = scr_rc_to_gi(y);

scr_add_base_tile_with_walls(i, j);

instance_destroy();