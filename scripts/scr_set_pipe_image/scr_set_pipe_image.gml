/// @param pipe_instance

var arg_pipe = argument0;

with(arg_pipe)
{
	switch(pipe_adjacency)
	{
		case 0:
		case 1:
		case 4:
		case 5:
			image_index = 0;
			break;
		case 2:
			image_index = 11;
			break;
		case 8:
		case 10:
			image_index = 1;
			break;
		case 3:
			image_index = 2;
			break;
		case 6:
			image_index = 3;
			break;
		case 12:
			image_index = 4;
			break;
		case 9:
			image_index = 5;
			break;
		case 11:
			image_index = 6;
			break;
		case 7:
			image_index = 7;
			break;
		case 14:
			image_index = 8;
			break;
		case 13:
			image_index = 9;
			break;
		case 15:
			image_index = 10;
			break;
	}
}