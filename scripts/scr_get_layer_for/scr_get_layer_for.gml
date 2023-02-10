/// @arg object_index
function scr_get_layer_for(argument0) {

	switch(argument0)
	{
		case obj_assign_icon:
		case obj_cart_assign_icon:
		case obj_hit:
		case obj_construction:
			return macro_logic_layer;
		case obj_wall:
		case obj_construction_mdu_pile:
		case obj_mdu_pile:
		case obj_door:
		case obj_hatch:
		case obj_projectile:
			return macro_base_tall_layer;
		case obj_room:
			return macro_rooms_layer;
		case obj_resource_water:
		case obj_resource_metal:
		case obj_resource_gold:
			return macro_resource_layer;
		case obj_robot:
		case obj_cart:
		case obj_astronaut:
			return macro_astronaut_layer;
		case obj_corpse:
		default:
			return macro_base_layer;
	}


}
