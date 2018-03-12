
//border
scr_draw_rectangle_width_color(x, y, x + width, y + height, border_size, border_color, border_alpha);

//background
draw_sprite_ext(spr_background, 0, x + border_size, y + border_size, 1, 1, 0, c_white, background_alpha);

var map_left = x + border_size + inner_left;
var map_top = y + border_size + inner_top;

//entities //todo: expand with more units/constructions + better contrast with bg?
var entity_size = 32 * scale; //todo: what if bigger than 1 tile?
if(entity_size < 1) entity_size = 1;
with(obj_constructable)
{
	var color = (owner == macro_player) ? c_green : c_maroon;
	if(is_selected) color = c_white;
	draw_rectangle_color(map_left + (x * other.scale), map_top + (y * other.scale), map_left + (x * other.scale) + entity_size, map_top + (y * other.scale) + entity_size, color, color, color, color, false);
}
with(obj_astronaut)
{
	var color = (owner == macro_player) ? c_lime : c_red;
	if(is_selected) color = c_white;
	draw_rectangle_color(map_left + (x * other.scale), map_top + (y * other.scale), map_left + (x * other.scale) + entity_size, map_top + (y * other.scale) + entity_size, color, color, color, color, false);
}

//cam viewport rectangle
var cam_pos = [camera_get_view_x(view_camera[0]) * scale, camera_get_view_y(view_camera[0]) * scale];
var cam_size = [camera_get_view_width(view_camera[0]) * scale, camera_get_view_height(view_camera[0]) * scale];
scr_draw_rectangle_width_color(map_left + cam_pos[0], map_top + cam_pos[1], map_left + cam_pos[0] + cam_size[0], map_top + cam_pos[1] + cam_size[1], camera_border_size, camera_border_color, camera_border_alpha);
