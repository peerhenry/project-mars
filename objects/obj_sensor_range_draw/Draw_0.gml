#macro macro_sensor_d_squared 49

if(global.construct == macro_drill || global.construct == macro_sensor)
{
	draw_set_color(c_aqua);
	draw_set_alpha(0.2);

	with(obj_sensor){
		if(!under_construction && scr_get_grid_prop(id, macro_grid_electric, macro_grid_component_active))
		{
			for(var ni = -20; ni <= 20; ni++){
				for(var nj = -20; nj <= 20; nj++){
					var target_i = occ_i + ni;
					var target_j = occ_j + nj;
					if(target_i >= 0 && target_j >= 0) // todo: also check room border
					{
						var d_squared = ni*ni + nj*nj;
						if(d_squared < macro_sensor_d_squared)
						{
							var x1 = scr_gi_to_rc(target_i) - 16;
							var y1 = scr_gi_to_rc(target_j) - 16;
							var x2 = x1 + 31;
							var y2 = y1 + 31;
							draw_rectangle(x1,y1,x2,y2,false);
						}
					}
				}
			}
		}
	}

	draw_set_color(c_white);
	draw_set_alpha(1);
}