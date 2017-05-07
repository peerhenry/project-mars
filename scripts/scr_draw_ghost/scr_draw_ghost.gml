var target_x = argument0;
var target_y = argument1;

var target_i = scr_rc_to_gi(target_x);
var target_j = scr_rc_to_gi(target_y);

var clamped_x = scr_rc_clamp_center(target_x);
var clamped_y = scr_rc_clamp_center(target_y);

var left = ((target_x-16) div 32)*32+16;
var top = ((target_y-16) div 32)*32+16;
var right = left + 32;
var bottom = top + 32;

var can_build = true;

var sprite = noone;
switch(global.construct)
{
	case global.basetile:
		sprite = spr_base_tile;
		can_build = scr_validate(clamped_x, clamped_y, global.basetile);
		left -= 32;
		top -= 32;
		right += 32;
		bottom += 32;
		break;
	case global.wall:
		sprite = spr_wall;
		can_build = scr_validate(clamped_x, clamped_y, global.wall);
		break;
	case global.door:
		// there needs to be a wall and a basetile
		sprite = spr_door;
		can_build = scr_validate(clamped_x, clamped_y, global.door);
		break;
	case global.hatch:
		sprite = spr_hatch;
		can_build = scr_validate(clamped_x, clamped_y, global.hatch);
		break;
}

if(can_build) draw_set_color(c_lime);
else draw_set_color(c_red);
draw_set_alpha(0.5);
draw_rectangle(left, top, right, bottom, false);
draw_sprite(sprite, 0, clamped_x, clamped_y)
draw_set_alpha(1);