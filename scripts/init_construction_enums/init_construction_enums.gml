// the different constructions
/*enum construction
{
	basetile,			// carrier
	wall,				// carrier
	door,				// NA
	hatch,				// NA
	suit_closet,		// NA
	suit_closet_empty,	// NA
	sensor,				// consumer
	drill,				// consumer
	pump,				// consumer
	battery,			// source
	oxygen_tank,		// NA
	bed,				// NA
	operating_table,	// consumer
	cable,				// carrier
	pipe,
	airlock_pump
}//*/

enum dragging
{
	none,
	linear,
	rectangular
}

enum build_validation_i
{
	inside,
	outside,
	any
}

enum build_validation_o
{
	vacant,
	wall_like,
	any,
	wall,
	cable,
	pipe,
	for_cable,
	for_pipe
}

enum map_buffer_action
{
	nothing,
	clear,
	occupy,
	wall_like,
	wall,
	inside,
	cable,
	pipe
}

enum construction_state
{
	not_ready,		// not ready to be constructed.
	ready,			// construction is ready to be picked up
	picked_up,		// an astronaut picked up this construction task
	done
}