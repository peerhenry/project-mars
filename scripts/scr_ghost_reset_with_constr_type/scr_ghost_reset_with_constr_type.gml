/// @arg construction_type
var arg_construction_type = argument0;
var ghost = global.construction_ghost;
var ghost_stack = ghost[? macro_ghost_stack];
var invalid_ghost_stack = ghost[? macro_ghost_invalid_stack]
ds_stack_clear(ghost_stack);
ds_stack_clear(invalid_ghost_stack);
ds_map_replace(ghost, macro_ghost_constr_type, arg_construction_type);
ds_map_replace(ghost, macro_ghost_cost, 0);
ds_map_replace(ghost, macro_ghost_valid, true);
ds_map_replace(ghost, macro_ghost_payable, true);
return ghost;