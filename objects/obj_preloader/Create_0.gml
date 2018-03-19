working = false;
all_loaded = false;
finished = false;
progress = 0;

// Setup splash screen on room boot

// Anchor splash sprite to center
x = global.window_width / 2 - sprite_width / 2;
y = global.window_height / 2 - sprite_height / 2;

// Progress bar
pc = scr_hex_to_color("006464");
pa = 1;
pw = 440;
ph = 2;
px = global.window_width/2 - pw/2;
py = 8/9 * display_get_gui_height();

// Set cursor sprite
cursor_sprite = spr_cursor;