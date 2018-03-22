event_inherited();

active_category = noone;

padding = 8;
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();
var gui_half_w = gui_w/2;
var b_size = 32;
var b_left = gui_half_w - 1.5*b_size;
var b_top = gui_h - b_size - padding;

width = b_size*4 + 2*padding;
height = b_size + 2*padding;
left = b_left - padding;
top = b_top - padding;
right = left + width;
bottom = top + height;
should_draw_panel = true;

var b1 = scr_create_gui_item_sprite(id, b_left, b_top, spr_destruct); // sprite is 32
with(b1)
{
	sprite_x += 16;
	sprite_y += 16;
	should_draw_panel = true;
	tooltip_title = "Deconstruction";
	category = macro_category_deconstruction;
}

// b1.mouse_enter_script = 

var b2 = scr_create_gui_item_sprite(id, b_left + 32, b_top, spr_category_foundation); // sprite is 24
with(b2)
{
	sprite_x += 16;
	sprite_y += 16;
	should_draw_panel = true;
	tooltip_title = "Base Foundation";
	category = macro_category_foundation;
	width = 32;
	height = 32;
	bottom = top + height;
	right = left + width;
}

var b3 = scr_create_gui_item_sprite(id, b_left + 64, b_top, spr_category_inside); // sprite is 24
with(b3)
{
	sprite_x += 16;
	sprite_y += 16;
	should_draw_panel = true;
	tooltip_title = "Inside Constructions";
	category = macro_category_inside;
	width = 32;
	height = 32;
	bottom = top + height;
	right = left + width;
}

var b4 = scr_create_gui_item_sprite(id, b_left + 96, b_top, spr_category_outside); // sprite is 24
with(b4)
{
	sprite_x += 16;
	sprite_y += 16;
	should_draw_panel = true;
	tooltip_title = "Outside Constructions";
	category = macro_category_outside;
	width = 32;
	height = 32;
	bottom = top + height;
	right = left + width;
}