var container = new_override(c_ioc_container, obj_ioc_container);
global.ioc_container = container;

call_unwrap(container, "register", "navgrid", c_navgrid);
call_unwrap(container, "register", "appear_setter", c_astro_appear_setter);
call_unwrap(container, "register", "embarker", c_atm_embarker);
call_unwrap(container, "register", "notifier", c_player_notifier);
call_unwrap(container, "register", "interaction_factory", c_interaction_factory);