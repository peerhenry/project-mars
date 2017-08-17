if(scr_should_draw_sensor_range())
{
	var is_being_sensed = false;

	with(obj_sensor)
	{
		if(scr_sensor_can_sense(id)){
			var di = other.occ_i - occ_i;
			var dj = other.occ_j - occ_j;
			var d_squared = di*di + dj*dj;
			if( d_squared < macro_sensor_d_squared ) is_being_sensed = true;
		}
	}
	
	if(is_being_sensed) draw_self();
}