for(var n = 0; n < ds_list_size(component_list); n++)
{
	var next_component = component_list[| n];
	instance_destroy(next_component);
}
ds_list_destroy(component_list);
if(instance_exists(sub_panel)) instance_destroy(sub_panel);