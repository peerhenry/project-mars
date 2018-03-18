/// @description The very first script to run on startup

scr_force_trace("Application Boot");

global.game_end_listener = instance_create_depth(0, 0, 0, obj_game_end_listener); //persistent

scr_debug_header(scr_get_application_info());

global.enable_trace = debug_mode;
global.dev_env = true; //todo: via ENV var and/or external file 'dev_env.flag' present?
scr_force_trace("program_directory: " + string(program_directory));
scr_force_trace("working_directory: " + string(working_directory));
scr_force_trace("temp_directory: " + string(temp_directory));

// Load or initialize settings
init_settings();

// Set seed for builtin random generators
randomise();

// Set global game speed
game_set_speed(macro_init_game_speed, gamespeed_fps); //todo: discuss

// Generate player session ID
global.player_session_id = scr_generate_guid();
show_debug_message("Generated player session ID: " + global.player_session_id);

// Set window async and callback scr_preloader
init_window();
exit;