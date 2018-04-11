/// @description Grid has updated

var can_draw_power = resolve_execute(script_container, "can_draw_power", id);
scr_set_grid_prop(id, macro_grid_water, macro_grid_prop_can_perform_role, can_draw_power);