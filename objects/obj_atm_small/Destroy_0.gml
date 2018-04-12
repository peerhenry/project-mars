event_inherited();
if(!is_taking_off)
{
	for(var i = -1; i <= 1; i++)
	{
		for(var j = -1; j <= 1; j++)
		{
			scr_navgrid_free(occ_i + i, occ_j + j);
		}
	}
}