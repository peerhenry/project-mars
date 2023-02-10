function scr_should_draw_sensor_range() {
	var constr_type = scr_get_selected_constr_type();
	return constr_type == macro_drill || constr_type == macro_sensor || global.sensor_selected;


}
