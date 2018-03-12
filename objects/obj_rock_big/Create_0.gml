occ_i = (x - 16) div 32;
occ_j = (y - 16) div 32;

for(var i = -1; i <= 1; i++)
{
	for(var j = -1; j <= 1; j++)
	{
		scr_navgrid_occupy(occ_i + i, occ_j + j);
	}
}

depth = - (occ_j + 1);