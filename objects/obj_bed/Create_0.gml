event_inherited();

// hardcoded constructable logic
occ_i = scr_rc_to_gi(x);
occ_j = scr_rc_to_gi(y);
under_construction = true;
damage = 0;

var rot_param = global.build_rotation;
di = 0;
dj = 0;
switch(rot_param)
{
	case 0: dj = -1; break;
	case 1:
		sprite_index = spr_bed_horizontal;
		di = -1;
		break;
	case 2: 
		sprite_index = spr_bed_vertical_2;
		dj = 1;
		break;
	case 3:
		sprite_index = spr_bed_horizontal_2;
		di = 1;
		break;
}
scr_navgrid_occupy(occ_i, occ_j);
scr_navgrid_occupy(occ_i + di, occ_j + dj);

// sleep variables
occupant = noone;
zzz_index = 0; // there is a zzz animation for when an astronaut sleeps
zzz_counter = 0;

scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);
scr_execute_map_buffer_action(occ_i + di, occ_j + dj, map_buffer_action.occupy);