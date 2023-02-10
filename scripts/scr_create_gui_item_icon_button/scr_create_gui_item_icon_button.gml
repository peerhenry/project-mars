/// @arg container
/// @arg x
/// @arg y
/// @arg sprite
/// @arg pad
/// @arg action
function scr_create_gui_item_icon_button(argument0, argument1, argument2, argument3, argument4, argument5) {
	var arg_container = argument0;
	var arg_left = argument1;
	var arg_top = argument2;
	var arg_sprite = argument3;
	var arg_pad = argument4;
	var arg_action = argument5;

	var item = instance_create_depth(arg_container, 0, 0, obj_gui_item);
	with(item)
	{
		class = gui_item_class.button;
	
		should_draw_panel = true;
		sprite = arg_sprite;
		var spr_w = sprite_get_width(sprite);
		var spr_h = sprite_get_height(sprite);
		sprite_x = arg_left + arg_pad + 1;
		sprite_y = arg_top + arg_pad + 1;
	
		left = arg_left;
		top = arg_top;
		width = spr_w + 2*arg_pad;
		height = spr_h + 2*arg_pad;
		right = left + width;
		bottom = top + height;
	
		step_script = scr_gui_item_step_button;
		draw_script = scr_gui_item_draw_button;
		mouse_enter_script = scr_gui_item_enter_sound;
		click_action = arg_action;
	
		// new test, todo: remove if there are no issues
		sprite_button_color = c_aqua;
		sprite_hover_color = c_white;
		sprite_down_color = c_gray;
	}
	return item;


}
