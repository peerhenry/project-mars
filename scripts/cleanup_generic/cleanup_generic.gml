/// @arg thing
var thing = argument0;
if(instance_exists(thing))
{
	if(variable_instance_exists(thing, "class")) destroy(thing);
	else instance_destroy(thing);
}
else if(is_array(thing)) map_script(thing, cleanup_generic);
else if(ds_exists(thing, ds_type_list)) ds_list_destroy(thing);
else if(ds_exists(thing, ds_type_map)) ds_map_destroy(thing);