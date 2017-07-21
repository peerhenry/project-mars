/// @description Grid has updated

// Pump cannot perform role in water grid if it can't draw power.
scr_drill_pump_connection(id);
if(scr_can_draw_power(id))
{
	scr_set_grid_prop(id, macro_grid_water, macro_grid_component_can_perform_role, true);
}
else
{
	scr_set_grid_prop(id, macro_grid_water, macro_grid_component_can_perform_role, false);
}