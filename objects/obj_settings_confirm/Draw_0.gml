//prompt message
draw_set_color(c_white);
draw_set_font(font_hud);
var countdown_info = (countdown >= 0) ? " (" + string(countdown) + ")" : "";
draw_text(room_width/2, 2/6 * room_height, "Confirm changes" + countdown_info);