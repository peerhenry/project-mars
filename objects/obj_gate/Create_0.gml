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

var adj_walls = scr_get_adjacent_instances(id, obj_wall);
for(var n = 0; n < 4; n++) // ENWS
{
	var next_wall = adj_walls[n];
	if(next_wall != noone)
	{
		var adj_bit = power(2, (n+2)%4);
		if(next_wall.image_index & adj_bit != adj_bit)
		{
			next_wall.image_index += adj_bit;
		}
	}
}


var rot_param = global.construction_ghost[? macro_ghost_rotation];
show_debug_message("creating hatch with rot_param: " + string(rot_param));
connects_horizontally  = (rot_param == 1 || rot_param == 3);
show_debug_message("connects_horizontally " + string(connects_horizontally));