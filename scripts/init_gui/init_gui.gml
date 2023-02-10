/// @arg gui
function init_gui(argument0) {

	// gui containers
	instance_create_depth(argument0, 0, 0, obj_gui_construction_menu);

	// container for objectives and player alert
	var gui_topleft = instance_create_depth(argument0, 0, 0, obj_gui_container_autosize);
	global.gui_topleft = gui_topleft;

	var offset_hud_bar = 36 + 4; // obj_HUD does not exist yet
	gui_topleft.origin_y = offset_hud_bar;
	gui_topleft.spacing = 8;

	with(obj_level)
	{
		// only run this when level exists
		global.gui_objectives_panel = scr_create_gui_objectives_panel(gui_topleft);	
	}

	// cursor
	instance_create_depth(0, 0, 0, obj_cursor);


}
