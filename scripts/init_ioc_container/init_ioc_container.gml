var container = new(c_ioc_container);
global.ioc_container = container;

#region configure IOC container

// theres an issue with regestering this way
// some things must be static, but if they havent been set before another client needs it... it will be resolved as a new class instance
// things that are not registered should not be allowed to be resolved
// this means we must register as strings with class

/*register_resolvers(container, c_astro_appear_setter, [c_navgrid]); // when c_astro_appear_setter will be resolved, IOC container will resolve c_navgrid and inject that into the constructor
register_resolvers(container, c_atm_embarker, [c_astro_appear_setter]);
call_unwrap(container, "resolve_set_static", c_navgrid);
call_unwrap(container, "resolve_set_static", c_astro_appear_setter);
call_unwrap(container, "resolve_set_static", c_atm_embarker);*/


register(container, "astro_appear_setter", c_astro_appear_setter);
register(container, "atm_embarker", c_atm_embarker);
register(container, "atm_embarker", c_atm_embarker);

#endregion 