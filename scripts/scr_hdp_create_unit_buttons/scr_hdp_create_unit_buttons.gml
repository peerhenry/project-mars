/// @arg unit
/// @arg container
/// @arg content_left
/// @arg y_offset
var arg_unit = argument0;
var arg_container = argument1;
var arg_content_left = argument2;
var arg_y_offset = argument3;
	
var next_y_offset = arg_y_offset;
	
// Deploy button
if(arg_unit.object_index == obj_cart)
{
	var deploybtn = scr_create_gui_state_button(arg_container, arg_content_left, next_y_offset, spr_deploy, 0, details_panel_action.deploy, scr_button_state_cart_deploy);
	deploybtn.cart = arg_unit;
	deploybtn.tooltip_title = "Toggle deploy mode";
	deploybtn.tooltip_description = "If cart is carrying a component, you can use this button to order the cart to place the component on any location on the map."; 
	next_y_offset += deploybtn.height + padding;
}

if(scr_instance_inherits(arg_unit, obj_transit_module))
{
	var liftoff_btn = scr_create_gui_item_icon_button(arg_container, arg_content_left, next_y_offset, spr_takeoff, 0, details_panel_action.takeoff);
	next_y_offset += liftoff_btn.height + padding;
}

return next_y_offset;