function init_tutorial() {
	ds_list_clear(global.active_constructions);

	scr_update_hud_category(macro_category_deconstruction);
	scr_update_hud_category(macro_category_foundation);
	scr_update_hud_category(macro_category_inside);
	scr_update_hud_category(macro_category_outside);


}
