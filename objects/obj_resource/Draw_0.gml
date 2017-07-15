if(scr_should_draw_sensor_range())
{
	var within_sensor_range = false;

	with(obj_sensor)
	{
		if(!under_construction && is_active){
			var di = other.occ_i - occ_i;
			var dj = other.occ_j - occ_j;
			var d_squared = di*di + dj*dj;
			if( d_squared < macro_sensor_d_squared ) within_sensor_range = true;
		}
	}
	
	if(within_sensor_range) draw_self();
}