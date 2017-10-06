global.can_pay_for_construction = true;
global.construction_is_valid = true;
ds_stack_clear(global.ghost_stack);
ds_stack_clear(global.invalid_ghost_stack); // used to draw red tiles ghost
global.total_cost = 0;