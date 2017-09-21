test_init(test_for_obj_base_component);

// arrange
var dummy = instance_create_layer(64, 64, "instances", obj_base_component);
dummy.under_construction = true;
var constr = scr_create_dummy_construction();
dummy.construction_instance = constr;
var cell = scr_create_construction_cell(dummy.occ_i, dummy.occ_j, 0, noone, dummy, noone);
ds_map_replace(constr, construction_cells, [cell]);

// act
var destruction = instance_create_layer(dummy.x, dummy.y, "instances", obj_destruct);
destruction.owner = dummy.owner;
with(destruction){ 
	event_perform_object(obj_destruct, ev_alarm, 0);
	alarm_set(0, -1);
}

// assert
assert_false(instance_exists(dummy), "instance_exists(dummy)");
assert_false(ds_exists(constr, ds_type_map), "ds_exists(constr, ds_type_map)");
assert_false(instance_exists(destruction), "instance_exists(destruction)");

test_result();