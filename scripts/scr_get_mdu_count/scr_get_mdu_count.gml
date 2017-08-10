/// @param object index
switch(argument0)
{
	case obj_drill:
		return 5;
	case obj_pipe:
	case obj_cable:
		return 0;
}
return 1;