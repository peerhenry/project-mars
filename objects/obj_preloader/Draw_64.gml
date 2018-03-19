// Draw splash sprite
draw_sprite(sprite_index, 0, x, y);

// Draw progress bar
var px2 = px + (progress/100) * pw;
draw_set_alpha(pa);
draw_rectangle_color(px, py, px2, py + ph, pc, pc, pc, pc, false);
draw_set_alpha(1);