/// @param object index
switch(argument0)
{
	case obj_drill:
		return 5;
	case obj_pipe:
	case obj_cable:
		return 0;
	case obj_base_tile:
		return 0.5;
}
return 1;