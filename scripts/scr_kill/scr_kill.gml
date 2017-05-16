var astronaut = argument0;

var clamped_x = scr_rc_clamp_center(astronaut.x);
var clamped_y = scr_rc_clamp_center(astronaut.y);

var c_layer = layer_get_id("astronauts");
var corpse = instance_create_layer(clamped_x, clamped_y, c_layer, obj_corpse);

if(astronaut.wears_suit){
	corpse.sprite_index = spr_character_death;
	if(astronaut.object_index == obj_astronaut_enemy) corpse.sprite_index = spr_char_mask_death;
}

instance_destroy(astronaut);