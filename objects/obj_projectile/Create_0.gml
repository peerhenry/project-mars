path = path_add();
damage = global.projectile_damage;

var play_sound = script_container_resolve(global.script_container, "play_sound");
script_execute(play_sound, sound_fx_laser);