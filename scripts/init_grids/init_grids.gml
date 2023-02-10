function init_grids() {
#macro macro_grid_role_carrier 0
#macro macro_grid_role_source 1
#macro macro_grid_role_consumer 2
#macro macro_grid_role_storage 3
#macro macro_grid_role_count 4

	// grid types
#macro macro_grid_electric 0
#macro macro_grid_water 1
#macro macro_grid_oxygen 2
#macro macro_grid_hydrogen 3
#macro macro_grid_type_count 4		// used to iterate over grid types in grid logic

	// grid component props
#macro macro_grid_prop_grid 0
#macro macro_grid_prop_role 1
#macro macro_grid_prop_value 2 // either consumption, production or storage
#macro macro_grid_prop_can_perform_role 3
#macro macro_grid_storage_level 4 // extra prop especially for storage component


}
