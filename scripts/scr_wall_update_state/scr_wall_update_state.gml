///Updates wall sprite and orientation

// adjacency number:
// We can read the 4 adjacent cells as a 4 bit integer, one bit meaning if a wall is there.
// wall state:
// a number that is convenient for determining sprite and orientation.

var wall_id = argument0;

with(wall_id)
{

// 1. calculate adjacency number
adjacentcy_numer = 0;
var wall_north_id = instance_position(x, y-32, obj_wall);
var wall_east_id = instance_position(x+32, y, obj_wall);
var wall_south_id = instance_position(x, y+32, obj_wall);
var wall_west_id = instance_position(x-32, y, obj_wall);

if(wall_west_id != noone){
	adjacentcy_numer += 1;
	with(wall_west_id){ 
		adjacentcy_numer += 4;
	}
	//scr_wall_update_state(wall_west_id);
}

if(wall_north_id != noone){
	adjacentcy_numer += 2;
	with(wall_north_id){
		adjacentcy_numer += 8;
	}
	//scr_wall_update_state(wall_north_id);
}

if(wall_east_id != noone){
	adjacentcy_numer += 4;
	with(wall_east_id){
		adjacentcy_numer += 1;
	}
	//scr_wall_update_state(wall_east_id);
}

if(wall_south_id != noone){
	adjacentcy_numer += 8;
	with(wall_south_id){
		adjacentcy_numer += 2;
	}
	//scr_wall_update_state(wall_south_id);
}

// adj:		00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15
// state:	15 00 01 05

var wall_state = 0;

// 2. get the corresponding wall_state

switch(adjacentcy_numer)
{
case 0:
	wall_state = 15;
	break;
case 1:
	wall_state = 0;
	break;
case 2:
	wall_state = 1;
	break;
case 3:
	wall_state = 5;
	break;
case 4:
	wall_state = 2;
	break;
case 5:
	wall_state = 12;
	break;
case 6:
	wall_state = 6;
	break;
case 7:
	wall_state = 10;
	break;
case 8:
	wall_state = 3;
	break;
case 9:
	wall_state = 4;
	break;
case 10:
	wall_state = 13;
	break;
case 11:
	wall_state = 9;
	break;
case 12:
	wall_state = 7;
	break;
case 13:
	wall_state = 8;
	break;
case 14:
	wall_state = 11;
	break;
case 15:
	wall_state = 14;
	break;
}

// 3. calculate sprite and orientation based on wall state

var segment = wall_state div 4;			// segment is like; end, edge, T or straight
var orientation = wall_state - (segment*4);

switch(segment)
{
	case 0:
		sprite_index = spr_wall_end;
		break;
	case 1:
		sprite_index = spr_wall_edge;
		break;
	case 2:
		sprite_index = spr_wall_T;
		break;
	default:
		if(orientation < 2)
		{
			sprite_index = spr_wall_straight;
		}
		else if(orientation == 2)
		{
			sprite_index = spr_wall_cross;
		}
}

switch(orientation)
{
	case 1:
		image_angle = 270;
		break;
	case 2:
		image_angle = 180;
		break;
	case 3:
		image_angle = 90;
		break;	
	default:
		image_angle = 0;
}

}