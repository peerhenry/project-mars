var target_x = argument0;
var target_y = argument1;

walls[0] = instance_position(target_x-32, target_y-32, obj_wall);	// NW
walls[1] = instance_position(target_x, target_y-32, obj_wall);		// N
walls[2] = instance_position(target_x+32, target_y-32, obj_wall);	// NE
	
walls[3] = instance_position(target_x-32, target_y, obj_wall);		// W
walls[4] = instance_position(target_x+32, target_y, obj_wall);		// E
	
walls[5] = instance_position(target_x-32, target_y+32, obj_wall);	// SW
walls[6] = instance_position(target_x, target_y+32, obj_wall);		// S
walls[7] = instance_position(target_x+32, target_y+32, obj_wall);	// SE

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

for(s=0; s<20; s++)
{
	if(walls[s] != noone){
		scr_wall_update_state(walls[s]);
	}
}