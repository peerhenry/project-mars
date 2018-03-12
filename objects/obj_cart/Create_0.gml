/// @description Insert description here
// You can write your code in this editor

#macro macro_toggle_deploy_event 0
global.cart_deploy_mode = false;

// Inherit the parent event
event_inherited();
name = "cart";

battery_charge = 100;

sprite_down = spr_cart_down;
sprite_right = spr_cart_right;
sprite_up = spr_cart_up;
image_speed = 1;

carrying_instance = noone;
assigned_instance = noone;
deploy_ghost = noone;
action = cart_action.idle;
autotasking = false;

deploy = false; // deploy mode boolean