// OLD
/// @param astronaut
/// @param construction
/*
var arg_astronaut = argument0;
var arg_construction = argument1;

#macro MAX_NAV_D 30000000

var d_min = MAX_NAV_D;
var d_pixel = MAX_NAV_D;
var found_x = 0;
var found_y = 0;
var adj_x = 0;
var adj_y = 0;

// loop over construction cells and find the closest navigable adjacent.
//var cells = arg_construction[construction_cells];
var cells = arg_construction[? construction_cells];
var cell_count = array_length_1d(cells);

for(var n = 0; n < cell_count; n++)
{
	var next_cell = cells[n];
	var cell_i = next_cell[c_cell_i];
	var cell_j = next_cell[c_cell_j];
	var cell_x = scr_gi_to_rc(cell_i);
	var cell_y = scr_gi_to_rc(cell_j);
	
	// check left
	adj_x = cell_x - 32;
	adj_y = cell_y;
	d_pixel = abs(adj_x - arg_astronaut.x) + abs(adj_y - arg_astronaut.y);
	if(scr_navigation_is_possible(arg_astronaut, adj_x, adj_y))
	{	
		if(d_pixel < d_min)
		{
			d_min = d_pixel;
			found_x = adj_x;
			found_y = adj_y;
		} 
	}
	
	// check top
	adj_x = cell_x;
	adj_y = cell_y - 32;
	d_pixel = abs(adj_x - arg_astronaut.x) + abs(adj_y - arg_astronaut.y);
	if(scr_navigation_is_possible(arg_astronaut, adj_x, adj_y))
	{	
		if(d_pixel < d_min)
		{ 
			d_min = d_pixel;
			found_x = adj_x;
			found_y = adj_y;
		} 
	}

	// check right
	adj_x = cell_x + 32;
	adj_y = cell_y;
	d_pixel = abs(adj_x - arg_astronaut.x) + abs(adj_y - arg_astronaut.y);
	if(scr_navigation_is_possible(arg_astronaut, adj_x, adj_y))
	{	
		if(d_pixel < d_min)
		{ 
			d_min = d_pixel;
			found_x = adj_x;
			found_y = adj_y;
		} 
	}

	// check bottom
	adj_x = cell_x;
	adj_y = cell_y + 32;
	d_pixel = abs(adj_x - arg_astronaut.x) + abs(adj_y - arg_astronaut.y);
	if(scr_navigation_is_possible(arg_astronaut, adj_x, adj_y))
	{
		if(d_pixel < d_min)
		{ 
			d_min = d_pixel;
			found_x = adj_x;
			found_y = adj_y;
		} 
	}
}

if(d_min < MAX_NAV_D)
{
	return [found_x, found_y];
}

return noone;
*/