var class = argument0;
var deps = in(class, get_dependencies);
if(deps == noone) return [];
var mocks = call_unwrap(deps, "extract_mocks");
destroy(deps);
return mocks;