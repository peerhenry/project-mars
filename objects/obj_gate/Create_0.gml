event_inherited();

is_open = false;
auto_close = true;
locked = false;
target_frame = 0;
vertical = false;
image_speed = 0;
occ_i = scr_rc_to_gi(x);
occ_j = scr_rc_to_gi(y);
under_destruction = false;

var rot_param = global.construction_ghost[? macro_ghost_rotation];
connects_horizontally  = (rot_param == 1 || rot_param == 3);

if(!global.init_stage) scr_connect_gate(id);