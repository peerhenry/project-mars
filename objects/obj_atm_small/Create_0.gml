event_inherited();
name = "Astronaut Transit Module";

for(var i = -1; i <= 1; i++)
{
	for(var j = -1; j <= 1; j++)
	{
		scr_navgrid_occupy(occ_i + i, occ_j + j);
	}
}

depth = - (occ_j + 1);
image_speed = 0;
owner = global.default_owner;
mask_sprite = spr_atm_small_mask;
mask_color = scr_get_suit_color(owner);

is_landing = true;
begin_landing_animation = true;
path = noone;