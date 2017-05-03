/// @description Insert description here
// You can write your code in this editor

if(path_position > 0.001 && path_position < 0.999)
{
	if(!is_walking) is_walking = true;
}
else
{
	if(is_walking)
	{
		prev_x = x;
		prev_y = y;
		is_walking = false;
		path_end();
	}
}