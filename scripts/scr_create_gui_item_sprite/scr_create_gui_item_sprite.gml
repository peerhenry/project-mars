/// @arg container
/// @arg x
/// @arg y
/// @arg sprite
function scr_create_gui_item_sprite(argument0, argument1, argument2, argument3) {
	var arg_container = argument0;
	var arg_left = argument1;
	var arg_top = argument2;
	var arg_sprite = argument3;

	var item = instance_create_depth(arg_container, 0, 0, obj_gui_item);
	with(item)
	{
		class = gui_item_class.none;
	
		sprite = arg_sprite;
		var spr_w = sprite_get_width(sprite);
		var spr_h = sprite_get_height(sprite);
		sprite_x = arg_left;
		sprite_y = arg_top;
	
		left = arg_left;
		top = arg_top;
		width = spr_w;
		height = spr_h;
		right = left + width;
		bottom = top + height;
	}
	return item;


}
