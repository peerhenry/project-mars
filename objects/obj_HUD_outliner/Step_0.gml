if(gui_w != display_get_gui_width() || gui_h != display_get_gui_height()) //update responsive screen positions
{
	gui_w = display_get_gui_width();
	gui_h = display_get_gui_height();

	//anchor everything to right //todo: via dynamic container
	tab_astro_left = gui_w - tab_w;
	tab_astro_right = gui_w;

	tab_robot_left = gui_w - tab_w;
	tab_robot_right = gui_w;

	tab_cart_left = gui_w - tab_w;
	tab_cart_right = gui_w;

	text_left = gui_w - tab_w + 4;
	
	with(obj_HUD_entity_panel)
	{
		left = other.gui_w - other.tab_w;
	}
}

if(global.mousedrag_from == mousedrag_from.world) exit; //prevent hover when dragging into from outside

var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();

var new_hover_astro_tab = window_mouse_x > tab_astro_left
	&& window_mouse_x < tab_astro_right
	&& window_mouse_y > tab_astro_top
	&& window_mouse_y < tab_astro_top + tab_h;

var new_hover_robot_tab = window_mouse_x > tab_robot_left
	&& window_mouse_x < tab_robot_right
	&& window_mouse_y > tab_robot_top
	&& window_mouse_y < tab_robot_top + tab_h;

var new_hover_cart_tab = window_mouse_x > tab_cart_left
	&& window_mouse_x < tab_cart_right
	&& window_mouse_y > tab_cart_top
	&& window_mouse_y < tab_cart_top + tab_h;

var new_hover = 
	hover_astro_tab != new_hover_astro_tab
	|| hover_robot_tab != new_hover_robot_tab
	|| hover_cart_tab != new_hover_cart_tab;
if(new_hover)
{
	resolve_execute(global.script_container, "play_sound", sound_hover);
	hover_astro_tab = new_hover_astro_tab;
	hover_robot_tab = new_hover_robot_tab;
	hover_cart_tab = new_hover_cart_tab;
	hover = hover_astro_tab || hover_robot_tab || hover_cart_tab;
}

var clicked = mouse_check_button_pressed(mb_left);

if(clicked)
{
	if(hover_astro_tab)
	{
		show_astro_panels = !show_astro_panels;
		scr_set_outliner_part(id, obj_astronaut, show_astro_panels);
		reset = true;
	}
	else if(hover_robot_tab)
	{
		show_robot_panels = !show_robot_panels;
		scr_set_outliner_part(id, obj_robot, show_robot_panels);
		reset = true;
	}
	else if(hover_cart_tab)
	{
		show_cart_panels = !show_cart_panels;
		scr_set_outliner_part(id, obj_cart, show_cart_panels);
		reset = true;
	}
}

if(reset)
{
	scr_reset_outliner(id);
	reset = false;
}