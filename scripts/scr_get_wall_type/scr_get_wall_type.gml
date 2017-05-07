/// checks if there is a straight wall at coordinates x, y
var wall_id = instance_position(argument0, argument1, obj_wall);
if(wall_id == noone) return wall_type.none;
with(wall_id){
	if(sprite_index == spr_wall_straight)
	{
		if(adjacentcy_numer == 5) return wall_type.horizontal;
		if(adjacentcy_numer == 10) return wall_type.vertical;
	}
	return wall_type.other;
}
return wall_type.none;