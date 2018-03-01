/// @description Update sleeping astronaut

if(occupant != noone)
{
	occupant.sleep_level += sleep_speed;
	if(occupant.sleep_level > 100){
		occupant.sleep_level = 100;
		instance_activate_object(occupant);
		occupant = noone;
		image_index++;
	}
}