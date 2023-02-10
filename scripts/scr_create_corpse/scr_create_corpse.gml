/// @arg astronaut
function scr_create_corpse(argument0) {
	var arg_astro = argument0;

	var clamped_x = scr_rc_clamp_center(arg_astro.x);
	var clamped_y = scr_rc_clamp_center(arg_astro.y);

	var get_layer_for = script_container_resolve(arg_astro.script_container, "get_layer_for");
	var corpse_layer = script_execute(get_layer_for, obj_corpse);
	var corpse = instance_create_layer(clamped_x, clamped_y, corpse_layer, obj_corpse);
	corpse.mask_color = arg_astro.mask_color;
	if(arg_astro.wears_suit)
	{
		corpse.sprite_index = spr_character_death;
		corpse.mask_sprite = spr_suit_mask_death;
	}
	else
	{
		corpse.sprite_index = spr_male_dead;
		corpse.mask_sprite = spr_male_mask_dead;
	}

	return corpse;


}
