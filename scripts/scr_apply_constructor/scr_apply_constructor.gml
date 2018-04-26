/// @arg class
/// @arg instance
/// @arg args
var class = argument0;
var instance = argument1;
var args = argument2;
var realthis = script_execute(class, constructor, instance, args);
if(!instance_exists(realthis)) scr_panic("Constructor did not return an object.");
return realthis;