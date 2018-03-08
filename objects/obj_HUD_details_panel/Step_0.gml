unit = scr_get_single_selected();
if(unit != noone)
{
	var wmx = window_mouse_get_x();
	var wmy = window_mouse_get_y();
	hover = (
		wmx > left
		&& wmx < right
		&& wmy > top
		&& wmy < bottom
	);
	
	if(hover)
	{
		var clicked = mouse_check_button_pressed(mb_left);
		if(clicked)
		{
			// whered you click
		}
		
		#region inventory
		if(scr_instance_inherits(unit, obj_task_actor) || unit.object_index == obj_fridge)
		{
			// 3x3 inventory
			hover_inventory = (
				wmx > inventory_x
				&& wmx < inventory_x + inventory_w
				&& wmy > inventory_y
				&& wmy < inventory_y + inventory_h
			);
		}
		#endregion 
		
	}
}
else hover = false;