test_init(test_med_bed_with_occupant);

// arrange
var med_bed = instance_create_depth(0,0,0,obj_med_bed);
var astro = instance_create_depth(0,0,0,obj_astronaut);
astro.entity_health = 20;
med_bed.assigned_astronaut = astro;

// assert setup

// act
with(med_bed) event_user(macro_event_interact);

// assert
assert_true( scr_get_grid_prop(med_bed, macro_grid_electric, macro_grid_prop_can_perform_role), "can perform role" );

// cleanup
instance_activate_object(astro);
instance_destroy(med_bed);
instance_destroy(astro);

test_result();