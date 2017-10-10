event_inherited();

//if(wall_adjacency == 0 || under_construction) exit;

// Maar even geen basetile lichtjes...
/*
var light_image_index = 0;
if(scr_can_draw_power(id)) light_image_index = 1;

if((wall_adjacency & macro_east_number) == macro_east_number)
{
	draw_sprite_ext(spr_tile_light, light_image_index, x, y, 1, 1, 270, c_white, 1);
}
if((wall_adjacency & macro_north_number) == macro_north_number)
{
	draw_sprite_ext(spr_tile_light, light_image_index, x, y, 1, 1, 0, c_white, 1);
}
if((wall_adjacency & macro_west_number) == macro_west_number)
{
	draw_sprite_ext(spr_tile_light, light_image_index, x, y, 1, 1, 90, c_white, 1);
}
if((wall_adjacency & macro_south_number) == macro_south_number)
{
	draw_sprite_ext(spr_tile_light, light_image_index, x, y, 1, 1, 180, c_white, 1);
}
*/