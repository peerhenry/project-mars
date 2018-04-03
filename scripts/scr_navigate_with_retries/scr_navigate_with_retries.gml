/// @param astronaut
/// @param end_x
/// @param end_y
/// @param max_retries
var arg_entity = argument0;
var arg_end_x = argument1;
var arg_end_y = argument2;
var arg_max_loop = argument3;

var start_x = arg_entity.x;
var start_y = arg_entity.y;

var end_i = (arg_end_x - 16) div 32;
var end_j = (arg_end_y - 16) div 32;
var snap_end_x = scr_gi_to_rc(end_i);
var snap_end_y = scr_gi_to_rc(end_j);
var counter = 0;
var navigation_grid = scr_get_nav_grid();

if(start_x == snap_end_x && start_y = snap_end_y)
{
	scr_stop_moving(arg_entity);
	return false;
}
with(arg_entity)
{
	if(!path_exists(path) && end_i == occ_i && end_j == occ_j) return false;
}

// Clear all character cells before trying to navigate
with(obj_movable)
{
	mp_grid_clear_cell(navigation_grid, occ_i, occ_j);
}

// Astronauts without suits may not go through hatches

with(obj_gate) // Make gate impassable IF
{
	// - it is of different owner
	// - entity is an astronaut without suit and gate is a hatch
	var impassable = arg_entity.owner != owner;
	if(!impassable && scr_instance_inherits(arg_entity, obj_astronaut))
	{
		impassable = object_index == obj_hatch && !arg_entity.wears_suit;
	}
	if( impassable ) mp_grid_add_cell( navigation_grid, occ_i, occ_j );
}

var path_found = false;
if(!path_exists(arg_entity.path)) arg_entity.path = path_add();

if( scr_destination_is_legal(snap_end_x, snap_end_y, arg_entity) )
{
	path_found = mp_grid_path(navigation_grid, arg_entity.path, start_x, start_y, snap_end_x, snap_end_y, true);
}

while ( !path_found && counter < arg_max_loop )
{
	end_i += scr_get_delta_i(counter);
	end_j += scr_get_delta_j(counter);
	
	snap_end_x = (end_i + 1)*32;
	snap_end_y = (end_j + 1)*32;
	if(scr_destination_is_legal(snap_end_x, snap_end_y, arg_entity))
	{
		path_found = mp_grid_path(navigation_grid, arg_entity.path, start_x, start_y, snap_end_x, snap_end_y, true);
	}
	
	counter++;
}

// Navigate the path
if(path_found && !(snap_end_x == arg_entity.x && snap_end_x == arg_entity.y))
{
	with(arg_entity)
	{
		dest_i = end_i;
		dest_j = end_j;
		path_start(path, movement_speed, path_action_stop, false); // path, speed, end action, absolute
	}
}
else
{
	scr_stop_moving(arg_entity);
}

// Reset all navgrid cells at astronaut positions.
with(obj_movable)
{
	mp_grid_add_cell(navigation_grid, occ_i, occ_j);
}

// Free hatches and doors again
with(obj_gate)
{
	var passable = (!under_construction && !under_destruction && !locked);
	if( passable ) mp_grid_clear_cell(navigation_grid, occ_i, occ_j);
}

return path_found;