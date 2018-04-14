/// @arg child_class
/// @arg parent_class
if(argument0 == argument1) scr_panic("Class may not inherit itself");
var hierarchy = global.class_hierarchy;
if( hierarchy[? argument1] == argument0) scr_panic("Circular inheritance is not allowed!");
hierarchy[? argument0] = argument1;