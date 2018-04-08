/// @arg component
var arg_component = argument0;

// check if component can be carried by cart
var cart_can_carry = scr_is_cart_carryable(arg_component);
if(!cart_can_carry) return false;

// check if component is already assigned to a cart
var already_assigned = false;
with(obj_cart)
{
	if(assigned_instance == arg_component || carrying_instance == arg_component)
	{
		already_assigned = true;
		break;
	}
}
if(already_assigned) return false;

// get closest selected cart to component
var d_min = 100000000000;
var closest_cart = noone;
with(obj_cart)
{
	if(is_selected && carrying_instance == noone)
	{
		var ds = scr_d_squared(id, arg_component);
		if(ds < d_min){
			d_min = ds;
			closest_cart = id;
			break;
		}
	}
}

var state = scr_navigate_to_assignable(arg_component, closest_cart);

if(state != reach_state.unreachable)
{
	var get_layer_for = script_container_resolve(arg_component.script_container, "get_layer_for");
	var logic_layer = script_execute(get_layer_for, obj_cart_assign_icon);
	arg_component.icon = instance_create_layer(arg_component.x, arg_component.y-16, logic_layer, obj_cart_assign_icon);
	closest_cart.assigned_instance = arg_component;
	closest_cart.action = cart_action.pickup;
	if(state == reach_state.adjacent)
	{
		scr_end_path_action(closest_cart);
		scr_cancel_walking(closest_cart); // todo: rename this script to cancel_moving
	}
	return true;
}
else return false;