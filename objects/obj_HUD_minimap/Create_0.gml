width = 200;
height = 200;
border_size = 2;
border_color = c_aqua;
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
if(room_ar >= map_ar) scale = borderless_width / room_width;
else if(room_ar < map_ar) scale = borderless_height / room_height;

inner_width = room_width * scale;
inner_height = room_height * scale;
inner_left = (borderless_width / 2) - (inner_width / 2);
inner_top = (borderless_height / 2) - (inner_height / 2);

// -- render temp background sprite --
var _surf_bg = surface_create(borderless_width, borderless_height);
var _surf_room = surface_create(room_width, room_height);
surface_set_target(_surf_room);

draw_clear(c_black);
draw_sprite_tiled(spr_default, 0, 0, 0);
draw_tilemap(layer_tilemap_get_id(layer_get_id("Tiles_surface")), 0, 0);

surface_reset_target();
surface_set_target(_surf_bg);

if(background_color != noone) draw_clear(background_color);
draw_surface_stretched(_surf_room, inner_left, inner_top, inner_width, inner_height);
var _org_a = draw_get_alpha();
draw_set_alpha(0.15);
gpu_set_blendmode(bm_add);
draw_rectangle_color(inner_left, inner_top, inner_left + inner_width, inner_top + inner_height, c_white, c_white, c_white, c_white, false);
draw_set_alpha(_org_a);
gpu_set_blendmode(bm_normal);

spr_background = sprite_create_from_surface(_surf_bg, 0, 0, borderless_width, borderless_height, false, false, 0, 0);

surface_reset_target();
surface_free(_surf_bg);
surface_free(_surf_room);
