event_inherited();
occ_i = scr_rc_to_gi(x);
occ_j = scr_rc_to_gi(y);
mp_grid_add_cell( scr_get_nav_grid(), occ_i, occ_j );
image_speed = 0;

resource_instance = instance_position(x, y, obj_resource_metal);
has_resource = resource_instance > 0;

alarm_set(0, 30); // mine event

electric_consumption = 5;