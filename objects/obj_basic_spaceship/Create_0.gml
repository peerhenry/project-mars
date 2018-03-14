occ_i = scr_rc_to_gi(x);
occ_j = scr_rc_to_gi(y);

for(var i = -1; i <= 1; i++)
{
	for(var j = -1; j <= 1; j++)
	{
		scr_navgrid_occupy(occ_i + i, occ_j + j);
	}
}

depth = - (occ_j + 1);
owner = global.default_owner;
mask_sprite = spr_basic_spaceship_mask;
mask_color = scr_get_suit_color(macro_enemy);