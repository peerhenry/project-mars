/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

scr_update_robot(id);

if(carrying_instance != noone)
{
	carrying_instance.x = x;
	carrying_instance.y = y;
	carrying_instance.occ_i = occ_i;
	carrying_instance.occ_j = occ_j;
}