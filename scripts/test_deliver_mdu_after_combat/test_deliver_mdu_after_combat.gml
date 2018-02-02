test_init(test_deliver_mdu_after_combat);

// arrange
var constr = scr_create_dummy_mdu_construction();
scr_register_new_construction(constr);
var astro = instance_create_depth(0,0,0,obj_astronaut_playable);
astro.auto_construct = true;
scr_inventory_insert(astro.inventory, macro_item_mdu);
var enemy = scr_create_enemy_astronaut(64,64);
enemy.astronaut_health = 1;
astro.target = enemy;
enemy.astronaut_health = 0;
with(enemy) event_perform(ev_step, 0); // should kill the enemy
with(astro) event_perform(ev_alarm, 0); // should cancel combat state with enemy

// act
with(astro) event_perform(ev_alarm, 1); // should autotask acquire construction

// assert
assert_true(astro.auto_construct, "astro.auto_construct");
assert_false(instance_exists(enemy), "dead enemy is destroyed");
assert_equal(noone, astro.assigned_object, "assigned_object");
assert_equal(noone, astro.target, "target");
assert_equal(astronaut_action.delivering_mdu, astro.current_action, "current_action");
assert_equal(constr, astro.construction, "construction");

// cleanup
scr_destroy_construction(constr);
instance_destroy(astro);

test_result();