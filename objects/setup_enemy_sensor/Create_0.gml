var object = obj_sensor;
var inst = instance_create_layer(x, y, macro_base_layer, object);
with(inst)
{
	event_user(macro_event_finalize);
	owner = macro_enemy;
}
instance_destroy();