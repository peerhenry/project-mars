arg_build = argument0;

switch(arg_build)
{
	case build.basetile:
		return "basetile";
	case build.wall:
		return "wall";
	case build.door:
		return "door";
	case build.hatch:
		return "hatch";
	case build.suit_closet:
		return "suit closet"
	case build.suit_closet_empty:
		return "empty suit closet";
	case build.sensor:
		return "sensor";
	case build.drill:
		return "drill";
	case build.pump:
		return "pump";
	case build.battery:
		return "battery";
	case build.cable:
		return "cable";
	case build.pipe:
		return "pipe";
	case build.oxygen_tank:
		return "oxygen tank";
	case build.bed:
		return "bed";
	case build.operating_table:
		return "operating table";
	case build.airlock_pump:
		return "airlock pump";
}

return "unkown";