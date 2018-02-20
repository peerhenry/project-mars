/// @arg astronaut
var arg_astro = argument0;

var has_food = scr_inventory_extract(arg_astro.inventory, macro_inventory_food);
if(has_food)
{
	arg_astro.food_level = 100;
	return true;
}
else return false;