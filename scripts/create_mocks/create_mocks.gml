var class = argument0;
var deps = call_static_unwrap(class, get_dependencies);
if(deps == noone) return [];
var mocks = call_unwrap(deps, "extract_mocks");
destroy(deps);
return mocks;