show_astro_panels = false;
show_robot_panels = false;
show_cart_panels = false;

hover = false; // hover over any tab
hover_astro_tab = false;
hover_robot_tab = false;
hover_cart_tab = false;

tab_w = 230;
tab_h = 24;
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();
var top = 88;
with(obj_HUD)
{
	// offset is: bar + margin + button_height + margin
	// = bar + 2*(margin + padding) + sprite height
	top =  hud_bar_h + 2*(outliner_button_margin + outliner_button_padding) + sprite_get_height(outliner_sprite);
}

tab_astro_top = top;
tab_astro_left = gui_w - tab_w;
tab_astro_right = gui_w;

tab_robot_top = top + tab_h + 1;
tab_robot_left = gui_w - tab_w;
tab_robot_right = gui_w;

tab_cart_top = top + 2*(tab_h + 1);
tab_cart_left = gui_w - tab_w;
tab_cart_right = gui_w;

text_left = gui_w - tab_w + 4;
text_y_offset = tab_h/2;

reset = false; // flag used by a panel if an astronaut dies and therefore the panel will be destroyed
active = true;

astro_count = 0;
robot_count = 0;
cart_count = 0;
alarm[0] = 1;