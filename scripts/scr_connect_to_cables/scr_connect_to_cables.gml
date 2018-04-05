/// @arg instance
show_debug_message("connect to cables...");
with(argument0)
{
	show_debug_message("inside argument0: " + object_get_name(object_index));
	scr_connect_cable_adjacency(id);
}