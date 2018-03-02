/// @arg hud
/// @arg x
/// @arg y
/// @arg sprite
/// @arg padding
/// @arg action
var hud = argument0;
var arg_x = argument1;
var arg_y = argument2;
var sprite = argument3;
var arg_padding = argument4;
var arg_action = argument5;

var sw = sprite_get_width(sprite);
var sh = sprite_get_height(sprite);

var pad = arg_padding;
var pad2 = 2*pad;

scr_add_hud_button_ext( hud, arg_x, arg_x + pad2 + sw, arg_y, arg_y + pad2 + sh, noone, "", arg_x + pad, arg_y + pad, sprite, arg_action );