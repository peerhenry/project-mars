/// @description Finalize construction
event_inherited();

show_debug_message("finalizing door at: " + string(occ_i) + ", " + + string(occ_j)); // DEBUG

scr_room_remove_tile_and_part(x, y);

scr_door_connect(id); // connects door to rooms