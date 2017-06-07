/// @param electric_grid
var arg_grid = argument0;

var available_power = scr_electric_grid_power(arg_grid);
var consumption = scr_electric_grid_consumption(arg_grid);
var net_power = available_power - consumption;
arg_grid[@e_grid_net_power] = net_power;

if(available_power > 0 && net_power >= 0)
{
	// update carriers
	var carriers = arg_grid[e_grid_carrier_list];
	for(var n = 0; n < ds_list_size(carriers); n++)
	{
		var next_carrier = ds_list_find_value(carriers, n);
		if(next_carrier.object_index == obj_cable && next_carrier.image_index mod 2 == 0)
		{
			next_carrier.image_index += 1; // for even images, next image is "power on" image
		}
	}
	
	// update consumers
	var consumers = arg_grid[e_grid_consumer_list];
	for(var n = 0; n < ds_list_size(consumers); n++)
	{
		var next_consumer = ds_list_find_value(consumers, n);
		scr_tell_consumer_power_is_on(next_consumer);
	}
}
else // low power
{
	// update carriers
	var carriers = arg_grid[e_grid_carrier_list];
	for(var n = 0; n < ds_list_size(carriers); n++)
	{
		var next_carrier = ds_list_find_value(carriers, n);
		if(next_carrier.object_index == obj_cable && next_carrier.image_index mod 2 == 1)
		{
			next_carrier.image_index -= 1;	// for uneven images, previous image is "power off" image
		}
	}
	
	// update consumers
	var consumers = arg_grid[e_grid_consumer_list];
	for(var n = 0; n < ds_list_size(consumers); n++)
	{
		var next_consumer = ds_list_find_value(consumers, n);
		if(next_consumer.object_index == obj_drill && next_consumer.switched_on && next_consumer.has_resource)
		{
			next_consumer.image_index = 0;
			next_consumer.image_speed = 0;
		}
	}
}