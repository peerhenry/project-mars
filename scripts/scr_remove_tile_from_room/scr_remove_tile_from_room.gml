/// @arg room
/// @arg i
/// @arg j
var le_room = argument0;
var arg_i = argument1;
var arg_j = argument2;

with(le_room)
{
	var val = scr_encode_grid_coord(arg_i, arg_j);
	var pos = ds_list_find_index(tiles, val);
	if(pos > -1) ds_list_delete(tiles, pos);
	
	if(ds_list_size(tiles) == 0) exit;
	
	// recalculate BB
	var leftest = bb_right - 32;
	var rightest = bb_left + 32;
	var toppest = bb_bottom - 32;
	var bottomest = bb_top + 32;
	for(var n = 0; n < ds_list_size(tiles); n++)
	{
		var next_tile = tiles[|n];
		var next_i = scr_decode_grid_coord_i(next_tile);
		var next_j = scr_decode_grid_coord_j(next_tile);
		var next_x = scr_gi_to_rc(next_i);
		var next_y = scr_gi_to_rc(next_j);
		var next_left = next_x - 16;
		var next_right = next_x + 16;
		var next_top = next_y - 16;
		var next_bottom = next_y + 16;
		if(next_left < leftest) leftest = next_left;
		if(next_right > rightest) rightest = next_right;
		if(next_top < toppest) toppest = next_top;
		if(next_bottom > bottomest) bottomest = next_bottom;
	}
	bb_left = leftest;
	bb_top = toppest;
	bb_right = rightest;
	bb_bottom = bottomest;//*/
}