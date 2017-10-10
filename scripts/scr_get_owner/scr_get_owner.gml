/// @description Get the owner for the constructable at the create event
/// @arg constructable
debug_instance_inherits(argument0, obj_constructable);
var arg_constructable = argument0;



// top-left, top-right, bottom-left, bottom-right
global.quarter_owners = [macro_player, macro_nau, macro_china, macro_japan];

switch(global.ownership_behavior)
{
	case macro_ownership_default:
		return global.default_owner;
	case macro_ownership_map_quarters: // get owner by map quarter
		with(arg_constructable)
		{
			var bit_one = x > room_width/2;
			var bit_two = (y > room_height/2)*2;
			var quarter_index = bit_one + bit_two;
			return global.quarter_owners[quarter_index];
		}
}

return macro_player;