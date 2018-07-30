if( instance_number(object_index) > 1 ) show_error("more than one: " + string( object_get_name(object_index) ), true);
global.init_stage = true;
init_view_and_camera();
init_game();
alarm[0] = 2;

// I put it here for lack of a better place...
if(variable_global_exists("ioc_container") && instance_exists(global.ioc_container))
{
	destroy(global.ioc_container);
}
global.ioc_container = init_ioc_container();

var singletons = ds_list_create();
ds_list_add(singletons, obj_map_initializer);
var level = global.level_object_index;
if(level != noone) ds_list_add(singletons, level);
else scr_warn("No level is set for this mission");
ds_list_add(singletons, obj_music);
ds_list_add(singletons, obj_ambient_sound);
ds_list_add(singletons, obj_sensor_range_draw);
ds_list_add(singletons, obj_surface_renderer);
ds_list_add(singletons, obj_mouse_listener);
ds_list_add(singletons, obj_view_mover);
ds_list_add(singletons, obj_key_listener);
ds_list_add(singletons, obj_gui);
ds_list_add(singletons, obj_HUD); // todo: remove once it has become obsolete
ds_list_add(singletons, obj_noise_shader);
if(global.dev_env)
{
	ds_list_add(singletons, obj_key_listener_DEBUG_WINDOW);
	ds_list_add(singletons, obj_key_listener_DEBUG);
	ds_list_add(singletons, obj_HUD_DEBUG);
}

for( var n = 0; n < ds_list_size(singletons); n++ )
{
	var next_instance = instance_create_layer( -1, -1, "logic", singletons[|n] );
}

ds_list_destroy(singletons);