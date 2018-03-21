working = false;
all_loaded = false;
finished = false;
progress = 0;

// Setup splash screen on room boot

var ww = global.window[? key_window_width]; //todo: or window_get_width() ?
var wh = global.window[? key_window_height]; //todo: or window_get_height() ?

// Anchor splash sprite to center
x = ww/2 - sprite_width/2;
y = wh/2 - sprite_height/2;

// Progress bar
pc = scr_hex_to_color("006464");
pa = 1;
pw = 440;
ph = 2;
px = ww/2 - pw/2;
py = 8/9 * display_get_gui_height();

// Set cursor sprite
cursor_sprite = spr_cursor;