event_inherited();

if(btn_hover_flag && mouse_check_button_pressed(mb_left)){
	with(obj_HUD_btn_construct){
		btn_bg_color_idle = global.btn_bg_color;
		btn_bg_color_hover = global.btn_bg_color_hover;
		btn_bg_color = btn_bg_color_idle;
	}
	btn_bg_color_idle = global.btn_active_bg_color;
	btn_bg_color_hover = global.btn_active_bg_color_hover;
	btn_bg_color = btn_bg_color_idle;
	
	global.construct = construct;
	global.construction_is_valid = false;
	global.construct_button = self;
}