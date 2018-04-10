/// @arg ghost
var ghost = argument0;
var valid = ghost[?macro_ghost_valid];
if(!valid) resolve_execute(global.script_container, "alert_player", "Invalid landing site.");

var land_i = scr_rc_to_gi(mouse_x);
var land_j = scr_rc_to_gi(mouse_y);
var land_x = scr_gi_to_rc(land_i); // clamped
var land_y = scr_gi_to_rc(land_j); // clamped

var alm = instance_create_layer(land_x, land_y, macro_logic_layer, obj_basic_spaceship); // todo, rename to something like obj_alm_small