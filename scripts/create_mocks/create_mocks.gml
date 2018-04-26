var class = argument0;
var deps = cs_get_dependencies(class);
if(deps == noone) return [];
var mocks = void_unwrap(deps, "extract_mocks");
destroy(deps);
return mocks;