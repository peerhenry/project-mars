/// @param object index
function scr_get_mdu_count(argument0) {
	switch(argument0)
	{
		case obj_drill:
			return 5;
		case obj_pipe:
		case obj_cable:
			return 0;
		case obj_base_tile:
			return 0.125;
		case obj_destruct_placemarker:
		case obj_destruct:
		case noone:
			return 0;
	}
	return 1;


}
