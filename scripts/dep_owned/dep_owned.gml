/// @arg name
/// @arg type
var name = argument0;
var type = argument1;
var dep = new(c_dependency, [name, type, false]);
dep.owned = true;
return dep;