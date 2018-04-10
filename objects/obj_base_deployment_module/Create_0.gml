occ_i = scr_rc_to_gi(x);
occ_j = scr_rc_to_gi(y);
depth = - (occ_j + 2);
image_speed = 0;

is_landing = true;
begin_landing_animation = true;
path = noone;

for(var i = -2; i <= 2; i++)
{
	for(var j = -2; j <= 2; j++)
	{
		scr_navgrid_occupy(occ_i + i, occ_j + j);
	}
}