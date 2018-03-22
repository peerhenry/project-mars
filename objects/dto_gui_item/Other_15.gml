/// @description Update geometric properties
switch(valign)
{
	case align_v.top:
		top = origin_y;
		break;
	case align_v.mid:
		top = origin_y - height/2;
		break;
	case align_v.bottom:
		top = origin_y - height;
		break;
}
bottom = top + height;
switch(halign)
{
	case align_h.left:
		left = origin_x;
		break;
	case align_h.center:
		left = origin_x - width/2;
		break;
	case align_h.right:
		left = origin_x - width;
		break;
}
right = left + width;
		
sprite_x = origin_x + sprite_offset_x;
sprite_y = origin_y + sprite_offset_y;