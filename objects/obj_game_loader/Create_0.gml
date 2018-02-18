/// @description Insert description here
// You can write your code in this editor
var singletons = ds_list_create();
ds_list_add(singletons, obj_initializer);
ds_list_add(singletons, obj_map_initializer);
ds_list_add(singletons, obj_music);
ds_list_add(singletons, obj_sensor_range_draw);
ds_list_add(singletons, obj_surface_renderer);
ds_list_add(singletons, obj_mouse_listener);
ds_list_add(singletons, obj_view_mover);
ds_list_add(singletons, obj_key_listener);
ds_list_add(singletons, obj_HUD);
ds_list_add(singletons, obj_noise_shader);
if(global.dev_env) ds_list_add(singletons, obj_key_listener_DEBUG);

for(var n = 0; n < ds_list_size(singletons); n++)
{
	var next_instance = instance_create_layer(-1, -1, "logic", singletons[|n]);
}

ds_list_destroy(singletons);
instance_destroy();