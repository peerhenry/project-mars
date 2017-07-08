if(global.construct == macro_drill || global.construct == macro_sensor)
{
	var within_sensor_range = false;

	with(obj_sensor)
	{
		if(!under_construction){
			var di = other.occ_i - occ_i;
			var dj = other.occ_j - occ_j;
			var d_squared = di*di + dj*dj;
			if( d_squared < macro_sensor_d_squared ) within_sensor_range = true;
		}
	}
	
	if(within_sensor_range) draw_self();
}