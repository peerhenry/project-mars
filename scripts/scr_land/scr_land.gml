/// @arg ghost
function scr_land(argument0) {
	var ghost = argument0;
	var valid = ghost[?macro_ghost_valid];
	if(!valid)
	{
		resolve_execute(global.script_container, "alert_player", "Invalid landing site.");
		exit;
	}

	var land_i = scr_rc_to_gi(mouse_x);
	var land_j = scr_rc_to_gi(mouse_y);
	var land_x = scr_gi_to_rc(land_i); // clamped
	var land_y = scr_gi_to_rc(land_j); // clamped

	var construct_type = ghost[?macro_ghost_constr_type];
	var object = obj_atm_small;
	if(construct_type == macro_bdm) object = obj_base_deployment_module;

	var alm = instance_create_layer(land_x, land_y, macro_logic_layer, object);


}
