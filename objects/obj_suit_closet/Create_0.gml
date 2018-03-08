event_inherited();
name = "suit closet";
description = "Can hold one space suit and fills it with oxygen. Right click a selected astronaut here to put on or take off a suit."
// hardcoded constructable logic
under_construction = true;
damage = 0;

image_speed = 0;
depth = -occ_j;
holds_suit = true;
occ_i = scr_rc_to_gi(x);
occ_j = scr_rc_to_gi(y);
suit_oxygen = 100;
oxygen_bar_color = global.oxygen_bar_color;
suit_closet_replenishment = global.suit_closet_replenishment;

scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);

// mask
mask_sprite = spr_suit_closet_mask;
mask_color = scr_get_suit_color(owner);