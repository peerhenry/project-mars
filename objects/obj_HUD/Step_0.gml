/// @descr responsive stuff & buttons hover/click

if(gui_w != display_get_gui_width()) //update responsive horizontal screen positions
{
	gui_w = display_get_gui_width();
	gui_h = display_get_gui_height();
	minimap.x = gui_w - minimap.width; //anchor to right
	
	var btns_left = 0;
	var btns_right = 0;
	for(var i = 0; i < ds_list_size(buttons); i++) //todo: should change to use x,y, width and height as to simplify relative coordinates
	{
		var button = buttons[|i];
		if(button.anchor == 0) continue; //fixed position //todo: shift to scaled relative horizontal position?
		
		if(button.anchor == -1) button.x = btns_left++ * button.width; //anchor left //todo: what about text btns with variable size?
		else if(button.anchor == 1) button.x = gui_w - (++btns_right * button.width); //anchor right
	}
}

if(global.mousedrag_from == mousedrag_from.world) exit; //prevent hover when dragging into from outside

var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();
var pressed = mouse_check_button_pressed(mb_left);
var released = mouse_check_button_released(mb_left);
var right_clicked = mouse_check_button_released(mb_right);
mouse_over_HUD = window_mouse_y < 36; // hud top bar

#region buttons hover & click logic

var mouse_over_one = false;
for(var n = 0; n < ds_list_size(buttons); n++)
{
	var button = buttons[| n];
	var mouse_over = 
		window_mouse_x > button.x
		&& window_mouse_x < button.x + button.width
		&& window_mouse_y > button.y
		&& window_mouse_y < button.y + button.height
	if(mouse_over)
	{
		if(hover_button != button) resolve_execute(global.script_container, "play_sound", sound_hover);
		hovers = true;
		hover_button = button;
		mouse_over_one = true;
		if(pressed) press_button = button;
		else if(released) scr_hud_button_click(button);
	}
	if(press_button == button && released) press_button = noone;
}
if(!mouse_over_one) hover_button = noone;

#endregion