/// @arg instance
var instance = argument0;

var info = void_static_unwrap(instance.class, get_class_info);
var data_props = uvoid(info, "get_data_props");

for(var n = 0; n < scr_length(data_props); n++)
{
	var prop = data_props[n];
	if(prop.type_info.is_on_heap && prop.is_borrowed)
	{
		var value = variable_instance_get(instance, prop.name);
		switch(prop.type_info.type)
		{
			case TYPE.INTERFACE:
				destroy(value);
				break;
			case TYPE.OBJECT:
			case TYPE.OBJECT_ANY:
				instance_destroy(value);
				break;
			case TYPE.LIST:
				ds_list_destroy(value);
				break;
			case TYPE.MAP:
				ds_map_destroy(value);
				break;
		}
	}
}

destroy(info);
destroy(instance);