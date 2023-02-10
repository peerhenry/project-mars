function scr_toggle_zoom() {
	zoomed_in = global.zoomed_in;
	var width = window_get_width();
	var height = window_get_height();
	zoomed_in = !zoomed_in;
	if(zoomed_in)
	{
		scr_zoom(width/2, height/2);
	}
	else
	{
		scr_zoom(width, height);
	}
	global.zoomed_in = zoomed_in;


}
