/// @arg hud
/// @arg left
/// @arg right
/// @arg top
/// @arg bottom
/// @arg font
/// @arg text
/// @arg text_x
/// @arg text_y
/// @arg sprite
var hud = argument0;
var l = argument1;
var r = argument2;
var t = argument3;
var b = argument4;
var font = argument5;
var text = argument6;
var text_x = argument7;
var text_y = argument8;
var sprite = argument9;
var arg_action = argument10;

var new_button = ds_map_create();
ds_map_add(new_button, "sprite", sprite);
ds_map_add(new_button, "font", font);
ds_map_add(new_button, "text", text);
ds_map_add(new_button, "text_x", text_x);
ds_map_add(new_button, "text_y", text_y);
ds_map_add(new_button, "top", t);
ds_map_add(new_button, "bottom", b);
ds_map_add(new_button, "left", l);
ds_map_add(new_button, "right", r);
ds_map_add(new_button, "width", r-l);
ds_map_add(new_button, "height", b-t);
ds_map_add(new_button, "action", arg_action);
ds_map_add(new_button, "active", false);

with(hud) ds_list_add(buttons, new_button);