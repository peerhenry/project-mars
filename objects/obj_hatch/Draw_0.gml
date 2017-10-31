if(under_construction)
{
	event_inherited();
	exit;
}

draw_self();

if(locked)
{
	var lock_y = y;
	if(global.draw_tall_walls) lock_y = y - 16;
	draw_sprite(spr_locked, 0, x, lock_y);
}