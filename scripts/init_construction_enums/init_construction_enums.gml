function init_construction_enums() {
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
		vacant_or_reserved,
		vacant_or_cable,
		vacant_or_pipe,
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
		reserve,
		wall_like,
		wall,
		inside,
		outside,
		cable,
		pipe,
		clear_cable,
		clear_pipe,
		clear_and_inside,
		clear_and_outside
	}

	enum construction_state
	{
		not_ready,
		awaiting_mdus,
		ready,
		picked_up,
		done
	}


}
