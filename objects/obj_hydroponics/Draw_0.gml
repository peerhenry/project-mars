event_inherited();

if(!under_construction)
{
	var food_image = floor(food_level/20) -1;
	if(food_image >= 0)
	{
		draw_sprite(spr_hydroponics_plants, food_image, x, y)
	}
	
	draw_sprite(spr_hydroponics_sprinklers, image_index, x, y);
}