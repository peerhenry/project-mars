/// @arg name
var name = argument[0];
var thing = new(c_class_property, [name, t_map()]);

var handle = argument_count == 2 ? argument[1] : 0;
var borrow = !(handle & OWNED == 1);
var inject = !(handle & NOT_INJECTED == 2);
thing.is_borrowed = borrow;
thing.gets_injected = inject;

return thing;