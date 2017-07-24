var layer_thing = layer_get_id("astronauts");
var new_astronaut = instance_create_layer(x, y, layer_thing, obj_astronaut_playable);
with(new_astronaut)
{
	name = "Malcom Phillips";
	wears_suit = false;
	sprite_index = spr_character_suitless_down;
	is_outside = false;
	sprite_walk_down = sprite_suitless_down;
	sprite_walk_right = sprite_suitless_right;
	sprite_walk_up = sprite_suitless_up;
}

instance_destroy();