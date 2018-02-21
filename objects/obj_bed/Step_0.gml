/// @description Update sleeping astronaut

if(occupant != noone)
{
	occupant.energy += sleep_speed;
	if(occupant.energy > 100){
		occupant.energy = 100;
		instance_activate_object(occupant);
		occupant = noone;
		image_index++;
	}
}