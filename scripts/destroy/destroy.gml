#macro destructor "destroy"
var instance = argument0;
script_execute(instance.class, destructor, instance);