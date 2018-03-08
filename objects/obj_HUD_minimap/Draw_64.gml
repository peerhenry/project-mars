
//border
draw_rectangle_color(x, y, x + size[0] + 1, y + size[1] + 1, c_black, c_black, c_black, c_black, true);

//background
var _inner_topleft = [x + 1, y + 1];
draw_sprite_ext(spr_background, 0, _inner_topleft[0], _inner_topleft[1], 1, 1, 0, c_white, 0.5);

//entities
for(var n = 0; n < ds_list_size(map_entities); n++)
{
	var item = map_entities[|n];
	with(item[0]) draw_point_color(_inner_topleft[0] + (x / 32), _inner_topleft[1] + (y / 32), item[1]);
}

//cam viewport rectangle
var cam_pos = [camera_get_view_x(view_camera[0]) / 32, camera_get_view_y(view_camera[0]) / 32];
var cam_size = [camera_get_view_width(view_camera[0]) / 32 - 1, camera_get_view_height(view_camera[0]) / 32 - 1];
draw_rectangle_color(_inner_topleft[0] + cam_pos[0], _inner_topleft[1] + cam_pos[1], _inner_topleft[0] + cam_pos[0] + cam_size[0], _inner_topleft[1] + cam_pos[1] + cam_size[1], c_white, c_white, c_white, c_white, true);
