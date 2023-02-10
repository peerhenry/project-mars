/// @param width
/// @param height
function scr_zoom(argument0, argument1) {
	var new_w = argument0;
	var new_h = argument1;

	var cam = view_camera[0];
	var cam_w = camera_get_view_width(cam);
	var cam_h = camera_get_view_height(cam);
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);
	var center_x = cam_x + cam_w/2;
	var center_y = cam_y + cam_h/2;
	var new_x = center_x - new_w/2;
	var new_y = center_y - new_h/2;

	// prevent cam zooming out from going out of bounds
	if(new_h > cam_h) // it was a zoom out
	{
		if(new_y + new_h > room_height)
		{
			new_y = room_height - new_h;
		}
		else if(new_y < 0)
		{
			new_y = 0;
		}
	}
	if(new_w > cam_w)
	{
		if(new_x + new_w > room_width) new_x = room_width - new_w;
		else if(new_x < 0) new_x = 0;
	}

	camera_set_view_size(cam, new_w, new_h);
	camera_set_view_pos(cam, new_x, new_y);


}
