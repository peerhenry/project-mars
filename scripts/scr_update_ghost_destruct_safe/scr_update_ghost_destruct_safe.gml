/// @arg target
var arg_container = argument0;
var arg_target = argument1;

/*

check surrounding basetiles:

A. if basetile has a component, destruct it

B. destruct basetiles
location needs to check if there are any surrounding basetiles that do not surround the target basetile (di > 1 || dj > 1)
-> if yes add wall / leave existing wall
-> if no, nothing more...

C. destruct walls
basetiles marked for destruction, surrounding walls must be checked
a wall check consists of checking if there are any surrounding basetiles that do not surround the target basetile
-> if yes do nothing
-> if no, wall needs to be removed

D. destruct target basetile

*/

var surrounding_walls = scr_get_surrounding_instances(arg_target, obj_wall);
var surrounding_tiles = scr_get_surrounding_instances(arg_target, obj_base_tile);
var surrounding_comps = scr_get_surrounding_instances(arg_target, obj_base_component);
var visited_walls = ds_list_create();
for(var n = 0; n<8; n++)
{
	// A. destroy surrounding components
	var comp = surrounding_comps[n];
	if(comp != noone)
	{
		//instance_destroy(comp); // maybe get some return?
		scr_create_destruct_ghost_cell(arg_container, comp, obj_destruct_placemarker);
	}
	
	// B. destroy tile and check if it needs a wall
	var tile = surrounding_tiles[n];
	var wall = surrounding_walls[n];
	if(tile != noone)
	{
		var needs_wall = false;
		var removal_surrounding_tiles = scr_get_surrounding_instances(tile, obj_base_tile);
		var removal_surrounding_walls = scr_get_surrounding_instances(tile, obj_wall);
		for(var m = 0; m<8; m++)
		{
			var removal_sur_tile = removal_surrounding_tiles[m];
			var removal_sur_wall = removal_surrounding_walls[m];
			if(removal_sur_tile != noone)
			{
				var abs_di = abs(removal_sur_tile.occ_i - arg_target.occ_i);
				var abs_dj = abs(removal_sur_tile.occ_j - arg_target.occ_j);
				if(abs_di > 1 || abs_dj > 1)
				{
					// tile needs to be replaced by wall
					needs_wall = true;
				}
			} 
			else if(removal_sur_wall != noone) // C
			{
				if(ds_list_find_index(visited_walls, removal_sur_wall) == -1) // wall has not been visited
				{
					scr_ghost_destruct_safe_surrounding_wall(arg_container, arg_target, removal_sur_wall);
					ds_list_add(visited_walls, removal_sur_wall);
				}
			}
		}
		
		// B continuation
		if(needs_wall)
		{
			if(wall == noone) // add a wall
			{
				scr_create_destruct_ghost_cell(arg_container, tile, obj_wall);
			}
			else
			{
				// only destruct basetile	
				scr_create_destruct_ghost_cell(arg_container, tile, obj_destruct_placemarker);
			}
		}
		else
		{
			if(wall == noone)
			{
				// destruct basetile
				scr_create_destruct_ghost_cell(arg_container, tile, obj_destruct_placemarker);
			}
			else
			{
				// also destruct the wall
				scr_create_destruct_ghost_cell(arg_container, wall, obj_destruct_placemarker);
				scr_create_destruct_ghost_cell(arg_container, tile, obj_destruct_placemarker);
			}
		}
	}
	else if(wall != noone) // C
	{
		if(ds_list_find_index(visited_walls, wall) == -1) // wall has not been visited
		{
			scr_ghost_destruct_safe_surrounding_wall(arg_container, arg_target, wall);
			ds_list_add(visited_walls, wall);
		}
	}
}

// D
if(arg_target.object_index == obj_base_tile)
{
	var comp = instance_position(arg_target.x, arg_target.y, obj_base_component);
	if(comp != noone)
	{
		scr_create_destruct_ghost_cell(arg_container, comp, obj_destruct_placemarker);
	}
	else
	{
		var wall = instance_position(arg_target.x, arg_target.y, obj_wall);
		if(wall != noone)
		{
			scr_create_destruct_ghost_cell(arg_container, wall, obj_destruct_placemarker);
		}
	}
	scr_create_destruct_ghost_cell(arg_container, arg_target, obj_destruct_placemarker);
}
else if(arg_target.object_index == obj_wall)
{
	if(ds_list_find_index(visited_walls, arg_target) == -1)
	{
		scr_create_destruct_ghost_cell(arg_container, arg_target, obj_destruct_placemarker);
	}
}
ds_list_destroy(visited_walls);