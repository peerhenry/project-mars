var navgrid = global.nav_grid;
mp_grid_clear_cell(navgrid, occ_i, occ_j);

with(dto_hud_details_panel) if(unit == other.id) instance_destroy();

if(path_exists(path)) path_delete(path);
if(end_path_action != noone) destroy(end_path_action);