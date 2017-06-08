arg_build = argument0;

switch(arg_build)
{
	case build.basetile:
		return spr_base_tile;
	case build.wall:
		return spr_wall;
	case build.door:
		return spr_door;
	case build.hatch:
		return spr_hatch;
	case build.suit_closet:
	case build.suit_closet_empty:
		return spr_suit_closet;
	case build.sensor:
		return spr_sensor;
	case build.drill:
		return spr_drill_bottom;
	case build.pump:
		return spr_pump;
	case build.battery:
		return spr_battery;
	case build.cable:
		return spr_cable;
	case build.pipe:
		return spr_pipe;
}

return noone;