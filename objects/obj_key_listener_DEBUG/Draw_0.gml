/// @descr draw grid
if(show_grid)
{
	draw_set_alpha(0.5);
	mp_grid_draw(nav_grid);
	draw_set_alpha(1);
}