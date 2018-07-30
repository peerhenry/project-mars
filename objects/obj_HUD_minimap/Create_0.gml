width = 230 - 1; //outliner width minus half of shiny border line
height = width; //forcing square design as maps are currently all square (prevent letterbox)
border_size = 0;
border_color = global.hud_border_color;
border_alpha = 0.5
background_color = noone; //noone = transparent bg fill
background_alpha = 1;
camera_border_size = 1;
camera_border_color = c_white;
camera_border_alpha = 0.5;

hover = false;
surf_minimap = noone;
spr_background = noone;

borderless_width = width - (2 * border_size);
borderless_height = height - (2 * border_size);

var room_ar = room_width / room_height;
var map_ar = width / height;
scale_x = borderless_width / room_width;
scale_y = borderless_height / room_height;

/*
// previous way of doing things: universal scaling
// caused a white band on minimap for non-square maps
if(room_ar >= map_ar) scale = scale_x;
else if(room_ar < map_ar) scale = scale_y;
scale_x = scale;
scale_y = scale;
*/

inner_width = room_width * scale_x;
inner_height = room_height * scale_y;
inner_left = (borderless_width / 2) - (inner_width / 2);
inner_top = (borderless_height / 2) - (inner_height / 2);

// -- render temp background sprite --

var tilemap = layer_tilemap_get_id(layer_get_id("Tiles_surface"));
var tilemap_width = tilemap_get_width(tilemap);
var tilemap_height = tilemap_get_height(tilemap);
var colormap = ds_map_create();
var colorgrid = ds_grid_create(tilemap_width, tilemap_height);
for(var xx = 0; xx < tilemap_width; xx++)
{
	for(var yy = 0; yy < tilemap_height; yy++)
	{
		var tile = tilemap_get(tilemap, xx, yy);
		var index = tile_get_index(tile);
		if(ds_map_exists(colormap, index)) var color = colormap[? index]; //load from map
		else //sample color
		{
			var color = scr_sample_tile_color(tilemap, tile);
			ds_map_add(colormap, index, color); //store to map
		}
		ds_grid_set(colorgrid, xx, yy, color);
	}
}
ds_map_destroy(colormap);

show_debug_message("@# MINIMAP DETAILS"); // DEBUG
show_debug_message("borderless_width: " + string(borderless_width)); // DEBUG
show_debug_message("borderless_height: " + string(borderless_height)); // DEBUG

var surf_bg = surface_create(borderless_width, borderless_height);
surface_set_target(surf_bg);
if(background_color != noone) draw_clear(background_color);
else draw_clear(c_black);

var scaled_width = tilemap_get_tile_width(tilemap) * (inner_width / room_width);
var scaled_height = tilemap_get_tile_height(tilemap) * (inner_height / room_height);

show_debug_message("scaled_width: " + string(scaled_width)); // DEBUG
show_debug_message("scaled_height: " + string(scaled_height)); // DEBUG

for(var xx = 0; xx < tilemap_width; xx++)
{
	for(var yy = 0; yy < tilemap_height; yy++)
	{
		var color = ds_grid_get(colorgrid, xx, yy);
		var cl = xx * scaled_width;
		var ct = yy * scaled_height;
		var cr = cl + scaled_width;
		var cb = ct + scaled_height;
		draw_rectangle_color(cl, ct, cr, cb, color, color, color, color, false);
	}
}
ds_grid_destroy(colorgrid);

//todo: alternative method could be: draw colorgrid as pixels and then stretch to needed size

spr_background = sprite_create_from_surface(surf_bg, 0, 0, borderless_width, borderless_height, false, false, 0, 0);

surface_reset_target();
surface_free(surf_bg);
