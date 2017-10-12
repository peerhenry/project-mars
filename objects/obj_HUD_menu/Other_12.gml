/// @description Initialize
button_count = array_length_1d(button_objects);
b_height = 48;
width = 400;
height = 8 + button_count*(b_height + 8);
button_list = ds_list_create();