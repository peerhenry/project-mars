function scr_click_select_construction(argument0) {
	var arg_button = argument0;
	scr_deselect_all();
	resolve_execute(global.script_container, "play_sound", sound_click);
	scr_ghost_reset_with_constr_type(arg_button.construction);


}
