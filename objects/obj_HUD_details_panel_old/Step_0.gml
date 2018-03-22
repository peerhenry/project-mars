if(global.mousedrag_from == mousedrag_from.world) exit; // prevent step when dragging into this from outside

var clicked = mouse_check_button_pressed(mb_left);
var r_clicked = mouse_check_button_pressed(mb_right);

hover_component = noone;

for(var n = 0; n < ds_list_size(component_list); n++)
{
	var next_component = component_list[| n];
	scr_step_details_panel_component(next_component);
	if(destroy)
	{
		if(instance_exists(sub_panel)) instance_destroy(sub_panel);
		instance_destroy();
		exit;
	}
	if(next_component.hover)
	{
		hover_component = next_component;
	}
}

var wmx = window_mouse_get_x();
var wmy = window_mouse_get_y();
hover = hover_component != noone || (
	wmx >= left
	&& wmx <= right
	&& wmy >= top
	&& wmy <= bottom
);

inv_hover_item = noone;
if( hover_component != noone && hover_component.class == details_panel_component_class.inventory )
{
	// get item hovers over
	var inv_x = floor((wmx - hover_component.left)/64);
	var inv_y = floor((wmy - hover_component.top)/64);
	inv_hover_item = scr_inventory_get_item(unit.inventory, inv_x, inv_y);
	if(inv_hover_item != noone && scr_instance_inherits(unit, obj_task_actor))
	{
		if((r_clicked || clicked) && inv_hover_item.class == item_class.weapon)
		{
			unit.equipped_item = inv_hover_item;
		}
		else if(r_clicked && inv_hover_item.class == item_class.food)
		{
			scr_eat(unit);
		}
	}
}