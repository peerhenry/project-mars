/// @description Insert description here
// You can write your code in this editor
if(under_construction)
{
	draw_set_alpha(0.4);
	draw_set_color(c_aqua);
	draw_rectangle(x-16, y-16, x+15, y+15, false)
	draw_set_alpha(1);
}
else
{
	draw_self();
}