var storage_was_positive = storage > 0;
scr_grid_update(id);
scr_grid_change_storage_levels(id);
if(storage_was_positive && net_output < 0 && storage = 0) // storage has depleted.
{
	scr_grid_notify_components(id);
}

if(counter == limit)
{
	display_total_production = cum_tp/limit;
	display_total_demand = cum_td/limit;
	display_net_output = cum_no/limit;
	display_storage = cum_s/limit;
	display_storage_capacity = storage_capacity;
	
	// reset cumulative values and counter
	cum_tp = 0;
	cum_td = 0;
	cum_no = 0;
	cum_s = 0;
	counter = 0;
}

cum_tp += total_production;
cum_td += total_demand;
cum_no += net_output;
cum_s += storage;
counter++;