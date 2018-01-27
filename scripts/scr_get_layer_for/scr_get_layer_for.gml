/// @arg object_index

switch(argument0)
{
	case obj_assign_icon:
		return macro_logic_layer;
	case obj_wall:
	case obj_construction_mdu_pile:
	case obj_mdu_pile:
		return macro_base_tall_layer;
	case obj_room:
		return macro_rooms_layer;
	case obj_resource_water:
	case obj_resource_metal:
	case obj_resource_gold:
		return macro_resource_layer;
	default:
		return macro_base_layer;
}