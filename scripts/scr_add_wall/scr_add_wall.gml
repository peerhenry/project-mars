var i = argument0;
var j = argument1;
var index = argument2;
// the index gives info about the walls position relative to the new tile.
// 0: NW - the wall segment is northwest of the tile
// 0 to 8 correspond to: NW, N, NE, W, E, SW, S, SE

var targetX = (i+1)*32;
var targetY = (j+1)*32;

var wall_id = instance_position(targetX, targetY, obj_wall);
var tile_id = instance_position(targetX, targetY, obj_base_tile);

/*if(wall_id != noone)
{
	// modify wall
	with(wall_id){
		
	}
}
else */
if(tile_id  == noone)
{
	var blid = layer_get_id("base");
	var new_wall_id = instance_create_layer(targetX, targetY, blid, obj_wall);
	
	with(new_wall_id){
		switch(index){
			case 0:
				sprite_index = spr_wall_edge;
				orientation = 1;
				break;
			case 1:
				sprite_index = spr_wall;
				orientation = 0;
				break;
			case 2:
				sprite_index = spr_wall_edge;
				orientation = 0;
				break;
			case 3:
				sprite_index = spr_wall;
				orientation = 1;
				break;
			case 4:
				sprite_index = spr_wall;
				orientation = 3;
				break;
			case 5:
				sprite_index = spr_wall_edge;
				orientation = 2;
				break;
			case 6:
				sprite_index = spr_wall;
				orientation = 2;
				break;
			case 7:
				sprite_index = spr_wall_edge;
				orientation = 3;
				break;
		}
	}
}