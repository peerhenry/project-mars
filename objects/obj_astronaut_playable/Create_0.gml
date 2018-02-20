event_inherited();

is_selected = false;
show_details = false;
hovering_over_details_panel = false;

alarm[1] = 30 + round(random_range(-5,5));

details_panel_width = 384;
details_panel_height = 32 + 16 + 24*5 + 64*3 + 96; // padding + spaces + lines + inventory + avatar
ap_offset = 0;
with(obj_HUD) other.ap_offset = ap_w + ap_margin;

// scr_inventory_insert(inventory, macro_inventory_rifle);