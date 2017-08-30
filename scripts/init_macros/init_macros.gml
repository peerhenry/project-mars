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

// # construction owners
#macro macro_player 0
#macro macro_enemy 1

// used for adjacency numbers
#macro east_number 1
#macro north_number 2
#macro west_number 4
#macro south_number 8

#macro macro_east_number 1
#macro macro_north_number 2
#macro macro_west_number 4
#macro macro_south_number 8

// # custom events

#macro macro_event_grid_notify 0	// A grid (water/electric/etc.) updates
#macro macro_event_interact 1		// Astronaut interact with assignable object
#macro macro_event_finalize 2		// finalize construction event

#macro macro_astronaut_move_speed 3

// old
#macro macro_inventory_empty 0
#macro macro_inventory_occupied 1	// not used for rendering
#macro macro_inventory_pistol 2
#macro macro_inventory_food 3
#macro macro_inventory_module 4
// new: use items
#macro macro_item_pistal 2
#macro macro_item_food 3
#macro macro_item_mdu 4

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