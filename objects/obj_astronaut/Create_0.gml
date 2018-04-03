// things that need to be set before calling event_inherited
wears_suit = true;

event_inherited();
script_update = scr_astro_update;

// things to overwrite from base classes
movement_speed = global.astro_move_speed;

// astronaut props
name = "John Doe";
astro_id = 0;  // used to identify specific astronauts
suit_oxygen = 100;
sleep_level = 100;
food_level = 100;
oxygen_consumption = global.astro_oxygen_consumption; // absolute value

// shader color mask
mask_color_clothes = scr_get_clothes_color(owner);
mask_color_suit = scr_get_suit_color(owner);
mask_color = mask_color_clothes;
if(wears_suit) mask_color = mask_color_suit;
image_speed = 0;

// automatic behavior
auto_eat = (owner == macro_player) ? global.auto_eat_player : global.auto_eat_nonplayer;
auto_sleep = (owner == macro_player) ? global.auto_sleep_player : global.auto_sleep_nonplayer;
auto_eat_level = global.auto_eat_hunger_level;
auto_sleep_level = global.auto_sleep_level;

var inside = position_meeting(x, y, obj_base_tile);
is_outside = !inside;
scr_set_suit(id, is_outside);

scr_give_entity_new_item(id, inv_space.pistol);

oxygen_bar_color = global.oxygen_bar_color;

// autotask
alarm[1] = 30 + round(random_range(-5,5));