test_init(test_for_different_owner);

// arrange
var dummy = instance_create_depth(64,64,0,obj_base_component);
dummy.under_construction = true;
var constr = scr_create_dummy_construction();
dummy.construction = constr;

// act
var destruction = instance_create_depth(dummy.x, dummy.y, 0, obj_destruct);
with(destruction)
{
	owner = macro_nau;
	event_perform_object(obj_destruct, ev_alarm, 0);
}

// assert
assert_true(instance_exists(dummy), "instance_exists(dummy)");
assert_true(ds_exists(constr, ds_type_map), "ds_exists(constr, ds_type_map)");
assert_false(instance_exists(destruction), "instance_exists(destruction)");

// cleanup
scr_cancel_construction(constr);
instance_destroy(dummy);

test_result();