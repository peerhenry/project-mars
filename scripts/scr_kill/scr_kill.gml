/// @param astronaut
var astronaut = argument0;

var clamped_x = scr_rc_clamp_center(astronaut.x);
var clamped_y = scr_rc_clamp_center(astronaut.y);

var c_layer = layer_get_id("astronauts");
var corpse = instance_create_layer(clamped_x, clamped_y, c_layer, obj_corpse);

if(astronaut.wears_suit)
{
	corpse.sprite_index = spr_character_death;
	if(astronaut.object_index == obj_astronaut_enemy) corpse.sprite_index = spr_char_mask_death;
}

with(astronaut)
{
	has_died = true;
	if(object_index == obj_astronaut_playable){
		var play_sound = script_container_resolve(script_container, "play_sound");
		script_execute(play_sound, sound_fx_flatline);
	}
}

instance_destroy(astronaut);