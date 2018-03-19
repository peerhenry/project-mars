scr_force_trace("Application Start");

if(debug_mode) room_goto(room_tests); //jump to room tests directly
else instance_create_depth(0, 0, 0, obj_fade); //fade to main menu