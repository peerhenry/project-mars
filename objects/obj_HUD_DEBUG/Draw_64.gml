draw_set_font(font_hud);
draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

var drag = false;

with(obj_mouse_listener)
{
	drag = is_dragging;
}

dy = 0;
draw_text(1920/2, 1080/2 + dy, "is draggin: " + string(drag));
dy += 32;