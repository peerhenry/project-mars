/// @description Update sleeping astronaut

if(occupant != noone)
{
	occupant.entity_health += heal_speed;
	if(occupant.entity_health > 100){
		occupant.entity_health = 100;
		instance_activate_object(occupant);
		occupant = noone;
		image_index++;
	}
}