/// @description Insert description here
// You can write your code in this editor

switch(orientation)
{
	case 1:
		image_angle = 90;
		break;
	case 2:
		image_angle = 180;
		break;
	case 3:
		image_angle = 270;
		break;	
	default:
		image_angle = 0;
}

draw_self();