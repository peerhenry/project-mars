// construction categories
#macro macro_category_deconstruction 1
#macro macro_category_foundation 2
#macro macro_category_inside 3
#macro macro_category_outside 4

// the different constructions
#macro macro_basetile 0
#macro macro_wall 1
#macro macro_door 2
#macro macro_hatch 3
#macro macro_suit_closet 4
#macro macro_suit_closet_empty 5
#macro macro_sensor 6
#macro macro_drill 7
#macro macro_battery 8
#macro macro_oxygen_tank 9
#macro macro_cable 10
#macro macro_pipe 11
#macro macro_bed 12
#macro macro_pump 13
#macro macro_water_reservoir 14
#macro macro_water_purifier 15
#macro macro_hydroponics 16
#macro macro_magic_generator 17
#macro macro_magic_pump 18
#macro macro_fridge 19
#macro macro_solar_panel 20
#macro macro_electrolyser 21
#macro macro_printer 22
#macro macro_med_bed 23
#macro macro_recharge_station 24

#macro macro_destruct 101
#macro macro_destruct_safe 102
#macro macro_destruct_room 103

// construction properties
#macro macro_id 0
#macro macro_name 1
#macro macro_hud_sprite 3
#macro macro_build_tiles 4
#macro macro_rotation_params 5
#macro macro_dragging 6
#macro macro_drag_actions 7
#macro macro_drag_params 8
#macro macro_surround_actions 9
#macro macro_category 10

// build action properties
#macro macro_validation_i 0
#macro macro_validation_o 1
#macro macro_map_buffer_action 2
#macro macro_layer 3
#macro macro_object_to_add 4
#macro macro_object_to_remove 5
#macro macro_metal_cost 6

// used for map buffer
#macro map_value_vacant 0
#macro map_value_reserved 1
#macro map_value_occupied 2
#macro map_value_wall_like 3
#macro map_value_wall_pure 4
#macro map_value_under_construction 5
#macro map_value_cable 6
#macro map_value_pipe 7
#macro map_value_pipe_and_cable 8

// properties for build cells
#macro build_cell_i 0
#macro build_cell_j 1
#macro build_cell_object_to_add 2
#macro build_cell_layer 3
#macro build_cell_object_to_remove 4
#macro build_cell_map_buffer_action 5
#macro build_cell_cost 6
#macro build_cell_object_sprite 7
#macro build_cell_object_image 8
#macro build_cell_object_angle 9
#macro build_cell_required_object 10

// properties for construction cells
#macro c_cell_i 0
#macro c_cell_j 1
#macro c_cell_new_instance 2
#macro c_cell_object_to_remove 3
#macro c_cell_layer 4

// props for build tiles
#macro macro_build_tile_di 0
#macro macro_build_tile_dj 1
#macro macro_build_tile_actions 2

// linear drag parameters
#macro macro_drag_horizontal 0
#macro macro_drag_vertical 1
#macro macro_drag_top 2 
#macro macro_drag_bottom 3
#macro macro_drag_left 4 
#macro macro_drag_right 5

// rotation parameters
#macro macro_rotation_0 0
#macro macro_rotation_1 1
#macro macro_rotation_2 2
#macro macro_rotation_3 3

// drawing paramaters
#macro macro_sprite 0
#macro macro_image 1
#macro macro_angle 2

// construction instance properties
#macro construction_build_state 0
#macro construction_completion 1
#macro construction_type 2
#macro construction_cells 3
#macro construction_astronaut 4
#macro construction_time 5
#macro construction_prerequisite 6
#macro construction_bb_top 7
#macro construction_bb_left 8
#macro construction_bb_right 9
#macro construction_bb_bottom 10
#macro construction_required_mdu_count 11
#macro construction_required_mdu_remaining 12
#macro construction_mdu_deliveries 13
#macro construction_mdu_piles 14
#macro construction_owner 15
#macro construction_required_metal 16
#macro construction_object 17

// construction ghost
#macro macro_ghost_stack 0
#macro macro_ghost_invalid_stack 1
#macro macro_ghost_constr_type 2
#macro macro_ghost_cost 3
#macro macro_ghost_valid 4
#macro macro_ghost_payable 5
#macro macro_ghost_rotation 6
#macro macro_ghost_owner 7