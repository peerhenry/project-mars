scr_trace("test_drill_should_destroy_depleted_resource");
var metal = instance_create_depth(32, 32, 0, obj_resource_metal);
metal.amount = -10;
var drill = instance_create_depth(32, 32, 0, obj_drill);
drill.under_construction = false;
// give drill a grid with plenty power
var e_grid = instance_create_depth(0,0,0,obj_grid);
with(e_grid)
{
	grid_type = macro_grid_electric;
	net_output = 100;
}
scr_set_grid_prop(drill, macro_grid_electric, macro_grid_prop_grid, e_grid);
with(drill){ event_perform(ev_alarm, 0); }
var res_is_gone = !instance_exists(drill.resource_instance);
instance_destroy(e_grid);
instance_destroy(drill);

if(!instance_exists(metal) && res_is_gone) return true
else{
	show_debug_message("[TEST] failed. Expected object metal to not exist.");
	instance_destroy(metal);
	return false;
}