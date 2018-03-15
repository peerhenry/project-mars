
if(global.mousedrag_from == mousedrag_from.world) exit;

var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();

var mouse_over = window_mouse_x > x + border_size + inner_left && //todo: use point_in_rectangle()?
	window_mouse_x < x + border_size + inner_left + inner_width && 
	window_mouse_y > y + border_size + inner_top && 
	window_mouse_y < y + border_size + inner_top + inner_height;

var mouse_down = mouse_check_button(mb_left);

if(mouse_over)
{
	hover = true;
	if(mouse_down)
	{
		global.mousedrag_from = mousedrag_from.minimap;
		event_user(0);
	}
	else if(global.mousedrag_from == mousedrag_from.minimap) global.mousedrag_from = mousedrag_from.none; //reset
}
else
{
	hover = false;
	if(!mouse_down && global.mousedrag_from == mousedrag_from.minimap) global.mousedrag_from = mousedrag_from.none; //reset
}