/// @description The very first script to run on startup

scr_force_trace("Application Boot");

global.game_end_listener = instance_create_depth(0, 0, 0, obj_game_end_listener); //persistent

global.enable_trace = debug_mode;
global.dev_env = false;
if(environment_get_variable("__PIONEERS_DEV") != "") global.dev_env = true;
else if(file_exists("dev_env.flag")) global.dev_env = true;

scr_debug_header(scr_get_application_info());
show_debug_message("program_directory: " + string(program_directory));
show_debug_message("working_directory: " + string(working_directory));
//show_debug_message("temp_directory: " + string(temp_directory));
show_debug_message("local_storage: " + environment_get_variable("LOCALAPPDATA") + "\\" + game_project_name); //use LOCALAPPDATA or APPDATA according to project options for windows

// Load or (re)initialize settings
scr_boot_settings();

// Set seed for builtin random generators
global.random_seed = randomise();

// Set global game speed
game_set_speed(macro_init_game_speed, gamespeed_fps); //todo: discuss

// Generate player session ID
global.player_session_id = scr_generate_guid();
show_debug_message("Generated player session ID: " + global.player_session_id);
//todo: send app start statistic to server?

// Set window async and callback scr_preloader
scr_boot_window();
exit; //last line of code