event_inherited();
scr_set_new_grid_props(id, macro_grid_water, macro_grid_role_source, 20);

scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);

if(!global.init_stage)
{
	scr_connect_to_pipes(id);
}