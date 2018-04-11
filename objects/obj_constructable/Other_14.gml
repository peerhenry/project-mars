/// @description Post Init
// This is code that must not execute during level init stage
if(scr_has_grid_props(id, macro_grid_electric)) scr_connect_to_cables(id);