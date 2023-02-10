function scr_gate_connects_horizontally(argument0) {
	debug_instance_inherits(argument0, obj_gate);
	with(argument0)
	{
		return rot_param == 1 || rot_param == 3;
	}


}
