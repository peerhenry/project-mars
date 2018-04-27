/// @description Update sleeping astronaut

if(occupant != noone)
{
	occupant.entity_health += heal_speed;
	if(occupant.entity_health > 100){
		occupant.entity_health = 100;
		
		var result = call(id, "disembark", occupant);
		if(result.status == STATUS.OK)
		{
			// instance_activate_object(occupant);
			occupant = noone;
			image_index++;
		}
		else
		{
			resolve_execute(script_container, "alert_player", "Astronaut cannot leave bed: " + result.value);
		}
	}
}