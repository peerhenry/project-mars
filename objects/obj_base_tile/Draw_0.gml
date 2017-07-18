event_inherited();

if(wall_adjacency == 0 || under_construction) exit;

var grid_props = grid_props_map[? macro_grid_electric];
var grid = grid_props[macro_grid_component_grid];
var is_active = grid_props[macro_grid_component_active];

var light_image_index = 0;
if(is_active && scr_can_draw_power(id)) light_image_index = 1;

if(wall_adjacency & macro_east_number == macro_east_number)
{
	draw_sprite_ext(spr_tile_light, light_image_index, x, y, 1, 1, 270, c_white, 1);
}
if(wall_adjacency & macro_north_number == macro_north_number)
{
	draw_sprite_ext(spr_tile_light, light_image_index, x, y, 1, 1, 0, c_white, 1);
}
if(wall_adjacency & macro_west_number == macro_west_number)
{
	draw_sprite_ext(spr_tile_light, light_image_index, x, y, 1, 1, 90, c_white, 1);
}
if(wall_adjacency & macro_south_number == macro_south_number)
{
	draw_sprite_ext(spr_tile_light, light_image_index, x, y, 1, 1, 180, c_white, 1);
}
