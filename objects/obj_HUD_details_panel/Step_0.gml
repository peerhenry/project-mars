unit = scr_get_single_selected();
var clicked = mouse_check_button_pressed(mb_left);
hover_deselect = false;
hover_center = false;
if(unit != noone)
{
	var wmx = window_mouse_get_x();
	var wmy = window_mouse_get_y();
	var hover_main = (
		wmx >= left
		&& wmx <= right
		&& wmy >= top
		&& wmy <= bottom
	);
	
	if(hover_main)
	{
		if(clicked)
		{
			// whered you click
		}
		
		#region inventory
		if(scr_instance_inherits(unit, obj_task_actor) || unit.object_index == obj_fridge)
		{
			// 3x3 inventory
			hover_inventory = (
				wmx >= inventory_x
				&& wmx <= inventory_x + inventory_w
				&& wmy >= inventory_y
				&& wmy <= inventory_y + inventory_h
			);
		}
		#endregion 
		
		hover = true;
	}
	else
	{
		// check buttons
		hover_deselect = (
			wmx >= deselect_button_left
			&& wmx <= deselect_button_right
			&& wmy >= deselect_button_top
			&& wmy <= deselect_button_bottom
		);
		if(!hover_deselect)
		{
			hover_center = (
				wmx >= center_cam_button_left
				&& wmx <= center_cam_button_right
				&& wmy >= center_cam_button_top
				&& wmy <= center_cam_button_bottom
			);
		}
		
		hover = hover_deselect || hover_center;
		
		if(clicked)
		{
			if(hover_deselect)
			{
				unit.is_selected = false;
				unit = noone;
			}
			else if(hover_center)
			{
				scr_center_screen_on(unit);
			}
		}
	}
}
else hover = false;