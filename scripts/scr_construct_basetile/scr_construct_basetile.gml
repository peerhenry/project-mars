var target_x = argument0;
var target_y = argument1;

var target_i = scr_rc_to_gi(target_x);
var target_j = scr_rc_to_gi(target_y);

var can_build = scr_validate(target_x, target_y, global.basetile);

if(!can_build) return noone;

return scr_add_base_tile_with_walls(target_i, target_j);

// todo, decrease resource cost.