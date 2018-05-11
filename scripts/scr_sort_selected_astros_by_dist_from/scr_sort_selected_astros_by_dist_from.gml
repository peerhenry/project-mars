/// @arg assignable
var arg_instance = argument0;
var orders_given = false;

#macro NEW_LIST ds_list_create()
#macro NEW_MAP ds_map_create()

var dsq_list = NEW_LIST;
var dsq_map = NEW_MAP;

with(obj_task_actor)
{
	if(is_selected)
	{	
		var dsq = scr_d_squared(id, arg_instance);
		while( ds_map_exists(dsq_map, dsq) )
		{
			dsq = dsq + 0.01;
		}
		ds_list_add(dsq_list, dsq);
		dsq_map[? dsq] = id;
	}
}

var sorted_astros = [];
ds_list_sort(dsq_list, true);	// dsq_list is sorted after this
for(var n = 0; scr_length(dsq_list); n++)
{
	var dsq = dsq_list[|n]
	sorted_astros[n] = dsq_map[? dsq];
}
ds_list_destroy(dsq_list);
ds_map_destroy(dsq_map);
return sorted_astros;