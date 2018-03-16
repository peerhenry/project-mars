init_create_spaceship_and_astros(30, 30);

// create enemy astronauts
init_skirmish_add_astronauts(100, 100, 5, macro_enemy);

global.default_owner = macro_player;
// todo:
// global.default_owner is used for more than you think
// debug finish construction for example results in ownership to this value
// test if this is also true for astronauts making the construction themselves
// and think about a good pattern for all of this ownership magic