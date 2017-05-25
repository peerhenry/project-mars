if(is_assigned)
{
	frame_counter++;
	if(frame_counter == frames)
	{
		frame_counter = 0;
		i_index = (i_index + 1) mod 4;
	}
	draw_sprite(spr_assigned, i_index, x, y);
}