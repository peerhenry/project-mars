// @arg gui_container
var arg_container = argument0;
var inst = instance_create_depth(noone, 0, 0, obj_gui_item);
inst.level = noone;
with(obj_level)
{
	inst.level = id;
}
with(inst)
{
	container = arg_container;
	ds_list_insert(arg_container.gui_item_list, 0, id); // prepend objectives panel so it's always drawn above a player notification
	
	prev_nr_of_objectives = 0; // height is recalculated when nr of objectives change
	padding = 8;
	font = font_small_bold;
	font_height = font_get_size(font); // used for text positioning in draw
	line_space = 4;
	line_height = sprite_get_height(spr_checked);
	line_offset = line_space + line_height;
	current_max_string_w = 0; // max string width of one objective, used to calculate panel width in step
	
	step_script = scr_gui_item_step_objectives;
	draw_script = scr_gui_item_draw_objectives;
}
return inst;