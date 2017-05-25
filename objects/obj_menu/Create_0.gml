/// @description Insert description here
// You can write your code in this editor
menu_index_start = 0;
menu_index_options = 1;
menu_index_quit = 2;

menu[menu_index_start] = "Start";
menu[menu_index_options] = "Options";
menu[menu_index_quit] = "Quit";
menu_index_max = array_length_1d(menu) - 1;

space = 64;
menu_focus_index = 0;
mark_for_go = false;