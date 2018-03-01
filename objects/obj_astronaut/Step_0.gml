/// @description Update astronaut

event_inherited();
if(has_died) exit;
scr_step_sleep_and_speed(id);
scr_step_hunger_and_health(id);
scr_step_oxygen_and_health(id);