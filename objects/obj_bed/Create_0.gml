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
	case 1: di = -1; break;
	case 2: dj = 1; break;
	case 3: di = 1; break;
}
scr_navgrid_occupy(occ_i, occ_j);
scr_navgrid_occupy(occ_i + di, occ_j + dj);

// sleep variables
occupant = noone;
zzz_index = 0; // there is a zzz animation for when an astronaut sleeps
zzz_counter = 0;