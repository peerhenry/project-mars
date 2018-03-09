// # layers
#macro macro_grid_layer "logic"
#macro macro_logic_layer "logic"
#macro macro_astronaut_layer "astronauts"
#macro macro_rooms_layer "rooms"
#macro macro_terrain_layer "terrain"
#macro macro_resource_layer "terrain"

#macro macro_base_tall_layer "base"
#macro macro_base_layer "base"
#macro macro_base_tile_layer "base_low"

// owners
#macro macro_player 0
#macro macro_enemy 1
#macro macro_china 2
#macro macro_nau 3 // North american union
#macro macro_eu 4
#macro macro_japan 5
#macro macro_un 6

// ownership behavior
#macro macro_ownership_default 0
#macro macro_ownership_map_quarters 1

// used for adjacency numbers
#macro east_number 1
#macro north_number 2
#macro west_number 4
#macro south_number 8

#macro macro_east_number 1
#macro macro_north_number 2
#macro macro_west_number 4
#macro macro_south_number 8

#macro macro_east 0
#macro macro_north_east 1
#macro macro_north 2
#macro macro_north_west 3
#macro macro_west 4
#macro macro_south_west 5
#macro macro_south 6
#macro macro_south_east 7

// # custom events

#macro macro_event_grid_notify 0	// A grid (water/electric/etc.) updates
#macro macro_event_interact 1		// Astronaut interact with assignable object
#macro macro_event_finalize 2		// finalize construction event

#macro macro_astronaut_move_speed 3 // todo: move to settings

// x, y coordinate encodings for 3x3 grid
#macro macro_astronaut_inventory_0_0 0
#macro macro_astronaut_inventory_0_1 1	// x: 0, y: 1
#macro macro_astronaut_inventory_0_2 2
#macro macro_astronaut_inventory_1_0 4
#macro macro_astronaut_inventory_1_1 5
#macro macro_astronaut_inventory_1_2 6
#macro macro_astronaut_inventory_2_0 8
#macro macro_astronaut_inventory_2_1 9
#macro macro_astronaut_inventory_2_2 10

// Sensor
#macro macro_sensor_d_squared 49
#macro macro_sensor_d 7

// debug stuff
#macro macro_type_string 0
#macro macro_type_real 1
#macro macro_type_bool 2
#macro macro_type_array 3
#macro macro_type_list 4
#macro macro_type_map 5
#macro macro_type_object 6

// Skirmish settings
#macro macro_skirmish_victory_condition 0 
#macro macro_skirmish_astro_count 1
#macro macro_skirmish_mdu_pile_count 2

// ghost drawing stuff
#macro macro_ghost_alpha 0.42
#macro macro_sensor_ghost_alpha 0.16

// movable orientations
#macro macro_up 1
#macro macro_down 2
#macro macro_right 3
#macro macro_left 4