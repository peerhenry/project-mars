/// @arg astronaut
var arg_astro = argument0;

var clamped_x = scr_rc_clamp_center(arg_astro.x);
var clamped_y = scr_rc_clamp_center(arg_astro.y);
var c_layer = layer_get_id("astronauts");
var corpse = instance_create_layer(clamped_x, clamped_y, c_layer, obj_corpse);
if(arg_astro.wears_suit)
{
	corpse.sprite_index = spr_character_death;
	if(arg_astro.object_index == obj_astronaut_enemy) corpse.sprite_index = spr_char_mask_death;
}