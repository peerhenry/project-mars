var draw_tall_walls = !global.draw_tall_walls;
global.draw_tall_walls = draw_tall_walls;
if(draw_tall_walls)
{
	with(obj_wall)
	{
		sprite_index = spr_wall_tall;
	}
	with(obj_door)
	{
		if(sprite_index == spr_door) sprite_index = spr_door_tall;
		if(sprite_index == spr_door_vertical) sprite_index = spr_door_tall_vertical;
	}
	with(obj_hatch)
	{
		if(sprite_index == spr_hatch) sprite_index = spr_hatch_tall;
		if(sprite_index == spr_hatch_vertical) sprite_index = spr_hatch_tall_vertical;
	}
}
else
{
	with(obj_wall)
	{
		sprite_index = spr_wall;
	}
	with(obj_door)
	{
		if(sprite_index == spr_door_tall) sprite_index = spr_door;
		if(sprite_index == spr_door_tall_vertical) sprite_index = spr_door_vertical;
	}
	with(obj_hatch)
	{
		if(sprite_index == spr_hatch_tall) sprite_index = spr_hatch;
		if(sprite_index == spr_hatch_tall_vertical) sprite_index = spr_hatch_vertical;
	}
}