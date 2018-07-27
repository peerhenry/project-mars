event_inherited();
gui_item_count = 0;
reset = false;

anchor_item = noone;
enum stack
{
	vertical,
	horizontal
}

orientation = stack.vertical;
spacing = 0;
padding = 4;

content_align_h = align_h.center;
content_align_v = align_v.mid;

step_script = scr_gui_item_step_set_hover;