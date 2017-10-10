if(under_construction)
{
	event_inherited();
	exit;
}

draw_self();

if(locked)
{
	draw_sprite(spr_locked, 0, x, y);
}