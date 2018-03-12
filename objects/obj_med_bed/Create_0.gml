event_inherited();
name = "med bed";
heal_speed = global.heal_speed;
rot_param = global.construction_ghost[? macro_ghost_rotation];
di = 0;
dj = 0;	// second space the bed occupies
switch(rot_param)
{
	case 0: dj = -1; break;
	case 1:
		sprite_index = spr_med_bed_horizontal;
		di = -1;
		break;
	case 2: 
		sprite_index = spr_med_bed_vertical_2;
		dj = 1;
		break;
	case 3:
		sprite_index = spr_med_bed_horizontal_2;
		di = 1;
		break;
}
scr_navgrid_occupy(occ_i, occ_j);
scr_navgrid_occupy(occ_i + di, occ_j + dj);
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);
scr_execute_map_buffer_action(occ_i + di, occ_j + dj, map_buffer_action.occupy);

scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_consumer, global.med_bed_energy_consumption);

depth = -occ_j;

// sleep variables
occupant = noone;
zzz_index = 0; // there is a zzz animation for when an astronaut sleeps
zzz_counter = 0;

// will not draw electricity if noone uses it
scr_set_grid_prop(id, macro_grid_electric, macro_grid_prop_can_perform_role, false);