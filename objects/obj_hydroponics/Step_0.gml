if(is_active && food_level < 100)
{
	food_level += 0.1;
	if(food_level > 100)
	{
		food_level = 100;
	}
}