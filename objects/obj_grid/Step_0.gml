var storage_was_positive = storage > 0;
scr_grid_update(id);
scr_grid_change_storage_levels(id);
if(storage_was_positive && net_output < 0 && storage = 0) // storage has depleted.
{
	scr_grid_notify_components(id);
}