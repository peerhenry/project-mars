event_inherited();

// hardcoded constructable logic
under_construction = true;
damage = 0;

image_speed = 0;
holds_suit = true;
occ_i = scr_rc_to_gi(x);
occ_j = scr_rc_to_gi(y);
mp_grid_add_cell( scr_get_nav_grid(), occ_i, occ_j );
suit_oxygen = 100;
oxygen_bar_color = global.oxygen_bar_color;
suit_closet_replenishment = global.suit_closet_replenishment;