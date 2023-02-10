/// @arg astronaut
function scr_eat(argument0) {
	var arg_astro = argument0;

	var food = scr_inventory_extract(arg_astro.inventory, inv_space.food);
	if(food != noone)
	{
		arg_astro.food_level = 100;
		instance_destroy(food);
		return true;
	}
	else return false;


}
