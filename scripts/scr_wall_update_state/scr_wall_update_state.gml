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

var connects_west = scr_wall_connector_exists_at(x-32, y);
var connects_north = scr_wall_connector_exists_at(x, y-32);
var connects_east = scr_wall_connector_exists_at(x+32, y);
var connects_south = scr_wall_connector_exists_at(x, y+32);
/*
var connects_northwest = scr_wall_connector_exists_at(x-32, y-32);
var connects_northeast = scr_wall_connector_exists_at(x+32, y-32);
var connects_southwest = scr_wall_connector_exists_at(x-32, y+32);
var connects_southeast = scr_wall_connector_exists_at(x+32, y+32);
*/

if(connects_west){
	adjacentcy_numer += 1;
	//with(wall_west_id){ 
	//	adjacentcy_numer += 4;
	//}
}

if(connects_north){
	adjacentcy_numer += 2;
	//with(wall_north_id){
	//	adjacentcy_numer += 8;
	//}
}

if(connects_east){
	adjacentcy_numer += 4;
	//with(wall_east_id){
	//	adjacentcy_numer += 1;
	//}
}

if(connects_south){
	adjacentcy_numer += 8;
	//with(wall_south_id){
	//	adjacentcy_numer += 2;
	//}
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