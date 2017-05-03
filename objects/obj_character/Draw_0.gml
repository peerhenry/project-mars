/// @description Insert description here
// You can write your code in this editor

if(is_walking){
	dx = x - prev_x;
	dy = y - prev_y;
	if(dx > 0)
	{
		moveDir = right;
	}
	else if(dx < 0)
	{
		moveDir = left;
	}
	if(dy < 0)
	{
		if(dy < dx - 0.1) moveDir = up;
	}
	else if(dy > 0 && dy > dx + 0.1)
	{
		moveDir = down;
	}
	
	prev_x = x;
	prev_y = y;
}
else sprite_index = spr_character_stand;

switch(moveDir)
{
	case still:
	{
		if(sprite_index != spr_character_stand) sprite_index = spr_character_stand;
		break;
	}
	case up:
	{
		if(sprite_index != spr_character_walk_up) sprite_index = spr_character_walk_up;
		break;
	}
	case down:
	{
		if(sprite_index != spr_character_walk_down) sprite_index = spr_character_walk_down;
		break;
	}
	case left:
	{
		if(sprite_index != spr_character_walk_right || image_xscale != -1)
		{
			sprite_index = spr_character_walk_right;
			image_xscale = -1;
		}
		break;
	}
	case right:
	{
		if(sprite_index != spr_character_walk_right || image_xscale != 1)
		{
			sprite_index = spr_character_walk_right;
			image_xscale = 1;
		}
		break;
	}
}

if(is_selected)
{
	draw_set_colour(c_black);
	var onlyOutline = true;
	//draw_rectangle(x-16, y-16, x+16, y+16, onlyOutline);	
	draw_sprite(spr_selection, 0, x, y);
}

draw_healthbar(x - 12, y - 17, x + 12, y - 15, 100, c_black, c_red, c_lime, 0, true, false)
draw_self();