
button_count = 5;
b_height = 48;

width = 400;
height = 8 + button_count*(b_height+8);

is_active = false;
button_list = ds_list_create();
texts = ["Options", "Save", "Load", "Quit", "Return"];