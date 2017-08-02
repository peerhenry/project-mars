/// @description Initialize tutorial

// Get astronaut
with(obj_astronaut)
{
	if(astro_id == macro_malcom_phillips)
	{
		other.astronaut = id;
		scr_center_screen_on(id);
		break;
	}
}
if(astronaut == noone)
{
	var msg = "Astronaut not found";
	show_error("Error: Tutorial could not initialize: " + msg, false);
}


// Create objective arrow above the closet
arrow = instance_create_layer(astronaut.x, astronaut.y - 32, macro_logic_layer, obj_arrow);
arrow.target = astronaut;

// Get the suit closet
with(obj_suit_closet)
{
	if(id.holds_suit) other.closet = id;
}
if(closet == noone)
{
	var msg = "Closet not found";
	show_error("Error: Tutorial could not initialize: " + msg, false);
}

has_initialized = true;
scr_alert_player("Select captain Phillips.");