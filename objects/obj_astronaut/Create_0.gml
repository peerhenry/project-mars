// things that need to be set before calling event_inherited
wears_suit = true;

event_inherited();

// things to overwrite from base classes
moveDir = macro_down;
movement_speed = macro_astronaut_move_speed;

// astronaut props
name = "John Doe";
astro_id = 0;  // todo: find out and write here why this is used or remove it
suit_oxygen = 100;
energy = 100;
food_level = 100;
oxygen_consumption = global.astro_oxygen_consumption; // absolute value

// shader color mask
mask_color_clothes = scr_get_clothes_color(owner);
mask_color_suit = scr_get_suit_color(owner);
mask_color = mask_color_clothes;
if(wears_suit) mask_color = mask_color_suit;
image_speed = 0;

// automatic behavior
auto_attack = false;
auto_construct = true;
auto_eat = false;
auto_sleep = false;
auto_eat_level = global.auto_eat_hunger_level;
auto_sleep_level = global.auto_sleep_level;

var is_inside = position_meeting(x, y, obj_base_tile);
is_outside = !is_inside;
scr_set_suit(id, !is_inside);

scr_inventory_insert(inventory, macro_inventory_pistol);