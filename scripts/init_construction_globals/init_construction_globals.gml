// used for gameplay:
var ghost = ds_map_create();
ds_map_add(ghost, macro_ghost_constr_type, noone);
ds_map_add(ghost, macro_ghost_cost, 0);
ds_map_add(ghost, macro_ghost_stack, ds_stack_create());
ds_map_add(ghost, macro_ghost_invalid_stack, ds_stack_create());
ds_map_add(ghost, macro_ghost_payable, true);
ds_map_add(ghost, macro_ghost_valid, true);
ds_map_add(ghost, macro_ghost_rotation, 0);
global.construction_ghost = ghost;

// constructions dont immediately build, but are put on a queue for astronauts to pick up.
global.construction_queue = ds_list_create();