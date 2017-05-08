// 1. movement and drawing
path = path_add();
is_walking = false;
prev_x = x;
prev_y = y;

occ_i = (x - 16) div 32;
occ_j = (y - 16) div 32;
mp_grid_add_cell(global.grid_map, occ_i, occ_j);

still = 0;
up = 1;
down = 2;
right = 3;
left = 4;
moveDir = still;

movement_speed = 3;
image_speed = 1.2;

is_selected = false;

// 2. health and oxygen
o2_depletion_speed = 0.005;
suffocation_speed = 0.1;
oxygen_bar_color = make_color_rgb(55, 55, 255);
health = 100;
oxygen = 100;

is_outside = true;
inside_room = noone;