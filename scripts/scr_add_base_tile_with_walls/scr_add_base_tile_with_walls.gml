/// adds basetile, adds outside walls if necessary, updates all adjacent walls.
/*var i = argument0;
var j = argument1;

var target_x = scr_gi_to_rc(i);
var target_y = scr_gi_to_rc(j);

// assuming validation has already happened

// 1. if tile contains wall, remove wall
var wall_id = instance_position(target_x, target_y, obj_wall);
if((wall_id != noone))
{
	with(wall_id) instance_destroy();
}

// 2. add the basetile
var basetile_layer = layer_get_id("basetiles");
var new_basetile = instance_create_layer(target_x, target_y, basetile_layer, obj_base_tile);

// 3. add walls around tile
walls[0] = scr_add_outside_wall(i-1, j-1);	// NW
walls[1] = scr_add_outside_wall(i, j-1);	// N
walls[2] = scr_add_outside_wall(i+1, j-1);	// NE
	
walls[3] = scr_add_outside_wall(i-1, j);	// W
walls[4] = scr_add_outside_wall(i+1, j);	// E
	
walls[5] = scr_add_outside_wall(i-1, j+1);	// SW
walls[6] = scr_add_outside_wall(i, j+1);	// S
walls[7] = scr_add_outside_wall(i+1, j+1);	// SE
	
// 4. get the extra walls that need to update
walls[8] = instance_position(target_x+64, target_y+32, obj_wall);
walls[9] = instance_position(target_x+64, target_y, obj_wall);
walls[10] = instance_position(target_x+64, target_y-32, obj_wall);
walls[11] = instance_position(target_x-64, target_y+32, obj_wall);
walls[12] = instance_position(target_x-64, target_y, obj_wall);
walls[13] = instance_position(target_x-64, target_y-32, obj_wall);
	
walls[14] = instance_position(target_x+32, target_y+64, obj_wall);
walls[15] = instance_position(target_x, target_y+64, obj_wall);
walls[16] = instance_position(target_x-32, target_y+64, obj_wall);
walls[17] = instance_position(target_x+32, target_y-64, obj_wall);
walls[18] = instance_position(target_x, target_y-64, obj_wall);
walls[19] = instance_position(target_x-32, target_y-64, obj_wall);

// 5. update all walls
for(s=0; s<20; s++)
{
	if(walls[s] != noone) scr_wall_update_state(walls[s]);
}

return new_basetile;*/