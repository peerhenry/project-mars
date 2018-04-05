/// @descr
gui_item_list = ds_list_create();
global.gui = id;
global.hud_details_panel = noone;	// needs to be global for destroying when deselecting astros
global.gui_hover_item = noone;		// in global for tooltip
being_destroyed = false;

resolve_execute(global.script_container, "init_gui", id);