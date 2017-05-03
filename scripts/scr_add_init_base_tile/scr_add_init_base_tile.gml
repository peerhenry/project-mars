// warning: this script must not be called during gameplay
// it is meant only for the room setup

var i = argument0;
var j = argument1;

var targetX = scr_gi_to_rc(i);
var targetY = scr_gi_to_rc(j);
		
var blid = layer_get_id("base");
instance_create_layer(targetX, targetY, blid, obj_base_tile);
	
// the other one is instance_place
var wall_id = instance_position(targetX, targetY, obj_wall);
while(wall_id != noone)
{
	with(wall_id) instance_destroy();
	wall_id = instance_position(targetX, targetY, obj_wall);
}

// add walls around tile	
scr_add_outside_wall(i-1, j-1);	// NW
scr_add_outside_wall(i, j-1);	// N
scr_add_outside_wall(i+1, j-1);	// NE
	
scr_add_outside_wall(i-1, j);	// W
scr_add_outside_wall(i+1, j);	// E
	
scr_add_outside_wall(i-1, j+1);	// SW
scr_add_outside_wall(i, j+1);	// S
scr_add_outside_wall(i+1, j+1);	// SE