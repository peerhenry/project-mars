/// @arg gui_container
/// @arg category
/// @arg sprite
/// @arg tooltip
var arg_container = argument0;
var arg_sprite = argument1;
var arg_category = argument2;
var arg_tooltip = argument3;

#region Create Category button

var cat_btn = scr_create_gui_item_sprite(arg_container, 0, 0, arg_sprite);
//var cat_btn = scr_create_gui_item_icon_button(arg_container, 0, 0, arg_sprite, 0, 0);
with(cat_btn)
{
	should_draw_panel = true;
	tooltip_title = arg_tooltip;
	category = arg_category;
	halign = align_h.center;
	valign = align_v.mid;
	width = 32; // important to set because sprite may be smaller
	height = 32;
	
	sprite_button_color = c_white;
	click_script = scr_click_select_construction_category;
}

#endregion

#region Create Category Build Selection Panel

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();
var build_select_panel = instance_create_depth(global.gui, 0, 0, obj_gui_container_autosize);

with(build_select_panel)
{
	origin_x = gui_w/2;
	origin_y = gui_h - arg_container.height;
	halign = align_h.center; // origin is at center-bottom of this panel
	valign = align_v.bottom;
	should_draw_panel = true;
	visible = false;
	padding = arg_container.padding;
	spacing = 2;
	orientation = stack.horizontal;
}

#endregion

#region Create Category Panel Items

var counter = 0;
var construction_list = global.active_constructions;
for(var n = 0; n < ds_list_size(construction_list); n++)
{
	var next_build = ds_list_find_value(construction_list, n);
	if(scr_get_category(next_build) == arg_category)
	{
		var next_sprite = scr_hud_sprite_for_build(next_build);
		var next_image_index = scr_hud_image_for_build(next_build);		
		var new_btn = scr_create_gui_item_icon_button(build_select_panel, 0, 0, next_sprite, 0, 0);
		with(new_btn)
		{
			should_draw_rectangle = true;
			should_draw_panel = false;
			construction = next_build;
			tooltip_title = scr_get_tooltip_text(next_build);
			halign = align_h.center;
			valign = align_v.mid;
			click_script = scr_click_select_construction;
		}
	}
}

#endregion

cat_btn.build_select_panel = build_select_panel;