var layer_thing = layer_get_id("astronauts");
var new_astronaut = instance_create_layer(x, y, layer_thing, obj_astronaut_playable);
with(new_astronaut)
{
	name = "Malcom Phillips";
	scr_set_suit(id, false);
	sprite_index = spr_character_suitless_down;
	is_outside = false;
	sprite_active_down = sprite_suitless_down;
	sprite_active_right = sprite_suitless_right;
    sprite_active_up = sprite_suitless_up;
	astro_id = macro_malcom_phillips;
}

instance_destroy();