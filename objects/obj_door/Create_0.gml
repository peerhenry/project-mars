scr_trace("door create event");
event_inherited();
name = "door";
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.wall_like);
scr_navgrid_clear_cell(occ_i, occ_j);
oxygen_max_alpha = global.oxygen_max_alpha;
depth = -occ_j;	// set depth for tall structures
room1 = noone; // Either north or west
room2 = noone; // Either south or east