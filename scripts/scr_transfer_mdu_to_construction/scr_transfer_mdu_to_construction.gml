/// @param astronaut
/// @param construction
var arg_astronaut = argument0;
var arg_construction = argument1;

scr_inventory_extract(arg_astronaut.inventory, macro_item_mdu);

var remaining_mdus = arg_construction[? construction_required_mdu_remaining] - 1;
ds_map_replace(arg_construction, construction_required_mdu_remaining, remaining_mdus);

if(remaining_mdus == 0)
{
	ds_map_replace(arg_construction, construction_build_state, construction_state.ready);
}

/*
scr_alert_player("Transfered MDU to construction, remaining: " + string(remaining_mdus));
show_debug_message("remaining_mdus" + string(remaining_mdus));
show_debug_message("remaining required MDUs in map: " + string(ds_map_find_value(arg_construction, construction_required_mdu_remaining)));
debug_show_construction(arg_construction);
*/