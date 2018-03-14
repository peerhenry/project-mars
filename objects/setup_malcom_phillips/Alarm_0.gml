var layer_thing = layer_get_id("astronauts");
var new_astronaut = instance_create_layer(x, y, layer_thing, obj_astronaut);
with(new_astronaut)
{
	name = "Malcom Phillips";
	owner = player;
	scr_set_suit(id, false);
	is_outside = false;
	astro_id = macro_malcom_phillips;
}

instance_destroy();