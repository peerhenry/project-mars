/// @descr override the object to use on the class
/// @arg class
/// @arg object_index
/// @arg arguments_array

var class = argument0;
var obj_index = argument1;
var args = argument2;
if(!is_array(args)) args = [args];
var instance = instance_create_depth(0,0,0,obj_index);
instance.class = class;
scr_apply_constructor(class, instance, args);
// global.class_instance_registry[? instance] = instance;
return instance;