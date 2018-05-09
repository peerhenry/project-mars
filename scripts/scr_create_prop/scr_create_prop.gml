/// @arg name
/// @arg type_info
/// @arg state_handle

var name = argument0;
var type_info = argument1;
var handle = argument2;
var thing = new(c_class_property, [name, type_info]);
var borrow = !(handle & OWNED == 1);
var inject = !(handle & NOT_INJECTED == 2);
thing.is_borrowed = borrow;
thing.gets_injected = inject;
return thing;