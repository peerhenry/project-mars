if(image_index >= 10)
{
	flag_for_destroy = true;
}
else if(image_index == 0 && flag_for_destroy)
{
	instance_destroy();
}