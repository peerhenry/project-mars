draw_set_alpha(0.5);
draw_set_color(c_aqua);
var cell_list = grid.tile_key_list;
for(var n = 0; n < ds_list_size(cell_list); n++)
{
	var cell = cell_list[| n];
	var i = scr_decode_grid_coord_i(cell);
	var j = scr_decode_grid_coord_j(cell);
	var left = scr_gi_to_rc(i) - 16;
	var right = left + 32;
	var top = scr_gi_to_rc(j) - 16;
	var bottom = top + 32;
	draw_rectangle(left, top, right, bottom, false);
}
draw_set_alpha(1);