/// @description Insert description here
// You can write your code in this editor
if(is_dragging){
	draw_set_colour(c_black);
	var onlyOutline = true;
	draw_rectangle(click_x, click_y, mouse_x, mouse_y, onlyOutline);	
}