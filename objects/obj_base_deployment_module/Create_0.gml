depth = - (occ_j + 2);
image_speed = 0;

for(var i = -2; i <= 2; i++)
{
	for(var j = -2; j <= 2; j++)
	{
		scr_navgrid_occupy(occ_i + i, occ_j + j);
	}
}