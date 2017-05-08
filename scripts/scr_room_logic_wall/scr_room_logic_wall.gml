var new_wall = argument0;

// either subtracts from a room, or parts to it.

var le_room = scr_room_at(new_wall.x, new_wall.y);
var i = scr_rc_to_gi(new_wall.x);
var j = scr_rc_to_gi(new_wall.y);
scr_remove_tile_from_room(le_room, i, j);

scr_room_part(le_room, false); // false, do not force new room creation