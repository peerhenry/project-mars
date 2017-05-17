arg_build = argument0;

switch(arg_build)
{
	case global.basetile:
		return spr_base_tile;
	case global.wall:
		return spr_wall;
	case global.door:
		return spr_door;
	case global.hatch:
		return spr_hatch;
	case global.suit_closet:
	case global.suit_closet_empty:
		return spr_suit_closet;
	case global.sensor:
		return spr_sensor;
}

return noone;