var container = new(c_ioc_container);
global.ioc_container = container;

#region configure IOC container

call_unwrap(container, "resolve_set_static", c_navgrid);
register_resolvers(container, c_astro_appear_setter, [c_navgrid]); // when c_astro_appear_setter will be resolved, IOC container will resolve c_navgrid and inject that into the constructor
register_resolvers(container, c_atm_embarker, [c_astro_appear_setter]);

#endregion 