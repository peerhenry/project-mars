if(hover && is_moving && owner == macro_player)
{
	var dest_x = scr_gi_to_rc(dest_i);
	var dest_y = scr_gi_to_rc(dest_j);
	draw_set_color(c_aqua);
	//draw_rectangle(dest_x-1, dest_y-1, dest_x+1, dest_y+1, false);
	//draw_line(x, y, dest_x, dest_y);
	draw_arrow(x, y, dest_x, dest_y, 10);
}