event_inherited();
if(btn_hover_flag && mouse_check_button_pressed(mb_left)){
	var l = layer_get_id("logic");
	instance_create_layer(0, 0, l, obj_fade_to_menu);
}