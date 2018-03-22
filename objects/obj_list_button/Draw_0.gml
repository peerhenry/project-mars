//draw focus indicator arrow
if(enabled && focussed && text_height != -1)
{
	draw_sprite(sprite_index, image_index, x, y + text_height/2);
}

//draw label
var color = c_white;
if(!enabled) color = c_gray;
else if(hover) color = c_green;

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(font);
draw_set_color(color);
draw_text(x + focus_indent, y, caption);