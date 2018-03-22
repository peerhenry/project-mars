/// @description The very first script to run on startup

scr_force_trace("Application Boot");

// -- Create persistent application events listener --
global.persistent_listener = instance_create_depth(0, 0, 0, obj_persistent_listener);
global.room_origin = noone;

// -- CMD parameters --
//todo: check cmd line parameters (set/overwrite flags?)

// -- Set environment flags --
global.enable_trace = debug_mode;
global.dev_env = false;
if(environment_get_variable("__PIONEERS_DEV") != "") global.dev_env = true;
else if(file_exists("dev_env.flag")) global.dev_env = true;

// -- Print info to log --
debug_format_header(scr_get_application_info());
show_debug_message("runtime version: " + GM_runtime_version);
show_debug_message("program_directory: " + string(program_directory));
show_debug_message("working_directory: " + string(working_directory));
//show_debug_message("temp_directory: " + string(temp_directory));
show_debug_message("local_storage: " + environment_get_variable("LOCALAPPDATA") + "\\" + game_project_name); //use LOCALAPPDATA or APPDATA according to project options for windows

//todo: check os_*() methods for more user info

// -- Enable/disable GML release mode --
if(false) //todo: implement automatic gml_release_mode? check via runtime name equals project exe name?
{
	scr_trace("gml_release_mode enable");
	gml_release_mode(true); //todo: discuss using this
}
else
{
	show_debug_message("!!! WARNING: gml_release_mode disabled !!!");
	gml_release_mode(false);
}

// -- Load or (re)initialize settings --
scr_boot_settings();

// -- Set seed for builtin random generators --
global.random_seed = randomise();

// -- Set global game speed --
game_set_speed(default_game_speed, gamespeed_fps);

// -- Generate player session ID --
global.player_session_id = scr_generate_guid();
show_debug_message("Generated player session ID: " + global.player_session_id);

// -- Send boot stats to server --
//todo: send app start statistic to server?

// -- Set window and callback scr_preloader --
scr_boot_window(); //important: needs to be last line of code
exit;