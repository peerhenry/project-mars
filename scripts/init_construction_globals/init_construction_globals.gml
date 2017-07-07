
// blast from the past:

// construction instance properties
#macro construction_build_state 0
#macro construction_completion 1
#macro construction_build_type 2
#macro construction_cells 3
#macro construction_astronaut 4
#macro construction_time 5

global.ghost_previous_i = 0; // to check if ghost hovers over a new tile; scr_update_ghost
global.ghost_previous_j = 0;

global.build_rotation = 0;
global.build_tile_counts = ds_map_create();
global.build_action_counts = ds_map_create();
global.last_d_i = 0;
global.last_d_j = 0;
global.last_build_tile_key = 0;

// at the end of initialization, the data from big bad buffer gets transferred to a buffer for build tiles, and a buffer for build actions
// see scr_finalize_build_buffers

// used for gameplay:
global.build_stack = ds_stack_create(); // build stack is filled by ghost, see scr_update_ghost. Mouse release triggers new construction from the data on this stack.
global.invalid_build_stack = ds_stack_create(); // filled by scr_update_ghost, scr_draw_ghost will draw red tiles for these.
global.construction_queue = ds_list_create(); // constructions dont immediately build, but are put on a queue for astronauts to pick up.
global.construction_is_valid = false;
global.can_pay_for_construction = false;