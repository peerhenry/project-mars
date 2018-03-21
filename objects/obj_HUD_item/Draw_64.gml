var left = x;
var top = y;
var right = x + width;
var bottom = y + height;

// draw background
draw_set_color(c_dkgray);
draw_set_alpha(1);
draw_rectangle(left, top, right, bottom, false);
// draw sprite
if(sprite_index != noone) draw_sprite(sprite_index, image_index, x + 16, y + 16);

// draw transpart overlay color
if(object_index != obj_HUD_category_select_button)
{
	draw_set_alpha(0.3);
	draw_set_color(c_aqua);
	draw_rectangle(left, top, right, bottom, false);
	draw_set_alpha(1);
}

// draw hover/select overlay
if(state == button_state.hover || state == button_state.selected)
{
	draw_set_alpha(0.3);
	draw_set_color(c_white);
	draw_rectangle(left, top, right, bottom, false);
	draw_set_alpha(1);
}

// outline
draw_set_color(c_black);
draw_rectangle(left, top, right, bottom, true);