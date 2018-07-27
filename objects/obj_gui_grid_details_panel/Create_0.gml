event_inherited();
grid = y;
if(!instance_exists(grid)) exit;
if(grid.object_index != obj_grid) show_error("Grid in grid details panel is not a grid", true);
orientation = stack.horizontal;
anchor_item = container;
halign = align_h.left;
valign = align_v.bottom;
content_align_h = align_h.center;
content_align_v = align_v.mid;
should_draw_panel = true;
step_script = scr_gui_item_step_set_hover;
padding = 16;
spacing = 8;

var grid_font = font_hud;
var font_size = font_get_size(grid_font);

// grid production
var c1 = instance_create_depth(id, 0, 0, obj_gui_container_autosize);
with(c1)
{
	padding = 16;
	spacing = 8;
	should_draw_rectangle = true;
	rectangle_alpha = 0.5;
}
scr_create_gui_item_sprite(c1, 0, 0, spr_grid_electric_source);
var l1 = instance_create_depth(c1, grid, 0, obj_gui_grid_prop_label);
with(l1)
{
	font = grid_font;
	text_halign = fa_center;
	step_script = scr_gui_item_step_grid_production_label;
	height = font_size;
}

// arrow
scr_create_gui_item_sprite(id, 0, 0, spr_grid_flow_arrow);

// grid storage / net output
var c2 = instance_create_depth(id, 0, 0, obj_gui_container_autosize);
with(c2)
{
	padding = 16;
	spacing = 8;
	should_draw_rectangle = true;
	rectangle_alpha = 0.5;
}
var sprite_thing = scr_create_gui_item_sprite(c2, 0, 0, spr_grid_electric_storage_fill);
var l2 = instance_create_depth(c2, grid, 0, obj_gui_grid_prop_label);
with(l2)
{
	grid_part_sprite = sprite_thing;
	font = grid_font;
	text_halign = fa_center;
	step_script = scr_gui_item_step_grid_net_label;
	height = font_size;
}

// arrow
scr_create_gui_item_sprite(id, 0, 0, spr_grid_flow_arrow);

// grid demand
var c3 = instance_create_depth(id, 0, 0, obj_gui_container_autosize);
with(c3)
{
	padding = 16;
	spacing = 8;
	should_draw_rectangle = true;
	rectangle_alpha = 0.5;
}
scr_create_gui_item_sprite(c3, 0, 0, spr_grid_electric_consumption);
var l3 = instance_create_depth(c3, grid, 0, obj_gui_grid_prop_label);
with(l3)
{
	font = grid_font;
	text_halign = fa_center;
	step_script = scr_gui_item_step_grid_demand_label;
	height = font_size;
}