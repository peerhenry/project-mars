scr_trace("constructable destroy event");
scr_destroy_instance_grid_logic(id);
with(dto_hud_details_panel) if(unit == other.id) instance_destroy();