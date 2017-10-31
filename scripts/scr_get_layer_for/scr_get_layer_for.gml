/// @arg object_index

switch(argument0)
{
	case obj_wall:
	case obj_construction_mdu_pile:
	case obj_mdu_pile:
		return macro_base_tall_layer;
	case obj_room:
		return macro_rooms_layer;
	default:
		return macro_base_layer;
}