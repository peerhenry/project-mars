test_init(test_room_step)

// arrange
var le_room = instance_create_depth(0,0,0,obj_room);

// act
with(le_room)
{
	event_perform(ev_step, 0);
}

// assert
// does not crash

// cleanup
instance_destroy(le_room);

test_result();