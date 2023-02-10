function scr_sample_tile_color(argument0, argument1) {
	var arg_tilemap = argument0;
	var arg_tiledata = argument1;

	var tileset = tilemap_get_tileset(arg_tilemap);
	var width = tilemap_get_tile_width(arg_tilemap);
	var height = tilemap_get_tile_height(arg_tilemap);

	var surface = surface_create(width, height);
	surface_set_target(surface);
	draw_clear(c_black);
	draw_sprite_tiled(spr_default, 0, 0, 0);
	draw_tile(tileset, arg_tiledata, 0, 0, 0);
	surface_reset_target();

	var buffer = buffer_create(4 * width * height, buffer_fast, 1);
	buffer_get_surface(buffer, surface, 0); // buffer_get_surface(buffer, surface, 0, 0, 0);
	surface_free(surface);

	var r = 0;
	var g = 0;
	var b = 0;
	var a = 0;
	for(var yy = 0; yy < height; yy++)
	{
		var offset = 4 * yy * width;
		buffer_seek(buffer, buffer_seek_start, offset);
		repeat(width)
		{
			r += buffer_read(buffer, buffer_u8);
			g += buffer_read(buffer, buffer_u8);
			b += buffer_read(buffer, buffer_u8);
			a += buffer_read(buffer, buffer_u8);
		}
	}
	buffer_delete(buffer);

	//calculate color
	var pixels = width * height;
	return make_color_rgb(r/pixels, g/pixels, b/pixels);


}
