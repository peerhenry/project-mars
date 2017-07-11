alpha = clamp(alpha + (fade*0.1), 0, 1);

if(alpha == 1)
{
	room_goto(target_room);
	fade = -1;
	alpha = clamp(alpha + (fade*0.1), 0, 1);
}
else if(alpha == 0)
{
	instance_destroy();
}

draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(
	view_xview[0],
	view_yview[0],
	view_xview[0] + view_wview[0],
	view_yview[0] + view_hview[0],
	false // rectangle is not outlined; it's filled
);

draw_set_alpha(1);