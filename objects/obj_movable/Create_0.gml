scr_trace("movable create event");
script_container = global.script_container;
ioc_container = global.ioc_container;
if(!instance_exists(ioc_container)) scr_panic("ioc container does not exist!");
name = "movable";
// movement and drawing
path = noone;
end_path_action = noone;
occ_i = scr_rc_to_gi(x);
occ_j = scr_rc_to_gi(y);
dest_i = occ_i;
dest_j = occ_j;
scr_navgrid_occupy(occ_i, occ_j);
move_dir = macro_down;
movement_speed = global.astro_move_speed;
owner = scr_get_owner(id);
is_moving_through_gate = false;
has_died = false;

prev_x = x;
prev_y = y;

sprite_down = spr_arrow_down;
sprite_right = spr_arrow_right;
sprite_up = spr_arrow_up;

entity_health = 100;

// only for player
is_selected = false;
hover = false;

// draw stuff
var sprite_set = scr_get_sprite_set(id);
sprite_down = sprite_set[0];
sprite_right = sprite_set[1];
sprite_up = sprite_set[2];
sprite_mask_down = sprite_set[3];
sprite_mask_right = sprite_set[4];
sprite_mask_up = sprite_set[5];
mask_color = [0,0,0,0]; // not regular color; array for shader
sprite_index = sprite_down;
mask_sprite = sprite_mask_down;
health_bar_color = global.health_bar_color;

last_cancel_walking_result = 0; // debug
autotasking = false;