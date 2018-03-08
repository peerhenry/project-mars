hover = false;
surf_minimap = noone;
spr_background = noone;
size = [room_width / 32, room_height / 32]; //todo: any target size + extra enlarge specific entities
map_entities = ds_list_create();
ds_list_add(map_entities, [obj_base_tile, c_gray]);
ds_list_add(map_entities, [obj_astronaut, c_lime]);
//todo: enemy, selected

// -- render temp background sprite --
var _surf_bg = surface_create(size[0], size[1]);
var _surf_room = surface_create(room_width, room_height);
surface_set_target(_surf_room);

draw_clear(c_black);
draw_sprite_tiled(spr_default, 0, 0, 0);
draw_tilemap(layer_tilemap_get_id(layer_get_id("Tiles_surface")), 0, 0);

surface_reset_target();
surface_set_target(_surf_bg);

draw_surface_stretched(_surf_room, 0, 0, size[0], size[1]); //todo: preserve aspect ratio

spr_background = sprite_create_from_surface(_surf_bg, 0, 0, size[0], size[1], false, false, 0, 0);

surface_reset_target();
surface_free(_surf_bg);
surface_free(_surf_room);
